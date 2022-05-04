package product.model;

import java.util.UUID;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ProductBean {

	//default p_readcount,p_total_price,p_reg_date  
	
	private final String common="입력 누락";
		
	private int p_num;			
	
	private String p_category_fk;   
		
	private String p_writer; 	

	private String p_subject; 	
	
	//default
	private int p_readcount;
	
	private String p_image;    				
	
	private String p_content; 	

	private int p_origin_price;  	
	
	private int p_total_price; 	
			
	private int p_end_price;  
	
	private int p_point; 	
	
	private String p_reg_date; 	
	
	private String p_start_date; 		

	private String p_end_date;
	
	private int orderqty;
	
	private MultipartFile upload;

	//옵션
	@NotEmpty(message = "옵션값"+common)
	private String[] item_option;	//option 

	private String option_content;	//option
	private int option_item_no;
	private int option_no;	
	
	//좋아요
	//private int l_num;
	
	public ProductBean() {
		super();
	}	
	
	public ProductBean(int p_num, String p_category_fk, String p_writer, String p_subject, int p_readcount,
			String p_image, String p_content, int p_origin_price,
			int p_total_price, int p_end_price, int p_point, String p_reg_date, String p_start_date, String p_end_date,
			int orderqty, MultipartFile upload, String[] item_option, int option_item_no,
			int option_no) {
		super();
		this.p_num = p_num;
		this.p_category_fk = p_category_fk;
		this.p_writer = p_writer;
		this.p_subject = p_subject;
		this.p_readcount = p_readcount;
		this.p_image = p_image;
		this.p_content = p_content;
		this.p_origin_price = p_origin_price;
		this.p_total_price = p_total_price;
		this.p_end_price = p_end_price;
		this.p_point = p_point;
		this.p_reg_date = p_reg_date;
		this.p_start_date = p_start_date;
		this.p_end_date = p_end_date;
		this.orderqty = orderqty;
		this.upload = upload;
		this.item_option = item_option;
		this.option_item_no = option_item_no;
		this.option_no = option_no;
	}


	
	public String getOption_content() {
		return option_content;
	}

	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}

	public String[] getItem_option() {
		return item_option;
	}

	public void setItem_option(String[] item_option) {
		this.item_option = item_option;
	}

	public int getOption_item_no() {
		return option_item_no;
	}

	public void setOption_item_no(int option_item_no) {
		this.option_item_no = option_item_no;
	}
	public int getOption_no() {
		return option_no;
	}

	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}

	public int getOrderqty() {
		return orderqty;
	}
	public void setOrderqty(int orderqty) {
		this.orderqty = orderqty;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload:" + upload);
		System.out.println("upload.getName():"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		UUID uuid=UUID.randomUUID();
		p_image = uuid.toString()+"_"+upload.getOriginalFilename();	//사진이름 중복 제거
	}

	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_category_fk() {
		return p_category_fk;
	}
	public void setP_category_fk(String p_category_fk) {
		this.p_category_fk = p_category_fk;
	}
	public String getP_writer() {
		return p_writer;
	}
	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}
	public String getP_subject() {
		return p_subject;
	}
	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}
	public int getP_readcount() {
		return p_readcount;
	}
	public void setP_readcount(int p_readcount) {
		this.p_readcount = p_readcount;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public int getP_origin_price() {
		return p_origin_price;
	}
	public void setP_origin_price(int p_origin_price) {
		this.p_origin_price = p_origin_price;
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
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	public String getP_reg_date() {
		return p_reg_date;
	}
	public void setP_reg_date(String p_reg_date) {
		this.p_reg_date = p_reg_date;
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
	
}
