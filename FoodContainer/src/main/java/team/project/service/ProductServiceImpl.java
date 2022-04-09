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
		
		PagingUtil paging = adminProductPaging(searchvo, nowPage);
		
		// 검색 값과 해당 페이지에 대한 목록을 출력하는 과정
		paging.setDel_YN(searchvo.getDel_YN());
		paging.setSearchValue(searchvo.getSearchValue());
		paging.setStart(paging.getStart() - 1);
		
		return productDao.adminProductList(paging);
	}
	
	// 상품 조회(페이징)
	@Override
	public PagingUtil adminProductPaging(SearchVO searchvo, int nowPage) throws Exception {
		int cnt = productDao.adminProductListCount(searchvo);
		PagingUtil paging = new PagingUtil(cnt, nowPage, 10, 5);
		return paging;
	}
	
	// 상품 삭제
	@Override
	public int adminProductDelYNisY(String[] productIndexArr) throws Exception {
		
		List<String> deleteIndexList = new ArrayList<String>();
		for(int i = 0; i < productIndexArr.length; i++) {
			deleteIndexList.add(productIndexArr[i]);
		}
		System.out.println(deleteIndexList.size());
		
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
		
		// 다음은 이미지 업로드 하는 과정이다. 참고로 주석은 내가 직접 어느정도 이해하면서 작성하였다.
		// 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/" + product.getBrand() + "/" + product.getMiddleSort());
		
		// 경로에 대한 디렉토리 생성
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();	// 경로에 대한 디렉토리가 없으면 알아서 생성해준다.
		
		// 해당 경로에 업로드
		if(!tumnailImage.getOriginalFilename().isEmpty()) tumnailImage.transferTo(new File(path, product.getThumbnail_image()));
		if(!detailImage.getOriginalFilename().isEmpty()) detailImage.transferTo(new File(path, product.getDetail_image()));
		
		
		// 상품 번호를 생성하는 과정
		String alphbetList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
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
			if(product.getMiddleSort().equals("국문")) {
				productIndex += "01";
			}else if(product.getMiddleSort().equals("반찬")) {
				productIndex += "02";
			}else {
				productIndex += "03";
			}
		}
		
		
		// 생성한 상품 번호를 DB와 대조하고 입력하는 과정
		List<ProductVO> productIndexList = productDao.adminProductIndexSelectList(productIndex);
		
		if(productIndexList.size() == 0) {
			productIndex += "A";
			product.setProduct_index(productIndex);
		}else {
			String lastIndex = productIndexList.get(0).getProduct_index();
			String alpha = lastIndex.substring(4);
			if(alphbetList.indexOf(alpha) < 25) {
				productIndex += alphbetList.substring(alphbetList.indexOf(alpha) + 1, alphbetList.indexOf(alpha) + 2);
				product.setProduct_index(productIndex);
			}else {
				return 0;
			}
		}
		
		
		return productDao.adminProductInsert(product);
	}

	
	
}
