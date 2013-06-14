<cfif session.authuser.group EQ "1">	
	<div class="navbar pull-right">
		<div class="navbar-inner">
			<ul class="nav nav-pills">
				<li><a href="EditAccounts.cfm">Edit Accounts</a></li>
				<li class="divider-vertical"></li>
				<li><a href="CreateUser.cfm">Create User</a></li>
			</ul>
	</div>
</cfif>