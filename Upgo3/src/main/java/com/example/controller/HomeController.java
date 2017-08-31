package com.example.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.Product;
import com.example.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;

	@RequestMapping(value = {"/" , "/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	// 추후 팝업으로 변경 예정 -효현 
	@RequestMapping(value = "/ordermain.action", method = RequestMethod.GET)
	public String login() {
		
		return "order/ordermain";
	}
	
	// Product List
	@RequestMapping(value = "/itemList.action", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		List<Product> product = productService.selectProduct();

		for (int i = 0; i < product.size(); i++) {
			String code = product.get(i).getPrdCode();
			int sum = productService.codeByAmount(code);
			
			product.get(i).setPrdQuantity(sum);
		}

		model.addAttribute("product", product);
		
		return "cart/itemlist";
	}
	
}
