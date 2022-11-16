package com.spring.di05;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.di04.PersonInfo;

public class Main {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:car.xml");

		CarImpl car = (CarImpl)ctx.getBean("carimpl");
		car.getCarPrint();
		ctx.close();
	}

}
