<cfif session.auth_isloggedin>
<div id="sidebar">
	<ul class="sidebar-menu">
		<li><h5>USER TOOLS</h5></li>
		<li><a href="EditUser.cfm">Edit User</a></li>
		<li><a href="?logout">Logout</a>
			
		<cfif session.authuser.group EQ "1" OR session.authuser.group EQ "3">
			<li><h5>EDITING TOOLS</strong></<h5></li>
			<cfinclude template="supervisor/supervisorbar.cfm">
		</cfif>
			
		<cfif session.authuser.group EQ "1">
			<cfinclude template="admin/adminbar.cfm">
		</cfif>	
	</ul>
</div>
</cfif>