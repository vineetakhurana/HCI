
<%@ page import="com.hci.StudyGroup"%>
<!DOCTYPE html>
<html>
<head>
<title>Show Courses</title>
</head>
<body>
	<g:if test="${session?.user}">
		<g:render template="/user/profile" />
	</g:if>
		<br>
		<ul>
			<g:each in="${courseNames}" var="p">
				<li><g:link controller="resource" action="report"
						params="['websiteID': "${p}"]">
						${p}
					</g:link></li>
			</g:each>
		</ul>
	</div>
</body>
</head>
</html>