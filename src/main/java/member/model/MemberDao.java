package member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myMemberDao")
public class MemberDao {
	private String namespace = "member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	

	public MemberBean getLoginInfo(MemberBean mb) {
		MemberBean loginInfo = sqlSessionTemplate.selectOne(namespace+".GetLoginInfo",mb);
		return loginInfo;
	}

	public int insertMember(MemberBean membean) {
		int cnt=-1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertMember", membean);
		return cnt;
	}

	public MemberBean findId(MemberBean membean) {
		MemberBean findid = sqlSessionTemplate.selectOne(namespace+".FindId", membean);
		if(findid!=null) {	
		}
		return findid;
	}

	public int updatePassword(MemberBean membean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdatePassword", membean);
		return cnt;
	}

	public List<MemberBean> getAllMember(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<MemberBean> memlist = sqlSessionTemplate.selectList(namespace+".GetAllMember",map,rowBounds);
		return memlist;
	}

	public int upgrade(int no) {
		int cnt=-1;
		cnt = sqlSessionTemplate.update(namespace+".UpgradeMember",no);
		return cnt;
	}

	public int updateMember(MemberBean membean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateMember", membean);
		return cnt;
	}

	public void mpointUpdate(int no, int mpoint) {
		MemberBean mb=new MemberBean();
		mb.setNo(no);
		mb.setMpoint(mpoint);
		sqlSessionTemplate.update(namespace+".MpointUpdate",mb);		
	}

	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return count;
	}

	public int deleteMember(String no) {
		int cnt=-1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteMember",no);
		return cnt;
	}

}
