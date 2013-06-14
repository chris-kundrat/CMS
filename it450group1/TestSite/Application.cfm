<cfapplication name="amuttitest"  clientmanagement="yes" sessionmanagement="yes" setdomaincookies="yes" setclientcookies="yes" sessiontimeout="#CreateTimeSpan(0,1,0,0)#">

<!--- Set Application DSN --->
<cfset application.dsn = "muttilan_classcms_dsn">

<!----  ---->


<!--- DEFINE SESSION VARIABLE DEFAULTS --->

<!--- <cfparam> is the same as <cfif NOT isDefined('VARIABLENAME')><cfset VARIABLENAME=VALUE></CFIF> --->
<cfparam name="session.auth_isloggedin" type="string" default="false"> <!--- Start logged off --->
<cfparam name="variables.auth_message" type="string" default="">
<cfparam name="session.authuser" type="any" default="#structNew()#"> <!---- A Struct is a datatype that is similar to a JavaScript object.  It can hold other variables, functions, etc. --->
<cfparam name="session.authuser.firstname" type="string" default="">
<cfparam name="session.authuser.lastname" type="string" default="">
<cfparam name="session.authuser.roles" type="string" default="">

<!----  ---->



<!--- PROCESS LOGIN --->
<cfif IsDefined("form.submit_login")>
	<cfif Len(form.username) and Len(form.password)>
		<!--- Always for the negative and prove the positive --->
		<cfset session.auth_isloggedin = false>
        
        <!--- Look them up in the database --->
        <cfquery name="variables.qAuthenticateUser"  dataSource="#application.dsn#">
              SELECT *
              From Users
              WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#"> ;	
						<!--- cfqueryparam encapsolate and validate data type in an effort to thwart SQL injection attacks; 
						regardless of web scripting language you should always isolate, clean, and validate user submitted data on the serverside --->
        </cfquery>
        
        
        
        <cfif variables.qAuthenticateUser.recordcount EQ 1>
        	<!--- Mark login successful --->
			<cfset variables.auth_message = "Login successful!">
            <cfset session.auth_isloggedin = true>
            
            <!--- Setup User Access --->
            <cfset session.authuser = structNew()>
            <cfset session.authuser.firstname = variables.qAuthenticateUser.firstname>
            <cfset session.authuser.lastname = variables.qAuthenticateUser.lastname> 
			
            
        
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
    <cfset variables.auth_message = "Successful Logged Out!">
</cfif>



<!----  ---->


<!---- SHOW LOGIN FORM OR CONTENT ---->

<cfif not session.auth_isloggedin>
	<cfinclude template="includes/login.cfm"> <!--- cfinclude lets you include an external document --->
    <cfabort> <!--- cfabort stops executing code ---->
</cfif>


<!---- ---->


<!---- Create User ---->

<cfif IsDefined("form.submit_create")>
	<cfif Len(form.username) and Len(form.password) and Len (form.firstname) and Len (form.lastname) and Len (form.email)>
		
        <!--- Insertthem up in the database --->
        <cfquery name="variables.qCreateUser"  dataSource="#application.dsn#">
              INSERT INTO Users
              (username, password, firstname, lastname, email, status)
              VALUES(
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">,
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">,
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstname#">,
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.lastname#">,
			  <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#">,
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


<!----- Edit User ---->

<cfif IsDefined("form.submit_edit")>
	<cfif Len(form.username) and Len(form.password) and Len (form.firstname) and Len (form.lastname) and Len (form.email)>
		
        <!--- Insertthem up in the database --->
        <cfquery name="variables.qEditUser"  dataSource="#application.dsn#">
			  UPDATE Users 
			  SET
			  password=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">,
			  firstname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstname#">,
			  lastname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.lastname#">,
			  email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.email#">
			  WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#"> ;
			
			<!---- stust left out because ther is no cf_sql_enum so unsure of what to do---->
			 
			 
			<!---- <cfif mysql_affected_rows() EQ 1 >
				<cfset variables.auth_message = "Edit successfully made">
	
						it keeps saying mysql_affected_rows() is undefined
			---->
		
		</cfquery>
				  
		

	</cfif>
</cfif>

<!---- ---->