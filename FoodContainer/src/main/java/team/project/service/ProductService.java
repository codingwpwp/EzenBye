package team.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.util.PagingUtil;
import team.project.vo.CartVO;
import team.project.vo.ProductFilterVO;
import team.project.vo.ProductVO;
import team.project.vo.SearchVO;

public interface ProductService {
	//상품조회
	List<ProductVO> productListAll(ProductVO productVO) throws Exception;
	List<ProductVO> productListAll2(List<ProductFilterVO> filterList) throws Exception;
	//상세보기
	ProductVO view(String index) throws Exception;
	//최근 본 상품
	List<ProductVO> cookieList(ArrayList<String> cookieArr) throws Exception;
	//비회원 장바구니
	List<ProductVO> noMemberCartList(ArrayList<String> noMemberCartArr) throws Exception;
	//메인 - 인기상품
	List<ProductVO> popularList(ProductVO productVO) throws Exception;
	//검색
	List<ProductVO> productSearch(ProductVO productVO) throws Exception;
	
	/* 구매페이지 */
	// 회원&비회원 결제화면 전에 상품 수량 확인 및 빼주기
	String checkProductInventory(HashMap<String, String> cartMap) throws Exception;
	// 회원&비회원 결제화면에서 취소할 경우 다시 상품 채워놓기
	void plusInventory(HashMap<String, String> cartMap) throws Exception;
	// 구매페이지에서 뿌려질 상품목록들(상품번호=갯수 의 경우)
	List<CartVO> purchaseListCaseOne(HttpServletRequest request) throws Exception;
	// 구매페이지에서 뿌려질 상품목록들(카트번호=값 의 경우)
	List<CartVO> purchaseListCaseTwo(int[] cart_index) throws Exception;
	
	/*여기서 부터는 관리자페이지*/
	
	// 관리자메인페이지 최고 인기매출 상품 3개 뿌리기
	List<ProductVO> adminMainProductList() throws Exception;	
	
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
	
	// 상품 복구
	void adminProductDelYNisN(String product_index) throws Exception;
}
