package days05;

public class PageBlock {

	private int currentPage = 1; 		 // 현재 페이지 번호
	private int numberOfPageBlocks = 10;  // 페이징 블럭 수
	private int numberPerPage = 15; 	 	 // 한 페이지 당 게시글 수
	private int numberOfPages = 0;		 // 총 페이지 수
	private int start;
	private int end;
	
	private boolean prev, next;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNumberOfPageBlocks() {
		return numberOfPageBlocks;
	}

	public void setNumberOfPageBlocks(int numberOfPageBlocks) {
		this.numberOfPageBlocks = numberOfPageBlocks;
	}

	public int getNumberPerPage() {
		return numberPerPage;
	}

	public void setNumberPerPage(int numberPerPage) {
		this.numberPerPage = numberPerPage;
	}

	public int getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(int numberOfPages) {
		this.numberOfPages = numberOfPages;
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
	
	
}
