package com.spring.aop01;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person boy = new Boy();
		Person girl = new Girl();
		PersonAdvice advice = new PersonAdvice();
		advice.setPerson(girl);
		advice.doSomething();
	}

}
