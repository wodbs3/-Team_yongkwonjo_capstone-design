package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.SmallGroup;

public interface SmallGroupService {

	public int create(SmallGroup smallGroup);					// 소모임 생성

	public List<SmallGroup> readAll(int groupList_number); 		// 소모임 목록

	public SmallGroup readOne(int somoim_number);			// 소모임 상세
}
