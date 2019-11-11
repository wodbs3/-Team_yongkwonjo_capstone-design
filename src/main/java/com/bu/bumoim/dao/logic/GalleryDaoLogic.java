package com.bu.bumoim.dao.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.GalleryDao;
import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.GalleryCriteria;


@Repository
public class GalleryDaoLogic implements GalleryDao {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(getClass());

	@Override
	public List<Gallery> getGalleryList(GalleryCriteria cri) {

		SqlSession session = sqlSessionFactory.openSession();

		try {

			return session.selectList("Gallery.getGalleryList",cri);

		}

		finally {
			session.close();
		}

	}

	@Override
	public Gallery findGallery(int num) {

		SqlSession session = sqlSessionFactory.openSession();
		try {

			Gallery gallery = session.selectOne("Gallery.findGallery", num);
			logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> name: " + gallery.getFileName());

			return gallery;
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

			session.delete("Gallery.deleteGallery", num);

		} finally {
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

	@Override
	public int getGalleryCount() {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			return session.selectOne("Gallery.getGalleryCount");

		}

		finally {
			session.close();
		}
	}

}
