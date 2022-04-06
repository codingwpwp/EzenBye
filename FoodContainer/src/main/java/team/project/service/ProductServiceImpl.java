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
	public ProductVO view(String index) throws Exception {
		
		return productDAO.view(index);
	}
	
}
