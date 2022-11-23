package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EmpDTO> getEmpList() {
		return this.sqlSession.selectList("list");
	}

	@Override
	public int insertEmp(EmpDTO dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public EmpDTO getEmp(int empno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateEmp(EmpDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEmp(int empno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DeptDTO> getDeptList() {
		return this.sqlSession.selectList("deptList");
	}

	@Override
	public List<EmpDTO> getMgrList() {
		return this.sqlSession.selectList("mgrList");
	}

	@Override
	public List<String> getJobList() {
		return this.sqlSession.selectList("jobList");
	}

	@Override
	public List<EmpDTO> getSearchList(String field, String keyword) {
		return this.sqlSession.selectList(field, keyword);
	}

}
