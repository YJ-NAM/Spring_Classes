package com.spring.di01;

public class MyGetSum {
		
	private int su1;
	private int su2;
	private GetSum getSum;
	
	public int getSu1() {
		return su1;
	}
	public void setSu1(int su1) {
		this.su1 = su1;
	}
	public int getSu2() {
		return su2;
	}
	public void setSu2(int su2) {
		this.su2 = su2;
	}
	public GetSum getGetSum() {
		return getSum;
	}
	public void setGetSum(GetSum getSum) {
		this.getSum = getSum;
	}
	
	// 비지니스 로직 
	public void sum() {
		this.getSum.hap(su1, su2);
	}
}
