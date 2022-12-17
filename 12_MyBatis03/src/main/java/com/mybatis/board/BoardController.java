package com.mybatis.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.model.BoardDAO;
import com.mybatis.model.BoardDTO;
import com.mybatis.model.PageDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	// 한 페이지 당 보여질 게시물 수
	private final int rowsize = 5;
	private int totalRecord = 0;
	
	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;	// 처음으로 게시물 전체 목록 태그를 클릭한 경우
		}
		// DB 상의 전체 게시물 수를 확인하는 메서드 호출
		totalRecord = this.dao.getListCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BoardDTO> list = this.dao.getBoardList(dto);
		model.addAttribute("list", list);
		model.addAttribute("paging", dto);
		
		return "board_list";
	}
	
	@RequestMapping("board_write.do")
    public String insert() {
        return "board_write";
    }
	
	@RequestMapping("board_write_ok.do")
	public void insertOk(BoardDTO dto, HttpServletResponse response) throws IOException {
		int check = this.dao.insertBoard(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>alert('Success:)'); location.href='board_list.do'; </script>");
		}else {
			out.println("<script>alert('Fail:<'); history.back(); </script>");
		}
	}
	
	@RequestMapping("board_content.do")
	public String content(@RequestParam("no") int no, @RequestParam("page") int page, Model model) {
		this.dao.readCount(no); // 조회수 증가 메서드
		BoardDTO cont = this.dao.boardCont(no);
		model.addAttribute("cont", cont);
		model.addAttribute("page", page);
		return "board_content";
	}
	
	@RequestMapping("board_modify.do")
	public String modify(@RequestParam("no") int no, @RequestParam("page") int page, Model model) {
		BoardDTO cont = this.dao.boardCont(no);
		model.addAttribute("modify", cont);
		model.addAttribute("page", page);
		return "board_write";
	}
	
	@RequestMapping("board_modify_ok.do")
	public void modifyOk(BoardDTO dto, @RequestParam("page") int page, HttpServletResponse response) throws IOException {
		int check = this.dao.updateBoard(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>alert('Success:)'); location.href='board_content.do?no="+dto.getBoard_no()+"&page="+page+"'; </script>");
		}else {
			out.println("<script>alert('Fail:<'); history.back(); </script>");
		}
	}
	
	@RequestMapping("board_delete.do")
	public void delete(@RequestParam("board_no") int no, @RequestParam("page") int page, HttpServletResponse response) throws IOException {
		int check = this.dao.deleteBoard(no);
		this.dao.updateSequence(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>alert('Success:)'); location.href='board_list.do?page="+page+"'; </script>");
		}else {
			out.println("<script>alert('Fail:<'); history.back(); </script>");
		}
	}
	
	@RequestMapping("board_search.do")
	public String search(@RequestParam("field") String field, @RequestParam("keyword") String keyword, @RequestParam("page") int page, Model model) {
		totalRecord = this.dao.searchBoardCount(field, keyword);
		PageDTO pdto = new PageDTO(page, rowsize, totalRecord, field, keyword);		
		// 검색 시 한 페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드 호출.
		List<BoardDTO> searchList = this.dao.searchBoardList(pdto);		
		model.addAttribute("list", searchList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("field", field);
		model.addAttribute("paging", pdto);		
		return "board_list";
	}

}
