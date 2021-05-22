package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.mapper.CommercialMapper;

@Service
public class CommercialServiceImpl implements CommercialService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CommercialDto> search(Map<String, String> map) throws Exception {
		if (map.get("key").equals("dong")) {
			return sqlSession.getMapper(CommercialMapper.class).searchByDong(map.get("word"));
		}
		return null;
	}

}
