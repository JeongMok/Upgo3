package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Member;
import com.example.dto.Product;
import com.example.service.WarehouseService;

@Controller
@RequestMapping(value = "warehouse")
public class WarehouseController {

	@Autowired
	@Qualifier("warehouseService")
	private WarehouseService warehouseService;

	@RequestMapping(value = "warehouse-status.action", method = RequestMethod.GET)
	public String searchMemberForm(){
		return "warehouse/warehouse-status";
	}
	
	
//	@RequestMapping(value = "searchMember.action", method = RequestMethod.POST)
//	@ResponseBody
//	public String searchMember(String mbrName, String mbrPhone){
//		
//		Member member = omsService.authenticate(mbrName, mbrPhone);
//		if (member == null){
//			System.out.println("�??��결과?��?��");
//		} else {
//			System.out.println(member.getMbrAddress());
//		}
//		return "";
//	}
	
	
}