package com.spring.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.BoardDAO;
import com.spring.model.BoardDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("board_list.do")
	public String list(Model model) {
		List<BoardDTO> list = this.dao.getBoardList();
		model.addAttribute("list", list);
		return "board_list";		
	}
	
	@RequestMapping("board_write.do")
	public String insert() {
		return "board_write";
	}
	
	@RequestMapping("board_write_ok.do")
	public void insert_ok(BoardDTO dto, HttpServletResponse response) throws IOException {
		int result = this.dao.insertBoard(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.println("<script> alert('성공적으로 글이 등록되었습니다.'); location.href='board_list.do'; </script>");
		}else {
			out.println("<script> alert('글 등록 실패'); history.back(); </script>");
		}
	}
	
	@RequestMapping("board_content.do")
	public String cont(@RequestParam("no") int no, Model model) {
		this.dao.readCount(no);
		BoardDTO dto = this.dao.boardCont(no);
		model.addAttribute("cont", dto);
		return "board_content";
	}
	
	@RequestMapping("board_modify.do")
	public String modify(@RequestParam("no") int no, Model model) {
		BoardDTO dto = this.dao.boardCont(no);
		model.addAttribute("modify", dto);
		return "board_modify";
	}
	
	@RequestMapping("board_modify_ok.do")
	public void modifyOk(BoardDTO dto, @RequestParam("db_pwd") String db_pwd, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if(dto.getBoard_pwd().equals(db_pwd)) {
			int result = this.dao.updateBoard(dto);
			if(result > 0) {
				out.println("<script> alert('성공적으로 글이 수정되었습니다.'); location.href='board_content.do?no="+dto.getBoard_no()+"'; </script>");
			}else {
				out.println("<script> alert('글 수정 실패'); history.back(); </script>");
			}
		}else {
			out.println("<script> alert('비밀번호를 다시 확인해주세요.'); history.back(); </script>");
		}
	}
	
	@RequestMapping("board_search.do")
	public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword, Model model) {
		List<BoardDTO> list = this.dao.searchBoardList(field, keyword);
		model.addAttribute("search", "search");
		model.addAttribute("list", list);
		return "board_list";
	}
	
	@RequestMapping("board_delete.do")
	public void delete(@RequestParam("no") int no, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		int result = this.dao.deleteBoard(no);
		this.dao.updateSeq(no);
		if(result > 0) {
			out.println("<script> alert('성공적으로 글이 삭제되었습니다.'); location.href='board_list.do'; </script>");
		}else {
			out.println("<script> alert('글 삭제 실패'); history.back(); </script>");
		}
	}
}
