package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDealDto;

public interface HouseDealService {

	public List<HouseDealDto> search(Map<String, String> map) throws Exception;

}