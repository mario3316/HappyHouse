package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.mapper.HouseDealMapper;

@Service
public class HouseDealServiceImpl implements HouseDealService {

	private static final Logger logger = LoggerFactory.getLogger(HouseDealServiceImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HouseDealDto> search(Map<String, String> map) throws Exception {

		if (map.get("by").equals("dong")) {
			return sqlSession.getMapper(HouseDealMapper.class).searchByDong(map.get("keyword"));
		} else if (map.get("by").equals("aptname")) {
			return sqlSession.getMapper(HouseDealMapper.class).searchByAptName(map.get("keyword"));
		}

		return null;
	}

}
