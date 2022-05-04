package order.cart;

public class ShoppingInfo {
	private int p_num;
	private int option_no;
	private String option_content;
	private String p_subject;
	private int p_total_price;
	private int p_end_price;
	private String p_start_date;
	private String p_end_date;
	private String p_image;
	private int qty;
	private int price;
	private int amount;
	private int deliver;
	private int od_num;

	
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public int getP_total_price() {
		return p_total_price;
	}
	public void setP_total_price(int p_total_price) {
		this.p_total_price = p_total_price;
	}
	public int getP_end_price() {
		return p_end_price;
	}
	public void setP_end_price(int p_end_price) {
		this.p_end_price = p_end_price;
	}
	public String getP_start_date() {
		return p_start_date;
	}
	public void setP_start_date(String p_start_date) {
		this.p_start_date = p_start_date;
	}
	public String getP_end_date() {
		return p_end_date;
	}
	public void setP_end_date(String p_end_date) {
		this.p_end_date = p_end_date;
	}
	public int getOd_num() {
		return od_num;
	}
	public void setOd_num(int od_num) {
		this.od_num = od_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_subject() {
		return p_subject;
	}
	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}
	public int getDeliver() {
		return deliver;
	}
	public void setDeliver(int deliver) {
		this.deliver = deliver;
	}
	public String getOption_content() {
		return option_content;
	}
	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public int getp_num() {
		return p_num;
	}
	public void setp_num(int p_num) {
		this.p_num = p_num;
	}
	public String getp_subject() {
		return p_subject;
	}
	public void setp_subject(String p_subject) {
		this.p_subject = p_subject;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
