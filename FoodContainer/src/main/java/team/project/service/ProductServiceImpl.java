package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.MemberDAO;
import team.project.dao.ProductDAO;
import team.project.vo.MemberVO;
import team.project.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> productListAll(ProductVO productVO) throws Exception {
		
		List<ProductVO> prodcutListAll = productDAO.productListAll(productVO);
		
		return prodcutListAll;
	}

	@Override
	public ProductVO ProductSelectOne(ProductVO productVO) throws Exception {
		
		ProductVO productOne = productDAO.ProductSelectOne(productVO);
		return productOne;
	}

	@Override
	public void insertProduct(ProductVO productVO) throws Exception {
		
		/*
		 *  상품번호 생성하는 구간 String ProductIndex = "P";
		 * 
		 * // 대분류&중분류 if(productVO.getBigSort().equals("냉동식품")) { ProductIndex += "I";
		 * if(productVO.getMiddleSort().equals("볶음밥")) { ProductIndex += "01"; }else
		 * if(productVO.getMiddleSort().equals("치킨,만두")) { ProductIndex += "02"; } }else
		 * { ProductIndex += "R"; if(productVO.getMiddleSort().equals("국물")) {
		 * ProductIndex += "01"; }else if(productVO.getMiddleSort().equals("치킨,만두")) {
		 * ProductIndex += "02"; }else if(productVO.getMiddleSort().equals("치킨,만두")) {
		 * ProductIndex += "02"; } }
		 */
		//productDAO.insertProduct(productVO);
	}
	public ProductVO view(String index) throws Exception {
		
		return productDAO.view(index);
	}
	
}
