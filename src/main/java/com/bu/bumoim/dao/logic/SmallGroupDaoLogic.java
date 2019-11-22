package com.bu.bumoim.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.SmallGroupDao;
import com.bu.bumoim.domain.SmallGroup;

@Repository
public class SmallGroupDaoLogic implements SmallGroupDao{
	//
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int create(SmallGroup smallGroup) {
		//
		return sqlSession.insert("smallgroup.createSmallGroup", smallGroup);
	}

	@Override
	public List<SmallGroup> readAll(int groupList_number) {
		//
		return sqlSession.selectList("smallgroup.smallGroupList", groupList_number);
	}

	@Override
	public SmallGroup readOne(int somoim_number) {
		//
		return sqlSession.selectOne("smallgroup.smallGroupDetail", somoim_number);
	}
}
