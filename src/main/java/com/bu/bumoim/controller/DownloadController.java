package com.bu.bumoim.controller;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController implements ApplicationContextAware  {

	@Resource(name = "uploadPath")
	String uploadPath;
	
	private WebApplicationContext context = null;

	
	@RequestMapping(value="/FileDownloadAction.do")
    public ModelAndView downloadFile(@RequestParam("board_photo")String board_photo){
         
        String fullPath = uploadPath + File.separator + board_photo;
         
        File file = new File(fullPath);
         
        return new ModelAndView("download", "downloadFile", file);
    }
 
    @Override
    public void setApplicationContext(ApplicationContext arg0)
            throws BeansException {
        // TODO Auto-generated method stub
         
        this.context = (WebApplicationContext)arg0;
         
    }


}
