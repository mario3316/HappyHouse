package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.CommercialDto;

public interface CommercialMapper {

	public List<CommercialDto> searchByDong(String dong);
}
