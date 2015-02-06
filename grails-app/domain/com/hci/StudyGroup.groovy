/*package com.hci

class Group {
	String groupName
	String meetstartTime
	String meetendTime
	static constraints = {
		meetstartTime(matches: "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$")
		meetendTime(matches: "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$")
		groupName unique:true
		}
    
}
*/

package com.hci

class StudyGroup {
	String groupName
	String startTime
	String endTime
	long courseId;
	static constraints = {
		startTime(matches: "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$")
		endTime(matches: "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$")
		groupName unique:true
		}
}
