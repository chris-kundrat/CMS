<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Muttiland CMS</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="author" content="US" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<script src="js/jquery-1.9.0.min.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>

        <div class="container">
			
	<header>
		<img src="images/muttilandlogo.png" class="img-rounded">
		<div class="navbar pull-right">
			<div class="navbar-inner">
				<a class="brand" href="index.cfm">&nbsp;</a>
					<ul class="nav nav-pills">
						<li><a href="EditUser.cfm">Edit User</a></li>
						<li class="divider-vertical"></li>
						<li><a href="?logout">Logout</a>
					</ul>
			</div>	
		</div>
		<div class="navbar pull-left">
			<div class="navbar-inner">
				<a class="brand" href="index.cfm">&nbsp;</a>
					<ul class="nav nav-pills">
						<li><a href="index.cfm">Home</a></li>
						<li class="divider-vertical"></li>
						<li><a href="testpage.cfm">Test Page</a></li>
						<li class="divider-vertical"></li>
						<li><a href="some_other_page.cfm">Some Other Page</a></li>
						<li class="divider-vertical"></li>
						<li><a href="right_page.cfm">Probably The Page You Need</a>
					</ul>
	</header>
	
	<div class="content">		
		<div class="main well">
			<cfoutput><h1>WELCOME TO THE TEST PAGE</h1></cfoutput>
			
			<div class="row">
				<div class="span4">
					<h3 class="logo">Look at this Picture!</h3>
				</div>
					<img src="images/example.jpg" alt="Smiley face" height="900 width="700" class="offset6 span4" style="margin-top:-50px; border: 1px solid #FFF;">
				<div class="span4" style="margin-top:-160px">	
					<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
					<p><a class="btn btn-primary" href="#">View details &raquo;</a></p>	
				</div><!-- Span4 ends -->
				
				
				
				<div class="span11" style="margin-top:15px; text-align: center;">
					<h3 class="logo">Feature Coming Soon!</h3>
					<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris 									condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec 								sed odio dui. 
						onec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris 									condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec 								sed odio dui.
					</p>
					<p><a class="btn btn-primary" href="#">View details &raquo;</a></p>
					
				</div><!-- Span6 ends -->
				
			</div><!--- row ends --->
					</div>
        </div><!---Content--->
		
		
		<p class="logo1 well1">Having Trouble? Follow these simple steps to troubleshoot.</p>
				
		<div class="wellfooter">
			<p class="text-center">&copy; Muttiland 2013</p>
		</div>
				
        </div><!---Container Ends--->
        
    </body>
      
      	
      
</html>