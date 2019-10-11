package com.bu.bumoim.service.logic;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bu.bumoim.dao.GalleryDao;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.service.GalleryService;

@Service
public class GalleryServiceLogic implements GalleryService {

	private Logger logger = Logger.getLogger(getClass());
	@Resource(name = "uploadPath") // bean�쓽 id媛� uploadPath�씤 �깭洹몃�� 李몄“
	String uploadPath;

	@Autowired
	private GalleryDao galleryDao;

	@Override
	public void insertGallery(Gallery gallery) {
		galleryDao.insertGallery(gallery);
//		upload(gallery);
	}

	@Override
	public void updateGallery(Gallery gallery) {
		galleryDao.updateGallery(gallery);

	}

	@Override
	public void deleteGallery(Gallery gallery) {
		galleryDao.deleteGallery(gallery.getNum());
	}

	@Override
	public Gallery getGallery(Gallery gallery) {
		return galleryDao.findGallery(gallery.getNum());
	}

	@Override
	public List<Gallery> getGalleryList() {
		return galleryDao.getGalleryList();
	}

	
}
