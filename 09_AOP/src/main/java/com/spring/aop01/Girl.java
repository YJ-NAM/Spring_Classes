package com.spring.aop01;

/*
 * 여자(청소년)
 * - 학교 수업 후 집에 와서 문을 열고 집에 들어갑니다. ==> 공통관심사항(이전) 
 * - TV로 드라마를 봅니다. 					  ==> 핵심기능
 * - 잠을 잡니다.  							  ==> 공통관심사항(이후) 
 * - 화재 발생 : 119 신고 					  ==> 공통관심사항(이후-예외) 
 * - 아침에 일어나서 문을 열고 집을 나옵니다.		  ==> 공통관심사항(이후) 
 */

public class Girl implements Person {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("드라마를 봅니다.");
	}

}
