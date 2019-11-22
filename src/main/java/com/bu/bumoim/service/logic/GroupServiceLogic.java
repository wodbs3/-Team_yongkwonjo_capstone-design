package com.bu.bumoim.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.GroupDao;
import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.service.GroupService;

import org.apache.log4j.Logger;

@Service
public class GroupServiceLogic implements GroupService{
	//
	private Logger logger = Logger.getLogger(getClass());
   
	@Autowired
   private GroupDao groupDao;
   
   @Override
   public List<GroupList> selectGroupList(Criteria cri) {
      
      return groupDao.selectGroupList(cri);
   }
   @Override
   public int insertGroup(GroupList grouplist) {
	   return groupDao.insertGroup(grouplist);
   }
   
   @Override
   public GroupList groupDuplicationCheck(String grouplist_name) {
	   System.out.println("%%%%%%%%%%%%%%%%%%%%%%%");
	   logger.info("grouplist_name + " + grouplist_name);
	   return groupDao.groupDuplicationCheck(grouplist_name);
   }
   
	@Override
	public GroupList findGroupDetail(int grouplist_number) {
		//
		return groupDao.findGroupDetail(grouplist_number);
	}
	@Override
	public List<Member> getGroupMemberList(int groupList_number) {
		//
		return groupDao.getGroupMemberList(groupList_number);
	}
	@Override
	public void groupJoin(int groupList_number, String member_id) {
		//
		groupDao.groupJoin(groupList_number, member_id);
	}
	@Override
	public int getcount(int groupList_number) {
		return groupDao.getcount(groupList_number);
	}
}