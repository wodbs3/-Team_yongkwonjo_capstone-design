package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;

public interface GroupService {

   List<GroupList> selectGroupList(GroupList grouplist);
   
   public int insertGroup(GroupList grouplist);
   
   public GroupList groupDuplicationCheck(String grouplist_name);

   public GroupList findGroupDetail(int grouplist_number); //그룹 정보 찾기
   
   public List<Member> getGroupMemberList(int groupList_number); // 그룹 모임회원
}