package com.spring.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private JdbcTemplate template;
	String sql = null;

	@Override
	public List<BoardDTO> getBoardList() {
		List<BoardDTO> list = null;
		sql = "select * from board order by board_no desc";		
		return list = this.template.query(sql, new RowMapper<BoardDTO>() {

			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
                dto.setBoard_title(rs.getString("board_title"));
                dto.setBoard_cont(rs.getString("board_cont"));
                dto.setBoard_pwd(rs.getString("board_pwd"));
                dto.setBoard_hit(rs.getInt("board_hit"));
                dto.setBoard_date(rs.getString("board_date"));
                dto.setBoard_update(rs.getString("board_update"));				
				return dto;
			}			
		});
	}

	@Override
	public int insertBoard(final BoardDTO dto) {
		final int count = this.template.queryForObject("select max(board_no) from board", Integer.class);
		
		sql = "insert into board values (?, ?, ?, ?, ?, default, sysdate, '')";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, count+1);
				ps.setString(2, dto.getBoard_writer());
				ps.setString(3, dto.getBoard_title());
				ps.setString(4, dto.getBoard_cont());
				ps.setString(5, dto.getBoard_pwd());
			}
		});
	}

	@Override
	public BoardDTO boardCont(int no) {
		sql = "select * from board where board_no = ?";
		return this.template.queryForObject(sql, new RowMapper<BoardDTO>() {

			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
	            dto.setBoard_title(rs.getString("board_title"));
	            dto.setBoard_cont(rs.getString("board_cont"));
	            dto.setBoard_pwd(rs.getString("board_pwd"));
	            dto.setBoard_hit(rs.getInt("board_hit"));
	            dto.setBoard_date(rs.getString("board_date"));
	            dto.setBoard_update(rs.getString("board_update"));				
				return dto;		
			}	
		}, no);
	}

	@Override
	public void readCount(final int no) {
		sql = "update board set board_hit = board_hit + 1 where board_no = ?";
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, no);
			}
		});
	}

	@Override
	public int updateBoard(final BoardDTO dto) {
		sql = "update board set board_title = ?, board_cont = ?, board_update = sysdate where board_no = ?";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getBoard_title());
				ps.setString(2, dto.getBoard_cont());
				ps.setInt(3, dto.getBoard_no());
			}
		});		
	}

	@Override
	public int deleteBoard(final int no) {
		sql = "delete from board where board_no = ?";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, no);				
			}
		});		
	}

	@Override
	public void updateSeq(final int no) {
		sql = "update board set board_no = board_no -1 where board_no > ?";
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, no);
			}
		});
	}

	@Override
	public List<BoardDTO> searchBoardList(String field, String keyword) {
		
		String search_sql = "";
		if(field.equals("all")) {
			search_sql = "board_title like '%"+keyword+"%' or board_cont like '%"+keyword+"%' or board_writer like '%"+keyword+"%'";
		}else if(field.equals("title")) {
			search_sql = "board_title like '%"+keyword+"%'";
		}else if(field.equals("cont")) {
			search_sql = "board_cont like '%"+keyword+"%'";
		}else if(field.equals("writer")) {
			search_sql = "board_writer like '%"+keyword+"%'";
		}
		
		List<BoardDTO> list = null;
		sql = "select * from board where "+search_sql+" order by board_no desc";
		return list = this.template.query(sql, new RowMapper<BoardDTO>() {

			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
                dto.setBoard_title(rs.getString("board_title"));
                dto.setBoard_cont(rs.getString("board_cont"));
                dto.setBoard_pwd(rs.getString("board_pwd"));
                dto.setBoard_hit(rs.getInt("board_hit"));
                dto.setBoard_date(rs.getString("board_date"));
                dto.setBoard_update(rs.getString("board_update"));				
				return dto;
			}
		});
	}

}
