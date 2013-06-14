<header>

<cfif len(variables.auth_message)><h3 class="text-center"><cfoutput>#variables.auth_message#</cfoutput></h3></cfif>
<br />
<img src="muttilandlogo2.png" class="img-rounded">
<div class="navbar pull-right">
	<div class="navbar-inner">
		<a class="brand" href="index.cfm">&nbsp;</a>
		<ul class="nav nav-pills">
		<li><a href="index.cfm">Home</a></li>
		<li class="divider-vertical"></li>
		<li><a href="EditUser.cfm">Edit User</a></li>
		<li class="divider-vertical"></li>
		<li><a href="?logout">Logout</a>
	</ul>
</div>

<cfif session.authuser.group EQ "1">
	<cfinclude template="admin/adminbar.cfm">
</cfif>			

<div class="support-note">
	<span class="note-ie">Sorry, only modern browsers.</span>
</div>
				
</header>