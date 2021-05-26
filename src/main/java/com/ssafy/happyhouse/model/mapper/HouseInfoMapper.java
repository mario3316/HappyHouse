package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseInfoDto;

public interface HouseInfoMapper {

	public HouseInfoDto search(int no) throws SQLException;

	public List<HouseInfoDto> searchByDong(String dong) throws SQLException;

	public HouseInfoDto searchByDongAptname(Map<String, String> map) throws Exception;
}
