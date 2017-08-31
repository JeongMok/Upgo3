package com.example.mapper;


import java.util.HashMap;
import java.util.List;

import com.example.dto.Member;

public interface MemberMapper {
	
	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);
	void insertMember(Member member);
	List<String> selectMessageByMemberName(String mbrId);
	int selectMessage(String mbrId);
	Member selectMemberByIdAndPasswd(String name, String userId);

	
}
