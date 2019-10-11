package com.bu.bumoim.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.GalleryDao;
import com.bu.bumoim.domain.Gallery;

@Repository
public class GalleryDaoLogic implements GalleryDao {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(getClass());
	
	@Override
	public List<Gallery> getGalleryList() {

		SqlSession session = sqlSessionFactory.openSession();

		try {
			
			List<Gallery> gallery =  session.selectList("Gallery.getGalleryList");
			logger.info("-------------------------");
			logger.info("List: " + gallery);
			logger.info("List: " + gallery.getClass());
			return gallery;
		}

		finally {
			session.close();
		}

	}

	@Override
	public Gallery findGallery(int num) {

		SqlSession session = sqlSessionFactory.openSession();
		try {
			return session.selectOne("Gallery.findGallery", num);
		} finally {
			session.close();
		}
	}

	@Override
	public void insertGallery(Gallery gallery) {
		
		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("Gallery.insertGallery", gallery);

		} finally {
			session.close();
		}
	}

	@Override
	public void deleteGallery(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			session.delete("Gallery.deleteGallery",num);
		} 
		finally {
			session.close();
		}
	}

	@Override
	public void updateGallery(Gallery gallery) {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			session.update("Gallery.updateGallery", gallery);
		} finally {
			session.close();
		}
	}



}
