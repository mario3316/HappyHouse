package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.mapper.HouseInfoMapper;

@Service
public class HouseInfoServiceImpl implements HouseInfoService {

	private static final Logger logger = LoggerFactory.getLogger(HouseInfoServiceImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public HouseInfoDto search(int no) throws SQLException {
		return sqlSession.getMapper(HouseInfoMapper.class).search(no);
	}

}
