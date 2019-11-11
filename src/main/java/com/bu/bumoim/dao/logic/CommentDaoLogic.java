package com.bu.bumoim.dao.logic;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.CommentDao;
import com.bu.bumoim.domain.Comment;


@Repository
public class CommentDaoLogic implements CommentDao{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	Logger logger = Logger.getLogger(getClass());
	
	@Override
	public void galInsertComment(Comment comment) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("Comment.galCommentInsert", comment);
		} finally {
			session.close();
		}
		
	}

	@Override
	public List<Comment> galGetCommentList(int photo_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			List<Comment> comment = session.selectList("Comment.galCommentList", photo_number);

			return comment;
		} finally {
			session.close();
		}
	}

	@Override
	public void galCommentAllDelete(int photo_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("Comment.galCommentAllDelete", photo_number);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void galCommentDelete(int comment_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("Comment.galCommentDelete", comment_number);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void galUpdateComment(Comment comment) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("Comment.galCommentUpdate", comment);
		} finally {
			session.close();
		}
	
	}

	@Override
	public int getPhotoNumber(int comment_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			int photo_number = session.selectOne("Comment.getPhotoNumber", comment_number);

			return photo_number;
		} finally {
			session.close();
		}
	}


	

}
