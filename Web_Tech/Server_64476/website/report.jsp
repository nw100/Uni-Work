<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
  lang="en-GB" xml:lang="en-GB">
	<head>
		<title>The Copper Spoon</title>
		<meta charset="UTF-8"/>	
		<link rel="stylesheet" type="text/css" href="main.css"/>
		<link href="./lightbox.css" rel="stylesheet" />
		<link href='https://fonts.googleapis.com/css?family=Lily+Script+One' rel='stylesheet' type='text/css'/>
		<link href='https://fonts.googleapis.com/css?family=Allura' rel='stylesheet' type='text/css'/>
		<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'/>
		<script src="./jquery-1.10.2.min.js"></script>
		<script src="./lightbox-2.6.min.js"></script>
		<script src="./main.js"></script>
		<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		<!--[if lte IE 7]>
	<script src="js/IE8.js" type="text/javascript"></script><![endif]-->
		<!--[if lt IE 7]>
 
	<link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/><![endif]-->
	</head>
<body id="index" class="report">
		<header id="banner" class="body">
			<address id="rAddr">
				Created by: Nina Williams<br/>
				Candidate No.: 64476
			</address>
			
			<h1 class="rTitle">Report</h1>

			<%@ include file = "nav_bar_02.jsp" %>

		</header>
		<!-- /#banner -->

		<section id="content" class="body">
			<h1>Contents</h1>
			<ul class="reportList">

				<li>
					<a class='go-to-html' href='#html' title='html'>Setting up the Server and General Server Issues</a>
				</li>
				<li>
					<a class='go-to-css' href='#css' title='css'>Integration with a database and/or other technologies</a>
				</li>
				<li>
					<a class='go-to-gimp' href='#gimp' title='css'>Programming</a>
				</li>
				<li>
					<a class='go-to-inkscape' href='#inkscape' title='css'>Integration with a database and/or other technologies</a>
				</li>
				<li>
					<a class='go-to-svg' href='#svg' title='css'>Programming</a>
				</li>
				<li>
					<a class='go-to-jScript' href='#jScript' title='css'>Sophistication/Ingenuity/Creativity/Polish</a>
				</li>

			</ul>

			<h2>Introduction</h2>
			In this report I have included my personal log (integrated with everything else); it is not a separate document. 
			
<h2 id="html">Setting up the Server and General Server Issues</h2>		
The server-side of websites is entirely new to me, and setting up the server probably took the longest amount of time compared to the rest of the coursework.	
<ol>
	<li>Installed Tomcat – </li>
	<ul>
		<li>Core: 64-bit Windows zip.</li>
		<li>Placed in ‘TC_Web’ folder</li>
	</ul>
	<li>Installed JDK, make a copy of the Java folder and placed it within Tomcat directory (..\TC_Web\apache-tomcat-7.0.52) in Java folder.</li>
	<li>Set PATH for Java. </li>
	<li>Tested Java using</li>
	<ul>
		<li>javac –version</li>
		<li>java -version</li>
	</ul>
	<li>Set CATALINA_HOME and JAVA_HOME using environment variables.</li>
	<li>Installed server.bat, and configured Windows Services as described in lecture slides.</li>
	<li> Moved the site using Context. The website is at the same level as tomcat, in the TC_Web folder.</li>
	<li>Tested Java in website using the following in my index page (it worked):</li>
	<ul>
	<li><p>Testing Java</p></li>
	</ul>
