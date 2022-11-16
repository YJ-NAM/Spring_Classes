package com.spring.di09;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 * DI 설정 시 Java 코드에서 애노테이션을 설정하여 주입하는 방법
 * 
 * - @Configuration, @Bean 애노테이션을 사용함
 * 
 * - @Configuration : 클래스 앞에 선언하는 애노테이션
 * 					  "해당 클래스는 스프링 설정에 사용되는 클래스입니다."라고 알려주는 애노테이션
 * - @Bean : 메서드 앞에 사용되는 애노테이션
 * 			 "해당 메서드는 객체 생성 시 사용됩니다."라고 아려주는 애노테이션
 * 
 * - 애노테이션의 역할
 *   * 컴파일러에게 정보를 알려주는 역할
 *   * 컴파일 및 설치 시의 작업을 지정하는 역할
 *   * 실행할 때 별도의 처리가 필요한 경우 사용됨
 *   
 * - 주의 : 설정 시 반드시 cglib 라이브러리 필요함
 * 		   ==> pom.xml 파일에 해당 라이브러리 추가 필요
 */

public class Config {
	
	@Bean
	public Player player1() {		
		ArrayList<String> position = new ArrayList<String>();
		position.add("4번타자");
		position.add("1루수");
		Player player = new Player("추신수", 38, position, 100, 188);
		
		return player;
	}
	
	@Bean
	public Player player2() {		
		ArrayList<String> position = new ArrayList<String>();
		position.add("9번타자");
		position.add("투수");
		Player player = new Player("류현진", 34, position, 110, 190);
		
		return player;
	}
	
	@Bean
	public Player player3() {		
		ArrayList<String> position = new ArrayList<String>();
		position.add("104번타자");
		position.add("100루수");
		Player player = new Player("카드", 88, position, 88, 77);
		
		return player;
	}

}
