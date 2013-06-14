<cfapplication name="amuttitest"  clientmanagement="yes" sessionmanagement="yes" setdomaincookies="yes" setclientcookies="yes" sessiontimeout="#CreateTimeSpan(0,1,0,0)#">

<!--- Set Application DSN --->
<cfset application.dsn = "muttilan_classcms_dsn">

<!----  ---->


<!--- DEFINE SESSION VARIABLE DEFAULTS --->

<!--- <cfparam> is the same as <cfif NOT isDefined('VARIABLENAME')><cfset VARIABLENAME=VALUE></CFIF> --->
<cfparam name="session.auth_isloggedin" type="string" default="false"> <!--- Start logged off --->
<cfparam name="variables.auth_message" type="string" default="">
<cfparam name="session.authuser" type="any" default="#structNew()#"> <!---- A Struct is a datatype that is similar to a JavaScript object.  It can hold other variables, functions, etc. --->
<cfparam name="session.authuser.username" type="string" default="">
<cfparam name="session.authuser.firstname" type="string" default="">
<cfparam name="session.authuser.lastname" type="string" default="">
<cfparam name="session.authuser.group" type="string" default="">
<cfparam name="session.authuser.email" type="string" default=""><cfparam name="session.authuser.username" type="string" default="">


<!----  ---->

<!---- Define Edit Variables ---->
<cfparam name="edit.user" type="any" default="#structNew()#">
<cfparam name="edit.user.username" type="string" default="">
<cfparam name="edit.user.firstname" type="string" default="">
<cfparam name="edit.user.lastname" type="string" default="">
<cfparam name="edit.user.group" type="string" default="">
<cfparam name="edit.user.email" type="string" default="">



