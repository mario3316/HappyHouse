package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface UserService {

	public MemberDto login(Map<String, String> map) throws Exception;
	
//	REST 
	public List<MemberDto> userList();
	public List<MemberDto> searchList(Map<String, String> map);
	public MemberDto userInfo(String userid);
	public int userRegister(MemberDto memberDto);
	public int userModify(MemberDto memberDto);
	public int userDelete(String userid);
}
