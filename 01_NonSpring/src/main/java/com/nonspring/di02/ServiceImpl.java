package com.nonspring.di02;

public class ServiceImpl {
	
	private DAO dao;
	
	public ServiceImpl() {
		// TODO Auto-generated constructor stub
	} // 기본 생성자
	
	public ServiceImpl(DAO dao) {
		// TODO Auto-generated constructor stub
		this.dao = dao;
	} // 인자 생성자

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	public void biz() {
		// TODO Auto-generated method stub
		dao.add();
	}
	
}
