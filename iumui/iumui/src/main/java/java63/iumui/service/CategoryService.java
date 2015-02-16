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
  
  public List<?> getTablehead() {
    return categoryDao.selectTablehead();
  }
  
  public List<?> getMainDisplay() {
    return categoryDao.selectMainDisplay();
  }
  
}
















