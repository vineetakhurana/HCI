<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'registration.css')}"
	type="text/css">
  <meta name="layout" content="webpages">
<title>Register</title>
</head>
<body>
<div id=register-form style="width: 500px;">
	<h3>REGISTRATION FORM</h3>
	<br> <br>
	<g:hasErrors bean="${user}">
		<div class="errors">
			<g:renderErrors bean="${user}"></g:renderErrors>
		</div>
	</g:hasErrors>
	<fieldset>
		<g:form action="register" name="registerForm">
			<table cellspacing="10" cellpadding="10">
				<tr>
					<td width=100%><div class="input1">
							<label for="login">Login:</label></td>
					<td><g:textField name="login" required="true"
							value="${user?.login}"></g:textField>
						</div></td>
				</tr>
				<tr>
					<td width=100%><div class="input1">
							<label for="password">Password:</label></td>
					<td><g:passwordField name="password" required="true"
							value="${user?.password}"></g:passwordField>
						</div></td>
				</tr>

				<tr>
					<td width=100%><div class="input1">
							<label for="confirm">Confirm Password:</label></td>
					<td><g:passwordField name="confirm" required="true"
							value="${params?.confirm}"></g:passwordField>
						</div></td>
				</tr>

				<tr>
					<td width=100%><div class="input1">
							<label for="firstName">First Name:</label></td>
					<td><g:textField name="firstName" required="true"
							value="${user?.firstName}"></g:textField>
						</div></td>
				</tr>
				<tr>
					<td width=100%><div class="input1">
							<label for="lastName">Last Name:</label></td>
					<td><g:textField name="lastName" required="true"
							value="${user?.lastName}"></g:textField>
						</div></td>
				</tr>
				<tr>
					<td width=100%><div class="input1">
							<label for="email">Email:</label></td>
					<td><g:textField name="email" required="true"
							value="${user?.email}"></g:textField>
						</div></td>
				</tr>
			</table>
			<g:submitButton class="formButton" name="register" value="REGISTER"></g:submitButton>
		</g:form>
	</fieldset>
</div>
</body>
</html>