package team.project.service;

import java.io.File;
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
		
//		int member_index=vo.getMember_index();
		String title=vo.getTitle();
		String contents=vo.getContents();
//		String thumbnail=vo.getThumbnail_image();
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
	
	// 상품 이미지 업로드 메소드
		public void imageUpload(RecipeVO vo, MultipartFile tumnailImage, HttpServletRequest request) throws Exception {
			
	
			
			// 경로 설정
			String path = request.getSession().getServletContext().getRealPath("/resources/img/recipe");
			
			// 경로에 대한 디렉토리 생성
			File dir = new File(path);
			if(!dir.exists()) dir.mkdirs();	// 경로에 대한 디렉토리가 없으면 알아서 생성해준다.
			
			// 해당 경로에 업로드
			if(tumnailImage != null) {
				if(!tumnailImage.getOriginalFilename().isEmpty()) tumnailImage.transferTo(new File(path,vo.getThumbnail_image()));
			}
			
			
		}
	
	
	
}
