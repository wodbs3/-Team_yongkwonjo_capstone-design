package com.bu.bumoim.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bu.bumoim.domain.Gallery;

@Controller
public class GalleryController {

	
	private Logger logger = Logger.getLogger(getClass());

	@Resource(name = "uploadPath") // bean의 id가 uploadPath인 태그를 참조
	String uploadPath;
	
	@RequestMapping(value = "/gallery.do")
	public String gallery() {
		return "gallery/gallery";
	}

	@RequestMapping(value = "/galleryDetail.do")
	public String galleryDetail() {
		return "gallery/galleryDetail";
	}

	@RequestMapping(value = "/upload.do")
	public String upload() {
		return "gallery/upload";
	}


	@RequestMapping(value="/fileUpload", method = RequestMethod.POST)
	public String fileUpload(HttpServletRequest req, Model model) {
		try { 
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames();
			MultipartFile uploadFile = null;
			List resultList = new ArrayList(); 
			Map returnObject = new HashMap();
			
			// create directory
			File dir = new File(uploadPath); 
			if (!dir.isDirectory()) {
				dir.mkdirs(); 
			} 
			while (iter.hasNext()) { 
				String fieldName = (String) iter.next(); // 내용을 가져와서 
				uploadFile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
				
				// 파일명이 없다면 
				if ("".equals(origName)) { continue; } 
				
				// 파일 명 변경(uuid로 암호화) 
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
				String saveFileName = getUuid() + ext; 
				
				// 설정한 path에 파일저장 
				File serverFile = new File(uploadPath + File.separator + saveFileName); 
				uploadFile.transferTo(serverFile); 
				logger.info("path: " + uploadFile);
				logger.info("fileName: " + uploadFile.getOriginalFilename());
				
				}
			} catch (UnsupportedEncodingException e ) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
				}catch (IllegalStateException e) { 
					// TODO	Auto-generated catch block
					e.printStackTrace(); 
					} catch (IOException e) { // TODO Auto-generated catch block
						e.printStackTrace(); 
						}
			
		return "gallery/gallery";
	}
	
	// uuid생성
		public static String getUuid() {
			return UUID.randomUUID().toString().replaceAll("-", "");
		}
}


