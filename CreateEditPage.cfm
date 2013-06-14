<cfparam name="variables.displaytype" default="list">
<cfparam name="variables.idPage" default="">
<cfparam name="variables.pagename" default="">
<cfparam name="variables.pagetitle" default="">
<cfparam name="variables.pagecontent" default="">
<cfparam name="variables.message" default="">
<!--- Delete page --->
<cfif isDefined('url.deletePage') AND isNumeric(url.deletePage)>
	<!--- verify logged in user has permission to delete --->
	<cfif session.authuser.group EQ "1" OR session.authuser.group EQ "3">
		<!--- query to make sure page id is valid --->
			<cfquery name="variables.qValidatePage" dataSource="#application.dsn#">
				SELECT * 
				FROM Page
				WHERE idPage = <cfqueryparam cfsqltype="cf_sql_bigint" value="#url.deletePage#">;
			</cfquery>
		<!--- if its valid query to delete it to change status --->
			<cfif variables.qValidatePage.recordcount EQ 1>
				<cfquery name="variables.qDeletePage" dataSource="#application.dsn#">
					DELETE FROM Page
					WHERE idPage= <cfqueryparam cfsqltype="cf_sql_bigint" value="#url.deletePage#">;
				</cfquery>
			
				<!--- double check to make sure its been deleted --->
				<cfquery name="variables.qValidatePage" dataSource="#application.dsn#">
					SELECT * 
					FROM Page
					WHERE idPage = <cfqueryparam cfsqltype="cf_sql_bigint" value="#url.deletePage#">;
				</cfquery>
			
				<cfif variables.qValidatePage.recordcount EQ 0>
					<!--- Mark successful --->
					<cfset variables.auth_message = "Delete successful!">
					
				</cfif>
				
				<!--- reload page with a cflocation url## something like that this probably prevents the message from showing though --->
				<cflocation url="#CGI.SCRIPT_NAME#">
				
			</cfif>
</cfif>
<!--- GENERAL NOTE make sure all display pages in navigation do not display delete pages --->
</cfif> 
<!--- Save page data --->
<cfif  isDefined('form.idPage')>
	<!--- if form submitted, set local variables equal to form data 
			PROBABLY SHOULD CHECK TO MAKE SURE THEY EXISIST!!!  I"M NOT RIGHT NOW ---->
	<cfset variables.idPage = form.idPage >
	<cfset variables.pagename = form.pagename >
    <cfset variables.pagetitle = form.pagetitle>
    <cfset variables.pagecontent = form.pagecontent>
	<cfset variables.status = form.ControlName>
</cfif>

<cfif isDefined('form.idPage') AND len(form.idPage) AND isNumeric(form.idPage)>
    <!--- Make sure it exsits --->
    <cfquery name="variables.qGetdata"  dataSource="#application.dsn#">
       SELECT *
       FROM Page
       WHERE idPage = <cfqueryparam cfsqltype="cf_sql_bigint" value="#form.idPage#">
       LIMIT 1
    </cfquery>
    
    <!--- If if exsists then update ---> 
    <cfif variables.qGetdata.recordcount EQ 1>
    <cfquery name="variables.qsavedata"  dataSource="#application.dsn#">
        UPDATE Page
        SET pagename = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.pagename#">,
        	pagetitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.pagetitle#">,
            pagecontent = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.pagecontent#">,
			status = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.status#">
        WHERE idPage = <cfqueryparam cfsqltype="cf_sql_bigint" value="#form.idPage#">
    </cfquery>
    <cfset variables.message = "Page saved.">
    <cfelse>
    	<cfset variables.message = "Couldn't save, that page does not exist.">
    </cfif>
<!--- Here the form has been submitted, BUT the idPage is blank; so should be an insert --->
<cfelseif isDefined('form.idPage') AND len(form.idPage) EQ 0>
	<cfquery name="variables.qsavedata"  dataSource="#application.dsn#">
        INSERT INTO Page(pagename,pagetitle,pagecontent,status)
        VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.pagename#">,
		<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.pagetitle#">,
		<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.pagecontent#">, 
		<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.status#">)
    </cfquery>
    <cfset variables.message = "New page saved.">
</cfif>

