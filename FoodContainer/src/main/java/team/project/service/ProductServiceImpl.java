package team.project.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.ProductDAO;
import team.project.util.PagingUtil;
import team.project.vo.CartVO;
import team.project.vo.ProductFilterVO;
import team.project.vo.ProductVO;
import team.project.vo.SearchVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDao;

	//상품조회
	@Override
	public List<ProductVO> productListAll(ProductVO productVO) throws Exception {
		
		List<ProductVO> prodcutListAll = productDao.productListAll(productVO);
		
		return prodcutListAll;
	}
	@Override
	public List<ProductVO> productListAll2(List<ProductFilterVO> filterList) throws Exception {
		
		List<ProductVO> prodcutListAll = productDao.productListAll2(filterList);
		
		return prodcutListAll;
	}
	
	@Override
	public List<ProductVO> productSearch(ProductVO productVO) throws Exception {
		
		List<ProductVO> productSearch = productDao.productSearch(productVO);
		
		return productSearch;
	}
	
	
	//상세보기
	@Override
	public ProductVO view(String index) throws Exception {
		
		return productDao.view(index);
	}
	//최근 본 상품
	@Override
	public List<ProductVO> cookieList(ArrayList<String> cookieArr) throws Exception {
		
		List<ProductVO> cookieListArr = productDao.cookieList(cookieArr);
		
		return cookieListArr;
	}
	//비회원 장바구니
	@Override
	public List<ProductVO> noMemberCartList(ArrayList<String> noMemberCartArr) throws Exception {
		
		List<ProductVO> noMemberCartList = productDao.noMemberCartList(noMemberCartArr);
		
		return noMemberCartList;
	}
	//메인 - 인기상품
	@Override
	public List<ProductVO> popularList(ProductVO productVO) throws Exception {
		
		List<ProductVO> popularList = productDao.popularList(productVO);
		
		return popularList;
	}

	/*--------------------------------------회원&비회원 공통------------------------------------*/
	// 결제화면 전에 상품 수량 확인 및 빼주기
	@Override
	public String checkProductInventory(HashMap<String, String> cartMap) throws Exception {

		int checkInventoryResult = 0;
		
		for(String pidx : cartMap.keySet()) {
			int inventory = productDao.checkInventory(pidx);
			if(Integer.parseInt(cartMap.get(pidx)) > inventory) {
				break;
			}else {
				checkInventoryResult++;
			}
		}
		
		if(checkInventoryResult != cartMap.size()) {
			// 수량이 충분하지 않는 경우
			return "Fail";
		}else {
			// 수량이 충분하다면 해당 갯수만큼 빼주기
			for(String pidx : cartMap.keySet()) {
				CartVO vo = new CartVO();
				vo.setProduct_index(pidx);
				vo.setCart_count(Integer.parseInt(cartMap.get(pidx)));
				productDao.MinusInventory(vo);
			}
			
			String orderRandomNum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			Date now = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			
			String order_index = simpleDateFormat.format(now).substring(2);
			for(int i = 0; i < 3; i++) {
				int randomIndex = (int)(Math.random() * orderRandomNum.length());
				order_index += orderRandomNum.substring(randomIndex, randomIndex + 1);
			}
			
			return order_index;
		}
		
	}
	
	// 결제화면에서 취소할 경우 다시 상품 채워놓기
	@Override
	public void plusInventory(HashMap<String, String> cartMap) throws Exception {
		for(String pidx : cartMap.keySet()) {
			CartVO vo = new CartVO();
			vo.setProduct_index(pidx);
			vo.setCart_count(Integer.parseInt(cartMap.get(pidx)));
			productDao.plusInventory(vo);
		}
	}
	/*----------------------------------------------------------------------------------------*/
	
	/******************************************구매페이지*****************************************/
	// 구매페이지에서 뿌려질 상품목록들(상품번호=갯수 의 경우)
	@Override
	public List<CartVO> purchaseListCaseOne(HttpServletRequest request) throws Exception {
		
		// 세션에 있는 cartMap 소환
		HttpSession session = request.getSession();
		HashMap<String, Integer> cartMap = (HashMap<String, Integer>) session.getAttribute("cartMap");
		
		// 쿼리에 WHERE절로 집어 넣을 List(Mapper에 hashMap의 key를 못넣어서 그럼)
		List<String> productIndexList = new ArrayList<String>();
		for(String pidx : cartMap.keySet()) productIndexList.add(pidx);
		
		// 상품번호들 넣어서 해당 상품 정보 불러오기
		List<CartVO> CartList = productDao.purchaseListCaseOne(productIndexList);
		
		// 각 상품에 대한 구매하려는 갯수를 해당 상품에 올바르게 집어 넣기
		for(String pidx : cartMap.keySet()){
			for(int i = 0; i < CartList.size(); i++) {
				if(pidx.equals(CartList.get(i).getProduct_index())) {
					CartList.get(i).setCart_count(cartMap.get(pidx));
					break;
				}
			}
		}
		
		return CartList;
	}
	
	// 구매페이지에서 뿌려질 상품목록들(카트번호=값 의 경우)
	@Override
	public List<CartVO> purchaseListCaseTwo(int[] cart_index) throws Exception{
		
		List<Integer> cartIndex = new ArrayList<Integer>();
		for(int cidx : cart_index) cartIndex.add(cidx);
		
		return productDao.purchaseListCaseTwo(cartIndex);
	}
	/*****************************************************************************************/
	
	/*여기서 부터는 관리자페이지*/
	
	// 관리자 메인페이지 최고 인기매출 상품 3개 뿌리기
	@Override
	public List<ProductVO> adminMainProductList() throws Exception {
		return productDao.adminMainProductList();
	}
	
	// 상품 조회(페이징 + 리스트 출력)
	@Override
	public List<ProductVO> adminProductList(SearchVO searchvo, int nowPage) throws Exception {

		
		// 페이징 처리
		PagingUtil paging = adminProductPaging(searchvo, nowPage);
		
		// 페이징 내부 값 세팅
		paging.setDel_YN(searchvo.getDel_YN());
		paging.setSearchValue(searchvo.getSearchValue());
		paging.setStart(paging.getStart() - 1);
		
		return productDao.adminProductList(paging);
	}
	
	// 상품 조회(페이징)
	@Override
	public PagingUtil adminProductPaging(SearchVO searchvo, int nowPage) throws Exception {
		int cnt = productDao.adminProductListCount(searchvo);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}
	
	// 상품 삭제
	@Override
	public int adminProductDelYNisY(String[] productIndexArr) throws Exception {
		
		List<String> deleteIndexList = new ArrayList<String>();
		for(int i = 0; i < productIndexArr.length; i++) {
			deleteIndexList.add(productIndexArr[i]);
		}
		
		return productDao.adminProductDelYNisY(deleteIndexList);
	}
	
	// 상품 상세 조회
	@Override
	public ProductVO adminProductSelectOne(String product_index) throws Exception {
		return productDao.adminProductSelectOne(product_index);
	}
	

	// 상품 등록
	@Override
	public int adminProductInsert(ProductVO product, MultipartFile tumnailImage, MultipartFile detailImage,
			HttpServletRequest request) throws Exception {

		product.setThumbnail_image(tumnailImage.getOriginalFilename());
		product.setDetail_image(detailImage.getOriginalFilename());
		
		// 이미지 업로드
		imageUpload(product, tumnailImage, detailImage, request);
		
		return productDao.adminProductInsert(productIndex(product));
	}

	// 상품 수정
	@Override
	public int adminProductUpdate(ProductVO product, MultipartFile tumnailImage, MultipartFile detailImage,
			HttpServletRequest request) throws Exception {
		
		product.setOrigin_product_index(product.getProduct_index());
		
		product.setThumbnail_image(tumnailImage.getOriginalFilename());
		product.setDetail_image(detailImage.getOriginalFilename());
		
		// 이미지 업로드
		imageUpload(product, tumnailImage, detailImage, request);
		
		return productDao.adminProductUpdate(product);
	}
	
	// 상품 이미지 업로드 메소드
	public void imageUpload(ProductVO product,
			MultipartFile tumnailImage, MultipartFile detailImage,
			HttpServletRequest request) throws Exception {
		
		// 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/" + product.getBrand() + "/" + product.getMiddleSort());
		
		// 경로에 대한 디렉토리 생성
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();	// 경로에 대한 디렉토리가 없으면 알아서 생성해준다.
		
		// 해당 경로에 업로드
		if(tumnailImage != null) {
			if(!tumnailImage.getOriginalFilename().isEmpty()) tumnailImage.transferTo(new File(path, product.getThumbnail_image()));
		}
		if(detailImage != null) {
			if(!detailImage.getOriginalFilename().isEmpty()) detailImage.transferTo(new File(path, product.getDetail_image()));
		}
		
	}
	
	// 상품 등록&수정 과정에서 상품번호를 올바르게 생성하는 과정
	private ProductVO productIndex(ProductVO product) throws Exception {
		
		// 상품번호 기본 설정
		String productIndex = "P";
		if(product.getBigSort().equals("냉동식품")) {
			productIndex += "I";
			if(product.getMiddleSort().equals("볶음밥")) {
				productIndex += "01";
			}else if(product.getMiddleSort().equals("치킨,만두")) {
				productIndex += "02";
			}	
		}else {
			productIndex += "R";
			if(product.getMiddleSort().equals("국")) {
				productIndex += "01";
			}else if(product.getMiddleSort().equals("반찬")) {
				productIndex += "02";
			}else if(product.getMiddleSort().equals("컵밥,햇반")){
				productIndex += "03";
			}
		}

		// 마지막 부분 (알파벳)생성
		productIndex = productLastIndex(productIndex);
			
		// 할거 다 끝나고 상품번호 마무리 세팅
		product.setProduct_index(productIndex);
		
		return product;
	}

	// 마지막 부분 (알파벳)생성 하는 메소드
	private String productLastIndex(String productIndex) throws Exception{
		// DB에 있는 관련 상품번호들을 리스트로 담기
		List<String> productIndexList = productDao.adminProductIndexSelectList(productIndex);
		
		// 알파벳
		String alphabetList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		// DB에 있는 관련 상품번호 리스트 끝자리들을 요놈에 담을거임
		String alphabetIndex = "";
		// 이빨 빠진지 안 빠진지의 여부 스위치
		int productIndexSw = 0;
		
		if(productIndexList.size() == 0) {
			productIndex += "A";
		}else if(productIndexList.size() > 0 && productIndexList.size() < 26){
			
			for(String index : productIndexList) {
				alphabetIndex += index.substring(4,5);
			}
			
			
			for(int i = 0; i < alphabetIndex.length(); i++) {
				String aIndex = alphabetIndex.substring(i, i + 1);
				String aList = alphabetList.substring(i, i + 1);

				System.out.println("--------------------");
				System.out.println(aIndex);
				System.out.println(aList);
				System.out.println("--------------------");
				if(!aIndex.equals(aList)) {	// 중간에 이빨 빠진 경우
					System.out.println("--------------------");
					System.out.println("이빨 빠졌읍니다");
					System.out.println("--------------------");
					productIndex += alphabetList.substring(i, i + 1);
					System.out.println(productIndex);
					System.out.println("--------------------");
					productIndexSw = 1;
					break;
				}
			}
			
			if(productIndexSw == 0) {	// 이빨 안 빠진 경우
				System.out.println("--------------------");
				System.out.println("이빨 빠지지 않았읍니다");
				System.out.println("--------------------");
				productIndex += alphabetList.substring(productIndexList.size(), productIndexList.size() + 1);
				System.out.println(productIndex);
				System.out.println("--------------------");
			}
			
		} else {
			return null;
		}
		
		return productIndex;
	}
	
	// 상품 복구
	@Override
	public void adminProductDelYNisN(String product_index) throws Exception {
		productDao.adminProductDelYNisN(product_index);
	}
	
	
}
