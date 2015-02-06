package com.hci
import com.hci.Course;
/*
 * This is the domain class for persisting user information to the backend.
 * 
 * Name        User.groovy
 * Author      Ayushi Jain
 * Version     0.4
 * Since       0.1
 * Copyright   iCiDIGITAL
 *
 */

class User {
	String login
	String password
	String firstName
	String lastName
	String email
	static constraints = {
		login blank:false, size:5..15,matches:/[\S]+/, unique:true
		password blank:false, size:5..15,matches:/[\S]+/
		firstName blank:false
		lastName blank:false
		email email: true
	}
}
