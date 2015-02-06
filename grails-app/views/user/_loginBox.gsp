  <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}"
	type="text/css">
	  <g:if test="${session?.user}">
</g:if>
<g:else>
	<h3>
		<div class="right" id="loginBox">
			<g:render template="/user/loginForm" />
			<footer1 class="clearfix">
			<p id="lastText">
				&nbsp &nbsp  
				<g:link controller="user" action="register"><font color="#415a68">New User? Register Here</g:link>
			</p>
			</footer1>
		</div>
	</h3>
</g:else>

