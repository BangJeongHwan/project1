package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;

public interface WeddingHallDao {
	public boolean addWedding(WeddingDto wd);
	public List<WeddingDto> getWeddingList();
	public WeddingDto getWedding(int whseq);
	
	public List<WeddingHallDto> getHallList(int whseq);
}
