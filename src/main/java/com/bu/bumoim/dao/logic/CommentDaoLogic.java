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
	
	public int getPhotoNumber(int comment_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			int photo_number = session.selectOne("Comment.getPhotoNumber", comment_number);

			return photo_number;
		} finally {
			session.close();
		}
	}

	@Override
	public void boardInsertComment(Comment comment) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("Comment.boardCommentInsert", comment);
		} finally {
			session.close();
		}
		
	}

	@Override
	public List<Comment> boardGetCommentList(int groupList_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			List<Comment> comment = session.selectList("Comment.boardCommentList", groupList_number);

			return comment;
		} finally {
			session.close();
		}
	}

	@Override
	public void boardUpdateComment(Comment comment) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("Comment.boardCommentUpdate", comment);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void boardCommentAllDelete(int groupList_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("Comment.boardCommentAllDelete", groupList_number);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void boardCommentDelete(int comment_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("Comment.boardCommentDelete", comment_number);
		} finally {
			session.close();
		}
		
	}
//---------------------------------------------------------------------------
	@Override
	public void groupInsertComment(Comment comment) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("Comment.groupCommentInsert", comment);
		} finally {
			session.close();
		}
		
	}

	@Override
	public List<Comment> groupGetCommentList(int groupList_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			List<Comment> comment = session.selectList("Comment.groupCommentList", groupList_number);

			return comment;
		} finally {
			session.close();
		}
	}

	@Override
	public void groupUpdateComment(Comment comment) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("Comment.groupCommentUpdate", comment);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void groupCommentAllDelete(int board_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("Comment.groupCommentAllDelete", board_number);
		} finally {
			session.close();
		}
		
	}

	@Override
	public void groupCommentDelete(int comment_number) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("Comment.groupCommentDelete", comment_number);
		} finally {
			session.close();
		}
		
	}
	

}