package java63.iumui.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java63.iumui.dao.GroupDao;
import java63.iumui.domain.Group;
import java63.iumui.domain.GroupMember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GroupService {
	
  @Autowired GroupDao groupDao; 
  
  public List<?> getUserGroups(int pageNo, int mno) {
  	HashMap<String,Object> paramMap = new HashMap<>();
  	paramMap.put("startIndex", ((pageNo - 1) * 6));
  	paramMap.put("mno", mno);
  	
  	return groupDao.selectUserGroups(paramMap);
  }
  
  public int getAllGroups(int mno) {
  	return mno;
  }
  
  public int getMaxPageNo(int mno) {
  	int totalSize = groupDao.totalSize(mno);
  	int maxPageNo = totalSize / 6;
  	if ((totalSize % 6) > 0) maxPageNo++;
  	
  	return maxPageNo;
  }
  
  public List<?> getUserSchedules (int mno, int dataSize) {
  	
  	HashMap<String,Object> paramMap = new HashMap<>();
  	paramMap.put("mno", mno);
  	paramMap.put("dataSize", dataSize);
  	
  	return groupDao.selectUserSchedules(paramMap);
  }
  
  public List<?> getThisGroupSchedules (int gno,int mno) {
  	
  	HashMap<String,Object> paramMap = new HashMap<>();
  	paramMap.put("gno", gno);
  	paramMap.put("mno", mno);
  	
  	return groupDao.selectThisGroupSchedules(paramMap);
  }
  
  public List<?> getAllGroupSchedules (int mno) {
  	
  	return groupDao.selectAllGroupSchedules(mno);
  }
  
  public List<?> getMyGroup (int gno, int mno) {
  	
  	HashMap<String,Object> paramMap = new HashMap<>();
  	paramMap.put("gno", gno);
  	paramMap.put("mno", mno);
  	
  	return groupDao.selectMyGroup(paramMap);
  }
  
  public List<?> getRcommendGroups (int mno) {
  	
  	return groupDao.selectRecommendedGroup(mno);
  }
  
  @Transactional(
      rollbackFor=Exception.class, 
      propagation=Propagation.REQUIRED)
  public void updateColor(String color, int gno, int mno) {
  	HashMap<String,Object> paramMap = new HashMap<>();
  	paramMap.put("color",color);
  	paramMap.put("gno", gno);
  	paramMap.put("mno",mno);
  	
    groupDao.updateColor(paramMap);
  }
  
  @Transactional(
      rollbackFor=Exception.class, 
      propagation=Propagation.REQUIRED)
  public void addGroup(Group group) {
    groupDao.insertGroup(group); 
  }
  
  public int getNextVal() {
    
    return groupDao.selectNextVal();
  }

  @Transactional(
      rollbackFor=Exception.class, 
      propagation=Propagation.REQUIRED)
  public void addGroupMember(GroupMember groupMember) {
    groupDao.insertGroupMember(groupMember); 
  }
  
  @Transactional(
      rollbackFor=Exception.class, 
      propagation=Propagation.REQUIRED)
  public void deleteGroup(int groupNo) {
    groupDao.deleteGroupMembers(groupNo);
    groupDao.deleteSchedules(groupNo);
    groupDao.deleteGroup(groupNo);
  }
  
  @Transactional(
      rollbackFor=Exception.class, 
      propagation=Propagation.REQUIRED)
  public void addGroupSchedule(int groupNo, Date startDay, 
      Date endDay, String scheduleContent) {
    
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("groupNo",groupNo);
    paramMap.put("startDay", startDay);
    paramMap.put("endDay",endDay);
    paramMap.put("scheduleContent",scheduleContent);
    
    groupDao.insertGroupSchedule(paramMap); 
  }
}