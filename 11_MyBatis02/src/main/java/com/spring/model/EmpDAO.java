package com.spring.model;

import java.util.List;

public interface EmpDAO {
	
	List<EmpDTO> getEmpList();
	int insertEmp(EmpDTO dto);
	EmpDTO getEmp(int empno);
	int updateEmp(EmpDTO dto);
	int deleteEmp(int empno);
	List<DeptDTO> getDeptList();
	List<EmpDTO> getMgrList();
	List<String> getJobList();
	List<EmpDTO> getSearchList(String field, String keyword);

}
