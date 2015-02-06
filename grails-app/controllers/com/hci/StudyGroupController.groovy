package com.hci
import com.hci.StudyGroup;

class StudyGroupController {
	def scaffold = StudyGroup
	def index() { }
	
	def create() {
		//println "in create"
		//println "user id " + session["user"].id
		def courses = UserCourse.findAllByUserId(session["user"].id).courseId
		//println "UserCourse.findByUserId" + courses.size()
		List coursename = new ArrayList();
		def roomInstance = Room.all
		for(def course : courses)
		{
			def temp = Course.get(course).courseName
			println "getting " + temp
			coursename.add(temp);
		}
	//	println(coursename.size())

		//get list of students in this course

		[courses : coursename, rooms:roomInstance.roomName]
	}
	def save() {
		//println " saving"
		def thisUser
		thisUser = User.get(session["user"].id)
		if(request.method == 'POST') {
			def studyGroup = new StudyGroup()
			studyGroup.properties[
						'groupName',
						'startTime',
						'endTime',
					] = params
			//def members = params.addMember
			//println "meow"
			//for which course is this study group
			//println("params kya aaya:"+params.courseval)
			
		//	def studyG = GroupLocation.all
				def roomInstance = params.roomName
					
			//println "course id is " + Course.findByCourseName(params.courseval.toString()).id
			studyGroup.courseId = Course.findByCourseName(params.courseval.toString()).id
			def courseInstance = UserCourse.findAllByUserId(thisUser.id)
			
//			for(def cI: courseInstance)
//			{
//				def courseN = Course.get(cI.courseId)
//				if((params.startTime >= courseN.startTime || params.endTime <= courseN.endTime) && params.endTime >=courseN.startTime)
//					
//			}
//					
			
			if(studyGroup.save()){
				def userGroup = new UserGroup()
				userGroup.userId = session["user"].id
				userGroup.studyGroupId = StudyGroup.findByGroupName(studyGroup.groupName).id
				userGroup.save()
				//println "main member saved"
				//now save every member in the user group table
				def members=params.tagN
				List temp = new ArrayList();
				if(members instanceof String) {
					temp.add(members)
				} else {
					temp = members as List
				}
				for(def member : temp)
				{
					userGroup = new UserGroup()
					def userInstance = User.findByLogin(members)
					userGroup.userId = userInstance.id
					//println "member id " + userGroup.userId
					//coz user group table has group ids.
					userGroup.studyGroupId = studyGroup.id //StudyGroup.findByGroupName(studyGroup.groupName).id
					userGroup.save()
					String content = "You have been added to the Study Group: "+studyGroup.groupName+ " by "+ thisUser.firstName + " "+ thisUser.lastName + " (" + thisUser.login + ")";
					sendEmail("New group created", userInstance.email, content)
				}
				
				GroupLocation g = new GroupLocation()
				g.roomId = Room.findByRoomName(roomInstance).id
				g.studyGroupId = studyGroup.id
				g.save()
				
				def day = params.dayI
				GroupDays d = new GroupDays()
				d.studyGroupId =  studyGroup.id
				d.dayName = day;
				d.save()
							
				
				//println "redirecting"
				redirect(action: "show", params: [message: "Successfully saved: \""+ studyGroup.groupName+"\""])
			}
			else
				render view: '/error'
		}
		else {
			return [StudyGroup:studyGroup]
		}
	}


/*	def findMembers = {

		def course = Course.get(params.course.id)

		def courseMembers = UserCourse.findAllByCourseId(course.id)

		List members = new ArrayList();

		for(def x: courseMembers)
		{
			members.add(User.get(x.userId).Login);
		}

		render(template: 'teamSelection', model:  [teams: members])

	}*/
		def find()
	{
		
		def userInstance = User.get(session["user"].id)
		
		def courseInstance= UserCourse.findAllByUserId(userInstance.id)
		List courses = new ArrayList();
		
		for(def c:courseInstance)
		{
			courses.add(Course.get(c.courseId));
		}
				
		render view:"find", model:[courses:courses]
	}	
		def choosecourse()
		{
			def coursename = params.coursename
			def courseInstance= Course.findByCourseName(coursename)
			def userInstance = User.get(session["user"].id)
			
			def courseInstance1= UserCourse.findAllByUserId(userInstance.id)
			def courses = new ArrayList();
			
			for(def c:courseInstance1)
			{
				courses.add(Course.get(c.courseId));
			}
				
			//println (courseInstance);
			def groups = new ArrayList();
			ArrayList hisGroups
			ArrayList roomList = new ArrayList();
			List dayList = new ArrayList();
			def message
			def studyGroupInstance = StudyGroup.findAllByCourseId(courseInstance.id)
			//println("s"+studyGroupInstance)
			def userGroupInstance = UserGroup.findAllByUserId(session["user"].id)
			//println("u"+userGroupInstance)
			if(studyGroupInstance?.id){
			ArrayList courseGroups=new ArrayList(studyGroupInstance.id);
			//println()
			if(userGroupInstance?.id)
			{
				if(userGroupInstance instanceof List)
				{
				hisGroups=new ArrayList(userGroupInstance.studyGroupId);
				}
				else
				{
				hisGroups=new ArrayList(Arrays.asList(userGroupInstance.studyGroupId));
				}
							
				for(def x:hisGroups)
				{
					courseGroups.remove(x);
				}
			}
			for(def y:courseGroups)
			{
				def sg=StudyGroup.get(y)
				//println("y"+y);
				def roomInstance=GroupLocation.findByStudyGroupId(sg.id)
				def room = Room.get(roomInstance.id).roomName
				def day = GroupDays.findByStudyGroupId(sg.id)
				groups.add(sg);
				roomList.add(room);
				dayList.add(day.dayName);
			}
				
			render view:"find", model:[courses:courses, groupInstance: groups, youselected:coursename, roomList:roomList, dayList:dayList]
			}
			else
			{
				message="No study groups found for course"+params.coursename
				render view:"find", model:[courses:courses, groupInstance: groups, youselected:coursename, message:message]
			}
		}	
	def show()
	{  // println "inside show"
		def message
		//String msg = params.message
		//println "message recvd "+ msg
		def myGroups = UserGroup.findAllByUserId(session["user"].id).studyGroupId;
		List groupname = new ArrayList();
		List locationList = new ArrayList();
		List dayList = new ArrayList();
		for(def group : myGroups)
		{
			//println "gorup is " + group
			def temp = StudyGroup.get(group)
			
			def location = GroupLocation.findByStudyGroupId(temp.id)
			def room = Room.get(location.roomId)
			def day = GroupDays.findByStudyGroupId(temp.id)
			
			dayList.add(day.dayName);
			locationList.add(room.roomName);
			
			//println "getting group " + temp
			groupname.add(temp);
		}
		//println " my groups " + groupname.size()
		if(groupname.size()==0)
			 message = "You are not a member of any study group yet"
		[studyGroups: groupname, locationList:locationList, dayList:dayList, message:message]
	}

