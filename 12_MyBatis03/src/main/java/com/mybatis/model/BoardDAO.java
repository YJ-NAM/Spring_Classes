package com.mybatis.model;

import java.util.List;

public interface BoardDAO {
	
	int getListCount();
	List<BoardDTO> getBoardList(PageDTO dto);
	int insertBoard(BoardDTO dto);
	void readCount(int no);
	BoardDTO boardCont(int no);
	int updateBoard(BoardDTO dto);
	int deleteBoard(int no);
	void updateSequence(int no);
	int searchBoardCount(String field, String keyword);
	List<BoardDTO> searchBoardList(PageDTO dto);

}
