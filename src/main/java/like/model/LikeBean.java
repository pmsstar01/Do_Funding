package like.model;

public class LikeBean {
	private int l_num; 	//찜하기 테이블 번호
	private int m_no; 	//회원번호
	private int lp_num; //상품 번호	
	private int l_check;//찜하기 상태
	
	
	public LikeBean() {
		super();
	}

	public LikeBean(int d_num, int m_no, int lp_num, int l_check) {
		super();
		this.l_num = d_num;
		this.m_no = m_no;
		this.lp_num = lp_num;
		this.l_check = l_check;
	}

	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getLp_num() {
		return lp_num;
	}
	public void setLp_num(int lp_num) {
		this.lp_num = lp_num;
	}
	public int getL_check() {
		return l_check;
	}
	public void setL_check(int l_check) {
		this.l_check = l_check;
	}
	
	
}
