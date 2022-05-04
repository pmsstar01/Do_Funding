package orderdetail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import order.cart.ShoppingInfo;

@Component("myCompositeDao")
public class CompositeDao {
	
	private String namespace="order.orderdetail.Composite";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ShoppingInfo> detailList(int o_num) {//주문 번호
		List<ShoppingInfo> detailList = sqlSessionTemplate.selectList(namespace + ".DetailList", o_num);
		return detailList;
	}
	
}
