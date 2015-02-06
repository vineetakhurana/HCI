<%@ page import="com.hci.StudyGroup" %>



<div class="fieldcontain ${hasErrors(bean: studyGroupInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="studyGroup.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="startTime" pattern="${studyGroupInstance.constraints.startTime.matches}" required="" value="${studyGroupInstance?.startTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studyGroupInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="studyGroup.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endTime" pattern="${studyGroupInstance.constraints.endTime.matches}" required="" value="${studyGroupInstance?.endTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studyGroupInstance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="studyGroup.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${studyGroupInstance?.groupName}"/>

</div>

