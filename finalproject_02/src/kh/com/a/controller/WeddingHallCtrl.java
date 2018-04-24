package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.model2.WdParam;
import kh.com.a.service.WeddingHallServ;
import kh.com.a.util.FUpUtil;

@Controller
public class WeddingHallCtrl {
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Autowired
	WeddingHallServ weddingHallServ;
	
	// 웨딩 업체 뷰
	@RequestMapping(value="weddingHallView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String weddingHallView(Model model) {
		logger.info("WeddingHallCtrl weddingHallView" + new Date());
		
		List<WeddingDto> list = weddingHallServ.getWeddingList();
		model.addAttribute("list", list);
		
		return "weddinghall.tiles";
	}
	
	// 웨딩 업체 추가 view
	@RequestMapping(value="weddingwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String weddingwrite(Model model) {
		logger.info("WeddingHallCtrl weddingwrite" + new Date());
		return "weddingwrite.tiles";
	}
	
	// 웨딩 업체 추가
	@RequestMapping(value="weddingwriteAf.do",method={RequestMethod.GET, RequestMethod.POST})
	public String weddingwriteAf(WeddingDto wd, 
							HttpServletRequest req,
							Model model,
							@RequestParam(value="fileload", required=false)
							MultipartFile fileload) {
		logger.info("WeddingHallCtrl weddingwriteAf" + new Date());
		
		
		// 파일 이름을 취득
		wd.setPicture(fileload.getOriginalFilename());
		System.out.println(wd.getPicture());
		
		//업로드 경로
		// tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
		System.out.println("파일 업로드 경로 : " + fupload);
		
		// 폴더
		//String fupload = "d:\\tmp"
		
		String f = wd.getPicture();
		String newFile = FUpUtil.getNewFile(f);
		
		wd.setPicture(newFile);
		try {
			File file = new File(fupload + "/" + newFile);
			// 실제 업로드 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			// DB에 저장
			weddingHallServ.addWedding(wd);
					
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/weddingHallView.do";
	}

	//////////////////////////////////////////////////////////////////////////////
	// 웨딩 홀 디테일 뷰
	@RequestMapping(value="hallView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hallDetailView(Model model, int whseq) {
		logger.info("WeddingHallCtrl hallDetailView" + new Date());
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);
		List<WeddingHallDto> hallList = weddingHallServ.getHallList(whseq);
		
		model.addAttribute("wd", wd);
		model.addAttribute("hallList", hallList);
		
		return "hallView.tiles";
	}
	
	@RequestMapping(value="Hallwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String Hallwrite(Model model, int whseq) {
		logger.info("WeddingHallCtrl Hallwrite" + new Date());
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);
		model.addAttribute("wd", wd);
		return "hallwrite.tiles";
	}
	
	@RequestMapping(value="hallwriteAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hallwriteAf(Model model, WdParam wd, HttpServletRequest req) {
		logger.info("WeddingHallCtrl hallwriteAf" + new Date());
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		for (int i = 0; i < wd.getFileList().size(); i++) {
			if (wd.getFileList().get(i).getSize() != 0) {
				upFileList.add(wd.getFileList().get(i));
			}
		}
		
		
		// 파일 이름만 저장할 공간
		List<String> FileNameList = new ArrayList<>();
		
		// 파일 업로드
		for (int i = 0; i < upFileList.size(); i++) {
			MultipartFile fileload = upFileList.get(i);
			String oriFileName = fileload.getOriginalFilename();
			if (oriFileName != null && !oriFileName.trim().equals("")) {
				String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
				String newFileName = FUpUtil.getNewFile(oriFileName);
				// TODO
				FileNameList.add(newFileName);
				System.out.println("--------> newFileName : " + FileNameList.get(i));
				
				// 파일 업로드
				try {
					File file = new File(fupload + "/" + newFileName);
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		// 나머지 세부 정보 기입
		WeddingHallDto whPd = wd.getHallPd();
		System.out.println("---------------> " + whPd.toString());
		
		return "redirect:/hallView.do";
	}
	
	
	/*테스트*/
	/*
	@RequestMapping(value="calendarView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hallDetailView() {
		return "NewFile.tiles";
	}
	*/
}
