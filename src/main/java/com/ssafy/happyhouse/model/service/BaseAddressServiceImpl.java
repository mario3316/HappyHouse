package com.ssafy.happyhouse.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.mapper.BaseAddressMapper;

@Service
public class BaseAddressServiceImpl implements BaseAddressService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, String> getLatLngByDong(String dong) {
		return sqlSession.getMapper(BaseAddressMapper.class).getLatLngByDong(dong);
	}

}
