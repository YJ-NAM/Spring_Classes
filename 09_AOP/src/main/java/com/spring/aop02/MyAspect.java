package com.spring.aop02;

// Advice ==> 스프링에서 공통 관심 사항이 있는 코드들의 묶음
public class MyAspect {
	
	public void before() {
		System.out.println("학교 수업 후 집에 와서 문을 열고 집에 들어갑니다.");
	}
	public void after() {
		System.out.println("아침에 일어나서 문을 열고 집을 나옵니다.");
	}
	public void after_returning() {
		System.out.println("잠을 잡니다.");
	}
	public void after_throwing() {
		System.out.println("화재 발생 : 119 신고");
	}
}
