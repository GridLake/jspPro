package days05;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMyBoardDAO {

	// 게시글 작성
	int insert(MyBoardDTO boardDto) throws SQLException;
	
	// 게시글 목록
	ArrayList<MyBoardDTO> select(int curPage, int pageSize) throws SQLException;

	// 게시글 삭제
	int delete(int seq) throws SQLException;

	String getPassword(int seq) throws SQLException;

	// 게시글 조회수 증가
	void increaseCnt(int seq) throws SQLException;

	MyBoardDTO selectSeq(int seq) throws SQLException;

	// 게시글 수정
	int update(MyBoardDTO boardDto) throws SQLException;

	// 총 페이지수 반환 메소드
	int getNumberOfPages(int numberPerPage) throws SQLException;

	ArrayList<MyBoardDTO> selectSearch
	(int currentPage, int numberPerPage, int searchCondition, String searchWord) throws SQLException;

	int getSearchNumberOfPages(int numberPerPage, int searchCondition, String searchWord) throws SQLException;
	
	// 게시글 보기
	// 총 게시글 수 반환
	// 총 페이지 수 반환
	
}
