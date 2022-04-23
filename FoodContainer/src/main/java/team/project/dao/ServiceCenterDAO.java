package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.SearchVO;
import team.project.vo.ServiceCenterReplyVO;
import team.project.vo.ServiceCenterVO;

@Repository
public class ServiceCenterDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.serviceCenterMapper";
	
	public List<ServiceCenterVO> latelyServiceCenter(int member_index) throws Exception {
		
		return sqlSession.selectList(Namespace+".latelyServiceCenter",member_index);
	}
	
	public int countServiceCenters(SearchVO searchVO) throws Exception {
		
		return sqlSession.selectOne(Namespace+".countServiceCenters",searchVO);
	}
	
	public List<ServiceCenterVO> serviceCenterList(PagingUtil paging) throws Exception {
		
		return sqlSession.selectList(Namespace+".serviceCenterList",paging);
	}
	
	public int countServiceCenter(int member_index) throws Exception {
		
		return sqlSession.selectOne(Namespace+".countServiceCenter",member_index);
	}
	
	
	/* 고객센터페이지 */
	
	// 종류2에 대한 FAQ조회
	public List<ServiceCenterVO> serviceCenterPageFAQList(String sort2) throws Exception{
		return sqlSession.selectList(Namespace + ".serviceCenterPageFAQList", sort2);
	}
	
	// 종류2에 대한 1:1문의들 갯수
	public int serviceCenterPageListCount(String sort2) throws Exception{
		return sqlSession.selectOne(Namespace + ".serviceCenterPageListCount", sort2);
	}
	
	// 종류2에 대한 1:1문의 리스트 출력
	public List<ServiceCenterVO> serviceCenterPageList(ServiceCenterVO vo) throws Exception{
		return sqlSession.selectList(Namespace + ".serviceCenterPageList", vo);
	}
	
	// 고객센터 글 상세조회
	public ServiceCenterVO serviceCenterPageView(int serviceCenter_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".serviceCenterPageView", serviceCenter_index);
	}
	
	// 고객센터 글 등록
	public void insert(ServiceCenterVO vo) throws Exception{
		sqlSession.insert(Namespace + ".insert", vo);
	}
	
	// 답변 등록
	public void replyInsert(ServiceCenterReplyVO vo) throws Exception{
		sqlSession.insert(Namespace + ".replyInsert", vo);
	}
	
	// 처리완료로 변경
	public void update(int serviceCenter_index) throws Exception{
		sqlSession.update(Namespace + ".update", serviceCenter_index);
	}
	
	// 고객센터 글 삭제
	public void deleteser(int serviceCenter_index) throws Exception{
		sqlSession.update(Namespace + ".deleteser", serviceCenter_index);
	}
	
	// 답변 불러오기
	public ServiceCenterReplyVO reply(int serviceCenter_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".reply", serviceCenter_index);
	}
	
	/* 관리자페이지 최근 문의 내역 */
	public List<ServiceCenterVO> adminService() throws Exception{
		return sqlSession.selectList(Namespace + ".adminService");
	}
}
