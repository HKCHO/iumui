package java63.iumui.dao;

import java.util.List;
import java.util.Map;

/*
Product selectOne(int no);
void delete(int no);
List<?> selectList(Map<String,Object> params);
void insert(Product product);
void insertPhoto(Product product);
List<?> selectPhoto(int productNo);
void deletePhoto(int productNo);
*/
public interface GroupDao {
	
  List<?> selectUserGroups(Map<String,Object> params);
  List<?> selectAllGroups(int mno);

  List<?> selectUserSchedules(Map<String,Object> params);
  
  int totalSize(int mno);
  
  void updateColor(Map<String,Object> params);
  
}
