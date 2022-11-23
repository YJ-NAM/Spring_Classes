package com.spring.mybatis02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.DeptDTO;
import com.spring.model.EmpDAO;
import com.spring.model.EmpDTO;

@Controller
public class EmpController  {
	
    @Inject
    private EmpDAO dao;
    
    @RequestMapping("emp_list.do")
    public String list(Model model) {
    	List<EmpDTO> empList = this.dao.getEmpList();
    	model.addAttribute("list", empList);
    	return "emp_list";
    }
    
    @RequestMapping("emp_insert.do")
    public String insert(Model model) {
    	// 담당업무 조회 + 관리자 조회 + 부서번호 조회
    	List<String> jobList = this.dao.getJobList();
    	List<EmpDTO> mgrList = this.dao.getMgrList();
    	List<DeptDTO> deptList = this.dao.getDeptList();
    	model.addAttribute("jList", jobList);
    	model.addAttribute("mList", mgrList);
    	model.addAttribute("dList", deptList);
		return "emp_insert";
    }
    
    @RequestMapping("emp_search.do")
    public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword, Model model) {
    	List<EmpDTO> searchList = this.dao.getSearchList(field, keyword);
    	model.addAttribute("list", searchList);
    	model.addAttribute("field", field);
    	model.addAttribute("keyword", keyword);
    	return "emp_list";
    }
    
    @RequestMapping("emp_insert_ok.do")
    public void insertOk(EmpDTO dto, HttpServletResponse response) throws IOException {
    	int check = this.dao.insertEmp(dto);
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	if(check > 0) {
    		out.println("<script>alert('Resgistration successed'); location.href='emp_list.do'; </script>");
    	}else {
    		out.println("<script>alert('Resgistration failed'); history.back(); </script>");
    	}
    }
}