<!--- PROCESS LOGIN --->
<cfif IsDefined("form.submit_login")>
	<cfif Len(form.username) and Len(form.password)>
		<!--- Always for the negative and prove the positive --->
		<cfset session.auth_isloggedin = false>
        
        <!--- Look them up in the database --->
        <cfquery name="variables.qAuthenticateUser"  dataSource="#application.dsn#">
              SELECT *, IF(password=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">,1,0) AS UpdatePassword
              From Users
              WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">
						AND (  password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#"> OR
							password=MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">));
						<!--- cfqueryparam encapsolate and validate data type in an effort to thwart SQL injection attacks; 
						regardless of web scripting language you should always isolate, clean, and validate user submitted data on the serverside --->
        </cfquery>
        
		<cfif variables.qAuthenticateUser.recordcount eq 1 AND variables.qAuthenticateUser.Updatepassword eq 1 >
		<cfquery name="variables.qUpdatePassword"  dataSource="#application.dsn#">
              UPDATE Users
			  SET password=MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">)
			  WHERE idUsers=#variables.qAuthenticateUser.idUsers#;  
        </cfquery>
		</cfif>
        
        
        <cfif variables.qAuthenticateUser.recordcount EQ 1>
        	<!--- Mark login successful --->
			<cfset variables.auth_message = "Login successful!">
            <cfset session.auth_isloggedin = true>
            
            <!--- Setup User Access --->
            <cfset session.authuser = structNew()>
			<cfset session.authuser.username=variables.qAuthenticateUser.username>
            <cfset session.authuser.firstname = variables.qAuthenticateUser.firstname>
            <cfset session.authuser.lastname = variables.qAuthenticateUser.lastname> 
			<cfset session.authuser.group = variables.qAuthenticateUser.idGroups>
			<cfset session.authuser.email = variables.qAuthenticateUser.email>
			
            
        
        <cfelse>
			<cfset variables.auth_message = "Incorrect username/password.">
            <cfset session.auth_isloggedin = false>
		</cfif>
        
	<cfelse>
		<cfset variables.auth_message = "Incorrect username/password.">
		<cfset session.auth_isloggedin = false>
	</cfif>
	

<cfelseif IsDefined("url.logout")>
	<cfset session.auth_isloggedin = false>
	<cfset StructClear(session)>
	<cfset variables.auth_message = "Successful Logged Out!">
	<cflocation url="index.cfm">
</cfif>



<!----  ---->


<!---- SHOW LOGIN FORM OR CONTENT ----> 

<cfif not session.auth_isloggedin and isDefined("url.logmein")>
	<cfinclude template="includes/login.cfm"> <!--- cfinclude lets you include an external document --->
    <cfabort> <!--- cfabort stops executing code ---->
</cfif>


<!---- ---->


<!---- Create User ---->

<cfif IsDefined("form.submit_create")>
	<cfif Len(form.username) and Len(form.password) and Len (form.firstname) and Len (form.lastname) and Len (form.email)>
		
        <!--- Insert them up in the database --->
        <cfquery name="variables.qCreateUser"  dataSource="#application.dsn#">
              INSERT INTO Users
              (username, password, firstname, lastname, email, idGroups,status)
              VALUES(
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">,
			  MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">),
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstname#">,
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.lastname#">,
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#">,
			  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.group#">,
			  "A"
			  );
		</cfquery>
		
        <cfquery name = "variables.qCheckCreateUser" dataSource="#application.dsn#">
			  SELECT * 
			  FROM Users 
			  WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">; 
		</cfquery>
			  
		<cfif variables.qCheckCreateUser.recordcount EQ 1>
			<cfset variables.auth_message = "User Succesfully Created">
		
		<cfelse>
			<!--- Returning error message in ColdFusion currenlty unavailable --->
		    <cfset variables.auth_message = "User Creation Failed">
        </cfif>                  			

	</cfif>
</cfif>

<!---- ---->


<!----- Edit Your Account  ---->

<cfif IsDefined("form.submit_edit")>
	<cfif Len(form.oldpassword) and Len(form.newpassword) and Len(form.confirmpassword) and Len (form.firstname) and Len (form.lastname) and Len (form.email)>
		<cfquery name="variables.qAuthenticateUser2"  dataSource="#application.dsn#">
              SELECT *
              From Users
              WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.authuser.username#"> 
			  AND (password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.oldpassword#">
			  OR password = MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.oldpassword#">));					
        </cfquery>
		
		<cfif variables.qAuthenticateUser2.recordcount EQ "1" 
		AND "#form.newpassword#"EQ "#form.confirmpassword#">
		
			<!--- Insert them up in the database --->
			
				<cfquery name="variables.qEditUser"  dataSource="#application.dsn#">
					  UPDATE Users 
					  SET
					  password=MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.newpassword#">),
					  firstname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstname#">,
					  lastname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.lastname#">,
					  email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#">
					  WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.authuser.username#"> ;
					
					<!---- status left out because ther is no cf_sql_enum so unsure of what to do---->

				</cfquery>
				<cfif variables.qAuthenticateUser2.recordcount EQ 1>
						<cfset variables.auth_message = "Edit successful!">
						<cfset session.auth_isloggedin = true>
				</cfif>
			<cfelse>
				<cfset variables.auth_message = "User Editing Failed">	
			
		</cfif>	
	<cfelse>	
		<cfset variables.auth_message = "User Editing Failed">	
	</cfif>
</cfif>

<!---- Edit Accounts Table ---->
<cfquery name="variables.qEditAccountsTable" dataSource="#application.dsn#">
	SELECT idUsers, username, password, firstname, lastname, email, idGroups
	FROM Users;
</cfquery>	

<!---- Edit Accounts Form ---->
<cfif IsDefined("form.submit_edit_accounts_table")>
	<cfquery name = "variables.qEditAccountsForm" dataSource="#application.dsn#">
		SELECT * 
		FROM Users
		WHERE idUsers = <cfqueryparam  cfsqltype="cf_sql_integer" value = "#form.idEdit#">;
	</cfquery>
	
	<cfset edit.user = structNew()>
	<cfset edit.user.username= variables.qEditAccountsForm.username>
    <cfset edit.user.firstname = variables.qEditAccountsForm.firstname>
    <cfset edit.user.lastname = variables.qEditAccountsForm.lastname> 
	<cfset edit.user.group = variables.qEditAccountsForm.idGroups>
	<cfset edit.user.email = variables.qEditAccountsForm.email>			
</cfif>	

<cfif IsDefined("form.submit_edit_accounts_form")>
	<!--- Insert them up in the database --->
	<cfquery name="variables.qEditAccounts"  dataSource="#application.dsn#">
		UPDATE Users 
		SET
		password=MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">),
		firstname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstname#">,
		lastname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.lastname#">,
		email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#">,
		idGroups=<cfqueryparam cfsqltype="cf_sql_integer" value="#form.group#">
		WHERE username =  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#"> ;
				
			<!---- status left out because ther is no cf_sql_enum so unsure of what to do---->		
	</cfquery>
	
	<cfquery name="variables.qEditAccounts"  dataSource="#application.dsn#">
		SELECT * FROM Users 
		WHERE
		password=MD5(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">) AND
		firstname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstname#"> AND
		lastname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.lastname#"> AND
		email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#"> AND
		idGroups=<cfqueryparam cfsqltype="cf_sql_integer" value="#form.group#"> AND
		username =  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">;
				
			<!---- status left out because ther is no cf_sql_enum so unsure of what to do---->		
	</cfquery> 
	
	
	<!---- Changes go through but mysql error is displayed---->
			<cfif variables.qEditAccounts.recordcount EQ 1>
			<cfset variables.auth_message = "Edit successful!">
			<cfelse>
			<cfset variables.auth_message = "Edit unsuccessful!">
	</cfif> 
</cfif>

<!---This is for listing roles--->
<cfquery name="variables.qGetRoles" dataSource="#application.dsn#">
		SELECT role_name, role_description, idRoles  
		FROM Roles;
</cfquery>

<!---This is for editing Groups--->
<cfif IsDefined("form.submit_edit_groups")>
<cfquery name="variables.qDeleteGroup_x_Roles" dataSource="#application.dsn#">
	DELETE FROM Groups_x_Roles 
	WHERE idGroups =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.group#">;
</cfquery>

<cfloop list="#form.idRoles#" index="i">
	<cfquery name="variables.qEditGroups" dataSource="#application.dsn#">
		INSERT INTO Groups_x_Roles
		(idGroups, idRoles)
		VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value=#form.group#>, <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">)
	</cfquery>
</cfloop>

	<!--- <cfif variables.qEditGroups.recordcount GTE 1>
		<cfset variables.auth_message = "Group Successfully Edited">
    <cfelse>
		<cfset variables.auth_message = "Editing Failed">
	</cfif>
	--->
</cfif>

<!--- Build Navigation of Pages in Database --->
<cfquery name="variables.qGetWebPages" dataSource="#application.dsn#">
	SELECT *
	FROM Page
	WHERE status="P";
</cfquery>	