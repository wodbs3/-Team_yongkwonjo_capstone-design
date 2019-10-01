package com.bu.bumoim.controller;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GalleryController {
	
	private Logger logger = Logger.getLogger(getClass());
	

	
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

