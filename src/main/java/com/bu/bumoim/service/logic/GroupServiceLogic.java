package com.bu.bumoim.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.GroupDao;
import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.service.GroupService;

@Service
public class GroupServiceLogic implements GroupService{
   
   @Autowired
   private GroupDao groupDao;
   
   @Override
   public List<GroupList> selectGroupList(GroupList grouplist) {
      
      return groupDao.selectGroupList(grouplist);
   }
   @Override
   public int insertGroup(GroupList grouplist) {
	   return groupDao.insertGroup(grouplist);
   }
   
   @Override
   public GroupList groupDuplicationCheck(String grouplist_name) {
	   return groupDao.groupDuplicationCheck(grouplist_name);
   }
   
	@Override
	public GroupList findGroupDetail(int grouplist_number) {
		//
		return groupDao.findGroupDetail(grouplist_number);
	}
}