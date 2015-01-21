package java63.iumui.service;

import java.util.List;
import java63.iumui.dao.CategoryDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
  @Autowired
  CategoryDao categoryDao;
  
  public List<?> getCategory() {
    
    return categoryDao.selectCategory();
  }
  
  public List<?> getMainDisplay() {
    
    return categoryDao.selectMainDisplay();
  }
  
  /*
  public int getMaxPageNo(int pageSize) {
    int totalSize = boardDao.totalSize();
    int maxPageNo = totalSize / pageSize;
    if ((totalSize % pageSize) > 0) maxPageNo++;
    
    return maxPageNo;
  }
  */
}
















