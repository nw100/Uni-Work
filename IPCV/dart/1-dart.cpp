/**********************************
 * Dartboard detector for COMS30121
 * J. Bligh, N. Williams, Q. He
 * November 2013
 *********************************/

/* Include files */
#include "opencv.hpp"
#include "objdetect/objdetect.hpp"
#include "highgui/highgui.hpp"
#include "imgproc/imgproc.hpp"

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

using namespace std;
using namespace cv;

/* Function Headers */
void saveImage(Mat frame, std::string input, int index);
void detectAndSave(Mat frame);
std::vector < Rect > houghLineTrans(Mat frame, Mat candidate,
				    std::vector < Rect > positives,
				    int frameNum, int xShift, int yShift);
/*int houghCircleTrans(Mat frame, Mat candidate, int xShift, int yShift);
int lineLength(Point p1, Point p2);*/
std::vector < Rect > getGrouping(Rect candidate,
				 std::vector < Rect > positives);

/* Global variables */
String logo_cascade_name = "dartcascade.xml";
CascadeClassifier logo_cascade;
RNG rng(12345);

int main(int argc, const char **argv)
{
    CvCapture *capture;
    Mat frame = imread(argv[1], CV_LOAD_IMAGE_COLOR);

    if (!logo_cascade.load(logo_cascade_name)) {
	printf("--(!)Error loading\n");
	return -1;
    };

    // Clear the images folder
    system("exec rm -r ./images/*");

    detectAndSave(frame);

    waitKey(0);
    return 0;
}

/*
** Saves frame to the /images/ folder as a .jpg with name (name,index).jpg 
*/
void saveImage(Mat frame, std::string input, int index)
{
    std::string fileName;
    std::stringstream fileNameStream;
    fileNameStream << "./images/" << input << index << ".jpg";
    fileName = fileNameStream.str();
    imwrite(fileName, frame);
}

/* 
** Takes an image and detects dartboard(s) if present 
*/
void detectAndSave(Mat frame)
{
    std::vector < Rect > haarBox, positives;
    Mat frame_gray;		// grayscale full image
    Mat dartboardCandidate;	// candidate sub-image
    Mat candBinarized;		// candidate sub-image
    Mat candCanny;		// candidate sub-image
    int cannyThreshold, count = 0;
    std::string iString;

    // Convert original image to grayscale
    cvtColor(frame, frame_gray, CV_BGR2GRAY);

    //equalizeHist(frame_gray, frame_gray);
    //normalize(frame_gray, frame_gray, 0, 255, NORM_MINMAX, -1);

    // Get results from classifier and store in haarBox
    logo_cascade.detectMultiScale(frame_gray, haarBox, 1.1, 1,
				  0 | CV_HAAR_SCALE_IMAGE, Size(30, 30),
				  Size(frame.cols / 3.6,
				       frame.rows / 3.6));
    std::
	cout << "Possbile positives from classification: " <<
	haarBox.size() << std::endl;

    // Iterate through candidate dartboards
    for (int i = 0; i < haarBox.size(); i++) {

	// Take next potential dartboard sub-image (candidate)
	dartboardCandidate = frame_gray(haarBox[i]);

	saveImage(dartboardCandidate, "candOrig", i);

	// Draw bounding box of candidate in blue on output image
	std::stringstream iStringStream;
	iStringStream << i;
	iString = iStringStream.str();

	int meanGray = (int) mean(dartboardCandidate)[0];
	int halfDist = (255 - meanGray) / 2;
	meanGray += halfDist;

	// Binarize the candidate
	threshold(dartboardCandidate, candBinarized, meanGray,
		  255, THRESH_TRUNC);
	saveImage(candBinarized, "candBinarized", i);
	cannyThreshold = (int) mean(candBinarized)[0];

	int halfMean = (255 - cannyThreshold) / 2;
	cannyThreshold += halfMean;

	// Apply Canny filter to candidate
	Canny(candBinarized, candCanny, cannyThreshold,
	      (cannyThreshold * 3), 3);
	saveImage(candCanny, "candCanny", i);

	// Run Hough Circle Transform to find (most!) frontal dartboards
	/*     houghCircleTrans(frame, dartboardCandidate, haarBox[i].x,
	   haarBox[i].y);
	   saveImage(candCanny, "candCircle", i); */

	// Run Hough Line Transform to find lines on dartboard; returns the number of positive detections
	positives =
	    houghLineTrans(frame, candCanny, positives, i, haarBox[i].x,
			   haarBox[i].y);


	saveImage(candCanny, "candCannyLines", i);
    }

    for (int i = 0; i < positives.size(); i++) {
	std::cout << "Positives size : " << positives.size() << std::endl;
	rectangle(frame,
		  Point(positives[i].x, positives[i].y),
		  Point(positives[i].x + positives[i].width,
			positives[i].y + positives[i].height), Scalar(0,
								      255,
								      0),
		  1);
    }


    //-- Show result
    imshow("Output", frame);


    saveImage(frame, "output", 0);
    std::cout << "Total dartboards in image: " << count << std::endl;
}

