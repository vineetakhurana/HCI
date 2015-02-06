  <link rel="stylesheet" href="${resource(dir: 'css', file: 'general.css')}"
	type="text/css">
 
<g:if test="${session?.user}">
		<div id="quickaccess">
			<a href=""> ${session?.user?.firstName}>> 
			</a>,
			<g:link controller="user" action="logout">Logout</g:link> <br><br>
		</div>
	</g:if>
<br>


