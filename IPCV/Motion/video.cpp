#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

#include <iostream>
#include <stdio.h>

#define REGION_SIZE 5
#define LINE 2

using namespace std;
using namespace cv;

Vector < Mat > calculate_derivatives(Mat f1, Mat f2);
Mat LKTracker(int aPos, int bPos, Mat f1, Vector < Mat > iVals);
void drawLines(Mat V, int i, int j, Mat lineFrame, Mat motionFrame);
int lineLength(Point p1, Point p2);
void showNorms(Vector < Mat > Vec);

int main(int argc, const char **argv)
{
    cv::VideoCapture cap;
    Vector < Mat > iVals;
    Mat vec, lineFrame, motionFrame;

    if (argc > 1) {
	cap.open(string(argv[1]));
    } else {
	cap.open(0);
    }

    if (!cap.isOpened()) {
	printf("Error: could not load a camera or video.\n");
    }

    Mat frame, frameCpy, frame_gray, frameCpy_gray;
    Mat smallFrame;
    smallFrame.create(frame.rows / 3, frame.cols / 3, frame.type());
    namedWindow("video", 1);

    for (;;) {
	waitKey(20);

	cap >> frame;
	//Resize frame by a third
	resize(frame, smallFrame, Size(), 0.3333, 0.3333, INTER_NEAREST);
	smallFrame.copyTo(frame);
	frame.copyTo(lineFrame);
	frame.copyTo(motionFrame);
	
	if (!frame.data) {
	    printf("Error: no frame data.\n");
	    break;
	}
	
	//work in grayscale
	cvtColor(frame, frame_gray, CV_BGR2GRAY);
	
	if (frameCpy.data) {

	    cvtColor(frameCpy, frameCpy_gray, CV_BGR2GRAY);
	    
	    //create Ix, Iy, It values
	    iVals = calculate_derivatives(frameCpy_gray, frame_gray);
	    
	    for (int i = REGION_SIZE; i < frame.rows - REGION_SIZE; i += REGION_SIZE * 2) {
		for (int j = REGION_SIZE; j < frame.cols - REGION_SIZE; j += REGION_SIZE * 2) {
		    //find vx and vy
		    vec = LKTracker(i, j, frame_gray, iVals);
		    //draw the motion field
		    drawLines(vec, i, j, lineFrame, motionFrame);
		}
	    }

	//showNorms(iVals);
	}

	frame.copyTo(frameCpy);

	imshow("video", frame);
	namedWindow("Line Video", 1);
	imshow("Line Video", lineFrame);
	imshow("Motion Video", motionFrame);
    }
}

/*
** Calculate Ix, Iy, It
*/
Vector < Mat > calculate_derivatives(Mat f1, Mat f2)
{
    Vector < Mat > iVals;
    Mat Ix, Iy, It;
    Ix.create(f1.size(), CV_32F);
    Iy.create(f1.size(), CV_32F);
    It.create(f1.size(), CV_32F);
    Mat IxShow, IyShow, ItShow, IxNorm, IyNorm, ItNorm;


    f1.convertTo(f1, CV_32F);
    f2.convertTo(f2, CV_32F);

    for (int i = 1; i < f1.rows - 1; i++) {

	for (int j = 1; j < f1.cols - 1; j++) {
	    //work over a 3x3 grid
	    Ix.at < float >(i, j) =
		((f1.at < float >(i + 1, j + 1) - f1.at < float >(i + 1, j - 1))
		 +(f1.at < float >(i - 1, j + 1) - f1.at < float >(i - 1, j - 1))
		 +(f1.at < float >(i, j + 1) - f1.at < float >(i, j - 1))
		 +(f2.at < float >(i + 1, j + 1) - f2.at < float >(i + 1, j + 1))
		 +(f2.at < float >(i - 1, j + 1) - f2.at < float >(i - 1, j - 1))
		 +(f2.at < float >(i, j + 1) - f2.at < float >(i, j - 1))) / 6;

	    Iy.at < float >(i, j) =
		((f1.at < float >(i + 1, j + 1) - f1.at < float >(i - 1, j + 1))
		 +(f1.at < float >(i + 1, j - 1) - f1.at < float >(i - 1, j - 1))
		 +(f1.at < float >(i + 1, j) - f1.at < float >(i - 1, j))
		 +(f2.at < float >(i + 1, j + 1) - f2.at < float >(i - 1, j + 1))
		 +(f2.at < float >(i + 1, j - 1) - f2.at < float >(i - 1, j - 1))
		 +(f2.at < float >(i + 1, j) - f2.at < float >(i - 1, j))) / 6;

	    It.at < float >(i, j) =
		((f2.at < float >(i, j) - f1.at < float >(i, j))
		 +(f2.at < float >(i - 1, j) - f1.at < float >(i - 1, j))
		 +(f2.at < float >(i, j - 1) - f1.at < float >(i, j - 1))
		 +(f2.at < float >(i, j + 1) - f1.at < float >(i, j + 1))
		 +(f2.at < float >(i + 1, j) - f1.at < float >(i + 1, j))
		 +(f2.at < float >(i + 1, j + 1) - f1.at < float >(i + 1, j + 1))
		 +(f2.at < float >(i - 1, j + 1) - f1.at < float >(i - 1, j + 1))
		 +(f2.at < float >(i + 1, j - 1) - f1.at < float >(i + 1, j - 1))
		 +(f2.at < float >(i - 1, j - 1) - f1.at < float >(i - 1, j - 1))) / 9;
	}
    }

//store the matrices in a vector
    iVals.push_back(Ix);
    iVals.push_back(Iy);
    iVals.push_back(It);

    imshow("Ix", Ix);
    imshow("Iy", Iy);
    imshow("It", It);

    return iVals;
}

