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
		
        <!--[if lte IE 8]><link rel="stylesheet" href="/js/responsive-nav.js-master/responsive-nav.css"><![endif]-->
		<!--[if gt IE 8]><!--><link rel="stylesheet" href="/css/responsivestylestyles.css"><!--<![endif]-->
		<script src="js/jquery-1.9.0.min.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
        <script src="/js/responsive-nav.js-master/responsive-nav.min.js"></script>
		
    </head>
    <body>
	
		
		
		<cfinclude template="includes/header.cfm">		
		<cfinclude template="includes/sidebar.cfm">
        <div  role="main"  id="container">
        
        <a href="#nav" id="toggle">Menu</a>
			<div class="content">
				<cfoutput>
					<p>Hello #session.authuser.firstname# #session.authuser.lastname#.</p>
					<p>Welcome to the CMS.Here you have the ability to Create,edit, and Change many aspects of your web site </p>
					<p>You are in group #session.authuser.group#.</p>
				</cfoutput>
					
				<h3>Feature Coming Soon!</h3>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
				<p><a class="btn btn-primary" href="#">View details &raquo;</a></p>
					
				<h3>Feature Coming Soon!</h3>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. 
					onec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
				</p>
				<p><a class="btn btn-primary" href="#">View details &raquo;</a></p>
			</div>
		</div>
        
		<cfinclude template="includes/footer.cfm">
	<script>
      var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
	  
    </script>	
    </body>
       
</html>