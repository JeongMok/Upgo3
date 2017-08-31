package com.example.dto;

public class OrderDetail {

	private int odtNo;
	private int odtQuantity;
	private String prdCode;
	private int ordNo;
	private String mbrId;
	private int odtCheck;
	private int odtType;
	
	public int getOdtNo() {
		return odtNo;
	}
	public void setOdtNo(int odtNo) {
		this.odtNo = odtNo;
	}
	public int getOdtQuantity() {
		return odtQuantity;
	}
	public void setOdtQuantity(int odtQuantity) {
		this.odtQuantity = odtQuantity;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public int getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public int getOdtCheck() {
		return odtCheck;
	}
	public void setOdtCheck(int odtCheck) {
		this.odtCheck = odtCheck;
	}
	public int getOdtType() {
		return odtType;
	}
	public void setOdtType(int odtType) {
		this.odtType = odtType;
	}
	

}
