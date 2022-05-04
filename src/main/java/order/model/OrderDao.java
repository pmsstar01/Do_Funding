package order.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import utility.Paging;

@Component("myOrderDao")
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="order.model.Order";

	public int insertOrder(int no) { 
		int cnt = sqlSessionTemplate.insert(namespace+".InsertOrder",no);
		return cnt;
	}

	public int getMaxO_num() {
		int maxOid=sqlSessionTemplate.selectOne(namespace+".GetMaxO_num");
		//System.out.println("maxOid1:" + maxOid);
		return maxOid;
	}

	public List<OrderBean> getorderList(Paging pageInfo,MemberBean loginInfo) {
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<OrderBean> list=sqlSessionTemplate.selectList(namespace+".getOrderList",loginInfo,rowBounds);
		return list;
	}

	public int getorderTotalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".getOrderTotalCount",map);
		return count;
	}

	public List<OrderBean> allOrderList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<OrderBean> list=sqlSessionTemplate.selectList(namespace+".AllOrderList",map,rowBounds);
		return list;
	}

	public int orderTotalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".OrderTotalCount",map);
		return count;
	}


	
}