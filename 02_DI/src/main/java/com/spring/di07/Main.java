package com.spring.di07;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:map.xml");
		MapTest test = ctx.getBean("test", MapTest.class);
		
		test.prn();
		ctx.close();
	}

}
