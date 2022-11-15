package com.spring.di02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:mydao.xml");
		// getBean 시 object 타입으로 반환됨
		ServiceImpl impl = (ServiceImpl)ctx.getBean("service");
		impl.biz();
		ctx.close();
		// 컨테이너 종료 역할
	}

}
