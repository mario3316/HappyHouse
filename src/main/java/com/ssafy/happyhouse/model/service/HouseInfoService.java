package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.HouseInfoDto;

public interface HouseInfoService {

	public HouseInfoDto search(int no) throws Exception;

	public HouseInfoDto searchByDongAptname(String dong, String aptname) throws Exception;

}