<html>
<head>
<title>Group Me</title>
<meta name="layout" content="webpages">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'general.css')}" type="text/css">
<script type="text/javascript">
function chooseCourse(coursename)
{
	var data=coursename.value;
	window.location.href="${createLink(controller:'StudyGroup' ,action:'choosecourse' ,params:[coursename:""])}" + data;
}

</script>
</head>

<body id="body">
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<div id=template_render>
		<g:if test="${session?.user}">
			<g:render template="/user/profile" />
		</g:if>
</div>
	
<div id="embed_content">

	
	<g:if test="${courses?.id}">
	<select name="course" id="course" onchange="chooseCourse(this)" onkeyup="chooseCourse(this)" style="height: 26px; width: 176px; font-size: 20px;">
							<option value=" ">Select a course </option>
							<g:each in="${courses}">
								<option id="${it.courseName}" value="${it.courseName}">${it.courseName}</option>
							</g:each>
	</select>
	</g:if>
	
<br><br>
<g:form action="joined" method="POST" style="margin-top: 10px;">
<g:if test="${message}">
		<div class="saved" style="width: 560px; height: 100%">
			<h4 style="margin-left: 20px;">
				${message}
			</h4>
		</div>
</g:if>
	<g:else>
	  <table class="all" id="cssTable">
				<tbody><tr><td colspan = 6 text-align="center"><g:if test="${youselected}">
	<label style="font-size: 20px;"><br><br> For course: ${youselected}, Study Groups available </label>
	</g:if> </td></tr>
				<g:if test="${groupInstance}">
					<tr>
						<td class="general"> Group Name </td>	
						<td class="general"> Day </td>
						<td class="general"> Start time </td>
						<td class="general"> End time </td>
						<td class="general" colspan=""> Location</td>
						<td> </td>	
					</tr>
						<g:each in="${groupInstance}" status="i" var="group">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td class="general"> 
								${group.groupName}
							 </td>
							 <td>${dayList[i]}
							 </td>
							 <td class="general"> 
								${group.startTime}
							 </td>
							<td class="general">
								${group.endTime}
							</td>	
							<td colspan ="2" class="general">
								 ${roomList[i]}
							</td>
							<td><g:link controller="StudyGroup"
									action="joined" id="${group.id}">
									Join
								</g:link>
							</td>
						</tr>
					</g:each> 
					</g:if>
   				</tbody>
			</table>
			</g:else>
			</g:form>		
			
			</div>
	
</body>
</html>