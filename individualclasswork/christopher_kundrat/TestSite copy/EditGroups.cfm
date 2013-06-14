<cfif session.authuser.group EQ "1">

	<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="UTF-8" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
			<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
			<title>Edit Groups</title>
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
				<h1>Edit Group</h1>		
				<hr>
				<form method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
					<input name="submit_edit_groups" type="hidden" value="true">
					<select name="group" placeholder="Group">
								<option value="" disabled selected>Choose Group</option>
								<option value="2">User</option>
								<option value="3">Supervisor</option>
								<option value="1">Administrator</option>
					</select><br>
							
					<cfloop query="variables.qGetRoles">
						<label>
							<input type="checkbox" name="idRoles" 
								value=<cfoutput>#variables.qGetRoles.idRoles[CurrentRow]#</cfoutput> >
							<strong><cfoutput>#variables.qGetROles.role_name[CurrentRow]#</cfoutput></strong>
							|
							<cfoutput>#variables.qGetROles.role_description[CurrentRow]#</cfoutput>
						</label>
						<br>
					</cfloop>
					<br>
					<input type="Submit" onClick="confirm('You sure you want to make these changes?')" value="Submit" class="btn btn-primary" />
					
				</form>
				</div>
				<br />
				
				</div>
			</div><!-- container ends -->
			
			<cfinclude template="includes/footer.cfm">			
			
		</body>
		  
	</html>
<cfelse>
	<cflocation url="index.cfm" addToken="no">	
</cfif>