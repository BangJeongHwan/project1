package kh.com.a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.WHallPictureDto;
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
		List<WeddingHallDto> list = sqlSession.selectList(ns+"getHallList", whseq);
		return list;
	}
	
	// 홀 이름 체크
	@Override
	public boolean checkHallName(String hallname) {
		WeddingHallDto wdPd = sqlSession.selectOne(ns+"checkHallName", hallname);
		return wdPd!=null?true:false;
	}

	// hall 추가
	@Override
	public boolean addHall(WeddingHallDto wdPd) {
		int n = sqlSession.insert(ns+"addHall", wdPd);
		return n>0?true:false;
	}
	
	// 홋 사진 넣기
	@Override
	public void addHallPicture(int whseq, String hallname, List<String> FileNameList) {
		WHallPictureDto hallpic;
		for(int i=0;i<FileNameList.size();i++) {
			hallpic = new WHallPictureDto(whseq, hallname, FileNameList.get(i));
			System.out.println(hallpic.toString());
			sqlSession.insert(ns+"addHallPicture", hallpic);
		}
		
	}
	
	// 사진 List 출력
	@Override
	public List<WHallPictureDto> getHallPicList(int whseq) {
		return sqlSession.selectList(ns+"getHallPicList", whseq);
	}

	
}
