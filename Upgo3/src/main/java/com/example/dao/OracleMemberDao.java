package com.example.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.dto.Member;
import com.example.mapper.MemberMapper;

@Repository(value = "memberDao")
public class OracleMemberDao{

	@Autowired
	@Qualifier("jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;

	/**
	 * 사용자를 DB에 등록하는 메서드(회원가입)
	 */
	public void insert(Member member) {
		// TODO Auto-generated method stub
		memberMapper.insertMember(member);
	}

	/**
	 * 사용자로부터 입력받은 이름과 비밀번호를 가지고 DB를 조회하는 메서드(로그인)
	 */
	public Member selectMemberByIdAndPasswd(Member member) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("mbrId", member.getMbrId());
		params.put("mbrPasswd", member.getMbrPasswd());
		return memberMapper.selectMemberByIdAndPasswd(params);
	}

	public List<String> selectMessageByMemberName(String mbrId) {
		// TODO Auto-generated method stub
		
		return memberMapper.selectMessageByMemberName(mbrId);
		
		
	}

	public int selectMessage(String mbrId) {
		// TODO Auto-generated method stub
		return memberMapper.selectMessage(mbrId);
	}



}
