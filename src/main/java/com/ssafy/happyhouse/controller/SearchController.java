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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.service.CommercialService;

@Controller
@RequestMapping("/search")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private CommercialService commercialService;
	
	@RequestMapping(value = "/cafe", method = RequestMethod.GET)
	public String mvSearchCafe() {
		return "search/cafe";
	}

//	@RequestMapping(value = "/cafe", method = RequestMethod.POST)
//	public String searchCafe(@RequestParam Map<String, String> map, Model model) {
//		try {
//			List<CommercialDto> list = commercialService.search(map);
//			model.addAttribute("cafes", list);
//			return "search/cafe";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "카페 정보 검색 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}

	@ResponseBody
	@RequestMapping(value = "/cafe", method = RequestMethod.POST)
	public ResponseEntity<List<CommercialDto>> searchCafe(@RequestBody Map<String, String> map) throws Exception {
			List<CommercialDto> list = commercialService.search(map);
			if (list != null && !list.isEmpty()) {
				return new ResponseEntity<List<CommercialDto>>(list, HttpStatus.OK);
			} else
				return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public String modify(@RequestParam("noticeno") int noticeno, Model model) {
//		try {
//			NoticeDto noticeDto = noticeService.getNotice(noticeno);
//			model.addAttribute("notice", noticeDto);
//			return "notice/modify";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}
//	
//	@RequestMapping(value = "/delete", method = RequestMethod.GET)
//	public String delete(@RequestParam("noticeno") int noticeno, Model model) {
//		try {
//			noticeService.deleteNotice(noticeno);
//			return "redirect:list?pg=1&key=&word=";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}
}
