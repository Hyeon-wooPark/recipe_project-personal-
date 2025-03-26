package kr.ac.kopo.model;

public class Criteria {

	private int page; // 현재 페이지 번호
	
	private int perPageNum; // 한 페이지에서 보여줄 게시글의 수
	
	// 검색기능에 필요한 변수
	private String type;
	
	private String keyword;
	
	public Criteria() {
		this.page=1; // 첫 페이지 번호
		this.perPageNum=10; // 한 페이지에 보여줄 게시글 수
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	// 현재 페이지의 게시글의 시작번호
	public int getPageStart() {    // 1page   2page   3page
		return (page-1)*perPageNum;// 0~	  10~     20~  : limit 0,10(10에서 mysql은 1을 뺌 그래서 0~9까지 10개 구해지고 우리가 아는 개념과 차이가 있을 뿐 같음)
	}
	
}