	def delete()
	{

	}
	def joined()
	{
		def groupId1 = Long.valueOf(params.id).longValue()
		//println "joined with group id " + params.id + " sdsd" + groupId1
		def userGroup = new UserGroup()
		userGroup.studyGroupId =  groupId1
		userGroup.userId =  session["user"].id
		
		userGroup.save()
		//println userGroup.studyGroupId
		redirect(action: "show", params: [message: "Successfully Joined"])
				
	}
	def leave(){
		
		def groupId = Long.valueOf(params.id).longValue()
		def cr1 = StudyGroup.get(groupId)
		//println UserGroup.findByUserIdAndStudyGroupId(session["user"].id, params.id)
		def cr = UserGroup.findByUserIdAndStudyGroupId(session["user"].id, groupId)
		def thisUser= User.get(session["user"].id)
		cr.delete flush:true  //deleting this entry from my groups
		def otherMembers = UserGroup.findAllByStudyGroupId(groupId)
		def roomInstance = GroupLocation.findByStudyGroupId(groupId)
		//if(otherMembers!=null && otherMembers.size()<2)  //according to contraints
		
		//this person has left group
		String content = thisUser.firstName + " "+ thisUser.lastName + " (" + thisUser.login + ")" + " has left the study group "+ cr1.groupName;
		def allMembers = UserGroup.findAllByStudyGroupId(groupId)
		
		for(def aM:allMembers)
		{
			def userInstance = User.get(aM.userId)
			if(userInstance)
				sendEmail("A member left the group you are a member of!",userInstance.email,content);
		}
		if(otherMembers.size()==1)  //according to contraints
		{
			cr1.delete flush:true  //deleting this entry from study groups
			//delete from user_group also
			def cr2 = UserGroup.findByStudyGroupId(groupId)
			def userInstance = User.get(cr2.userId)
			
			roomInstance.delete flush:true
			
			String deleteMessage = cr1.groupName+ " no longer exists as you are the only member of this group!"
			if(userInstance)
				sendEmail("Group being deleted due to insufficient number of members!", userInstance.email , deleteMessage )
			cr2.delete flush:true  //deleting this entry from my groups
			
			//send mail that group no longer exists
			
		}
		redirect(action: "show", params: [message: "You are no longer a member. bhaag ja"])
	}
	
	def addmember()
	{
		def rooms = Room.all
		def coursename = params.coursename.toString()
	//	println("params kya aaya:"+params.coursename)
	//	println(params.dayI)
		def hisCourses = Course.getAll(UserCourse.findAllByUserId(session["user"].id).courseId).courseName
		def courseInstance = Course.findByCourseName(coursename)
		List memberlist = new ArrayList();
		if(courseInstance?.id)
		{
			def memberInstance = UserCourse.findAllByCourseId(courseInstance.id).userId
			for(def mI:memberInstance)
			{
				if(User.get(mI).id!=session["user"].id)
					memberlist.add(User.get(mI).login);
			}
		render view:"create.gsp",model:[courses:hisCourses,memberlist:memberlist, groupname:params.group, starttime:params.start, endtime:params.end,coursename:coursename, dayI:params.dayI, rooms:rooms]	
			
		
		}
		
		else
		 {
			 render "error"
		 }
	}
	
		def mailService
	
	   def sendEmail(String subj, String toSend, String content)
	   {
		  	   try
			   {
				   	   mailService.sendMail {
					   to toSend
					   subject subj
					   body content
					}
			   }
			   catch(Exception e)
			   {
				   e.printStackTrace()
				   println "ERROR!!: Unable to send the notification to email "
			   }
		   render "ok"
	   }
	   
	   def timeInInt()
	   {
		   String time = "9:05";
		   //int[] finaltime = new int[3];
		   int i=0;
		   int x=0;
		   while(i<time.length())
		   {
		   if(time.charAt(i)=='0')
		   {
		   x=0;
		   render x
		   }
		   else if(time.charAt(i)==':')
		  println "nothin"
		   else{
		   x = Character.getNumericValue(time.charAt(i));
		   render x;
		   }
		 
		   i++;
		   
	
		   }
	   }
}