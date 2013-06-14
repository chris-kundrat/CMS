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
		<script src="js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>
        <div class="container">
		
		
			
			<header>
			
				<h1>Muttiland CMS</h1>
				<cfif len(variables.auth_message)><h2><cfoutput>#variables.auth_message#</cfoutput></h2></cfif>
				
				<nav class="navbuttons">
					<a class="current-demo" href="index.cfm">Home</a>
					<a href="CreateUser.cfm">Create User Account</a>
					<a href="EditUser.cfm">Edit User Account</a>
                    <a href="?logout">Logout</a>
				</nav>

				<div class="support-note">
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div>
				
			</header>
			
			<section class="main">
				<cfoutput><p>Hello #session.authuser.firstname# #session.authuser.lastname#, Welcome to the CMS.</p>
                </cfoutput>
			</section>
        </div>
    </body>
</html>