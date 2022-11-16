package com.spring.di08;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/*
 * AnnotationConfigApplicationContext
 * - 자바 기반 설정 클래스에서 스프링 애플리케이션 컨텍스트를 로드할 때 사용됨
 * - 자바 설정에서 정보를 읽어와 빈(Bean) 객체를 생성, 관리함
 */

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(Config.class);
		Player player1 = ctx.getBean("player1", Player.class);
		System.out.println("선수 이름 : "+player1.getName());
		System.out.println("선수 나이 : "+player1.getAge());
		System.out.println("선수 포지션 : "+player1.getPosition());
		System.out.println("선수 체중 : "+player1.getWeight());
		System.out.println("선수 신장 : "+player1.getHeight());
		
		System.out.println("====================================");
		
		Player player2 = ctx.getBean("player2", Player.class);
		System.out.println("선수 이름 : "+player2.getName());
		System.out.println("선수 나이 : "+player2.getAge());
		System.out.println("선수 포지션 : "+player2.getPosition());
		System.out.println("선수 체중 : "+player2.getWeight());
		System.out.println("선수 신장 : "+player2.getHeight());
		
		System.out.println("====================================");
		
		Player player3 = ctx.getBean("player3", Player.class);
		System.out.println("선수 이름 : "+player3.getName());
		System.out.println("선수 나이 : "+player3.getAge());
		System.out.println("선수 포지션 : "+player3.getPosition());
		System.out.println("선수 체중 : "+player3.getWeight());
		System.out.println("선수 신장 : "+player3.getHeight());
		
		ctx.close();
		
	}

}
