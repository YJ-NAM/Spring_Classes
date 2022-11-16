package com.spring.di09;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:baseball3.xml");
		
		Player player1 = ctx.getBean("player1", Player.class);
		
		System.out.println("선수 이름 : "+player1.getName());
		System.out.println("선수 나이 : "+player1.getAge());
		System.out.println("선수 포지션 : "+player1.getPosition());
		System.out.println("선수 체중 : "+player1.getWeight()+"kg");
		System.out.println("선수 신장 : "+player1.getHeight()+"cm");
		
		System.out.println("====================================");
				
		Player player2 = ctx.getBean("player2", Player.class);
		System.out.println("선수 이름 : "+player2.getName());
		System.out.println("선수 나이 : "+player2.getAge());
		System.out.println("선수 포지션 : "+player2.getPosition());
		System.out.println("선수 체중 : "+player2.getWeight()+"kg");
		System.out.println("선수 신장 : "+player2.getHeight()+"cm");
		
		System.out.println("====================================");
		
		Player player3 = ctx.getBean("player3", Player.class);
		System.out.println("선수 이름 : "+player3.getName());
		System.out.println("선수 나이 : "+player3.getAge());
		System.out.println("선수 포지션 : "+player3.getPosition());
		System.out.println("선수 체중 : "+player3.getWeight()+"kg");
		System.out.println("선수 신장 : "+player3.getHeight()+"cm");
		
		ctx.close();

	}

}
