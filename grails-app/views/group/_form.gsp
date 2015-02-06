<%@ page import="com.hci.StudyGroup" %>



<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="group.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="startTime" pattern="${groupInstance.constraints.startTime.matches}" required="" value="${groupInstance?.startTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="group.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endTime" pattern="${groupInstance.constraints.endTime.matches}" required="" value="${groupInstance?.endTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="group.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${groupInstance?.groupName}"/>

</div>

