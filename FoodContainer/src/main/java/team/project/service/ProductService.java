package team.project.service;

import java.util.List;

import team.project.vo.MemberVO;
import team.project.vo.ProductVO;

public interface ProductService {
	
	List<ProductVO> productListAll(ProductVO productVO) throws Exception;
	
<<<<<<< HEAD
	ProductVO ProductSelectOne(ProductVO productVO) throws Exception;
	
	void insertProduct(ProductVO productVO) throws Exception;
=======
	ProductVO view(String index) throws Exception;
>>>>>>> branch 'main' of https://github.com/codingwpwp/EzenBye.git
}
