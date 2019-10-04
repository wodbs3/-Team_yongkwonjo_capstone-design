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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class GalleryController {

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


	@RequestMapping(value = "/fileUpload" ,method=RequestMethod.POST) 
	 public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) { 
		//파일이 저장될 path 설정
		String path = "C:/Users/USER/Desktop/cap/bumoim/src/main/webapp/resources/upload"; 
		Map returnObject = new HashMap();
		try { 
			// MultipartHttpServletRequest 생성 
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames();
			
			MultipartFile mfile = null; 
			String fieldName = ""; 
			List resultList = new ArrayList(); 
			
			// 디레토리가 없다면 생성 
			File dir = new File(path); 
			if (!dir.isDirectory()) {
				dir.mkdirs(); 
			} 
			// 값이 나올때까지 
			while (iter.hasNext()) { 
				fieldName = (String) iter.next(); // 내용을 가져와서 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
				
				// 파일명이 없다면 
				if ("".equals(origName)) { continue; } 
				
				// 파일 명 변경(uuid로 암호화) 
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
				String saveFileName = getUuid() + ext; 
				
				// 설정한 path에 파일저장 
				File serverFile = new File(path + File.separator + saveFileName); 
				mfile.transferTo(serverFile); 
				logger.info("path: " + path);
				
				Map file = new HashMap(); 
				file.put("origName", origName);
				file.put("sfile", serverFile); 
				resultList.add(file); 
			}
			returnObject.put("files", resultList); 
			returnObject.put("params", mhsr.getParameterMap()); 
			} catch (UnsupportedEncodingException e ) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
				}catch (IllegalStateException e) { 
					// TODO	Auto-generated catch block
					e.printStackTrace(); 
					} catch (IOException e) { // TODO Auto-generated catch block
						e.printStackTrace(); 
						} 
		return null; 
					
	}
	// uuid생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}