/*
** Calculate Vx and Vy
*/
Mat LKTracker(int i, int j, Mat f1, Vector < Mat > iVals)
{
    Mat A = Mat::zeros(Size(2, 2), CV_32F);
    Mat b = Mat::zeros(2, 1, CV_32F);
    Mat V = Mat::zeros(2, 1, CV_32F);
    //Mat VN;
    float ixit = 0, iyit = 0;

    if (i + REGION_SIZE < f1.rows && j + REGION_SIZE < f1.cols
	&& i - REGION_SIZE > 0 && j - REGION_SIZE > 0) {
	for (int p = i - REGION_SIZE; p <= i + REGION_SIZE; p++) {
	    for (int q = j - REGION_SIZE; q <= j + REGION_SIZE; q++) {
		//create A
		A.at < float >(0, 0) += ((iVals[0].at < float >(p, q)) *(iVals[0].at < float >(p, q)));
		A.at < float >(1, 1) += ((iVals[1].at < float >(p, q)) *(iVals[1].at < float >(p, q)));
		A.at < float >(0, 1) += ((iVals[0].at < float >(p, q)) *(iVals[1].at < float >(p, q)));
		A.at < float >(1, 0) += ((iVals[0].at < float >(p, q)) *(iVals[1].at < float >(p, q)));

		//create b
		ixit += ((iVals[0].at < float >(p, q)) *(iVals[2].at < float >(p, q)));
		iyit += ((iVals[1].at < float >(p, q)) *(iVals[2].at < float >(p, q)));

	    }
	}
    }

    b.at < float >(0, 0) = ixit;
    b.at < float >(1, 0) = iyit;

    V = ((A.inv()) * (-b));
    //normalize(V, VN, -REGION_SIZE, REGION_SIZE, NORM_L2);
    return V * 3;
}

/*
** Draws red, green and blue lines on LineFrame and MotionFrame
** Red shows the general motion field
** Blue and green show the left and right gestures
*/
void drawLines(Mat V, int i, int j, Mat lineFrame, Mat motionFrame)
{
    float xtemp = V.at < float >(0, 0);
    float ytemp = V.at < float >(1, 0);
    int length;
    float limit = 4;

    Point p1, p2;

    p1.x = j;
    p1.y = i;
    p2.x = j + xtemp;
    p2.y = i + ytemp;

//find the length of the vector
    length = lineLength(p1, p2);

    //point is x,y so swap i,j
    //draw red lines to show general motion field
    line(lineFrame, Point(j, i),
	 Point(j + xtemp, i + ytemp), Scalar(0, 0, 255), 1, 8);

//the line must be a certain length   
    if (length >= LINE) {

	/*LEFT MOVEMENT - blue lines */
	if (xtemp < -2 && ytemp > -limit && ytemp < limit) {
	    line(motionFrame, Point(j, i),
		 Point(j + xtemp, i + ytemp), Scalar(255, 0, 0), 1, 8);
	} else if (xtemp > 2 && ytemp > -limit && ytemp < limit) {

	    /*RIGHT MOVEMENT - green lines */
	    line(motionFrame, Point(j, i),
		 Point(j + xtemp, i + ytemp), Scalar(0, 255, 0), 1, 8);
	}
    }
}

/*
** Calculates Euclidean distance between two points
*/
int lineLength(Point p1, Point p2)
{
    int dist;
    int xVal, yVal;

    xVal = pow((p1.x - p2.x), 2);
    yVal = pow((p1.y - p2.y), 2);

    dist = (int) sqrt(xVal + yVal);

    return dist;
}

/*
** Normalise Ix Iy and It for viewing
*/
void showNorms(Vector < Mat > Vec){
   
   double minIx, maxIx, minIy, maxIy, minIt, maxIt, b = 255.0;
   Mat IxShow, IyShow, ItShow;
   
       minMaxLoc(Vec[0], &minIx, &maxIx, NULL, NULL);
       minMaxLoc(Vec[1], &minIy, &maxIy, NULL, NULL);
       minMaxLoc(Vec[2], &minIt, &maxIt, NULL, NULL);
       
       Vec[0] = ((Vec[0] - minIx) * b)/(maxIx-minIx);
       Vec[1] = ((Vec[1] - minIy) * b)/(maxIy-minIy);
       Vec[2] = ((Vec[2] - minIt) * b)/(maxIt-minIt);

       Vec[0].convertTo(IxShow, CV_8UC1);
       Vec[1].convertTo(IyShow, CV_8UC1);
       Vec[2].convertTo(ItShow, CV_8UC1); 


    imshow("Ix Norm", IxShow);
    imshow("Iy Norm", IyShow);
    imshow("It Norm", ItShow);

}
