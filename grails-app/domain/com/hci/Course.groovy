package com.hci

class Course {
	String courseName
	String startTime
	String endTime
	static constraints = {
		startTime(matches: "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$")
		endTime(matches: "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$")
		courseName unique:true
		}
}
