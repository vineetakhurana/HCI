<%@ page import="com.hci.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="course.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="startTime" pattern="${courseInstance.constraints.startTime.matches}" required="" value="${courseInstance?.startTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="course.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endTime" pattern="${courseInstance.constraints.endTime.matches}" required="" value="${courseInstance?.endTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseName', 'error')} required">
	<label for="courseName">
		<g:message code="course.courseName.label" default="Course Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="courseName" required="" value="${courseInstance?.courseName}"/>

</div>

