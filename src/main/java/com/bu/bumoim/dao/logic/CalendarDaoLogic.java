package com.bu.bumoim.dao.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.CalendarDao;
import com.bu.bumoim.domain.Calendar;


@Repository
public class CalendarDaoLogic implements CalendarDao{


	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public void insertCalendar(Calendar calendar) {
		SqlSession session = sqlSessionFactory.openSession();

		try {

			session.insert("Calendar.insertCalendar", calendar);

		}

		finally {
			session.close();
		}
		
	}

	@Override
	public List<Map<String, Object>> getCalendar(String member_id) {
		SqlSession session = sqlSessionFactory.openSession();

		try {

			return session.selectList("Calendar.getCalendar", member_id);

		}

		finally {
			session.close();
		}
	}
	
	
	

}
