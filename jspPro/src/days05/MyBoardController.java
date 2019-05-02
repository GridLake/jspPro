package days05;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import com.util.DBConn;

public class MyBoardController {

	private int selectedNumber;
	private Scanner sc = null;
	private MyBoardService boardService = null;
	private int currentPage = 1;
	private int numberPerPage = 10;
	private int numberOfPageBlocks = 10; // 1,2,3,...,9,10
	
	public MyBoardController() {
		
		this.sc = new Scanner(System.in);
	}
	
	public MyBoardController(MyBoardService boardService) {
		
		this();	// 스캐너 들어있는 생성자 호출
		this.boardService = boardService;
	}

	public void start() {
		
		while(true) {
			
			printMenu();
			selectMenu();
			processMenu();
		
		}
	}

	private void processMenu() {
		
		switch (this.selectedNumber) {
		case 1:	// 새글
			새글쓰기();
			break;
		case 2: // 목록
			게시글목록조회();
			break;
		case 3: // 보기
			게시글상세보기();
			break;
		case 4:	// 수정
			게시글수정();
			break;
		case 5: // 삭제
			게시글삭제();
			break;
		case 6: // 검색
			게시물검색();
			break;
		case 7: // 종료
			exit();
			break;
		} // switch
	}

	private void 게시물검색() {
		
		int searchCondition; // 검색조건 1,2,3,4
		String searchWord;	 // 검색어
		
		System.out.print("1. 검색조건 선택(제목: 1, 내용: 2, 글쓴이: 3, 제목+내용: 4)");
		searchCondition = this.sc.nextInt();
		System.out.print("2. 검색어 입력 : ");
		searchWord = this.sc.next();
		
		
		System.out.print("> 검색된 결과의 페이지 번호 입력: ");
		this.currentPage = this.sc.nextInt();
		
		// this.currentPage = 1;
		ArrayList<MyBoardDTO> list = this.boardService.selectSearchService
				(currentPage, numberPerPage, searchCondition, searchWord);
		
		System.out.println("\t\t\t\tMy게시판");
		System.out.println("----------------------------------------------------------------------");
		System.out.printf("%s\t%s\t%s\t%s\t%s", "글번호", "글제목", "글쓴이", "작성일", "조회수\n");
		System.out.println("----------------------------------------------------------------------");
		
		if(list != null) {
			Iterator<MyBoardDTO> ir = list.iterator();

			while (ir.hasNext()) {
				MyBoardDTO dto = ir.next();
				System.out.printf("%d\t%s\t%s\t%tF\t%d\n"
						, dto.getSeq(), dto.getSubject(), dto.getName(), dto.getRegDate(), dto.getCnt());

			}
			
			System.out.println("----------------------------------------------------------------------");
			System.out.println("\t\t");
			String pagingBlock = this.boardService.pagingBlockSearchService
					(currentPage, numberPerPage, numberOfPageBlocks, searchCondition, searchWord);
			System.out.println(pagingBlock);
			System.out.println("----------------------------------------------------------------------");
		}
		else
			System.out.println("\t검색결과 없습니다.");
		
		일시정지();
	}

	private void 게시글수정() {
		
		System.out.print("> 수정하고자 하는 게시글 글번호(seq) 입력 : ");
		int seq = this.sc.nextInt();
		this.sc.nextLine();				//
		
		// 1. 수정하고자 하는 게시글 정보 출력
		// 2. 수정하는 입력(제목, 내용)
		MyBoardDTO boardDto = null;
		try {
			boardDto = this.boardService.getBoardDao().selectSeq(seq);
			System.out.println("Subject = " + boardDto.getSubject());
			System.out.println("Content = " + boardDto.getContent());
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("수정할 게시글이 존재하지 않습니다.");
			return;
		}
	
		System.out.print("> 비밀번호, 수정할 글제목, 글내용 입력 : ");
		String password = sc.nextLine();
		String subject = sc.nextLine();
		String content = sc.nextLine();
		
		if (!password.equals(boardDto.getPassword())) {
			System.out.println("비밀번호가 잘못되었습니다.");
			return;
		}
		boardDto.setSeq(seq);			//
		boardDto.setSubject(subject);
		boardDto.setContent(content);
		
		int resultCnt = this.boardService.updateService(boardDto);
		
		if(resultCnt == 1) {
			System.out.println("> 수정 완료.");
		}
	}

