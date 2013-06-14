<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Create User Account</title>
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
			
				<h1>Create User Account</h1>
				<cfif len(variables.auth_message)><h2><cfoutput>#variables.auth_message#</cfoutput></h2></cfif>
				
				
				<div class="support-note">
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div>
				
			</header>
			
			<nav class="navbuttons">
					<a class="current-demo" href="index.cfm">Home</a>
					<a href="CreateUser.cfm">Create User Account</a>
					<a href="EditUser.cfm">Edit User Account</a>
                    <a href="?logout">Logout</a>
				</nav>
			
			<section class="main">
				<form class="form-1" method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
                <input name="submit_create" type="hidden" value="true">
					<p class="field">
						<input type="text" name="username" placeholder="Username">
						<i class="icon-user icon-large"></i>
					</p>
						<p class="field">
							<input type="password" name="password" placeholder="Password">
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="field">
							<input type="text" name="firstname" placeholder="First Name">
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="field">
							<input type="text" name="lastname" placeholder="Last Name">
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="field">
							<input type="text" name="email" placeholder="Email">
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="submit">
						<button type="submit" name="submit"><i class="icon-arrow-right icon-large"></i></button>
					</p>
				</form>
			</section>
        </div>
    </body>
</html>