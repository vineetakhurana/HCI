<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
 <meta name="layout" content="webpages">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'HelvetiList.css')}" type="text/css">
<title>Profile</title>
</head>
<body>
<div>
<div id ="loggedin_profile">
<g:if test="${session?.user}">
	<g:render template="/user/welcomeMessage" />
</g:if>
	<ul>
		<li><g:link controller="user" action="showProfile">Show My Profile</g:link>
			 </li>
		<li><g:link controller="StudyGroup" action="create">Create New Study Group</g:link>
			 </li>
		<li><g:link controller="studyGroup" action="show">Show My Study Groups</g:link>
			 </li>
		<li><g:link controller="studyGroup" action="find">Find A Study Group</g:link>
			 </li>
			 
	</ul>
</div>

</div>
</body>
</html>


