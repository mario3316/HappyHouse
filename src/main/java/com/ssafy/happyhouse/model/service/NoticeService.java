package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.util.PageNavigation;

public interface NoticeService {

	public void writeNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> listNotice(Map<String, String> map) throws Exception;
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	
	public NoticeDto getNotice(int noticeno) throws Exception;
	public void modifyNotice(NoticeDto noticeDto) throws Exception;
	public void deleteNotice(int noticeno) throws Exception;
	
}
