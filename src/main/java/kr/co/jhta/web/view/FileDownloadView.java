package kr.co.jhta.web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileDownloadView extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 디렉토리 경로와 파일명을 모델에서 조회한다.
		String directory = (String) model.get("directory");
		String filename = (String) model.get("filename");
		
		log.info("디렉토리 - {} ", directory);
		log.info("파일명 - {} ", filename);
		
		response.setContentType("application/octet-stream");
		// 이렇게 적으면 무조건 다운로드됨 (이미지가 보여지기만하고 다운안되는 것을 방지)
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "utf-8"));
	
		FileInputStream in = new FileInputStream(new File(directory, filename));
		OutputStream out = response.getOutputStream();
		
		FileCopyUtils.copy(in, out);
	}
}