	private void 게시글상세보기() {
		
		System.out.print("> 보고자 하는 게시글 글번호(seq) 입력 : ");
		int seq = this.sc.nextInt();
		
		MyBoardDTO boardDTO = this.boardService.viewService(seq);
		
		// 해당 게시글 출력
		if (boardDTO != null) {
			System.out.printf("글번호 : %d\n", seq);
			System.out.printf("조회수 : %d\n", boardDTO.getCnt());
			System.out.printf("글쓴이 : %s\n", boardDTO.getName());
			System.out.printf("글제목 : %s\n", boardDTO.getSubject());
			System.out.printf("글내용 : %s\n", boardDTO.getContent());
			
			System.out.println("\n [수정][삭제][목록]");
		}
		else {
			System.out.println("해당 게시글이 존재하지 않습니다");
		}
		일시정지();
	}

	private void 게시글삭제() {
		
		System.out.print("> 삭제할 글번호(seq), 비밀번호(password) 입력 : ");
		int seq = this.sc.nextInt();
		String password = this.sc.next();
		int resultCnt = this.boardService.deleteService(seq, password);
		
		if(resultCnt > 0) {
			System.out.println("> 삭제 완료.");
		}
		else if(resultCnt == -1) {
			System.out.println("> 비밀번호가 잘못되었습니다.");
		}
		일시정지();
	}

	private void 새글쓰기() {
		
		// 새글 게시글 정보 입력
		/*
		insert into tbl_myboard
		(seq, name, password, email, subject, content, tag, userip)
		values(seq_myboard.nextval, '김덕영', '1234$!', 'maestrody@orgio.net', '헉. 왜 이렇게 썰렁해?'
		       , '이거 머야..\r\n 무지하게 썰렁하네. -_-a', 'y', '192.168.0.25');
		*/
		System.out.print("> Name : ");
		String name = this.sc.nextLine();
		System.out.print("> Password : ");
		String password = this.sc.nextLine();
		System.out.print("> Email : ");
		String email = this.sc.nextLine();
		System.out.print("> Subject : ");
		String subject = this.sc.nextLine();
		System.out.print("> Content : ");
		String content = this.sc.nextLine();
		
		// DTO
		MyBoardDTO boardDTO = new MyBoardDTO();
		boardDTO.setName(name);
		boardDTO.setPassword(password);
		boardDTO.setEmail(email);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		//
		int resultCnt = this.boardService.insertService(boardDTO);
		if(resultCnt == 1) {
			System.out.println("> 새글쓰기 완료.");
		}
		일시정지();
	}

	private void 게시글목록조회() {
		
		System.out.print("> 페이지 번호 입력: ");
		this.currentPage = this.sc.nextInt();
		// 컨트롤러 : ArrayList<DTO> MyBoardService.게시글목록조회()
		ArrayList<MyBoardDTO> list = this.boardService.selectService(currentPage, numberPerPage);
		
		// 목록출력(View)
		System.out.println("\t\t\t\tMy게시판");
		System.out.println("----------------------------------------------------------------------");
		System.out.printf("%s\t%s\t%s\t%s\t%s", "글번호", "글제목", "글쓴이", "작성일", "조회수\n");
		System.out.println("----------------------------------------------------------------------");
		Iterator<MyBoardDTO> ir = list.iterator();
		
		while (ir.hasNext()) {
			MyBoardDTO dto = ir.next();
			System.out.printf("%d\t%s\t%s\t%tF\t%d\n"
					, dto.getSeq(), dto.getSubject(), dto.getName(), dto.getRegDate(), dto.getCnt());
			
		}
		System.out.println("----------------------------------------------------------------------");
		// System.out.println("\t\t[1] 2 3 4 5 6 7 8 9 10 ▶");
		System.out.println("\t\t");
		/*
		for (int i = 1; i <= 10; i++) {
			System.out.printf(this.currentPage == i ? "[%2d]" : "%2d", i);
		}
		*/
		String pagingBlock = this.boardService.pagingBlockService
				(currentPage, numberPerPage, numberOfPageBlocks); // 현재페이지번호, 한 페이지에 출력할 게시글수. 1~10
		System.out.println(pagingBlock);
		System.out.println("----------------------------------------------------------------------");
		일시정지();
	}

	private void 일시정지() {
		
		System.out.print("> 계속하려면 엔터치세요...");
		try {
			System.in.read();
			System.in.skip(System.in.available());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void exit() {
		
		DBConn.close();
		System.out.println("\t\t프로그램 종료!!!");
		System.exit(-1);
	}

	private void selectMenu() {
		
		System.out.print("> 메뉴 선택하세요 ");
		// 유효성 검사
		this.selectedNumber = this.sc.nextInt();
		this.sc.nextLine();
	}


	private void printMenu() {
		
		String [] menus = {"새글", "목록", "보기", "수정", "삭제", "검색", "종료"};
		System.out.println("[메뉴]");
		
		for (int i = 0; i < menus.length; i++) {
			
			System.out.printf("%d. %s\t", i + 1, menus[i]);
		}
		System.out.println();
	}
	
	private static void skip() {
		
		try {
			System.in.skip(System.in.available());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
