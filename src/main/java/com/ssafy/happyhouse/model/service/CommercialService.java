package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.CommercialDto;

public interface CommercialService {

	public List<CommercialDto> searchCafe(Map<String, String> map) throws Exception;
	public List<CommercialDto> searchConvenience(Map<String, String> map) throws Exception;
}
