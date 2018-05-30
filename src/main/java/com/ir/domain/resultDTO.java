package com.ir.domain;

public class resultDTO {

	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getPath() {
		return path;
	}




	public void setPath(String path) {
		this.path = path;
	}




	public float getScore() {
		return score;
	}




	public void setScore(float score) {
		this.score = score;
	}




	String name;
	String path;
	float score;
	
	public resultDTO(String name, String path, float score2) {
		super();
		this.name = name;
		this.path = path;
		this.score = score2;
	}
	
	
	public resultDTO() {
	}

}
