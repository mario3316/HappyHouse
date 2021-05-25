package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.service.HouseInfoService;
import com.ssafy.happyhouse.model.service.SubwayService;

@Controller
@RequestMapping("/subway")
public class SubwayController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private SubwayService subwayService;

	@Autowired
	private HouseInfoService infoService;

	@RequestMapping(value = "/mvsearch", method = RequestMethod.GET)
	public String mvsearch() {
		return "subway/search";
	}

	@RequestMapping(value = "/searchBy", method = RequestMethod.POST)
	public String searchBy(@RequestParam Map<String, String> map, Model model) {
		try {
			List<HouseInfoDto> list = subwayService.search(map);
			for (HouseInfoDto h : list) {
				System.out.println(h.toString());
			}
			model.addAttribute("houses", list);
			return "subway/search";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "거래 정보 검색도중 문제가 발생했습니다.");
			return "error/error";
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
