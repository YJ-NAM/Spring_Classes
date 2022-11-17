package com.khie.jdbc01;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khie.model.MemberDAO;
import com.khie.model.MemberDTO;

@Controller
public class MemberController {

	@Inject
	private MemberDAO dao;
	
	@RequestMapping("/member_list.do")
	public String list(Model model) {		
		List<MemberDTO> list = dao.getMemberList();
		model.addAttribute("memList", list);
		
		return "member_list";
	}
	
	@RequestMapping("/member_insert.do")	
	public String insert(Model model) {
		return "member_insert";
	}
	
	@RequestMapping("/member_insert_Ok.do")	
	public String insertOk(Model model) {
		return "member_insert_Ok";
	}
}
