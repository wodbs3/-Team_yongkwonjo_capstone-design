package com.bu.bumoim.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.SmallGroupDao;
import com.bu.bumoim.domain.SmallGroup;
import com.bu.bumoim.service.SmallGroupService;

@Service
public class SmallGroupServiceLogic implements SmallGroupService{
	
	@Autowired
	private SmallGroupDao smallGroupDao;
	
	@Override
	public int create(SmallGroup smallGroup) {
		//
		return smallGroupDao.create(smallGroup);
	}

	@Override
	public List<SmallGroup> readAll(int groupList_number) {
		//
		return smallGroupDao.readAll(groupList_number);
	}

	@Override
	public SmallGroup readOne(int somoim_number) {
		//
		return smallGroupDao.readOne(somoim_number);
	}
}
