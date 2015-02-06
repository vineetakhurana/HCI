
<%@ page import="com.hci.StudyGroup"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet"
	href="${resource(dir: 'css', file: 'general.css')}" type="text/css">
<title>Show Study Groups</title>
</head>
<body>
	<div id=template_render>
		<g:if test="${session?.user}">
			<g:render template="/user/profile" />
		</g:if>
	</div>
	<div id=original_content>
	<g:if test="${message}">
		<div class="saved" style="width: 560px; height: 100%">
			<h4 style="margin-left: 20px;">
				${message}
			</h4>
		</div>
	</g:if>
	<g:else>
	<div id=selection-form style="width: 560px;">
		<fieldset>
			<g:form name="showMyStudyGroups"
				url="[controller:'StudyGroup',action:'leave']">
				<table cellspacing="10" cellpadding="10" id="cssTable">	
				<tr><td colspan = 4 text-align = "center"><h3>SHOW MY STUDY GROUPS</h3></td></tr>
				<th>Group Name</th><th>Day</th><th> Start Time </th><th> End Time</th> <th> Location</th>
					<g:each in="${studyGroups}" status="i" var="p">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td align="left">
								${p.groupName}
							</td>
							<td>
								${dayList[i]}
							</td>
							<td align="left">
								${p.startTime}
							</td>
							<td align="center">
								${p.endTime}
							</td>
							<td>
								${locationList[i]}
							</td>
							
							<td><g:link controller="StudyGroup"
									action="leave" id="${p.id}">
									Leave
								</g:link>
							</td>
						</tr>
					</g:each>
				</table>
			</g:form>
		</fieldset>
	</div></g:else></div>
</html>
	