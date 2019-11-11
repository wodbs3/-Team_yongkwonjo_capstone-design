package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.paging.GalleryCriteria;



public interface GalleryService {

	public List<Gallery> getGalleryList(GalleryCriteria cri);
	
	public Gallery getGallery(int num);

	public void insertGallery(Gallery gallery);
	
	public void deleteGallery(int num);
	
	public void updateGallery(Gallery gallery);
	
	public int getGalleryCount();

}
