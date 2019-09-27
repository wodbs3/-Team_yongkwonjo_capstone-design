package com.bu.bumoim.main.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.bu.bumoim.main.service.BoardService;



@Controller
public class galleryController {

	
	private static final Logger logger = LoggerFactory.getLogger(galleryController.class);
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
	@RequestMapping(value = "/gallery")
	public String gallery() {
		return "gallery/gallery";
	}
	
	@RequestMapping(value = "/galleryDetail")
	public String galleryDetail() {
		return "gallery/galleryDetail";
	}
	@RequestMapping(value="/upload")
	public String upload() {
		return "gallery/upload";
	}

}

