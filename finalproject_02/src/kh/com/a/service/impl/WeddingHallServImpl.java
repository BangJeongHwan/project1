package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.service.WeddingHallServ;

@Service
public class WeddingHallServImpl implements WeddingHallServ {

	@Autowired
	WeddingHallDao weddingHallDao;
	
	// 기업 추가
	@Override
	public boolean addWedding(WeddingDto wd) {
		return weddingHallDao.addWedding(wd);
	}

	// 기업 list 출력
	@Override
	public List<WeddingDto> getWeddingList() {
		return weddingHallDao.getWeddingList();
	}
	
	// 기업 한개 출력
	@Override
	public WeddingDto getWedding(int whseq) {
		return weddingHallDao.getWedding(whseq);
	}

	
	// 기업에 대한 hall list
	@Override
	public List<WeddingHallDto> getHallList(int whseq) {
		return weddingHallDao.getHallList(whseq);
	}
	
}
