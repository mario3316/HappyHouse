package com.ssafy.happyhouse.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.HouseViewDto;
import com.ssafy.happyhouse.model.service.BaseAddressService;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.model.service.HouseInfoService;

@Controller
@RequestMapping("/house")
public class HouseController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseDealService dealService;
	@Autowired
	private HouseInfoService infoService;
	@Autowired
	private BaseAddressService baseAddressService;

	@RequestMapping(value = "/mvsearch", method = RequestMethod.GET)
	public String mvsearch() {
		return "house/search";
	}

	@ResponseBody
	@RequestMapping(value = "/searchBy", method = RequestMethod.POST)
	public ResponseEntity<List<HouseViewDto>> searchBy(@RequestBody Map<String, String> map, Model model) {
		// by , keyword
		try {
			List<HouseViewDto> viewList = new LinkedList<>();
			List<HouseDealDto> dealList = dealService.search(map);

			for (HouseDealDto deal : dealList) {
				HouseInfoDto house = infoService.searchByDongAptname(deal.getDong(), deal.getAptName());

				if (house == null)
					continue;

				HouseViewDto view = new HouseViewDto(deal.getNo(), deal.getDong(), deal.getAptName(), deal.getCode(),
						deal.getDealAmount(), deal.getBuildYear(), deal.getDealYear(), deal.getDealMonth(),
						deal.getDealDay(), deal.getArea(), deal.getFloor(), deal.getJibun(), deal.getType(),
						deal.getRentMoney(), deal.getImg(), house.getLat(), house.getLng());

				viewList.add(view);
			}

			if (viewList != null && !viewList.isEmpty()) {
				return new ResponseEntity<List<HouseViewDto>>(viewList, HttpStatus.OK);
			} else
				return new ResponseEntity(HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}

	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("no") int no, Model model) {
		try {
			HouseInfoDto house = infoService.search(no);
			model.addAttribute("house", house);
			return "house/search_detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세 정보 가져오기 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
}
