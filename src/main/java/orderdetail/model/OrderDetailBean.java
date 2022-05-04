package orderdetail.model;

public class OrderDetailBean {
	private int od_num; //주문상세번호
	private int od_o_num; //주문번호
	private int od_p_num; //상품번호
	private int od_option_no; //상품옵션번호
	private int od_qty; //주문수량
	private int od_deliver; //배송상태
	
	public OrderDetailBean() {
		super();
	}

	public int getOd_num() {
		return od_num;
	}

	public void setOd_num(int od_num) {
		this.od_num = od_num;
	}

	public int getOd_o_num() {
		return od_o_num;
	}

	public void setOd_o_num(int od_o_num) {
		this.od_o_num = od_o_num;
	}

	public int getOd_p_num() {
		return od_p_num;
	}

	public void setOd_p_num(int od_p_num) {
		this.od_p_num = od_p_num;
	}

	public int getOd_option_no() {
		return od_option_no;
	}

	public void setOd_option_no(int od_option_no) {
		this.od_option_no = od_option_no;
	}

	public int getOd_qty() {
		return od_qty;
	}

	public void setOd_qty(int od_qty) {
		this.od_qty = od_qty;
	}

	public int getOd_deliver() {
		return od_deliver;
	}

	public void setOd_deliver(int od_deliver) {
		this.od_deliver = od_deliver;
	}

}