package kh.com.a.service;

import java.util.List;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.WHallPictureDto;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;

public interface WeddingHallServ {
	public boolean addWedding(WeddingDto wd);
	public List<WeddingDto> getWeddingList();
	public WeddingDto getWedding(int whseq);
	
	public List<WeddingHallDto> getHallList(int whseq);
	public boolean checkHallName(String hallname);
	public boolean addHall(WeddingHallDto wdPd);
	public void addHallPicture(int whseq, String hallname, List<String> FileNameList);
	public List<WHallPictureDto> getHallPicList(int whseq);
}
