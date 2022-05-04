package product.model;

public class OptionBean {
	private int option_no;
	private String option_content;
	private int option_item_no;	//¿Ã∞‘ p_num

	public OptionBean() {
		super();
	}

	
	public OptionBean(int option_no, String option_content, int option_item_no) {
		super();
		this.option_no = option_no;
		this.option_content = option_content;
		this.option_item_no = option_item_no;
	}



	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public String getOption_content() {
		return option_content;
	}
	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}
	public int getOption_item_no() {
		return option_item_no;
	}
	public void setOption_item_no(int option_item_no) {
		this.option_item_no = option_item_no;
	}


}
