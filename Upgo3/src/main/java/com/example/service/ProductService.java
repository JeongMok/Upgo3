package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.dao.ProductDao;
import com.example.dto.Product;

@Service
public class ProductService {
	
	@Autowired
	@Qualifier("productDao")
	ProductDao productDao;
	
	
	public List<Product> selectProduct(){
		List<Product> product = productDao.selectProduct();
		return product;
	}


	public Product selectProductByCode(Product product) {
		Product data = productDao.selectProductByCode(product);
		return data;
	}


	public int codeByAmount(String code) {
		int sum = productDao.codeByAmount(code);
		return sum;
	}


//	public Member memberLogin(Member member) {
//		// TODO Auto-generated method stub
//		logger.info("memberLogin");
//		return memberDao.selectMemberByIdAndPasswd(member);
//	};
	
	
}
