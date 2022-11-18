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
	
	@RequestMapping("member_insert.do")
	public String member_insert() {
		return "member_insert";
	}
	
	@RequestMapping("member_insert_ok.do")
	public void insertOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		int res = this.dao.insertMember(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script> alert('회원등록성공'); location.href='member_list.do'; </script>");
		}else {
			out.println("<script> alert('회원등록실패 8^8'); history.back(); </script>");
		}
	}
	
	@RequestMapping("member_content.do")
	public String cont(@RequestParam("num") int no, Model model) {
		this.dao.getMember(no);
		MemberDTO dto = this.dao.getMember(no);
		model.addAttribute("Cont", dto);
		return "member_content";
	}
	
	@RequestMapping("member_update.do")
	public String modifyOk(@RequestParam("num") int no, Model model) {
		MemberDTO dto = this.dao.getMember(no);
		model.addAttribute("Update", dto);
		return "member_update";
	}
	
	@RequestMapping("member_update_ok.do")
	public void updateOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		int check = this.dao.updateMember(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>alert('Successfully modified'); location.href='member_content.do?num="+dto.getNum()+"';</script>");
//			out.println("<script> alert('회원수정성공'); location.href='member_content.do?num="+dto.getNum()+"'; </script>");
		}else {
			out.println("<script> alert('회원수정실패 8^8'); history.back(); </script>");
		}
	}
	
	@RequestMapping("member_delete.do")
	public void delete(@RequestParam("num") int no, HttpServletResponse response) throws IOException {
		int res = this.dao.deleteMember(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res > 0) {
			this.dao.updateSequence(no);
			out.println("<script> alert('회원이 삭제되었습니다.'); location.href='member_list.do'; </script>");
		}else {
			out.println("<script> alert('회원삭제실패 8^8'); history.back(); </script>");
		}
	}
	
//	@RequestMapping("/member_search.do")
//	public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword, Model model) {
//		List<MemberDTO> searchList = this.dao.searchMemberList(field, keyword);
//		model.addAttribute("memList", searchList);
//		model.addAttribute("field", field);
//		model.addAttribute("keyword", keyword);
//		return "member_list";
//	}
	
	@RequestMapping("member_search.do")
    public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword, Model model) {
        List<MemberDTO> searchList = this.dao.searchMemberList(field, keyword);
        model.addAttribute("memList", searchList);
        model.addAttribute("field", field);
        model.addAttribute("keyword", keyword);
        return "member_list";
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
}
