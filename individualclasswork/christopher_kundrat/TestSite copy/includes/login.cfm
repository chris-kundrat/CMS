<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Muttiland CMS Login</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="author" content="US" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<script src="js/jquery-1.9.0.min.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>
		<h1 class="text-center">MUTTIVERSITY</h1>
		<cfif len(variables.auth_message)><h3 class="text-center"><cfoutput>#variables.auth_message#</cfoutput></h3></cfif>
		<div class="text-center wideall">
			<form class="content wide400 center" method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
				<input name="submit_login" type="hidden" value="true">
				<h3>Please sign in</h3>
				<input class="wide220" type="text" name="username" placeholder="Username"><br>
				<input class="wide220" type="password" name="password" placeholder="Password"><br>
				<button class="btn btn-large btn-primary" type="submit">Sign in</button>
				<p> Having Problems logging in? Click here <a href="#">HELP ME!</a></p>
			</form>
		</div>


		
		<cfinclude template="footer.cfm">

    </body>
</html>