package com.khie.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

// Spring에서 일반적으로 DAO 클래스에는 @Repository 애노테이션 적용.
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	// 자동으로 의존관계를 설정해 주는 애노테이션.
	// 무조건 객체에 대한 의존을 주입해 주는 애노테이션.
	private JdbcTemplate template;
	
	String sql = null;

	@Override
	public List<MemberDTO> getMemberList() {
		// TODO Auto-generated method stub
		List<MemberDTO> list = null;
		sql = "select * from member10 order by num desc";
		return list = this.template.query(sql, new RowMapper<MemberDTO>() {

			@Override
			public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMemid(rs.getString("memid"));
				dto.setMemname(rs.getString("memname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setAge(rs.getInt("age"));
				dto.setMileage(rs.getInt("mileage"));
                dto.setJob(rs.getString("job"));
                dto.setAddr(rs.getString("addr"));
                dto.setRegdate(rs.getString("regdate"));
				
				return dto;
			}
		});				
	}

	// insert 메서드
	@Override
	public int insertMember(final MemberDTO dto) {
		
		sql = "select max(num) from member10";
		final int count = this.template.queryForInt(sql);
		
		sql = "insert into member10 values(?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, count + 1);
				ps.setString(2, dto.getMemid());
				ps.setString(3, dto.getMemname());
				ps.setString(4, dto.getPwd());
				ps.setInt(5, dto.getAge());
				ps.setInt(6, dto.getMileage());
				ps.setString(7, dto.getAddr());
				ps.setString(8, dto.getJob());
			}
		});
	}

	@Override
	public MemberDTO getMember(int num) {
		sql = "select * from member10 where num = ?";
		return this.template.queryForObject(sql, new RowMapper<MemberDTO>() {
			

			@Override
			public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			MemberDTO dto = new MemberDTO();
			dto.setNum(rs.getInt("num"));
			dto.setMemid(rs.getString("memid"));
			dto.setMemname(rs.getString("memname"));
			dto.setPwd(rs.getString("pwd"));
			dto.setAge(rs.getInt("age"));
			dto.setMileage(rs.getInt("mileage"));
            dto.setJob(rs.getString("job"));
            dto.setAddr(rs.getString("addr"));
            dto.setRegdate(rs.getString("regdate"));
			
			return dto;
			
			}	
		}, num);		
	}

	@Override
	public int updateMember(final MemberDTO dto) {
		
		sql = "update member10 set age = ?, mileage = ?, job = ?, addr = ? where num = ?";
		// 익명 메서드 사용~!
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, dto.getAge());
				ps.setInt(2, dto.getMileage());
				ps.setString(3, dto.getJob());
				ps.setString(4, dto.getAddr());
				ps.setInt(5, dto.getNum());
			}
		}); 
	}

	@Override
	public int deleteMember(final int num) {
		// TODO Auto-generated method stub
		sql = "delete from member10 where num = ?";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, num);				
			}
		});
	}

	@Override
	public void updateSequence(final int num) {
		// TODO Auto-generated method stub
		sql = "update member10 set num = num - 1 where num > ?";
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, num);				
			}
		});
	}

	@Override
	public List<MemberDTO> searchMemberList(String field, String keyword) {
	    List<MemberDTO> searchList = null;

	    String search_sql = "";
	    if(field.equals("id")){
	        search_sql = "memid like '%" + keyword + "%'";
	    }else if(field.equals("name")){
	        search_sql = "memname like '%" + keyword + "%'";
	    }else if(field.equals("job")){
	        search_sql = "job like '%" + keyword + "%'";
	    }

	    sql = "select * from member10 where " + search_sql + " order by num desc";

	    searchList = this.template.query(sql, new RowMapper<MemberDTO>() {
	        @Override
	        public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
	            MemberDTO dto = new MemberDTO();

	            dto.setNum(rs.getInt("num"));
	            dto.setMemid(rs.getString("memid"));
	            dto.setMemname(rs.getString("memname"));
	            dto.setPwd(rs.getString("pwd"));
	            dto.setAge(rs.getInt("age"));
	            dto.setMileage(rs.getInt("mileage"));
	            dto.setJob(rs.getString("job"));
	            dto.setAddr(rs.getString("addr"));
	            dto.setRegdate(rs.getString("regdate"));
	            return dto;
	        }
	    });
	    return searchList;
	}
}
