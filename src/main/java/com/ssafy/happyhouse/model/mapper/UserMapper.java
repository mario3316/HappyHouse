package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface UserMapper {

	// 회원 가입
	public boolean register(MemberDto mdto) throws SQLException;

	// 로그인
	public MemberDto login(Map<String, String> map) throws SQLException;
	
	//	REST
	public List<MemberDto> userList();
	public List<MemberDto> searchList(Map<String, String> map);
	public MemberDto userInfo(String userid);
	public int userRegister(MemberDto memberDto);
	public int userModify(MemberDto memberDto);
	public int userDelete(String userid);
}
