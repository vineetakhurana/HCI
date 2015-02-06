<link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}"
	type="text/css">
<div id="login-form">	<h3>Login</h3>
	<fieldset>
		<g:form name="loginForm" url="[controller:'user',action:'login']"
			class="form">
			<div class="input1">
				<g:textField required="true" placeholder="Username" name="login"
					value="${fieldValue(bean:loginCmd, field:'login')}" />
				<%--<g:hasErrors bean="${loginCmd}" field="login">
					<p class="error">
						<br>
						<g:fieldError bean="${loginCmd}" field="login" />
					</p>
				</g:hasErrors>
			--%></div>
			<br>
			<div class="input1">
				<g:passwordField required="true" placeholder="Password"
					name="password" />
			</div>	<div class="bottom">
						
			<input type="submit" value="Sign In" class="btn1" />
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
		</g:form>

							<div class="clear"></div>
	</fieldset>
	<br>
</div>