package order.cart;

import java.util.ArrayList;
import java.util.List;

//장바구니
public class MyCartList { 

	//장바구니
	private List<int[]> orderlists = null;

	public MyCartList() {
		orderlists = new ArrayList<int[]>();
	}

	public void addOrder(int p_num, int orderqty,int option_no) {
		//상품번호,주문수량,옵션번호
		int[] ad=new int[]{p_num,orderqty,option_no};
		
		//등록된게 없으면 추가
		boolean check=false;
		if(orderlists.size()==0) {
			orderlists.add(ad);			
		} 
		else {	//등록된게 있으면
			for(int i=0;i<orderlists.size();i++) {	
				if((orderlists.get(i)[0] == p_num) && (orderlists.get(i)[2] == option_no)) {
					//상품번호랑 옵션이 같으면 장바구니에 있던거 수량만 누적
					orderlists.get(i)[1]=orderlists.get(i)[1]+orderqty;	
					check=true;
				}
			}		
			if(!check) {	//지금 넣는게 기존에있던게 아니라면
				orderlists.add(ad);
			}	
		}
		
	}//addOrder	
	
	public List<int[]> getAllOrderLists() {
		return orderlists;

	}

	public void deleteOrder(int p_num, int option_no) {
		for(int i=0;i<orderlists.size();i++) {	
			if((orderlists.get(i)[0] == p_num) && (orderlists.get(i)[2] == option_no)) {
				//상품번호랑 옵션 같은거 장바구니에서 삭제
				orderlists.remove(i);
			}
		}			
	}
	
}