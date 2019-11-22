package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.SmallGroup;

public interface SmallGroupDao {
	//
	public int create(SmallGroup smallGroup);					// 소모임 생성

	public List<SmallGroup> readAll(int groupList_number); 		// 소모임 전체

	public SmallGroup readOne(int somoim_number);			// 소모임 상세
}