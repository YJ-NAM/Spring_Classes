package com.spring.di06;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String path1 = "classpath:baseball.xml";
		String path2 = "classpath:baseball2.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path1, path2);
		
		PlayerInfo info = (PlayerInfo)ctx.getBean("playerinfo");
		info.getPlayerInfo();
		
		System.out.println("==============================");
		
		BaseballTeam team = (BaseballTeam)ctx.getBean("team");
		
		System.out.println("::: 국가대표 야구 선수단 :::");
		System.out.println("감독 " + team.getManager());
		System.out.println("타격코치 " + team.getBattingCoach());
		System.out.println("투수코치 " + team.getPitcherCoach());
		System.out.println("타자 " + team.getHitter());
		System.out.println("투수 " + team.getPitcher());
		
		ctx.close();
	}

}
