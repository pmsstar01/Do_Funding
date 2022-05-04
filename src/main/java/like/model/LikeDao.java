package like.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import product.model.ProductBean;
import utility.Paging;


@Component("myLikeDao")
public class LikeDao {
	
	private String namespace="like.model.Like";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	public int checkLike(LikeBean likeBean) {	
		int cnt= -1;
		
		LikeBean ck = sqlSessionTemplate.selectOne(namespace +".CheckLike", likeBean);
		if(ck != null) {
			cnt = sqlSessionTemplate.selectOne(namespace +".SelectLike", likeBean);	
		}
		
		return cnt;	
	}

	public int updateLike(LikeBean likeBean) {
		int check = 0;
		int cnt = likeBean.getL_check(); //좋아요 상태
		if(cnt == 0) {
			sqlSessionTemplate.update(namespace+ ".UpdateLike", likeBean);
			check = 1;
		}
		else{
			sqlSessionTemplate.update(namespace+ ".UpdateDisLike", likeBean);
			check = 0;
		}
		
		return check;
	}

	public void insertLike(LikeBean likeBean) {
		sqlSessionTemplate.insert(namespace+ ".InsertLike", likeBean);
		
	}
	

	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return count;
	}

	public List<ProductBean> getLikeList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ProductBean> prdlist=sqlSessionTemplate.selectList(namespace+ ".LikeList",map,rowBounds); 		
		return prdlist;		
	}

	
	public int multiDeleteProduct(String[] rowchecks, MemberBean loginInfo) {
		int count = 0;	
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_no", Integer.toString(loginInfo.getNo()));
		
		for(int i=0;i<rowchecks.length;i++) {
			String rowcheck=rowchecks[i];
			System.out.println("rowcheck:"+rowcheck);
			map.put("rowcheck",rowcheck);
			int cnt = sqlSessionTemplate.delete(namespace+".MultiDeleteLike",map);
			count+=cnt;
			map.remove(rowcheck);
		}
		return count;
		
	}
	
	
	
}
