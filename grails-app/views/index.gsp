<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
   <meta name="layout" content="main">
<title>Group Me</title>
</head>
<body id="body">
	<g:if test="${session?.user}">
		<g:render template="/user/welcomeMessage" />
	</g:if>
	<g:else>
		<g:render template="/user/loginBox" />
	</g:else>
</body>

<r:script>
$(function() {
$('#loginForm').ajaxForm(function(result) {
$('#loginBox').html(result);
});
});
</r:script>
</html>