<!--- Get display page data --->
<cfif isDefined('url.idPage') AND LEN(url.idPage) AND isNumeric(url.idPage)>
   <!--- Get the page --->
   	<!--- Probably should check for a status --->
    <cfquery name="variables.qGetdata"  dataSource="#application.dsn#">
       SELECT *
       FROM Page
       WHERE idPage = <cfqueryparam cfsqltype="cf_sql_bigint" value="#url.idPage#">
       LIMIT 1
    </cfquery>
    
    <!--- Check to make sure one was found and set appropriate variables --->
    <cfif variables.qGetdata.recordcount EQ 1>
    	<cfset variables.idPage= variables.qGetdata.idPage >
		<cfset variables.pagename = variables.qGetdata.pagename >
        <cfset variables.pagetitle = variables.qGetdata.pagetitle>
        <cfset variables.pagecontent = variables.qGetdata.pagecontent>
        <cfset variables.displaytype = 'page'>
    <cfelse>
    	<cfset variables.message = 'That page does not exist.'>
    </cfif>
 <cfelseif isDefined('url.newpage')>
 	<cfset variables.displaytype = 'page'>
 <cfelse> <!---- List all the pages --->	
 	  <cfquery name="variables.qGetdata"  dataSource="#application.dsn#">
       SELECT *
       FROM Page;
    </cfquery>
    
    <cfset variables.displaytype = 'list'>
</cfif>

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
		
        <!--[if lte IE 8]><link rel="stylesheet" href="/js/responsive-nav.js-master/responsive-nav.css"><![endif]-->
		<!--[if gt IE 8]><!--><link rel="stylesheet" href="/css/responsivestylestyles.css"><!--<![endif]-->
		<script src="js/jquery-1.9.0.min.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script src="/js/responsive-nav.js-master/responsive-nav.min.js"></script>
		
		<!--- <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Muttiland CMS</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="author" content="US" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<script src="js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]--> --->
    </head>
    <body>
	
		<cfinclude template="includes/sidebar.cfm">
		
		<cfinclude template="includes/header.cfm">	
		
        <div id="container">
				
			<div id="content">
					<!--- List individualpage --->
					<cfif variables.displaytype EQ "page">
						<cfform class="form" method="post" action="#CGI.SCRIPT_NAME#">
							<cfinput name="idPage" type="hidden" value="#variables.idPage#">
							<h1>EDIT THIS PAGE</h1>
							<table>
								<tr>
									<td>Page Name:</td>
									<td><cfinput value="#variables.pagename#" name="pagename" id="pagename"></td>
								</tr>
								<tr>
									<td>Page Title:</td>
									<td><cfinput value="#variables.pagetitle#" name="pagetitle" id="pagetitle"></td>
								</tr>
								<tr>
									<td>Page Content:</td>
								</tr>
							</table>
							<cftextarea richtext="yes"  name="pagecontent" id="pagecontent" value="#variables.pagecontent#" height="500" />
                        
                        
						<h3>Page Status</h3>
						<table width="150">
						<tr>
							<td>Edit This Page</td>
							<td><cfinput type="Radio" name="ControlName" value="NP" checked></td>
						</tr>
						<tr>
							<td>Publish This Page</td>
							<td><cfinput type="Radio" name="ControlName" value="P"></td>
						</tr>
						</table>
						<br>																	
						
					
							<cfinput name="save" type="Submit" value="Save" onClick="confirm('You sure you want to make these changes?')"class="btn btn-primary" />
						
						
                     </cfform>
                       
					
					
					
                    <cfelse>
						<!---- List all pages --->
						<h1>Create A New Page Or Choose One To Edit/Delete</h1>
						<hr>
						<h3><cfoutput><a href="#CGI.SCRIPT_NAME#?newpage=yes">Create A New Page</a></cfoutput></h3>
						<table class = "GetPages">
							<tr>
								<th>Page Name</th>
								<th>Page Status</th>
							</tr>
							<cfoutput query="variables.qGetdata">
								<tr>
									<td>#variables.qGetdata.pagename#</td>
									<td>#variables.qGetdata.status#</td>
									<td><a href="#CGI.SCRIPT_NAME#?idPage=#variables.qGetdata.idPage#">Edit</a></td>
									<td><a href="#CGI.SCRIPT_NAME#?deletePage=#variables.qGetdata.idPage#">Delete</a></td>
								</tr>
                        	
							</cfoutput>
                        </table>
                    </cfif>
                
                
            
			</div>
        </div>
		
		<cfinclude template="includes/footer.cfm">
		
    </body>
</html>