/*
**
*/
/*int houghCircleTrans(Mat frame, Mat candidate, int xShift, int yShift)
{
    std::vector < Vec3f > circles;	// Hough detected circles

    // Hough Circle Transform to find (most!) frontal dartboards
    HoughCircles(candidate, circles, CV_HOUGH_GRADIENT, 1,
		 candidate.rows / 8, 200, 60, 0, 0);

    // Draw each circle
    for (int i = 0; i < circles.size(); i++) {
	Point center((cvRound(circles[i][0]) + xShift),
		     (cvRound(circles[i][1]) + yShift));
	int radius = cvRound(circles[i][2]);

	// Draw circle center
	circle(frame, center, 3, Scalar(0, 255, 0), -1, 8, 0);
	// Draw circle outline
	circle(frame, center, radius, Scalar(0, 0, 255), 3, 8, 0);
    }

    return circles.size();
}*/

/*
** Finds lines in each frame and finds the 
*/
std::vector < Rect > houghLineTrans(Mat frame, Mat candidate,
				    std::vector < Rect > positives,
				    int frameNum, int xShift, int yShift)
{
    Mat blackOutput = Mat::zeros(candidate.rows, candidate.cols, CV_32F);	//black image
    vector < Vec4i > lines;
    Vec4i currentLine;

    int houghThreshold = (int) ((candidate.rows + candidate.cols) / 4);
    int count = 0;
    Rect candRect;

    HoughLinesP(candidate, lines, 1.2, CV_PI / 180, houghThreshold, 15,
		60);

    for (size_t i = 0; i < lines.size(); i++) {
	//create a new black image to draw the line on
	Mat tempBlack = Mat::zeros(candidate.rows, candidate.cols, CV_32F);
	currentLine = lines[i];

	//draw line on black image
	line(tempBlack,
	     Point(currentLine[0], currentLine[1]),
	     Point(currentLine[2], currentLine[3]), cvScalar(1), 1, CV_AA);

	//add the new image w/line to the main blackOutput image  
	add(blackOutput, tempBlack, blackOutput);

	Scalar color = Scalar(rng.uniform(0, 255),
			      rng.uniform(0, 255),
			      rng.uniform(0, 255));
    }

    saveImage(blackOutput, "blackoutput", frameNum);

    double maxVal;
    Point maxLoc;
    minMaxLoc(blackOutput, NULL, &maxVal, NULL, &maxLoc);

    if (maxLoc.x != 0 && maxLoc.y != 0 && maxVal >= 3) {
	maxLoc.x += xShift;
	maxLoc.y += yShift;
//draw center of dartboard
	//circle(frame, maxLoc, 3, Scalar(0, 0, 255), -1, 8);
	candRect.x = xShift;
	candRect.y = yShift;
	candRect.width = candidate.cols;
	candRect.height = candidate.rows;
	std::cout << "Positive being sent to grouping " << std::endl;
	positives = getGrouping(candRect, positives);
	std::cout << "size=" << positives.size() << std::endl;
    }

    return positives;

}

std::vector < Rect > getGrouping(Rect candidate,
				 std::vector < Rect > positives)
{

    // Compute centre of candidate
    Point candCentre;
    candCentre.x = candidate.x + (candidate.width / 2);
    candCentre.y = candidate.y + (candidate.height / 2);

    Point thisCentre;
    int distX, distY, maxX, maxY, candBtmX, candBtmY, thisBtmX, thisBtmY;

//if there are no boxes, just add the box to the list
    if (positives.size() == 0) {
	positives.push_back(candidate);
    } else { 

	for (int i = 0; i < positives.size(); i++) {

	    thisCentre.x = positives[i].x + (positives[i].width / 2);
	    thisCentre.y = positives[i].y + (positives[i].height / 2);

	    distX = abs(candCentre.x - thisCentre.x);
	    distY = abs(candCentre.y - thisCentre.y);
	    maxX = (candidate.width / 2) + (positives[i].width / 2);
	    maxY = (candidate.height / 2) + (positives[i].height / 2);

//if the boxes overlap then calculate the new box
	    if (distX <= maxX && distY <= maxY) {
		positives[i].x =
		    (candidate.x <
		     positives[i].x) ? candidate.x : positives[i].x;
		positives[i].y =
		    (candidate.y <
		     positives[i].y) ? candidate.y : positives[i].y;
		candBtmX = candidate.x + candidate.width;
		candBtmY = candidate.y + candidate.height;
		thisBtmX = positives[i].x + positives[i].width;
		thisBtmY = positives[i].y + positives[i].height;
		positives[i].width =
		    (candBtmX >
		     thisBtmX) ? (candBtmX - positives[i].x) : (thisBtmX -
								positives
								[i].x);
		positives[i].height =
		    (candBtmY >
		     thisBtmY) ? (candBtmY - positives[i].y) : (thisBtmY -
								positives
								[i].y);
	    } else { //if they don't overlap then just add the box to the list
		positives.push_back(candidate);
	    }

	}

    }
    return positives;

}

/*
** Calculates Euclidean distance between two points
*/
/*int lineLength(Point p1, Point p2)
{
    int dist;
    int xVal, yVal;

    xVal = pow((p1.x - p2.x), 2);
    yVal = pow((p1.y - p2.y), 2);

    dist = (int) sqrt(xVal + yVal);

    return dist;
}*/
