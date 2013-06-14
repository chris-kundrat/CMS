<cfif isDefined('url.idPage') AND LEN(url.idPage) AND isNumeric(url.idPage)>	
	<cfquery name="variables.qGetPage" dataSource="#application.dsn#">
       SELECT *
       FROM Page
       WHERE idPage = <cfqueryparam cfsqltype="cf_sql_bigint" value="#url.idPage#">
	   AND status ="p"
       LIMIT 1
    </cfquery>
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
		<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
        <script src="/js/responsive-nav.js-master/responsive-nav.min.js"></script>
    </head>
    <body>
		<cfinclude template="includes/sidebar.cfm">
		
		<cfinclude template="includes/header.cfm">		

        <div id="container">
			<div class="content">
				<h1><cfoutput>#variables.qGetPage.pagename#</cfoutput></h1>
				<hr>
				<cfoutput>#variables.qGetPage.pagecontent#</cfoutput>
		
					
			
			
			</div>
				
        </div>
		
		<cfinclude template="includes/footer.cfm">
        
    </body>
  
</html>