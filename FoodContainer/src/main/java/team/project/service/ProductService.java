package team.project.service;

import java.util.List;

import team.project.vo.MemberVO;
import team.project.vo.ProductVO;

public interface ProductService {
	
	List<ProductVO> productListAll(ProductVO productVO) throws Exception;
}
