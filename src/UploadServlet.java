

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		boolean isImage = false;
		
		//여기를 바꿔주면 다운 받는 경로가 바뀜
		String savePath = "upload";
		//최대 업로드 파일 크기 5MB로 제한
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = "c:/dev/upload";        // context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리 : ");
		System.out.println(uploadFilePath);
		
		File dir = new File(uploadFilePath);
		if (!dir.exists()) {
			dir.mkdir();
		}
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, 				// requeset 객체
					uploadFilePath,  		// 서버 상의 실제 디렉토리
					uploadFileSizeLimit, 	// 최대 업로드 파일 크기
					encType, 				// 인코딩방법
					new DefaultFileRenamePolicy()); //동일한 이름이 존재하면 새로운 이름이 부여됨
					
			// 업로드된 파일의 이름 얻기
			String fileName = multi.getFilesystemName("uploadFile");
			isImage = multi.getContentType("uploadFile")
				.substring(0, 6)
				.toLowerCase()
				.equals("image/");
			String ext = multi.getContentType("uploadFile")
					.substring(6).toLowerCase();
			if (isImage) {
				ParameterBlock pb = new ParameterBlock();
				pb.add(uploadFilePath + "/" + fileName);
				RenderedOp rOp = JAI.create("fileload", pb);
				BufferedImage bi = rOp.getAsBufferedImage();
				BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				Graphics2D g = thumb.createGraphics();
				g.drawImage(bi, 0, 0, 100, 100, null);
				
				File f = new File(uploadFilePath + "/thumb_" + fileName);
				ImageIO.write(thumb, ext, f);
			} 
			
			if(fileName == null) { // 파일이 업로드 되지 않을때
				System.out.print("파일이 업로드 되지 않았음");
							
			} else { //파일이 업로드 되었을때
				out.println("<br> 글쓴이 : " + multi.getParameter("name"));
				out.println("<br> 제 &nbsp; 목 : " + multi.getParameter("title"));
				out.println("<br> 파일명 : " + fileName);
				
			} //else
			
		} catch(Exception e) {
			System.out.print("예외 발생 : " + e);
			
		} //catch
	
	}

}