package days07;

import java.io.File;
import java.io.FileReader;

public class Test {

	public static void main(String[] args) {
		// 이 폴더에 있는 파일 읽어오기 -> select option
		String realPath = "C:\\Class\\JspClass\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\jspPro\\days05";
		File dir = new File(realPath);
		// dir.isDirectory()
		File[] files = dir.listFiles();
		
		for (int i = 0; i < files.length; i++) {
			files[i].getName();
		}
		
	}

	public void test() {
		String fileName = "C:\\Class\\JspClass\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\jspPro\\days05\\content.jsp";

	}
}
