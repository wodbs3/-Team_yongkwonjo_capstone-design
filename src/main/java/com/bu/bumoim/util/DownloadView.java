package com.bu.bumoim.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component						// 이 객체의 관리를 스프링이 한다.
public class DownloadView extends AbstractView{
	public void Download(){
        
        setContentType("application/download; utf-8");
         
    }
         
 	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub 
 		 File file = (File)model.get("downloadFile");     	// downloadController 에서 넘어온 값을 가져온다
         System.out.println("DownloadView --> file.getPath() : " + file.getPath());
         System.out.println("DownloadView --> file.getName() : " + file.getName());
          
         response.setContentType(getContentType());
         response.setContentLength((int)file.length());
          
         String userAgent = request.getHeader("User-Agent");	//클라이언트의 SW 명칭 및 정보          
         boolean ie = userAgent.indexOf("MSIE") > -1;         
         String fileName = null;
          
         if(ie){             
             fileName = URLEncoder.encode(file.getName(), "utf-8");        //대소문자, 숫자, 밑줄을 제외한 URL에 있는 문자를 코드화하는 것                 
         } else {              
             fileName = new String(file.getName().getBytes("utf-8"));             
         }// end if;
          
         response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");	// 첨부파일 사용
         response.setHeader("Content-Transfer-Encoding", "binary");		
          
         OutputStream out = response.getOutputStream();
         FileInputStream fis = null;
         
         try {           
             fis = new FileInputStream(file);           
             FileCopyUtils.copy(fis, out);  	// 입력스트림과 출력스트림으로 데이터를 복사한다.                      
         } catch(Exception e){            
             e.printStackTrace();          
         }finally{         
             if(fis != null){          
                 try{
                     fis.close();
                 }catch(Exception e){}
             }            
         }// try end;         
         out.flush();         
     }// render() end;
	}
