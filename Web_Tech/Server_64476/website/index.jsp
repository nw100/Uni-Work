<!DOCTYPE html>

<%@ page import="java.io.*, java.util.*" %>
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
	<body id="index" class="home">
		<%@ include file = "header.jsp" %>
		
		
		<section id="content" class="body">
			<h1>Posts</h1>
			<ol id="posts-list" class="hfeed">

				<li>
					<article class="hentry">
						<header>
							<h2 class="entry-title">
								<a href="./recipes.html#pasta01" rel="bookmark" title="Pasta Recipe">
									Pasta with fried Pancetta and a Tomato and Basil Sauce
								</a>
							</h2>
						</header>
						<footer class="post-info">
							<abbr class="published" title="08-02-2014T13:32:00-07:00">
								<!-- DDMMYYYYThh:mm:ss+ZZZZ -->
								8th February 2014
							</abbr>

							<address class="vcard author">
								By <a class="url fn" href="#"> Nina Williams</a>
							</address>
							<p>Cost: &#163;1.50</p>
						</footer>
						<!-- /.post-info -->

						<div class = "entry-content">
							<img id="pasta_image" src="./pasta_thumb.png" alt="Pasta with fried Pancetta and a Tomato and Basil sauce"/>
							<p>A cheap, quick and easy meal full of flavour. A pleasant reminder that you don't have to skimp out on ingrediants!</p>
							<p>Testing Java: <% out.print("OK"); %></p>
							<details>Pretty much what it says on the tin. All you need is a frying pan, a saucepan and a way to heat it all up!</details>
						</div>
						<!-- /.entry-content -->
					</article>
				</li>

				<li>
					<article class="hentry">
						<header>
							<h2 class="entry-title">
								<a href="./recipes.html#pizza01" rel="bookmark" title="Permalink to this POST TITLE">
				The best pizza you will ever make!
								</a>
							</h2>
						</header>
						<footer class="post-info">
							<abbr class="published" title="08-02-2014T13:32:00-07:00">
								<!-- DDMMYYYYThh:mm:ss+ZZZZ -->
				8th February 2014
							</abbr>
							<address class="vcard author">
					By <a class="url fn" href="#"> Nina Williams</a>
							</address>
							<p>Cost: &#163;1.50</p>
						</footer>
						<!-- /.post-info -->
						<div class = "entry-content">
							<p>Pizza's don't need to be difficult to taste excellent.</p>
						</div>
						<!-- /.entry-content -->
					</article>
				</li>
				<li>
					<article class="hentry">
						<header>
							<h2 class="entry-title">
								<a href="./recipes.html#last01" rel="bookmark" title="Permalink to this POST TITLE">
				This be the title
								</a>
							</h2>
						</header>
						<footer class="post-info">
							<abbr class="published" title="08-02-2014T13:32:00-07:00">
								<!-- DDMMYYYYThh:mm:ss+ZZZZ -->
				8th February 2014
							</abbr>
							<address class="vcard author">
					By <a class="url fn" href="#"> Nina Williams</a>
							</address>
						</footer>
						<!-- /.post-info -->
						<div class = "entry-content">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque venenatis nunc vitae libero iaculis elementum. Nullam et justo <a href="#">non sapien</a> dapibus blandit nec et leo. Ut ut malesuada tellus.</p>
						</div>
						<!-- /.entry-content -->
					</article>
				</li>
			</ol>
			<!-- /#posts-list --> 
		</section>
		<!-- /#content -->
<!-- Subscribe form and Social links -->
<%@ include file = "subscribe.jsp" %>
<!-- Footer info -->
<%@ include file = "footer.jsp" %>

	</body>
</html>