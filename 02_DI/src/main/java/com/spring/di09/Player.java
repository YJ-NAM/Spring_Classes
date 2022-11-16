package com.spring.di09;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Player {
	
	private String name;
	private int age;
	private ArrayList<String> position;
	private double weight;
	private double height;
	

}
