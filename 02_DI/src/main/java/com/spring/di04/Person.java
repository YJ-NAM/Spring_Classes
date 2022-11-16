package com.spring.di04;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
// getters and setters 생성
@NoArgsConstructor
// 기본 생성자 생성
@AllArgsConstructor
// 모든 필드 값을 파라미터로 받는 생성자 생성
public class Person {
	
	private String name;
	private String gender;
	private int age;
	private String juminNo;
}
