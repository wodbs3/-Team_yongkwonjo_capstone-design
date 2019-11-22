package com.bu.bumoim.dao.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.GroupDao;
import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;

@Repository
public class GroupDaoLogic implements GroupDao {
	//
	private Logger logger = Logger.getLogger(getClass());
	
   @Autowired
   private SqlSession sqlSession;

   public List<GroupList> selectGroupList(Criteria cri){
      return sqlSession.selectList("group.selectGroupList", cri);
   }
   
   public int insertGroup(GroupList grouplist) {
	   return sqlSession.insert("group.insertGroup", grouplist);
   }
   
   @Override
   public GroupList groupDuplicationCheck(String grouplist_name) {
	   //
	   System.out.println("############################333");
	   logger.info("grouplist_name ===> " + grouplist_name);
	   
	   
	   return sqlSession.selectOne("group.groupDuplicationCheck", grouplist_name);
   }

	@Override
	public GroupList findGroupDetail(int grouplist_number) {
		//
		return sqlSession.selectOne("group.findGroupDetail", grouplist_number);
	}

	@Override
	public List<Member> getGroupMemberList(int groupList_number) {
		// 
		return sqlSession.selectList("group.getGroupMemberList", groupList_number);
	}
	
	@Override
	public void groupJoin(int groupList_number, String member_id) {
		//
		System.out.println("777777777777777777777777777777777777777");
		System.out.println(groupList_number + " " + member_id);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("groupList_number", groupList_number);
		params.put("member_id", member_id);
		
		System.out.println(params.toString());
		
		System.out.println("888888888888888888888888888888888888888888888888888");
		System.out.println(params.get("groupList_number") + " " + params.get("member_id"));
		
		sqlSession.update("group.updateMemberGroup", params);
	}
	
	@Override
	public int getcount(int groupList_number) {
		return sqlSession.selectOne("group.groupPeopleCount", groupList_number);
	}
}