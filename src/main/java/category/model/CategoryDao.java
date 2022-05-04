package category.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myCategoryDao")
public class CategoryDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace="category.model.Category";
	
	public int insertCategory(CategoryBean bean) {
		int cnt= -1; 
		cnt= sqlSessionTemplate.insert(namespace+".InsertCategory",bean);
	    return cnt;
	}
	
	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".TotalCount",map);
		return count;
	}	
	
	public List<CategoryBean> categoryAll(Paging pageInfo, Map<String, String> map){
	List<CategoryBean> list = new ArrayList<CategoryBean>();
	RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
	list = sqlSessionTemplate.selectList(namespace+".CategoryAll",map,rowBounds);
	return list;
	}
	
			
	public int categoryDelete(int cnum) {
	int cnt = sqlSessionTemplate.delete(namespace+".CategoryDelete",cnum);
	return cnt;
	}

	
	public List<CategoryBean> categoryAllByProduct() {
		List<CategoryBean> list=sqlSessionTemplate.selectList(namespace+".CategoryAllByProduct");
		return list;
	}

	public int updateCategory(CategoryBean bean) {
		int cnt= -1; 
		cnt= sqlSessionTemplate.update(namespace+".UpdateCategory",bean);
		return cnt;
	}

	public CategoryBean getCategory(int cnum) {
		CategoryBean category=sqlSessionTemplate.selectOne(namespace+".GetCategory", cnum);
		return category;
	}

	
	public int multiDeleteCategory(String[] rowchecks) {    
		int count = 0;
		for(int i=0;i<rowchecks.length;i++) {
			String rowcheck=rowchecks[i];
			int cnt = sqlSessionTemplate.delete(namespace+".MultiDeleteCategory",rowcheck);
			count+=cnt;
		}

		return count;
		
		
	}

}
