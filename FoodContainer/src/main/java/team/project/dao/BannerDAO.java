package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.BannerVO;

@Repository
public class BannerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.bannerMapper";
	
	public List<BannerVO> bannerList() throws Exception {
		return sqlSession.selectList(Namespace + ".bannerList");
	}
	
	public void bannerInsert(BannerVO bannervo) throws Exception {
		sqlSession.insert(Namespace + ".bannerInsert", bannervo);
	}
	
	public int bannerDelete(List<Integer> bannerIndexList) throws Exception {
		return sqlSession.delete(Namespace + ".bannerDelete", bannerIndexList);
	}
}
