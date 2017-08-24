package com.example.mapper;

import java.util.HashMap;

import com.example.dto.Member;

public interface OmsMapper {

	Member findByNameAndPhoneNumber(HashMap<String, Object> params);
}
