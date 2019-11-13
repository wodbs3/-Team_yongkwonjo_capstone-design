package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.GalleryCriteria;

public interface GalleryDao {
	//
	public List<Gallery> getGalleryList(GalleryCriteria cri);
	
	public Gallery findGallery(int num);
	
	public void insertGallery(Gallery gallery);
	
	public void deleteGallery(int num);
	
	public void updateGallery(Gallery gallery);
	
	public int getGalleryCount();

}
