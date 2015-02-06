package com.hci

class UserController {
	def scaffold = User
	def index() { }

	def register() {
		if(request.method == 'POST') {
			def u = new User()
			u.properties[
						'login',
						'password',
						'firstName',
						'lastName',
						'email'
					] = params

			if(u.password =="" || params.confirm =="") {
				u.errors.rejectValue("password", "user.password.empty")
				return [user:u]
			}
			else if(u.password != params.confirm || u.password =="" || params.confirm =="") {
				u.errors.rejectValue("password", "user.password.dontmatch")
				return [user:u]
			}
			else if(u.save()) {
				session.user = u
				session.setMaxInactiveInterval(-1)
				redirect(uri:"/studyGroup/show")
			}

			else {
				return [user:u]
			}
		}
	}

	def login(LoginCommand cmd) {
		if(request.method == 'POST') {
			if(!cmd.hasErrors()) {
				session.setMaxInactiveInterval(-1)
				session.user = cmd.getUser()
				redirect uri:"/studyGroup/show"
			} else {
				flash.message = "incorrect username/password"
				redirect uri:"/"
				//render(view:'/', model: [loginCmd: cmd])
			}
		}
	}

	def logout() {
		session.user = null
		redirect uri:"/"
	}

	def profile(){

	}

	def showProfile()
	{

		def userId = session["user"].id
		//println "user is show prf" + userId
		def courses = UserCourse.findAllByUserId(userId).courseId
		//println courses.size()
		List<String> courseNames = new ArrayList<String>();
		List dayList = new ArrayList();
				
		for (def eachCourse : courses)
		{ //println "buhuhu"
			def courseInstance = Course.get(eachCourse)
			def name =courseInstance.courseName
			def dayL = CourseDays.findByCourseId(courseInstance.id)
			dayList.add(dayL.dayName);
			//println name + "88"
			courseNames.add(Course.get(eachCourse).courseName)
		}
		def information = User.get(userId)
		[courseNames : courseNames, information : information, dayList:dayList]
	}
}

class LoginCommand {
	String login
	String password
	private u
	User getUser() {
		if(!u && login) {
			u = User.findByLogin(login)
		}
		return u
	}
	static constraints = {
		login blank:false, validator:{ val, obj ->
			if(!obj.user)
				return "user.not.found"
		}
		password blank:false, validator:{ val, obj ->
			if(obj.user && obj.user.password != val)
				return "user.password.invalid"
		}
	}
}





