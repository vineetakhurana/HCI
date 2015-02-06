<!DOCTYPE html>
<html>
<head>
<title>Create Study Group</title>
<meta name="layout" content="webpages">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'general.css')}" type="text/css">
	
	<script type="text/javascript">
	function addmembers(coursename)
	{
		var group = document.getElementById("groupName").value;
		var start = document.getElementById("startTime").value;
		var end = document.getElementById("endTime").value;
		var dayI = document.getElementById("day").value;
		
		window.location.href=
		     "${createLink(controller:'StudyGroup', action:'addmember'
		         ).encodeAsJavaScript()}?coursename=" + encodeURIComponent(coursename.value)
		    + "&group=" + encodeURIComponent(group)  + "&start=" + encodeURIComponent(start)  + "&end=" + encodeURIComponent(end) + "&dayI=" + encodeURIComponent(dayI);
		
	}
	
	function add(name)
	{
		alert("hi");
	}
</script>

	
</head>
<body>
	<div id=template_render>
		<g:if test="${session?.user}">
			<g:render template="/user/profile" />
		</g:if>
	</div>
	<div id=original_content>
		<%--
	
	<div id=create-studygroup style="width: 560px; height: 100%">
		--%>
		
		<br>
		
		<g:hasErrors bean="${studyGroup}">
			<div class="errorAdd "
				style="width: 560px; height: 20px; margin-left: 8px;">
				<g:renderErrors bean="${studyGroup}"></g:renderErrors>
			</div>
		</g:hasErrors>
		<fieldset>
			<g:form action="save" name="saveStudyGroup" method="post">
			<input type="hidden" name="courseval" value="${coursename}"/>
				<table id="cssTable">
				<tr><td colspan = 2 text-align = "center"><h3>CREATE YOUR STUDY GROUP</h3></td></tr>
					<tr>
						<td>Group Name</td>
						<td><g:textField id="groupName" name="groupName" required="true"
								style="height: 20px;" value="${groupname}"></g:textField></td>
					</tr>
					<tr>
						<td>Day</td>
						<td><g:textField id="day" name="dayI" required="true"
								style="height: 20px;" value="${dayI}"></g:textField></td>
					</tr>
					<tr>
						<td>Start Time</td>
						<td><g:textField id="startTime" name="startTime" required="true"
								style="height: 20px;" value="${starttime}"></g:textField></td>
					</tr>
					<tr>
						<td>End Time</td>
						<td><g:textField id="endTime" name="endTime" required="true"
								style="height: 20px;" value="${endtime}"></g:textField></td>
					</tr>
				
						<tr>
						<td>Select course</td>
						<td><select style="
    width: 163px;
    height: 26px;font-size:16px;" name="course" onchange="addmembers(this)" onkeyup="addmembers(this)">
					<option> </option>
					<g:each in="${courses}"> <option> ${it} </option> </g:each>
					</select>
					</td>
					</tr>
					
					<g:if test="${memberlist}">
					<tr>
						<td>Add Member</td>
						<td><g:render template="addmember"/></td>
					</tr>
					<tr>
						<td>Select Room</td>
					<td>	
					<g:select name="roomName"
								style="
    width: 163px;
    height: 26px;font-size:16px;
" from="${rooms.roomName}"
								id="mySelect" required="true" value="select"/> </td> </tr>
					<tr>
						<td colspan = 2><g:submitButton class="formButton" style = "height: 26px;width: 100px;margin-left: 150px;"
								name="createStudyGroup"
								
								action="save" value="SAVE"></g:submitButton></td>
					</tr>
						
					</g:if>
					
					</table>
			</g:form>
		</fieldset>
	</div>
</body>
</html>
