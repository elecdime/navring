package com.bbs.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class admin {
private String id,password;

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}
	
	
}
