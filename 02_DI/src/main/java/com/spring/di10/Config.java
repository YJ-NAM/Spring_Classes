package com.spring.di10;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource("classpath:baseball4.xml")
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
