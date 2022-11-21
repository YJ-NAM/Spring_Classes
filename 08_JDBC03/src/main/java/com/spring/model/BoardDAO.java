package com.spring.model;

import java.util.List;

public interface BoardDAO {
	
	List<BoardDTO> getBoardList();
	int insertBoard(BoardDTO dto);
	BoardDTO boardCont(int no);
	void readCount(int no);
	int updateBoard(BoardDTO dto);
	int deleteBoard(int no);
	void updateSeq(int no);
	List<BoardDTO> searchBoardList(String field, String keyword);

}
