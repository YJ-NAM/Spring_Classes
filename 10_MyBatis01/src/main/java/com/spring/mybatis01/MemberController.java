package com.spring.mybatis01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;

@Controller
public class MemberController {
	
	@Inject
	private MemberDAO dao;
	
	@RequestMapping("member_list.do")
	public String list(Model model) {
		List<MemberDTO> list = this.dao.getMemberList();
		model.addAttribute("List", list);
		return "member_list";
	}
	
	@RequestMapping("member_insert.do")
	public String insert() {
		return "member_insert";
	}
	
	@RequestMapping("member_insert_ok.do")
	public void insertOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		int check = this.dao.insertMember(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('Succesfully member registered.'); location.href='member_list.do'; </script>");
		}else {
			out.println("<script> alert('Member registration failed.'); history.back(); </script>");
		}
	}
	
	@RequestMapping("member_content.do")
	public String content(@RequestParam("num") int no, Model model) {
		MemberDTO cont = this.dao.getMember(no);
		model.addAttribute("cont", cont);
		return "member_content";		
	}
	
	@RequestMapping("member_modify.do")
	public String modify(@RequestParam("num") int no, Model model) {
		MemberDTO cont = this.dao.getMember(no);
		model.addAttribute("modify", cont);
		return "member_modify";		
	}
	
	@RequestMapping("member_modify_ok.do")
	public void modifyOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		int check = this.dao.updateMember(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('Succesfully member modified.'); location.href='member_content.do?"+dto.getNum()+"'; </script>");
		}else {
			out.println("<script> alert('Member modification failed.'); history.back(); </script>");
		}
	}

}
