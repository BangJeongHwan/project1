package kh.com.a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;

@Repository
public class WeddingHallDaoImpl implements WeddingHallDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "WeddingHall.";
	
	// 기업 추가
	@Override
	public boolean addWedding(WeddingDto wd) {
		int n = sqlSession.insert(ns+"addWedding", wd);
		return n>0?true:false;
	}
	
	// 기업 list 출력
	@Override
	public List<WeddingDto> getWeddingList() {
		List<WeddingDto> list = sqlSession.selectList(ns+"getWeddingList");
		return list;
	}

	// 기업 한개 출력
	@Override
	public WeddingDto getWedding(int whseq) {
		WeddingDto wd = sqlSession.selectOne(ns+"getWedding", whseq);
		return wd;
	}

	
	// 기업에 대한 hall list
	@Override
	public List<WeddingHallDto> getHallList(int whseq) {
		List<WeddingHallDto> list = sqlSession.selectList(ns+"getHallList");
		return list;
	}


}
