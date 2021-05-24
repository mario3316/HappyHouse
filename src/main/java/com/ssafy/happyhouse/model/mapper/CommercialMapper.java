package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.CommercialDto;

public interface CommercialMapper {

	public List<CommercialDto> searchCafeByDong(String dong);
	public List<CommercialDto> searchConvenienceByDong(String dong);
}
