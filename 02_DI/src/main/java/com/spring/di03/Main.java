package com.spring.di03;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ClassPathXmlApplicationContext : generic~ 에서 classpath 직접 입력하던 것 -> 이미 포함
		AbstractApplicationContext ctx = new ClassPathXmlApplicationContext("exam.xml");
		
		// Exam exam = tx.getBean("exam", Exam.class); -> (Exam)으로 casting 안 해도 됨
		Exam exam = ctx.getBean("exam", Exam.class);
		exam.output();
		ctx.close();
	}

}
