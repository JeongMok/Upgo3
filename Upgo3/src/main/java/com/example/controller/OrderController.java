package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	
	@RequestMapping(value = "memberSearch.action", method = RequestMethod.GET)
	public String memberCkeck(){
		return "order/memberSearch";
	}


}
