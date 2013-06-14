
<header>
	<div id="title" class="text-center">
		<h1>MUTTIVERSITY</h1>
	</div>

	<div role="navigation"  id="nav">
		<ul class="nav">
			<li><a <cfif NOT isDefined('url.idPage')>class="active"</cfif> href="index.cfm">Home</a></li>
			<cfloop query="variables.qGetWebPages">
				<li>
					<a <cfif isDefined('url.idPage') AND url.idPage EQ variables.qGetWebPages.idPage[CurrentRow]>class="active"</cfif> href="template.cfm?idPage=<cfoutput>#variables.qGetWebPages.idPage[CurrentRow]#</cfoutput>"><cfoutput>#variables.qGetWebPages.pagename[CurrentRow]#</cfoutput></a>
				</li>
			</cfloop>
		</ul>
				
	</div>

	<cfif len(variables.auth_message)><h3 class="text-center"><cfoutput>#variables.auth_message#</cfoutput></h3></cfif>

</header>