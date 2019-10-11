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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.service.GalleryService;

@Controller
public class GalleryController {
	
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private GalleryService service;

	@Resource(name = "uploadPath") // bean�쓽 id媛� uploadPath�씤 �깭洹몃�� 李몄“
	String uploadPath;

	private Logger logger = Logger.getLogger(getClass());

	@RequestMapping(value = "/gallery.do")
	public ModelAndView gallery() {
		//
		List<Gallery> galleryList = service.getGalleryList();
		
		logger.info("------------------------------");
		logger.info("list" + galleryList.getClass());
		
		for(Gallery gallery : galleryList) {
			logger.info("------------------------------");
			logger.info("name" + gallery.getFileName());
			logger.info("content" + gallery.getContent());
			logger.info("date" + gallery.getRegDate());
			logger.info("------------------------------");
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("gallery/gallery");
		mav.addObject(galleryList);
		
		return mav;
	}

	@RequestMapping(value = "/galleryDetail.do")
	public String galleryDetail() {
		return "gallery/galleryDetail";
	}

	@RequestMapping(value = "/upload.do")
	public String upload() {
		return "gallery/upload";
	}

	@RequestMapping(value = "updateGallery.do")
	public String updateGallrey(Gallery gallery) {
		service.updateGallery(gallery);
		return "redirect:gallery/gallery";
	}

	@RequestMapping(value = "/deleteGallery.do")
	public String deleteGallery(Gallery gallery) {
		service.deleteGallery(gallery);
		return "redirect:gallery/gallery";
	}

	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.GET)
	public String insertGallery(Gallery gallery) {

		return "redirect:gallery/gallery";
	}

	@RequestMapping(value = "/findGallery.do")
	public String findGallery(Gallery gallery, Model model) {
		Gallery findGallery = service.getGallery(gallery);
		model.addAttribute("findGallery", findGallery);
		return "gallery/gallery";
	}


	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
	public String fileUpload(HttpServletRequest req, Gallery gallery) {
		try {
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile uploadFile = null;

			// create directory
			File dir = new File(uploadPath);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			while (iter.hasNext()) {
				String fieldName = (String) iter.next(); // 내용을 가져와서
				uploadFile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // 한글꺠짐 방지

				// 파일명이 없다면
				if ("".equals(origName)) {
					continue;
				}

				// 파일 명 변경(uuid로 암호화)
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
				String saveFileName = getUuid() + ext;

				// 설정한 path에 파일저장
				File serverFile = new File(uploadPath + File.separator + saveFileName);
				uploadFile.transferTo(serverFile);
				logger.info("path: " + uploadFile);
				logger.info("fileName: " + uploadFile.getOriginalFilename());

				gallery = new Gallery(saveFileName, gallery.getContent(), gallery.getRegDate());
				service.insertGallery(gallery);;

			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:gallery.do";

	}

	private static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
