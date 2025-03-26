package kr.ac.kopo.model;

// 페이징 처리를 만드는 클래스(vo)
public class ReviewPageMaker {

	private ReviewCriteria rcri;
	
	private int totalCount; // 총 게시글의 수
	
	private int startPage; // 시작 페이지 번호
	
	private int endPage; // 끝 페이지 번호(게시글 수에 따라 조정이 되어야 함)
	
	private boolean prev; // 이전버튼(true, false)을 생성할 것인가?
	
	private boolean next; // 다음버튼(true, false)을 생성할 것인가?
	
	private int displayPageNum=5; // 1 2 3 4 5 6 7 8 9 10(하단에 페이지 버튼을 몇개씩 보여줄 것인가?)
	
	public ReviewCriteria getRcri() {
		return rcri;
	}
	public void setRcri(ReviewCriteria rcri) {
		this.rcri = rcri;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	
	// 총 게시글의 수를 구하는 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		makePaging();
	}
	private void makePaging() {
		// 1. 화면에 보여질 마지막 페이지 번호
		endPage = (int)(Math.ceil(rcri.getRpage()/(double)displayPageNum)*displayPageNum);
		// 2. 화면에 보여질 시작 페이지 번호
		startPage = (endPage-displayPageNum) + 1;
		if(startPage <= 0) {
			startPage=1;
		}
		// 3. 전체 마지막 페이지 계산
		int tempEndPage = (int)(Math.ceil(totalCount/(double)rcri.getRperPageNum()));
		// 4. 화면에 보여질 마지막 페이지 유효성 체크
		if(tempEndPage<endPage) {
			endPage=tempEndPage;
		}
		// 5. 이전 페이지 버튼(링크) 존재 여부
		prev = (startPage==1)?false:true;
		// 6. 다음 페이지 버튼(링크) 존재 여부
		next = (endPage<tempEndPage)?true:false;
	}
}
