package com.bu.bumoim.main.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bu.bumoim.domain.Board;

@Service
public interface BoardService {

	void insertBoard(Board vo);
	
	void updateBorad(Board vo);
	
	void deleteBoard(Board vo);
	
	Board getBoard(Board vo);
	
	List<Board> getBoardList(Board vo);
	
	}
