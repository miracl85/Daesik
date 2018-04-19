package com.kat.home.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.kat.home.dto.FileDTO;

import ch.qos.logback.classic.Logger;


public class Common {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(Common.class);
	
	public String cssUrlChange(String language ,String cssKo ,String cssEn) {
	
		String cssUrl = "";
		
		if(language == "ko") {
			cssUrl = cssKo;
		} else if(language == "en") {
			cssUrl = cssEn;
		}
	
		return cssUrl;
	}

	public String smartEditorMultiplePhotoUpload(HttpServletRequest request, String filePath, String editorFilePath) {
		 // file Info
	    StringBuffer sb = new StringBuffer();
	    try {
	    	/* fileName get  */
	    	String oldName = request.getHeader("file-name");
	    
	    	/* file saveName */    
	    	String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
	    		  			.append(UUID.randomUUID().toString()).append(oldName.substring(oldName.lastIndexOf("."))).toString();
	    
	    	InputStream is = request.getInputStream();
	    	OutputStream os = new FileOutputStream(filePath + saveName);
	    
	    	int numRead;
		      
	    	byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		      
	    	while ((numRead = is.read(b, 0, b.length)) != -1) {
	    		os.write(b, 0, numRead);
	    	}

	    	os.flush();
	    	os.close();
	    	/* into print */
	    	sb = new StringBuffer();
	    	sb.append("&bNewLine=true").append("&sFileName=").append(oldName)
	    	.append("&sFileURL=").append(editorFilePath).append(saveName);	     
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}	
	    return sb.toString();
	}
	
	public HashMap<String, String> fileUpload(HttpServletRequest request, HttpServletResponse response, String filePath, FileDTO dto){
		HashMap<String, String> map = new HashMap<String, String>();
		StringBuffer sb = new StringBuffer();
	    
		MultipartFile uploadFile = dto.getFile();		
		String origName = null;
	
		try {
			origName = new String(dto.getFile().getOriginalFilename().getBytes("8859_1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(uploadFile != null && uploadFile.getOriginalFilename() != "") {
			String fileName = uploadFile.getOriginalFilename();
			
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
		  			.append(UUID.randomUUID().toString()).append(origName.substring(origName.lastIndexOf("."))).toString();
			
			File file = new File(filePath+saveName);
			map.put("orgFileName", fileName);
			map.put("fileName", saveName);
			
			try {
				uploadFile.transferTo(file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public void fileDelete(String fileName ,String filePath) {
		File file = new File(filePath + fileName);
		file.delete();
	}
	
	public void fileDownLoad(HttpServletRequest request, HttpServletResponse response, String path, String fileName, String orgFileName) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();  
		}
		
		String filePath = path + fileName;
		logger.info(filePath);
		
		try {											
			byte b[] = new byte[4096];

			response.reset();
			response.setContentType("application/octet-stream");

			String Encoding = java.net.URLEncoder.encode(orgFileName, "UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename =" + Encoding);

			FileInputStream in = new FileInputStream(filePath);

			ServletOutputStream out = response.getOutputStream();

			int numRead;
			while ((numRead = in.read(b, 0, b.length)) != -1) {
				out.write(b, 0, numRead);
			}

			out.flush();
			out.close();
			in.close();
				
		} catch(Exception e) {
			logger.info(e.toString());
		}
	}
	
}


