package com.example.service;

import java.util.List;

import com.example.dto.Member;

public interface MemberService {
	
	void register(Member member);
	Member authenticate(Member member);
	List<String> receiveMessage(String mbrId);
	int countMessages(String mbrId);

}
