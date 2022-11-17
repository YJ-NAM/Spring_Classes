package com.khie.jdbc01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void insertOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		int res = this.dao.insertMember(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>alert('회원 등록 성공'); location.href='member_list.do'; </script>");		
		}else {
			out.println("<script>alert('회원 등록 실패'); history.back(); </script>");
		}
	}
	
	// member_content.do?num -> num 파라미터 받아줘야함
	@RequestMapping("/member_content.do")
	public String content(@RequestParam("num") int no, Model model) {
		MemberDTO dto = this.dao.getMember(no);
		model.addAttribute("Cont", dto);
		
		return "member_content";
	}
	
}
