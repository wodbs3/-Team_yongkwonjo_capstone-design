package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;

public interface GroupDao {

   List<GroupList> selectGroupList(Criteria cri);
   public int insertGroup(GroupList grouplist);
   
   public GroupList groupDuplicationCheck(String grouplist_name);
   
   public GroupList findGroupDetail(int grouplist_number); // 洹몃９ �젙蹂� 李얘린

   public List<Member> getGroupMemberList(int groupList_number); // 洹몃９ 紐⑥엫 �쉶�썝
   
}