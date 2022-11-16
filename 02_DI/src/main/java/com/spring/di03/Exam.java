package com.spring.di03;

public class Exam {
	
	private String msg;

	public Exam() {	}	// 기본 생성자
	public Exam(String msg) {
		this.msg = msg;
	}	// 인자 생성자
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	// 비지니스 로직
	public void output() {
		System.out.println("메세지 >>> "+msg);
	}
	
}
