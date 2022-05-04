package order.model;

public class OrderBean {
	private int o_num;	//주문
    private int o_mnum;	//회원
    private String o_date;	//날짜
    
//  private int o_pnum;	//상품
//  private int o_option_no; //상품 옵션 번호
//  private int o_qty;	//수량
//  private int o_price;	//단가
//  private String o_startdate;	//시작일
//  private String o_enddate;	//종료일
//  private String o_state;		//상태
//  private String o_deliver;		//배송상태
     
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public int getO_mnum() {
		return o_mnum;
	}
	public void setO_mnum(int o_mnum) {
		this.o_mnum = o_mnum;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

 

}
