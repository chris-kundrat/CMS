<cfif session.authuser.group EQ "1" OR session.authuser.group EQ "3">
	<li><a href="CreateEditPage.cfm">Create/Edit Page</a></li>
</cfif>