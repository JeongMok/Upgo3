package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Member;
import com.example.dto.Order;
import com.example.dto.Product;
import com.example.service.OmsService;

import net.sf.json.JSONArray;

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
	public String searchMember(String mbrName, String mbrPhone, String mbrId){
		
		Member member = omsService.authenticate(mbrName, mbrPhone);
		if (member == null){
			System.out.println("검색결과없음");
		} else {
		}
		return "";
	}
	
	// 데이터가 들어있는 테이블 가져오기
	@RequestMapping(value = "memberTable.action", method = RequestMethod.GET)
	public String searchItem(Model model, String mbrName, String mbrPhone, String mbrId){
		
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
	@RequestMapping(value="orderConfirm.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void orderConfirm(Model model,HttpServletRequest request)throws IOException {
	    

		String[] productList= request.getParameterValues("productList");
		String[] quantityList= request.getParameterValues("quantityList");
		String[] mbrId = request.getParameterValues("mbrId");
		String[] ordName = request.getParameterValues("ordName");
		String[] ordAddress = request.getParameterValues("ordAddress");
		String[] ordPhone = request.getParameterValues("ordPhone");


		omsService.insertOrder(mbrId[0],ordAddress[0],ordPhone[0],ordName[0]);
		for(int i=0; i<productList.length; i++){
			System.out.println("productList"+i+"th value is "+productList[i]);
			System.out.println("quantityList"+i+"th value is "+quantityList[i]);
			
			omsService.insertOrderList(productList[i],quantityList[i], mbrId[0]);
		}

	}
}