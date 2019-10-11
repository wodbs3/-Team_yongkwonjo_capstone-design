package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.Gallery;


public interface GalleryService {

	public void insertGallery(Gallery gallery);
	
	public void updateGallery(Gallery gallery);
	
	public void deleteGallery(Gallery gallery);
	
	public Gallery getGallery(Gallery gallery);
	
	public List<Gallery> getGalleryList();
	
}
