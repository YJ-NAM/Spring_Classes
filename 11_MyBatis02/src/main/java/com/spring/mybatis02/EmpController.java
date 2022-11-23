package com.spring.mybatis02;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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


}
