package com.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;	

	@Override
	public List<MemberDTO> getMemberList() {
		return this.sqlSession.selectList("all");
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public MemberDTO getMember(int num) {
		return this.sqlSession.selectOne("content", num);
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return this.sqlSession.update("edit", dto);
	}

	@Override
	public int deleteMember(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updatSeq(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberDTO> searchMemberList(String field, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
