package board.model;

import java.sql.Timestamp;

public class NoticeBean {	
	private int no_num;
	private String no_writer; 
	private String no_subject; 
	private Timestamp no_reg_date;		
	private int no_readcount; 			
	private String no_content;

	public NoticeBean() {
		super();
	}

	public NoticeBean(int no_num, String no_writer, String no_subject, Timestamp no_reg_date, int no_readcount,
			String no_content) {
		super();
		this.no_num = no_num;
		this.no_writer = no_writer;
		this.no_subject = no_subject;
		this.no_reg_date = no_reg_date;
		this.no_readcount = no_readcount;
		this.no_content = no_content;
	}

	public int getNo_num() {
		return no_num;
	}

	public void setNo_num(int no_num) {
		this.no_num = no_num;
	}

	public String getNo_writer() {
		return no_writer;
	}

	public void setNo_writer(String no_writer) {
		this.no_writer = no_writer;
	}

	public String getNo_subject() {
		return no_subject;
	}

	public void setNo_subject(String no_subject) {
		this.no_subject = no_subject;
	}

	public Timestamp getNo_reg_date() {
		return no_reg_date;
	}

	public void setNo_reg_date(Timestamp no_reg_date) {
		this.no_reg_date = no_reg_date;
	}

	public int getNo_readcount() {
		return no_readcount;
	}

	public void setNo_readcount(int no_readcount) {
		this.no_readcount = no_readcount;
	}

	public String getNo_content() {
		return no_content;
	}

	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}		
	
	
}
