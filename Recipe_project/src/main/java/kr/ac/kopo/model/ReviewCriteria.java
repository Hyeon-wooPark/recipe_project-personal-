package kr.ac.kopo.model;

public class ReviewCriteria {

	private int rpage; // 현재 페이지 번호
	
	private int rperPageNum; // 한 페이지에서 보여줄 게시글의 수
	
	public ReviewCriteria() {
		this.rpage=1; // 첫 페이지 번호
		this.rperPageNum=30; // 한 페이지에 보여줄 게시글 수
	}
	
	public int getRpage() {
		return rpage;
	}

	public void setRpage(int rpage) {
		this.rpage = rpage;
	}

	public int getRperPageNum() {
		return rperPageNum;
	}

	public void setRperPageNum(int rperPageNum) {
		this.rperPageNum = rperPageNum;
	}

	// 현재 페이지의 게시글의 시작번호
	public int getRpageStart() {    
		return (rpage-1)*rperPageNum;
	}
	
}