<li>Set up content negotiation using files/info from coursework help.</li>	
</ol>
<h3>Any Issues:</h3>
I had little/no issues with setting up Java, but I've had issues with Tomcat that took a long time to sort out; each time I either didn't know what the cause was, or I did and I wasn't sure how to fix it.
For the most part I opted to start again; I had backups of all the files, but more often than not it was difficult to know what exactly had gone wrong.  I kept notes of each time I set it up, and my notes look the same as what appears
in the lecture slides (and in running.txt which comes with Tomcat). 
<ol>
<li>Port issue: My anti-virus supposedly uses port 80, and so haven’t changed the port defaults in server.xml (I know how)</li>
<li>I set up Tomcat 3 or 4 times because each time something would go wrong and due to inexperience I wasn't able to locate the fault.</li>
<ul>
<li>One time I ran startup.bat (before I set it up as a service) and the cmd would show that it's being started, but unexpectedly it would stop and close the window. 
Nothing happened when I tried to access localhost. I'm still not sure what caused this to happen but probably just something wrong with how I set it up.</li>
<li>Another time it wouldn't recognise the Context node, and so either I'd get an error or it would display Tomcats default web page. I left this alone for a while and set up the database; after I had included 
the resource node the context node seemed to work. Again, not sure what made the difference.</li>
<li>For quite a while I wasn't setting the CATALINA_HOME and JAVA_HOME environment variables properly and this caused me quite a few problems. It took a long time for me to realise that the e.variables were the problem.</li>
</ul>
Whilst setting up Tomcat from scratch each time probably wasn't the best way to fix the problems, or the most time-efficient way, it did mean that I had a better
understanding of the setup process. The total time it took for me to get Tomcat up and running with the above problems solved, which includes installing and setting up the database, was about 18 hours.
</ol>
<p>What I was proud of: I mentioned previously that I haven't worked with the server-side of websites before, and so my proud moment was just getting Tomcat up and running and seeing the slight configuration changes I made work. Had I more time I would have liked to 
try some of the other configuration options, but considering how long it took me to set up Tomcat in the first place, I can only imagine the config changes taking me much much longer. </p>


<h2 id="css">Integration with a database and/or other technologies</h2>
Used Apache Derby 10.8.3.0, lib distribution. Databases are also entirely new to me (I don't know how I've gone so long without learning about them). 
It didn't take too long to set up, but accessing the db from my site was very time-consuming. When trying to access the database from my jsp pages, the errors would tell me where the fault was but not at the correct line in the file
and so I had to test the files separately to the rest of the site in order to pin-point the fault.  I had error after error, not only for my first hitCounter database, but again for my mailing list database. 
Initially I set up two different databases (one for my hit counter and one for my mailing list) but I changed this to be 
one database with two tables. I'm not sure which is the more correct way to do it, but both methods worked.

<h3>Hit Counter</h3>
The table is called hitCount which contains a counter field. This is just to store the number of hits the website gets. 
<h3>Mailing List</h3>
The mailing table contains firstname, surname and email. It probably would be better to include an ID and maybe even an 'activated' column. I did consider it, and once I had set up confirmation emails I tried to set up a 
confirmation link (so that when they click it, the value in 'activated' becomes true), but I couldn't get it to work. So instead I have opted to just store their names and their email addresses.  

<p>What I was proud of: Overall I think it took me about 14 hours to work out what was going wrong when trying to access or insert or update the database. First it was the hit counter and just trying to get that to display and update properly. 
Then it was trying to insert the users information into the database. When something takes you that long to figure out, seeing the contents of the database being printed out onto the screen
is certainly a proud moment. Sadly I think the main reason it took me so long to work out just comes down to inexperience. Still, the longer you spend trying to work something out, the more you learn in the process. </p>

<h2 id="gimp">Programming:</h2>
<h3 id="css">-JSP</h3>
<p>For JSP I started with <a href="http://www.tutorialspoint.com/jsp/index.htm">Tutorials Point - JSP</a>, as I wasn't certain where the best place to start would be. It was from there that I got the idea to
include a hitCounter for my site.</p>
<p>Before I implemented the hit counter though, the first step I took was actually to convert all my html files to jsp files so I could separate content out such as the header and footer. I found it much easier to keep the jsp code in separate
smaller files; essentially treating each one as I would a java class. I haven't used Java support classes because I don't think my code ever really got complicated enough to warrant it,
 but for a more complex site it should be easy enough to convert the jsp files into small java classes. I ran out of time to do this however, since setting up the jsp pages (integrated with the database) took me much longer than I thought it would. </p>

