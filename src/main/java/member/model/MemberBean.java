package member.model;


import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	private int no;
	private String admin;
	@NotEmpty(message = "id입력")
	private String id;
	@Size(min = 3,max = 8,message = "비밀번호 입력")
	private String password;
	@NotEmpty(message = "이름 입력.")
	private String name; 
	@NotEmpty(message = "생일 입력")
	private String birthday;
	private String joindate;
	private String gender;
	private String hp1;
	private String hp2;
	private String hp3;
	private String address1;
	private String address2;
	private String accountbank;
	private String account;
	private int mpoint;
	public MemberBean() {
		super();
	}
	public MemberBean(int no, String admin, String id, String password, String name, String birthday, String joindate,
			String gender, String hp1, String hp2, String hp3, String address1, String address2, String accountbank,
			String account, int mpoint) {
		super();
		this.no = no;
		this.admin = admin;
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.joindate = joindate;
		this.gender = gender;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.address1 = address1;
		this.address2 = address2;
		this.accountbank = accountbank;
		this.account = account;
		this.mpoint = mpoint;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAccountbank() {
		return accountbank;
	}
	public void setAccountbank(String accountbank) {
		this.accountbank = accountbank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	
	
	
}
