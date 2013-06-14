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
		<script src="js/jquery-1.9.0.min.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>
		
		<cfinclude template="includes/sidebar.cfm">
		
		
		<cfinclude template="includes/header.cfm">
	
        <div id="container">
			<h1>Edit your Account</h1>
			<hr>
			<form class="form-1" method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
				<input name="submit_edit" type="hidden" value="true"> 
				<h2><cfoutput>#session.authuser.username#</cfoutput></h2>
				<input class="wide220" type="password" name="oldpassword" placeholder="Old Password"><br>
				<input class="wide220" type="password" name="newpassword" placeholder="New Password"><br>
				<input class="wide220" type="password" name="confirmpassword" placeholder="Confirm New Password"><br>
				<input class="wide220" type="text" name="firstname" placeholder="First Name" value=<cfoutput>#session.authuser.firstname#</cfoutput>><br>
				<input class="wide220" type="text" name="lastname" placeholder="Last Name" value=<cfoutput>#session.authuser.lastname#</cfoutput>><br>
				<input class="wide220" type="text" name="email" placeholder="Email" value=<cfoutput>#session.authuser.email#</cfoutput>><br>
				<input type="Submit" onclick="confirm('Are you sure you want to save?');" value="Submit" class="btn btn-primary"/>
			</form>
        </div>

		<cfinclude template="includes/footer.cfm">
		
    </body>
    
    
      
</html>