package com.spring.di04;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx = new ClassPathXmlApplicationContext("person.xml");
		PersonInfo info1 = ctx.getBean("info1", PersonInfo.class);
		PersonInfo info2 = ctx.getBean("info2", PersonInfo.class);
		PersonInfo info3 = ctx.getBean("info3", PersonInfo.class);
		info1.getPersonInfo();
		info2.getPersonInfo();
		info3.getPersonInfo();
		ctx.close();
		
	}

}
