package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.RecipeDAO;
import team.project.vo.RecipeVO;
@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private RecipeDAO recipeDao;

//	@Override
//	public List<RecipeVO> selectList(RecipeVO vo)throws Exception{
//		List<RecipeVO> list=recipeDao.selectList(vo);
//		return list;
//	}
	
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
		vo.setProduct_index2(product2);
		vo.setProduct_index3(product3);
		System.out.println(product1);
		System.out.println(product2);
		System.out.println(product3);
		System.out.println(vo);
		imageUpload(vo, tumnailImage, request);
		recipeDao.insertRecipe(vo);
	}
	

	public void imageUpload(RecipeVO vo, MultipartFile tumnailImage, HttpServletRequest request) throws Exception {
	}
	
	
}
