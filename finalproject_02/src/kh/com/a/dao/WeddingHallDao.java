package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.WHallPictureDto;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.model2.WHallPicSumVO;

public interface WeddingHallDao {
	public boolean addWedding(WeddingDto wd);
	public List<WeddingDto> getWeddingList();
	public WeddingDto getWedding(int whseq);
	
	public List<WeddingHallDto> getHallList(int whseq);
	public boolean checkHallName(String hallname);
	public boolean addHall(WeddingHallDto wdPd);
	public void addHallPicture(int whseq, String hallname, List<String> FileNameList);
	public List<WHallPicSumVO> getHallSumList(int whseq);
	public List<WHallPictureDto> getAllHallPicList(int whseq);
	public int picTotal(int whseq);
	public List<WHallPictureDto> getHallPicList(String hallname,int whseq);
}
