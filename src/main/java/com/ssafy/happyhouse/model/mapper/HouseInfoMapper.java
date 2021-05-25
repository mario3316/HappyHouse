package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.HouseInfoDto;

public interface HouseInfoMapper {

	public HouseInfoDto search(int no) throws SQLException;

	public List<HouseInfoDto> searchByDong(String dong) throws SQLException;
}
