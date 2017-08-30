package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.dao.OrderDao;
import com.example.dto.OrderDetail;

@Service
public class OrderService {
	
	@Autowired
	@Qualifier("orderDao")
	OrderDao orderDao;

	public void insertByCode(OrderDetail order) {
		orderDao.insertByCode(order);
	}
}
