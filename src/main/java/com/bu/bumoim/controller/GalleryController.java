package com.bu.bumoim.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.GalleryCriteria;
import com.bu.bumoim.paging.GalleryPageMaker;
import com.bu.bumoim.paging.PageMaker;
import com.bu.bumoim.service.CommentService;
import com.bu.bumoim.service.GalleryService;

@Controller
public class GalleryController {
	

	@Autowired
	private GalleryService service;
	@Autowired
	private CommentService commentService; 
	
	@Resource(name = "uploadPath") // bean�쓽 id媛� uploadPath�씤 �깭洹몃�� 李몄“
	String uploadPath;

	private Logger logger = Logger.getLogger(getClass());
	
	
	@RequestMapping(value = "/gallery.do", method = RequestMethod.GET)
	public ModelAndView gallery(Gallery gallery, @ModelAttribute("cri") GalleryCriteria cri) throws Exception {
		//전체 게시글 수
//		int listCnt = service.getGalleryCount();
		
		List<Gallery> list = service.getGalleryList(cri);
		
		
		ModelAndView mav = new ModelAndView();
		GalleryPageMaker pageMaker = new GalleryPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		mav.setViewName("gallery/gallery");
		mav.addObject("gallery", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	@RequestMapping(value ="/galleryDetail.do",method=RequestMethod.GET)
	public ModelAndView galleryDetail(int num) {
	
		Gallery gallery = service.getGallery(num);
		List<Comment> comment = commentService.galCommentList(num);
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("gallery/galleryDetail");
		mav.addObject("gallery",gallery);
		mav.addObject("commentList",comment);
		
		return mav;
	
		
	}

	@RequestMapping(value = "/upload.do", method=RequestMethod.GET)
	public String upload() {
		return "gallery/upload";
	}

	@RequestMapping(value = "/updateGallery.do")
	public String updateGallery(HttpServletRequest req,Gallery gallery, int num) {
		
		Gallery getGallery = service.getGallery(num);
		String preFileName = getGallery.getFileName();
		gallery = fileUpload(req,gallery);
		String fileName = gallery.getFileName();
		
		if(!preFileName.equals(fileName)) {
			if(preFileName != null && preFileName != "") {
			File file = new File(uploadPath,preFileName);
			file.delete();
			}			
		}
		
		gallery = new Gallery(fileName, gallery.getContent(), gallery.getRegDate(), gallery.getWriter(), num);
		service.updateGallery(gallery);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> name: " + gallery.getFileName());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> content: " + gallery.getContent());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> date: " + gallery.getRegDate());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> writer: " + gallery.getWriter());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> num: " + gallery.getNum());
		return "redirect:galleryDetail.do?num=" + num;
	}
	
	@RequestMapping(value = "/updateForm.do")
	public String updateForm(int num, Model model) {
		Gallery gallery = service.getGallery(num);
		model.addAttribute("gallery",gallery);
	
		return "gallery/update";
	}

	@RequestMapping(value = "/deleteGallery.do")
	public String deleteGallery(int num) {
		Gallery gallery = service.getGallery(num);
		String fileName = gallery.getFileName();
		
		if(fileName != null && fileName != "") {
		File file = new File(uploadPath,fileName);
		file.delete();
		}
		commentService.galDeleteAllComment(num);
		service.deleteGallery(num);
		
		return "redirect:gallery.do";
	}

	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
	public String insertGallery(Member member, HttpServletRequest req, Gallery gallery) {
		gallery = fileUpload(req,gallery);
	
		service.insertGallery(gallery);
	
		return "redirect:gallery.do";
	}


	
	public Gallery fileUpload(HttpServletRequest req, Gallery gallery) {
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

				gallery = new Gallery(saveFileName, gallery.getContent(), gallery.getRegDate(), gallery.getWriter());
				
			
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

		
			return gallery;
	}

	private static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
