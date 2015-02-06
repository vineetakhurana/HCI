<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <meta name="layout" content="webpages">  <link rel="stylesheet" href="${resource(dir: 'css', file: 'general.css')}"
	type="text/css">
<title>Group Me</title>
</head>
<body>

<div id = template_render>
	<g:if test="${session?.user}">
		<g:render template="/user/profile" />
	</g:if></div>
	<div id = original_content>
	<table cellspacing="10" cellpadding="10" id="cssTable">
		<tr><td colspan = 2 text-align = "center"><h3 text-align = center>MY PROFILE INFORMATION</h3></td></tr>
					<tr><tr>
		  <td strong> Login : </td>
			<td>
				${information.login}
			</td>
		</tr>
		<tr><td strong> First Name : </td>
			<td>
				${information.firstName}
			</td>
		</tr>
		<tr><td strong> Last Name : </td>
			<td>
				${information.lastName}
			</td>
		</tr>
		<tr><td strong> Email : </td>
			<td>
				${information.email}
			</td>
		</tr>
		<tr><td strong colspan = 3> My Courses: </td></tr>
		<g:each in="${courseNames}" var="p" status="i">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				<td align="left"colspan = 2>
					${p}
				</td>
				<td> ${dayList[i]} 
				</td>
			</tr></g:each>
	</table></div>
</body>