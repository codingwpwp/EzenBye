package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.vo.RecipeVO;

public interface RecipeService {

	//레시피작성
	public void insertRecipe(RecipeVO vo, MultipartFile tumnailImage,HttpServletRequest request) throws Exception;

//	public List<RecipeVO> selectList(RecipeVO vo)throws Exception;

	
	
}
