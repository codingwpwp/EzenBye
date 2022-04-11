package team.project.util;

import team.project.vo.SearchVO;

public class PagingUtil extends SearchVO{

	private int nowPage; //현재페이지번호. 게시판에 처음들어오거나, 파라미터값으로 생성자의 매개값에 대입한다..
	private int startPage; //화면에서 시작 페이지번호
	private int endPage; //화면에서 끝 페이지번호
	private int total; //게시글 총갯수. 갯수를 구하는 쿼리문에서 값을 따온뒤, 생성자의 매개값에 대입한다.
	private int perPage; //화면당 글갯수. 객체 생성할 때 매개값으로 대입한다.
	private int lastPage; //최종페이지번호. 사실상 페이지의 총 갯수나 다름 없다.
	private int start; //쿼리에서 사용할 화면당 글 시작번호
	private int end; // 쿼리에서 사용할 화면당 글 종료번호
	private int cntPage; //화면에서 보여질 페이징 갯수 EX)값이 10인 경우 : 1,2,3,...,9,10 페이지. 임의로 설정도 가능하다.
	
	public PagingUtil(int total, int nowPage, int perPage, int cntPage) {
		//게시글 갯수, 게시글 총갯수, 화면당 게시글 갯수, 화면에서 보여질 페이징 갯수 초기화
		setTotal(total);
		setNowPage(nowPage);
		setPerPage(perPage);
		setCntPage(cntPage);
		
		//전체의 최종 페이지번호 계산 lastPage 계산
		calcLastPage(total,perPage);
		
		//한 화면에서 보여질 시작 페이지와 종료 페이지 구하기
		calcStartEndPage(nowPage,cntPage);
		
		//쿼리에서 사용할 글 시작 번호와 종료 번호 구하기
		calcStartEnd(nowPage,perPage);
	}
	
	public void calcStartEnd(int nowPage, int perPage) {
		//한 화면의 게시글 시작 번호
		int start = (nowPage - 1) * perPage + 1;
		setStart(start);
		
		//한 화면의 게시글 종료 번호
		int end1 = start + perPage - 1;
		if (end1 > getTotal()) {
			setEnd(getTotal());
		} else {
			setEnd(end1);
		}
	}
	
	public void calcStartEndPage(int nowPage, int cntPage) {
		//한 화면에서 보여지는 마지막 페이지 계산
		int endPage1 = (((int)Math.ceil((double)nowPage/cntPage))*cntPage);
		
		// 최종 페이지가 endPage보다 작은 경우 최종페이지(LastPage)를 endPage로설정
		// Ex) 최종 페이지(LastPage)가 23 일때 계산된 끝페이지(endPage)는 30으로 계산 되므로 끝페이지를 최종 페이지로 변경
		if(getLastPage() < endPage1) {
			setEndPage(getLastPage());
		} else {
			setEndPage(endPage1);
		}
		
		//시작 페이지 계산하기
		int startPage = (endPage1 - cntPage + 1);
		// 필드에 있는 endPage가 아니라 메소드 안에있는 endPage값이다. 보기 편하라고 '1'을 붙여줬다.
		//int startPage = (((int)Math.floor((double)nowPage/cntPage))*cntPage) + 1; 중간중간에 오류난다.
		
		if(startPage < 1) {	// endPage가 cntPage보다 작을때의 경우.(> 버튼이 없고, 게시글의 수는 작고, 한 화면에 보여주는 페이지가 많을경우에 해당한다.)
			startPage = 1;
		}
		setStartPage(startPage);
	}
	
	public void calcLastPage(int total, int perPage) {
		//(정수)소수점 올림(전체 게시글/한 페이지당 글갯수)
		int lastPage = (int)Math.ceil((double)total/perPage);
		setLastPage(lastPage);
		
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
}