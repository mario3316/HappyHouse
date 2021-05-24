package com.ssafy.happyhouse.model.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SubwayDto;
import com.ssafy.happyhouse.model.mapper.HouseInfoMapper;
import com.ssafy.happyhouse.model.mapper.SubwayMapper;
import com.ssafy.util.LocationDistance;

@Service
public class SubwayServiceImpl implements SubwayService {

	private static final Logger logger = LoggerFactory.getLogger(SubwayServiceImpl.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HouseInfoDto> search(Map<String, String> map) throws Exception {

		LocationDistance calc = new LocationDistance();

		if (map.get("by").equals("dong")) {
			List<HouseInfoDto> resultList = new LinkedList<>();

			List<HouseInfoDto> houseList = sqlSession.getMapper(HouseInfoMapper.class).searchByDong(map.get("keyword"));
			List<SubwayDto> subwayList = sqlSession.getMapper(SubwayMapper.class).searchAll();

			for (HouseInfoDto house : houseList) {
				for (SubwayDto subway : subwayList) {

					if (subway.getLat().equals("") || subway.getLng().equals(""))
						continue;

					System.out.println(subway.toString());

					double lat1 = Double.parseDouble(house.getLat());
					double lng1 = Double.parseDouble(house.getLng());
					double lat2 = Double.parseDouble(subway.getLat());
					double lng2 = Double.parseDouble(subway.getLng());
					double result = calc.distance(lat1, lng1, lat2, lng2);
					System.out.println(result);

					if (result <= 1.0) {
						house.setSubway(subway.getName());
						if (!resultList.contains(house))
							resultList.add(house);
					}
				}
			}

			return resultList;
		}
		return null;
	}

}
