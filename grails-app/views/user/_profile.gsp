
<meta name="layout" content="webpages">

<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'HelvetiList.css')}" type="text/css">

<div style="
    margin-left: 20px;"><g:if test="${session?.user}">

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
	</li>
</div>
