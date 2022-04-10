package team.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.util.PagingUtil;
import team.project.vo.ProductVO;
import team.project.vo.SearchVO;

public interface ProductService {
	
	List<ProductVO> productListAll(ProductVO productVO) throws Exception;
	
	ProductVO view(String index) throws Exception;
	
	List<ProductVO> cookieList(ArrayList<String> cookieArr) throws Exception;
	
	/*여기서 부터는 관리자페이지*/
	
	// 상품 조회
	List<ProductVO> adminProductList(SearchVO searchvo, int nowPage) throws Exception;
	PagingUtil adminProductPaging(SearchVO searchvo, int nowPage) throws Exception;
	
	// 상품 삭제
	int adminProductDelYNisY(String[] productIndexArr) throws Exception;
	
	// 상품 상세 조회
	ProductVO adminProductSelectOne(String product_index) throws Exception;
	
	// 상품 등록
	int adminProductInsert(ProductVO product,
						   MultipartFile tumnailImage,
						   MultipartFile detailImage,
						   HttpServletRequest request
						  ) throws Exception;
	
	// 상품 수정
	int adminProductUpdate(ProductVO product,
						   MultipartFile tumnailImage,
						   MultipartFile detailImage,
						   HttpServletRequest request
						  ) throws Exception;
}
