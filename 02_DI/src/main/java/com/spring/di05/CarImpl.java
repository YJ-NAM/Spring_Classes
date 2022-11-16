package com.spring.di05;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CarImpl {
	
	private Car car;
	
	public void getCarPrint() {
		car.drive();
	}
	

}
