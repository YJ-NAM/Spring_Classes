package com.nonspring.di02;

public class Main {

	public static void main(String[] args) {
		// 기존에 Java, JSP에서 사용하던 방식
		MySqlDAO mySqlDAO = new MySqlDAO();
		mySqlDAO.add();
		
		System.out.println("=================================");
		
		OracleDAO oracleDAO = new OracleDAO();
		oracleDAO.add();
		
		System.out.println("=================================");

		// 1. 인자 생성자를 이용하여 주입하는 방법
		ServiceImpl impl = new ServiceImpl(new OracleDAO());
		impl.biz();
		
		// 2. setter() 메서드를 이용하여 주입하는 방법
		ServiceImpl impl2 = new ServiceImpl();
		impl2.setDao(new MySqlDAO());
		
		impl2.biz();
	}

}
