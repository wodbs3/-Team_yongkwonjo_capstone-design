package com.bu.bumoim.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.GroupDao;
import com.bu.bumoim.domain.GroupList;

@Repository
public class GroupDaoLogic implements GroupDao {
   
   @Autowired
   private SqlSession sqlSession;

   public List<GroupList> selectGroupList(GroupList grouplist){
      return sqlSession.selectList("group.selectGroupList", grouplist);
   }
   
   public int insertGroup(GroupList grouplist) {
	   return sqlSession.insert("group.insertGroup", grouplist);
   }
   
   @Override
   public GroupList groupDuplicationCheck(String grouplist_name) {
	   return sqlSession.selectOne("group.groupDuplicationCheck", grouplist_name);
   }

	@Override
	public GroupList findGroupDetail(int grouplist_number) {
		//
		return sqlSession.selectOne("group.findGroupDetail", grouplist_number);
	}
}