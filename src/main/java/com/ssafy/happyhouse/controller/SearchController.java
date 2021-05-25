package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.service.BaseAddressService;
import com.ssafy.happyhouse.model.service.CommercialService;

@Controller
@RequestMapping("/search")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	ServletContext servletContext;

	@Autowired
	private CommercialService commercialService;

	@Autowired
	private BaseAddressService baseAddressService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mvSearchCafe() {
		return "search/cafe";
	}

	@ResponseBody
	@RequestMapping(value = "/{dong}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, String>> getLatLngByDong(@PathVariable String dong) {
		Map<String, String> latlng = baseAddressService.getLatLngByDong(dong);
		if (latlng != null)
			return new ResponseEntity<Map<String, String>>(latlng, HttpStatus.OK);
		else
			return new ResponseEntity(HttpStatus.NO_CONTENT);

	}

	@ResponseBody
	@RequestMapping(value = "/cafe", method = RequestMethod.POST)
	public ResponseEntity<List<CommercialDto>> searchCafe(@RequestBody Map<String, String> map) throws Exception {
		List<CommercialDto> cafelist = commercialService.searchCafe(map);
		if (cafelist != null && !cafelist.isEmpty()) {
			return new ResponseEntity<List<CommercialDto>>(cafelist, HttpStatus.OK);
		} else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}

	@ResponseBody
	@RequestMapping(value = "/convenience", method = RequestMethod.POST)
	public ResponseEntity<List<CommercialDto>> searchConvenience(@RequestBody Map<String, String> map)
			throws Exception {
		List<CommercialDto> convlist = commercialService.searchConvenience(map);
		if (convlist != null && !convlist.isEmpty()) {
			return new ResponseEntity<List<CommercialDto>>(convlist, HttpStatus.OK);
		} else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
}
