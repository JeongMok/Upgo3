package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Member;
import com.example.service.OmsService;

@Controller
@RequestMapping(value = "oms")
public class OrderController {

	@Autowired
	@Qualifier("omsService")
	private OmsService omsService;

	// main에서 고객조회 window창 띄우기
	@RequestMapping(value = "searchMember.action", method = RequestMethod.GET)
	public String searchMemberForm(){
		return "order/memberSearch";
	}
	 
	@RequestMapping(value = "searchMember.action", method = RequestMethod.POST)
	@ResponseBody
	public String searchMember(String mbrName, String mbrPhone){
		
		Member member = omsService.authenticate(mbrName, mbrPhone);
		if (member == null){
			System.out.println("검색결과없음");
		} else {
			System.out.println(member.getMbrAddress());
		}
		return "";
	}
	
	@RequestMapping(value = "memberTable.action", method = RequestMethod.GET)
	public String searchItem(Model model, String mbrName, String mbrPhone){
		
		Member member = omsService.authenticate(mbrName, mbrPhone);
		
		model.addAttribute("member", member);
		
		return "order/searchItem";
	}

}