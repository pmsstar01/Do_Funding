package board.model;

import java.sql.Timestamp;

public class FaqBean {
	private int faq_num;
	private String faq_writer; 
	private String faq_subject; 
	private Timestamp faq_reg_date;		
	private int faq_readcount; 			
	private String faq_content;

	public FaqBean() {
		super();
	}
	public FaqBean(int faq_num, String faq_writer, String faq_subject, Timestamp faq_reg_date, int faq_readcount,
			String faq_content) {
		super();
		this.faq_num = faq_num;
		this.faq_writer = faq_writer;
		this.faq_subject = faq_subject;
		this.faq_reg_date = faq_reg_date;
		this.faq_readcount = faq_readcount;
		this.faq_content = faq_content;
	}
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_writer() {
		return faq_writer;
	}
	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public Timestamp getFaq_reg_date() {
		return faq_reg_date;
	}
	public void setFaq_reg_date(Timestamp faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}
	public int getFaq_readcount() {
		return faq_readcount;
	}
	public void setFaq_readcount(int faq_readcount) {
		this.faq_readcount = faq_readcount;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	
}
