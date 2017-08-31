package com.example.dto;

import java.util.Date;
import java.util.List;

public class Order {

	private String ordNo;
	private Date ordDate;
	private String ordMemo;
	private String ordAddress;
	private String ordPhone;
	private String ordName;
	private Date rdDeliveryDate;
	private int onstallTime;
	private int odtQuantity;
	private int dtType;
	private List<Order> orderList;
	
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public Date getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public String getOrdMemo() {
		return ordMemo;
	}
	public void setOrdMemo(String ordMemo) {
		this.ordMemo = ordMemo;
	}
	public String getOrdAddress() {
		return ordAddress;
	}
	public void setOrdAddress(String ordAddress) {
		this.ordAddress = ordAddress;
	}
	public Date getRdDeliveryDate() {
		return rdDeliveryDate;
	}
	public void setRdDeliveryDate(Date rdDeliveryDate) {
		this.rdDeliveryDate = rdDeliveryDate;
	}
	public int getOnstallTime() {
		return onstallTime;
	}
	public void setOnstallTime(int onstallTime) {
		this.onstallTime = onstallTime;
	}
	public int getOdtQuantity() {
		return odtQuantity;
	}
	public void setOdtQuantity(int odtQuantity) {
		this.odtQuantity = odtQuantity;
	}
	public int getDtType() {
		return dtType;
	}
	public void setDtType(int dtType) {
		this.dtType = dtType;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public String getOrdPhone() {
		return ordPhone;
	}
	public void setOrdPhone(String ordPhone) {
		this.ordPhone = ordPhone;
	}
	public String getOrdName() {
		return ordName;
	}
	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}
	
}
