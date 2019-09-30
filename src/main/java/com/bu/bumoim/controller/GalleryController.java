package com.bu.bumoim.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GalleryController {

	
	private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);
//	@Autowired
	//private BoardService boardService; 
	
	/*
	@RequestMapping("upload.do")
	public String uploadBoard(Board vo) throws IOException {
		
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/" + fileName));
		}
		
		boardService.insertBoard(vo);
		return "gallery/result";
	}
	*/
	@RequestMapping(value = "/gallery.do")
	public String gallery() {
		return "gallery/gallery";
	}
	
	@RequestMapping(value = "/galleryDetail.do")
	public String galleryDetail() {
		return "gallery/galleryDetail";
	}
	@RequestMapping(value="/upload.do")
	public String upload() {
		return "gallery/upload";
	}
	
	

}

