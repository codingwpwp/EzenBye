package team.project.service;

import org.springframework.beans.factory.annotation.Autowired;

import team.project.dao.RecipeDAO;
import team.project.vo.RecipeVO;

public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private RecipeDAO recipeDao;

	
	@Override
	public int insertRecipe(RecipeVO vo) throws Exception {
		
		return 0;
	}
	
	
}
