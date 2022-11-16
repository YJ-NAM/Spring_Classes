package com.spring.di04;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonInfo {
	
	private Person person;
	
	// 비지니스 로직
	public void getPersonInfo() {
		if(person != null) {
			System.out.println("이름 >>> "+person.getName());
			System.out.println("성별 >>> "+person.getGender());
			System.out.println("나이 >>> "+person.getAge());
			System.out.println("주민번호 >>> "+person.getJuminNo());
		}
	}
}
