<cfif session.authuser.group EQ "1">

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
		
			<cfinclude template="includes/sidebar.cfm">
		
			<cfinclude template="includes/header.cfm">

			<div id="container">
				<h1>Create User Account</h1>
				<hr>
				<form method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
					<input name="submit_create" type="hidden" value="true">
					<input class="wide220" type="text" name="username" placeholder="Username"><br>
					<input class="wide220" type="password" name="password" placeholder="Password"><br>
					<input class="wide220" type="text" name="firstname" placeholder="First Name"><br>
					<input class="wide220" type="text" name="lastname" placeholder="Last Name"><br>
					<input class="wide220" type="text" name="email" placeholder="Email"><br>
					<select name="group" placeholder="Group">
						<option value="" disabled selected>Choose Group</option>
						<option value="2">User</option>
						<option value="3">Supervisor</option>
						<option value="1">Administrator</option>
					</select><br>
					<input type="Submit" onClick="confirm('You sure you want to make these changes?')" value="Submit" class="btn" />
				</form>
			</div>
			
			
			<cfinclude template="includes/footer.cfm">
		</body> 
	</html>
	
<cfelse>
	<cflocation url="index.cfm" addToken="no">
</cfif>