package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Member;
import com.example.dto.Order;
import com.example.dto.Product;
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
	
	
	// 멤버검색
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
	
	// 데이터가 들어있는 테이블 가져오기
	@RequestMapping(value = "memberTable.action", method = RequestMethod.GET)
	public String searchItem(Model model, String mbrName, String mbrPhone){
		
		Member member = omsService.authenticate(mbrName, mbrPhone);
		
		model.addAttribute("member", member);
		
		return "order/searchItem";
	}
	
	///////////////////////주문목록//////////////////////////////////
	
	// 주문목록 팝업 띄우기
	@RequestMapping(value = "productList.action", method = RequestMethod.GET)
	public String openWindow(Model model){
		
		ArrayList<Product> products = omsService.productList();
		model.addAttribute("products", products);
		
		return "order/searchProduct";
		
	}
	// 오더확정하기
	@RequestMapping(value="orderConfirm.action", method = RequestMethod.POST)
	@ResponseBody
	public String orderConfirm(Member member, Product product, Model model, List<Order> orders){
		//orders.
		//for(int i=0; i< count; i++)
		//omsService.orderConfirm(member, product);
		return null;
	}
}