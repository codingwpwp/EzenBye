package team.project.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.ProductDAO;
import team.project.util.PagingUtil;
import team.project.vo.ProductVO;
import team.project.vo.SearchVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDao;

	@Override
	public List<ProductVO> productListAll(ProductVO productVO) throws Exception {
		
		List<ProductVO> prodcutListAll = productDao.productListAll(productVO);
		
		return prodcutListAll;
	}
	
	@Override
	public ProductVO view(String index) throws Exception {
		
		return productDao.view(index);
	}

	@Override
	public List<ProductVO> cookieList(ArrayList<String> cookieArr) throws Exception {
		
		List<ProductVO> cookieListArr = productDao.cookieList(cookieArr);
		
		return cookieListArr;
	}
	
	
	/*여기서 부터는 관리자페이지*/
	
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
		
		imageUpload(product, tumnailImage, detailImage, request);
		
		return productDao.adminProductInsert(productIndex(product, tumnailImage, detailImage, request));
	}

	// 상품 수정
	@Override
	public int adminProductUpdate(ProductVO product, MultipartFile tumnailImage, MultipartFile detailImage,
			HttpServletRequest request) throws Exception {
		
		if(!tumnailImage.getOriginalFilename().isEmpty()) product.setThumbnail_image(tumnailImage.getOriginalFilename());
		if(!detailImage.getOriginalFilename().isEmpty()) product.setDetail_image(detailImage.getOriginalFilename());
		
		imageUpload(product, tumnailImage, detailImage, request);
		
		return 0;
	}
	
	public void imageUpload(ProductVO product,
			MultipartFile tumnailImage, MultipartFile detailImage,
			HttpServletRequest request) throws Exception {
		
		// 이미지 업로드 하는 과정
		// 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/" + product.getBrand() + "/" + product.getMiddleSort());
		
		// 경로에 대한 디렉토리 생성
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();	// 경로에 대한 디렉토리가 없으면 알아서 생성해준다.
		
		// 해당 경로에 업로드
		if(!tumnailImage.getOriginalFilename().isEmpty()) tumnailImage.transferTo(new File(path, product.getThumbnail_image()));
		if(!detailImage.getOriginalFilename().isEmpty()) detailImage.transferTo(new File(path, product.getDetail_image()));
		
	}
	
	// 상품 등록&수정 과정에서 상품번호를 올바르게 생성하는 과정
	private ProductVO productIndex(ProductVO product, MultipartFile tumnailImage, MultipartFile detailImage,
			HttpServletRequest request) throws Exception {

		// 상품 번호 과정
		// 상품 번호를 생성하는 과정
		String alphabetList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String alphabetIndex = "";
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

		// 생성한 상품 번호를 DB와 대조하고 입력하는 과정
		List<ProductVO> productIndexList = productDao.adminProductIndexSelectList(productIndex);
		if(product.getProduct_index() == null) {	// 상품 등록의 경우
			if(productIndexList.size() == 0) {
				productIndex += "A";
				product.setProduct_index(productIndex);
			}else {
				for(ProductVO alphabet : productIndexList) {
					alphabetIndex += alphabet.getProduct_index();
				}
			}
		}else {	// 상품 수정의 경우
			if(!productIndex.equals(product.getProduct_index().substring(0, 4))) {
				
			}
		}
		
		
		
		
		return product;
	}
	
}
