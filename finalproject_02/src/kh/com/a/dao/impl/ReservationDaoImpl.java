package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ReservationDao;
import kh.com.a.model.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String ns = "Reservation.";

	@Override
	public boolean dressReserv(ReservationDto rDto) {
		return sqlSession.insert(ns+"dressReserv", rDto)>0?true:false;
	}

	@Override
	public List<ReservationDto> dressResrvList() {
		return sqlSession.selectList(ns+"dressResrvList");
	}

	@Override
	public List<ReservationDto> dressReservComList(String id) {
		return sqlSession.selectList(ns+"dressReservComList", id);
	}

	@Override
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return sqlSession.selectList(ns+"getDSReservListByPdseqRedate", reserv);
	}

	@Override
	public boolean DressReserveAdmit(int rvseq) throws Exception {
		return sqlSession.update(ns+"DressReserveAdmit", rvseq)>0?true:false;
	}
	
	@Override
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return sqlSession.selectList(ns+"getMuReservListByPdseqRedate", reserv);
	}

	@Override
	public int getNextRvseq() throws Exception {
		return sqlSession.selectOne(ns+"getNextRvseq");
	}

	@Override
	public boolean addMuReservation(ReservationDto reserv) throws Exception {
		return sqlSession.insert(ns+"addMuReservation", reserv)>0?true:false;
	}

	@Override
	public ReservationDto getReservByRvseq(int rvseq) throws Exception {
		return sqlSession.selectOne(ns+"getReservByRvseq", rvseq);
	}

	@Override
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception {
		int cnt = sqlSession.selectOne(ns+"checkMuBskByMidReserv", reserv);
		return cnt>0?true:false;
	}

	// 정환 추가
	// 홀 일정 추가
	@Override
	public void wdHallResv(ReservationDto rDto) {
		sqlSession.insert(ns+"wdHallResv", rDto);
	}
}
