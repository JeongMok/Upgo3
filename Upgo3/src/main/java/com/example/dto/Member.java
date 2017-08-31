package com.example.dto;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

public class Member {

	private int mbrUserType;
	
	@NotEmpty(message="아이디를 입력해주세요.")
	@Length(min=3, max=20, message="아이디는 3자 이상 20자 미만입니다.")
	private String mbrId;
	
	@NotEmpty(message="이름은 입력해주세요.")
	@Length(min=5, max=20, message="이름은 5자 이상 20자 미만입니다.")
	private String mbrName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mbrRegDate;
	
	@NotEmpty(message="비밀번호를 입력해주세요.")
	@Length(min=5, max=16, message="비밀번호는 5자이상 16자 미만입니다.")
	private String mbrPasswd;
	
	@NotEmpty(message=" - 를 빼고 핸드폰 번호를 입력해주세요")
	@Length(min=10, max=12, message="핸드폰 번호는 10자이상 12자 미만입니다.")
	private String mbrPhone;
	
	@NotEmpty(message="주소를 입력해주세요")
	@Length(min=5, max=30, message="주소는 5자이상 30자 미만입니다.")
	private String mbrAddress;
	
	@NotEmpty(message="이메일 주소를 입력해주세요")
	@Email(message="이메일 형식에 맞게 작성해주세요.")
	private String mbrEmail;

	public int getMbrUserType() {
		return mbrUserType;
	}

	public void setMbrUserType(int mbrUserType) {
		this.mbrUserType = mbrUserType;
	}

	public String getMbrId() {
		return mbrId;
	}

	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}

	public String getMbrName() {
		return mbrName;
	}

	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}

	public Date getMbrRegDate() {
		return mbrRegDate;
	}

	public void setMbrRegDate(Date mbrRegDate) {
		this.mbrRegDate = mbrRegDate;
	}

	public String getMbrPasswd() {
		return mbrPasswd;
	}

	public void setMbrPasswd(String mbrPasswd) {
		this.mbrPasswd = mbrPasswd;
	}

	public String getMbrPhone() {
		return mbrPhone;
	}

	public void setMbrPhone(String mbrPhone) {
		this.mbrPhone = mbrPhone;
	}

	public String getMbrAddress() {
		return mbrAddress;
	}

	public void setMbrAddress(String mbrAddress) {
		this.mbrAddress = mbrAddress;
	}

	public String getMbrEmail() {
		return mbrEmail;
	}

	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}


}
