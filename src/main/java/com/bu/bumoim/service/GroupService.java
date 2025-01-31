package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;

public interface GroupService {

   List<GroupList> selectGroupList(Criteria cri);
   
   public int insertGroup(GroupList grouplist);
   
   public GroupList groupDuplicationCheck(String grouplist_name);

   public GroupList findGroupDetail(int grouplist_number); //洹몃９ �젙蹂� 李얘린
   
   public List<Member> getGroupMemberList(int groupList_number); // 그룹 모임회원

   public void groupJoin(int groupList_number, String member_id);	// 그룹 가입
   

   public int getcount(int groupList_number);
   
   public int getgroupcount(int groupList_number);
   
   public int groupohotocount(int groupList_number);
}
