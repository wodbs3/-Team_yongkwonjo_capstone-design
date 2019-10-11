package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Gallery;

public interface GalleryDao {
	public List<Gallery> getGalleryList();
	
	public Gallery findGallery(int num);
	
	public void insertGallery(Gallery gallery);
	
	public void deleteGallery(int num);
	
	public void updateGallery(Gallery gallery);
	
	

}
