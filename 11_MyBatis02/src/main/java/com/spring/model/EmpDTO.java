package com.spring.model;

import lombok.Data;

@Data
public class EmpDTO {
	
	private int empno;
    private String ename;
    private String job;
    private int mgr;
    private String hiredate;
    private int sal;
    private int comm;
    private int deptno;
    private String dname;
}
