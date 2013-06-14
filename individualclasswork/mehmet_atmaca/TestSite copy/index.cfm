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
			
				<cfif len(variables.auth_message)><h3 class="logo text-center"><cfoutput>#variables.auth_message#</cfoutput></h3></cfif>
			<br />
			<img src="muttilandlogo2.png" class="img-rounded">
				<div class="navbar pull-right">
					<div class="navbar-inner">
					<a class="brand" href="index.cfm">&nbsp;</a>
						<ul class="nav nav-pills">
							<li class="active"><a href="index.cfm">Home</a></li>
							<li class="divider-vertical"></li>
							<li><a href="CreateUser.cfm">Create User Account</a></li>
							<li class="divider-vertical"></li>
							<li><a href="EditUser.cfm">Edit User Account</a></li>
							<li class="divider-vertical"></li>
							<li><a href="?logout">Logout</a>
						</ul>
					</div>
				

				<div class="support-note">
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div>
				
			</header>
		
	
				<div class="content">
						
				
					<div class="main well3">
						
							<cfoutput><p class="logo">Hello #session.authuser.firstname# #session.authuser.lastname#, Welcome to the CMS. 									Here you have the ability to Create,edit, and Change many aspects of your web site </p>
						</cfoutput>
					
				<div class="row">
					<div class="span4">
						
							<h3 class="logo">Feature Coming Soon!</h3>
								<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris 											condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis 											euismod. Donec sed odio dui. </p>
								<p><a class="btn btn-primary" href="#">View details &raquo;</a></p>
							
					</div><!-- Span4 ends -->
						<div class="span8">
						
							<h3 class="logo">Feature Coming Soon!</h3>
								<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris 									condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec 								sed odio dui. 
									onec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris 									condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec 								sed odio dui.
								</p>
						<p><a class="btn btn-primary" href="#">View details &raquo;</a></p>
						<!-- well ends -->
						</div><!-- Span6 ends -->
				
			</div><!--- row ends --->
					</div>
        </div><!---Content--->
		
		
		<div class="wellfooter fixed-bottom">
					<p class="text-center">&copy; Company 2013</p>
				</div>
				
        </div><!---Container Ends--->
        
    </body>
      
      	
      
</html>