package com.hci

class Room {
	
	String roomName;
	
    static constraints = {
		roomName unique:true
    }
}
