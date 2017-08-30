package com.example.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.example.dto.OrderDetail;
import com.example.mapper.OrderMapper;


@Repository
public class OrderDao {
	
	@Autowired
	@Qualifier("orderMapper")
	OrderMapper orderMapper;

	public void insertByCode(OrderDetail order) {
		orderMapper.insertByCode(order);
	}
}
