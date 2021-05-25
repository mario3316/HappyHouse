package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseInfoDto;

public interface SubwayService {

	public List<HouseInfoDto> search(Map<String, String> map) throws Exception;
}