<p>The footer.jsp file was kept fairly simple; the only jsp included was hitCounter.jsp. The hitCounter code I got from the Tutorials point site created a good hits counter but it reset each time you restarted Tomcat. So I had to change almost all of it 
to access a database instead. As mentioned above I created a table that stores the number of hits. Each time a new user lands on the website, the counter will increment. I've used 'session' to ensure that the counter doesn't increment whilst the same user is on the website (otherwise the counter increments
each time a different page is visited). I've got a couple of messages saying 'Welcome to my website' or 'Welcome back to my website' mostly for testing purposes. Session apparently has a default time-out time of 30 minutes - which I've tested and it works (just to make sure that the increment was still working!) </p>

<p>Note: I didn't fully understand how to use the context and datasource types; in the slides it says to connect only once to the database, but when I tried to do that it didn't work as I expected it to, hence the duplicated 
code where I connect to the database. </p>

<p>For the email subscription I had 4 jsp files handling it. There was the main subscribe.jsp file, which contained the subscribe form and some social networking links (this is part of the footer for each page hence why it's kept separate). The forms action 
is  emailAction.jsp. This takes all the parameters entered in the form and inserts them into the mailing list database. I saw a lot of examples that said to use statement, but that didn't seem to work for me, and so I changed it to prepared statement. Once all the fields have been inserted and everything closed, 
the emailAction.jsp redirects us to email.jsp. This is the result page, which shows the users whether (or not) they were successful in their subscription. This file includes email_confirm.jsp, which is a small function that sends the user an email to 
tell them they have subscribed to The Copper Spoon. For testing I have kept the 'to' field left as my university email address, and I've omitted my password for the submission. It successfully sends an email to the user when called, 
though I haven't been able to get it to work using the email parameter from the submitted form (this is where Java classes would come in handy I think, but as previously mentioned I ran out of time to implement this). I tried to essentially submit another (invisible) form to pass the information on but I couldn't get it to work properly. 
</p>

<p>What I was proud of: Setting up the email confirmation was the most rewarding part of JSP. There are plenty of tutorials out there on how to do it, but getting it to work in JSP directly (which most tutorials advised against, instead option for either a Java class, or using PHP or something) 
was not one of them, so I spend quite a long time trying to work it out. Using some of the Java tutorials I got a feel for what was needed. It's a shame I couldn't use the information submitted in the form, but I'm still proud that I managed to get it to work at all. </p>


<h2 id="jScript">Sophistication/Ingenuity/Creativity/Polish</h2>
<p>I'm not entirely sure what counts for this section. In truth because I've spent so long getting the basics all covered, anything on top of that I would consider to be ingenious. 
I think sophistication and polish come with experience, or at least time. I didn't have enough time to polish this coursework off. As always, with any open-ended coursework, with more time I would
have been able to do so much more. </p>
<p>Certain aspects of this coursework have taken me much longer than it should have done, not only because I had to try and solve the problem, but also because I tried to understand the problem each time. 
Even now there are aspects that I'm not sure why they went wrong, they just did. </p>
<p>What I was proud of: This probably doesn't fit in with this section particularly well but I want to include it somewhere: I feel that I have done everything that was stated in the coursework description, which is something to be proud of. Particularly
when you first look at the coursework and wonder how you're going to be able to achieve all of it in time, let alone produce anything extra on top. And so I'm proud that I have achieved that.  </p>
</section>
<br/>
<br/>

<!-- Back to Top -->
		<div id='fixed-bar'>
			<div id='bar-inner'>
				<a class='go-to-top' href='#banner' title='back to top'>Back to Top</a>
			</div>
		</div>
	</body>
</html>
