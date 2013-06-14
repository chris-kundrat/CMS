<cfif session.authuser.group EQ "1">

	<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="UTF-8" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
			<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
			<title>Edit Accounts</title>
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
				
				<cfif IsDefined("form.submit_edit_accounts_table")>			
					<h1>Edit This Account</h1>
					<hr>
					<form class="form" method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
						<input name="submit_edit_accounts_form" type="hidden" value="true">
						<h2><cfoutput>#edit.user.username#</cfoutput></h2>
						<input type="text" name="username" placeholder="Username" value=<cfoutput>#edit.user.username#</cfoutput>><br >
						<input type="password" name="password" placeholder="Password"></br />
						<input type="text" name="firstname" placeholder="First Name" value=<cfoutput>#edit.user.firstname#</cfoutput>><br>
						<input type="text" name="lastname" placeholder="Last Name" value=<cfoutput>#edit.user.lastname#</cfoutput>><br>
						<input type="text" name="email" placeholder="Email" value=<cfoutput>#edit.user.email#</cfoutput>><br>
						<select name="group" placeholder="Group">
							<option value="" disabled selected>Choose Group</option>
							<option value="2">User</option>
							<option value="3">Supervisor</option>
							<option value="1">Administrator</option>
						</select><br>
						<input type="Submit" value="Submit" onClick="confirm('You sure you want to make these changes?')" class="btn btn-primary" />
					</form>   
					<hr>
				</cfif>		

				<h1>Choose An Account To Edit</h1>
				<hr>
				<form class="form" method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
					<input name="submit_edit_accounts_table" type="hidden" value="true">
					<table class="AccountListing">
						<tr>
							<th>User Name</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Group</th>
							<th>User Id</th>
							<th>Edit</th>
						</tr>
						<cfloop query="variables.qEditAccountsTable">
							<tr>
								<td><cfoutput>#variables.qEditAccountsTable.username[CurrentRow]#</cfoutput></td>
								<td><cfoutput>#variables.qEditAccountsTable.firstname[CurrentRow]#</cfoutput></td>
								<td><cfoutput>#variables.qEditAccountsTable.lastname[CurrentRow]#</cfoutput></td>
								<td><cfoutput>#variables.qEditAccountsTable.email[CurrentRow]#</cfoutput></td>
								<td><cfoutput>#variables.qEditAccountsTable.idGroups[CurrentRow]#</cfoutput></td>
								<td><cfoutput>#variables.qEditAccountsTable.idUsers[CurrentRow]#</cfoutput></td> 
								<td><input type="radio" name="idEdit" 
									 value= <cfoutput>#variables.qEditAccountsTable.idUsers[CurrentRow]#</cfoutput> ></td>
							</tr>
							
						</cfloop>
					</table>
					</br>
					<p class="submit">
						<button type="submit" class="btn btn-primary">Select Edit</button>
						
					</p>
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