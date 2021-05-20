package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.HouseDealDto;

public interface HouseDealMapper {

	public List<HouseDealDto> searchAll() throws SQLException;

	public List<HouseDealDto> searchByDong(String dong);

	public List<HouseDealDto> searchByAptName(String AptName);

}
