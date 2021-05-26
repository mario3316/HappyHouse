package com.ssafy.happyhouse.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	@RequestMapping(value = "/searchBy", method = RequestMethod.POST)
	public ResponseEntity<List<HouseInfoDto>> searchBy(@RequestBody Map<String, String> map, Model model) {
		// by , keyword
		try {

			List<HouseInfoDto> list = subwayService.search(map);

			if (list != null && !list.isEmpty()) {
				return new ResponseEntity<List<HouseInfoDto>>(list, HttpStatus.OK);
			} else
				return new ResponseEntity(HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}

	}

}
