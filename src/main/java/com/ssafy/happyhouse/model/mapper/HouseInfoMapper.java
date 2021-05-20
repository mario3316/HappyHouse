package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.HouseInfoDto;

public interface HouseInfoMapper {

	public HouseInfoDto search(int no) throws SQLException;

}
