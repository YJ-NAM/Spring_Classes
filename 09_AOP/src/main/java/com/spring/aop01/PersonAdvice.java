package com.spring.aop01;

public class PersonAdvice implements Person{
	
    private Person person;
    
    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

	
	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		
		// 핵심 기능(이전)
		System.out.println("학교 수업 후 집에 와서 문을 열고 집에 들어갑니다.");
		
		try {
			person.doSomething();
			// 핵심 기능 이후(after-returning)
			System.out.println("잠을 잡니다.");
		} catch (Exception e) {
            // 예외가 발생한 경우(after-throwing)
            System.out.println("화재 발생 : 119에 신고");
        } finally {
            // 예외가 발생하더라도(after)
            System.out.println("아침에 일어나서 문을 열고 집을 나옵니다.");
        }

	}
}
