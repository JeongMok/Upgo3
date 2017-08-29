package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Product;
import com.example.service.ProductService;

@Controller
public class CartController {
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;
	
	@RequestMapping(value = "productDetail.action", method = RequestMethod.POST)
	public @ResponseBody Product selectProduct(Product product){
		
		System.out.println(product.getPrdCode());
		
		Product data = productService.selectProductByCode(product);
		
		return data;
	}


}
