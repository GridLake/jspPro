package days10.mvc.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days05.MyBoardDTO;
import days05.PageBlock;
import days10.mvc.command.CommandHandler;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int searchCondition = Integer.parseInt(
				request.getParameter("searchCondition") ==  null? "1": request.getParameter("searchCondition"));
		request.setAttribute("searchCondition", searchCondition);
		
		String searchWord = request.getParameter("searchWord");
		request.setAttribute("searchWord", searchWord); // null일 때 빈 문자 반환하기 위해 여기에 코딩
		if (searchWord == null || searchWord.equals("")) searchWord = "*";
		
		String pCurrentPage = request.getParameter("currentPage");
		int currentPage = pCurrentPage == null ? 1 : Integer.parseInt(pCurrentPage);
		int numberPerPage = 10;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MyBoardDTO> list = null;

		try {
			// 1
			String sql = "select *                                         ";
			sql+= " from (                                                 ";
			sql+= "    select rownum no, t.*                               ";
			sql+= "    from (                                              ";
			sql+= "        select  seq, name, email, subject, cnt, regdate ";
			sql+= "        from tbl_myboard                                ";

			// 검색 쿼리 추가
			switch (searchCondition) {
			case 1: sql += " where regexp_like(subject, ?, 'i') "; break;
			case 2: sql += " where regexp_like(content, ?, 'i') "; break;
			case 3: sql += " where regexp_like(name, ?, 'i') ";    break;
			case 4: sql += " where regexp_like(subject, ?, 'i') "
						+ " or regexp_like(content, ?, 'i') "; break;
			}
			
			sql+= "        order by seq desc                               ";
			sql+= "     ) t                                                ";
			sql+= " ) b                                                    ";
			sql+= " where b.no between ? and ?   						   ";

			con = DBConn.getConnection();
			int start = (currentPage-1) * numberPerPage + 1;
			int end = currentPage * numberPerPage;

			// searchWord = "%" + searchWord + "%";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			if(searchCondition == 4) {
				pstmt.setString(2, searchWord);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
			}
			else {
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {

				list = new ArrayList<>();
				MyBoardDTO dto = null;
				do {
					dto = new MyBoardDTO();
					// seq, name, email, subject, cnt, regdate
					dto.setSeq(rs.getInt("seq"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					String subject = rs.getString("subject");
					if ( !searchWord.equals("*")) {
						subject = subject.replace(searchWord, "<span class='searchWord'>" + searchWord + "</span>");
					}
					dto.setSubject(subject);
					dto.setCnt(rs.getInt("cnt"));
					dto.setRegDate(rs.getDate("regdate"));
					list.add(dto);	//
				} while (rs.next());
			}

			request.setAttribute("list", list); // ***
			rs.close();
			pstmt.close();

			// 페이징 처리 정보를 위한 request.setAttribute();
			PageBlock pageBlock = new PageBlock();
			pageBlock.setCurrentPage(currentPage);
			pageBlock.setNumberPerPage(numberPerPage);
			pageBlock.setNumberOfPageBlocks(10);

			int numberOfPages = 0;
			sql =   " select count(*) numberOfPostings "
					+ " , ceil(count(*)/?) numberOfPages "
					+ " from tbl_myboard ";
			switch (searchCondition) {
			case 1: sql += " where regexp_like(subject, ?, 'i') "; break;
			case 2: sql += " where regexp_like(content, ?, 'i') "; break;
			case 3: sql += " where regexp_like(name, ?, 'i') ";    break;
			case 4: sql += " where regexp_like(subject, ?, 'i') "
						+ " or regexp_like(content, ?, 'i') "; break;
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, numberPerPage);
			pstmt.setString(2, searchWord);
			if( searchCondition == 4) pstmt.setString(3, searchWord);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				numberOfPages = rs.getInt(2);
			}
			pstmt.close();
			rs.close();
			pageBlock.setNumberOfPages(numberOfPages);

			// start, end, prev, next
			int numberOfPageBlocks = pageBlock.getNumberOfPageBlocks();
			int pageBlockStart = (currentPage-1) / numberOfPageBlocks * numberOfPageBlocks + 1;
			int pageBlockEnd = pageBlockStart + numberOfPageBlocks -1;
			pageBlockEnd = pageBlockEnd > numberOfPages ? numberOfPages : pageBlockEnd;
			pageBlock.setStart(pageBlockStart);
			pageBlock.setEnd(pageBlockEnd);
			pageBlock.setPrev(pageBlock.getStart() == 1 ? false : true);
			pageBlock.setNext(pageBlock.getEnd() == numberOfPages ? false : true);

			request.setAttribute("pageBlock", pageBlock);
			DBConn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/board//list.do";
	}

	
}
