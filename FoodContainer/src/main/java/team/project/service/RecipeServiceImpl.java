package team.project.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.RecipeDAO;
import team.project.util.PagingUtil;
import team.project.vo.ProductVO;
import team.project.vo.RecipeVO;
import team.project.vo.SearchVO;
import team.project.vo.ThumbVO;
@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private RecipeDAO recipeDao;

	
	
	//레시피 번호
	@Override
	public RecipeVO selectRecipe(int recipe_index) throws Exception {
		
		return recipeDao.selectRecipe(recipe_index);
	}
		
	//레시피 목록 조회
	@Override
	public List<RecipeVO> recipeList(PagingUtil pu,SearchVO searchvo) throws Exception {
		List<RecipeVO> recipeList = recipeDao.recipeList(pu);
		return recipeList;
	}
	//레시피 상세 조회 
	@Override
	public RecipeVO recipeRead(int recipe_index) throws Exception{
		//레시피 상세 조회수 부분
		recipeDao.recipeHit(recipe_index);
		return recipeDao.recipeRead(recipe_index);
	}
	//레시피 수정
		public void updateRecipe(RecipeVO vo, MultipartFile tumnailImage,HttpServletRequest request) throws Exception{
			String product1=vo.getProduct_index1();
			String product2=vo.getProduct_index2();
			
			String product3=vo.getProduct_index3();
			vo.setThumbnail_image(tumnailImage.getOriginalFilename());
			if(product2 != null) {
				vo.setProduct_index2(product2);
				}else if(product3!=null) {
				vo.setProduct_index3(product3);
				}
				System.out.println(product1);
				System.out.println(product2);
				System.out.println(product3);
				System.out.println(vo);
				
				imageUpload(vo, tumnailImage, request);
			recipeDao.updateRecipe(vo);
		}
		
		//레시피 삭제
		public void deletdRecipe(int recipe_index) throws Exception{
			recipeDao.deletdRecipe(recipe_index);
		}

	//레시피 게시글 총 개수
	@Override
	public int countRecipe() throws Exception{
		return recipeDao.countRecipe();
	}
	
	//레시피 게시글 추천
	@Override
	public int updateThumb(int recipe_index)throws Exception{
		return recipeDao.updateThumb(recipe_index);
	}
	@Override
	public void insertThumb(ThumbVO vo)throws Exception{
		recipeDao.insertThumb(vo);
	}
	@Override
	public int getThumb(ThumbVO vo)throws Exception{
		return recipeDao.getThumb(vo);
	}
	
	
	//레시피작성
	@Override
	public void insertRecipe(RecipeVO vo,MultipartFile tumnailImage, HttpServletRequest request) throws Exception {
		

		String title=vo.getTitle();
		String contents=vo.getContents();
		String product1=vo.getProduct_index1();
		String product2=vo.getProduct_index2();
		String product3=vo.getProduct_index3();
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setThumbnail_image(tumnailImage.getOriginalFilename());
		vo.setProduct_index1(product1);
		if(product2 != null) {
		vo.setProduct_index2(product2);
		}else if(product3!=null) {
		vo.setProduct_index3(product3);
		}
		System.out.println(product1);
		System.out.println(product2);
		System.out.println(product3);
		System.out.println(vo);
		
		imageUpload(vo, tumnailImage, request);
		
		recipeDao.insertRecipe(vo);
	}
	//베스트 레시피
	@Override
	public int initRank(int best_rank) throws Exception{
		return recipeDao.initRank(best_rank);
	}
	@Override
	public void updateRank(RecipeVO vo)throws Exception{
		recipeDao.updateRank(vo);
	}
	
	// 상품 이미지 업로드 메소드
	public void imageUpload(RecipeVO vo, MultipartFile tumnailImage, HttpServletRequest request) throws Exception {
		

		
		// 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/recipe");
		System.out.println(path);
		System.out.println(path);
		System.out.println(path);
		
		// 경로에 대한 디렉토리 생성
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();	// 경로에 대한 디렉토리가 없으면 알아서 생성해준다.
		
		// 해당 경로에 업로드
		if(tumnailImage != null) {
			if(!tumnailImage.getOriginalFilename().isEmpty()) tumnailImage.transferTo(new File(path,vo.getThumbnail_image()));
		}
		
		
	}

	@Override
	public List<RecipeVO> viewRecipeList(RecipeVO recipeVO) throws Exception {
		
		List<RecipeVO> recipeList = recipeDao.viewRecipeList(recipeVO);
		
		return recipeList;
	}
	
	//마이페이지 부분
	@Override
	public List<RecipeVO> recipeMypageList(SearchVO searchVO, int nowPage) throws Exception {
		PagingUtil paging = recipeListPaging(searchVO, nowPage);
		
		paging.setMember_index(searchVO.getMember_index());
		
		paging.setStart(paging.getStart() - 1);
		
		return recipeDao.recipeMypageList(paging);
	}

	@Override
	public PagingUtil recipeListPaging(SearchVO searchVO, int nowPage) throws Exception {
		int cnt = recipeDao.countRecipeMypage(searchVO);
		return new PagingUtil(cnt, nowPage, 9, 5);
	}

	@Override
	public int countRecipeMypage(SearchVO searchVO) throws Exception {
		int cnt = recipeDao.countRecipeMypage(searchVO);
		return cnt;
	}

	/* 관리자 페이지 */
	// 베스트레시피 출력
	@Override
	public List<RecipeVO> adminBestRecipeList() throws Exception {
		return recipeDao.adminBestRecipeList();
	}

	// 레시피 해제&순위 조절
	@Override
	public void adminCancelBestRecipe(int[] ridxArr) throws Exception {
		
		// 리스트로 변환 작업
		List<Integer> ridxList = new ArrayList<Integer>();
		for(int i : ridxArr) {
			ridxList.add(i);
		}
		// 베스트 해제
		recipeDao.adminCancelBestRecipe(ridxList);
		
		// 순위 조절 시간
		if(ridxArr.length == 1) {
			recipeDao.adminUpdateBestRecipeRankOne();
			recipeDao.adminUpdateBestRecipeRankTwo();
		}else if(ridxArr.length == 2) {
			recipeDao.adminUpdateBestRecipeRankOne();
		}
	}
	
	//추천수 증가
	@Override
	public int thumbPlus(int recipe_index) throws Exception {
		int thumbPlus = recipeDao.thumbPlus(recipe_index);
		return thumbPlus;
	}
	
	//추천수 테이블 추가
	@Override
	public int thumbTablePlus(int recipe_index, int member_index) throws Exception {
		int thumbTablePlus = recipeDao.thumbTablePlus(recipe_index, member_index);
		return thumbTablePlus;
	}
		
}
