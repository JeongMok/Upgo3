package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.dao.OracleMemberDao;
import com.example.dto.Member;

@Service(value = "memberService")
public class OracleMemberService implements MemberService {

	@Autowired
	@Qualifier("memberDao")
	private OracleMemberDao dao;

	@Override
	public void register(Member member) {
		// TODO Auto-generated method stub
		dao.insert(member);
	}

	@Override
	public Member authenticate(Member member) {
		// TODO Auto-generated method stub
		member = dao.selectMemberByIdAndPasswd(member);
		return member;
		
		
	}
	@Override
	public List<String> receiveMessage(String mbrId) {
		// TODO Auto-generated method stub
		return dao.selectMessageByMemberName(mbrId);
		
	}
	@Override
	public int countMessages(String mbrId) {
		// TODO Auto-generated method stub
		return dao.selectMessage(mbrId);
	}




}
