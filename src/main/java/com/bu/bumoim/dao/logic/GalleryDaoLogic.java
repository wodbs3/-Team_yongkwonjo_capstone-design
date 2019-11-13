package com.bu.bumoim.dao.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
	public List<Gallery> getGroupGallery(int groupList_number, GalleryCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		  
        params.put("cri", cri);
        params.put("gNum", groupList_number);  

        
		try {
			Gallery gallery = new Gallery();
			List<Gallery> test =  session.selectList("Gallery.getGroupGallery", params);
			logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ test);
			logger.info(test.toString());
			logger.info(gallery.toString());
			
			System.out.println("555555555555555555555555555555555555555555555555555555555");
			System.out.println(params.get("cri"));
			System.out.println(params.get("gNum"));
			
			Iterator<Gallery> iter = test.iterator();

			while (iter.hasNext()) {
				System.out.println("66666666666666666666666666666666666666666666666666");
			    System.out.print(iter.next() + " ");

			}
			return test;
		}

		finally {
			session.close();
		}
		
	}
	
	
	

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
