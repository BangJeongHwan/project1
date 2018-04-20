package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ReservationDao;
import kh.com.a.model.ReservationDto;
import kh.com.a.service.ReservationServ;

@Service
public class ReservationServImpl implements ReservationServ {

	@Autowired
	ReservationDao reservDao;

	@Override
	public boolean dressReserv(ReservationDto rDto) {
		return reservDao.dressReserv(rDto);
	}

	@Override
	public List<ReservationDto> dressResrvList() {
		return reservDao.dressResrvList();
	}

	@Override
	public List<ReservationDto> dressReservComList(String id) {
		return reservDao.dressReservComList(id);
	}

	@Override
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return reservDao.getDSReservListByPdseqRedate(reserv);
	}

	@Override
	public boolean DressReserveAdmit(int rvseq) throws Exception {
		return reservDao.DressReserveAdmit(rvseq);
	}
	@Override
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return reservDao.getMuReservListByPdseqRedate(reserv);
	}

	@Override
	public int getNextRvseq() throws Exception {
		return reservDao.getNextRvseq();
	}

	@Override
	public boolean addMuReservation(ReservationDto reserv) throws Exception {
		return reservDao.addMuReservation(reserv);
	}

	@Override
	public ReservationDto getReservByRvseq(int rvseq) throws Exception {
//		redate에서 시간부분을 제외함
		ReservationDto reservDto = reservDao.getReservByRvseq(rvseq);
		String split[] = reservDto.getRedate().split(" ");
		reservDto.setRedate(split[0]);
		return reservDto;
	}

	@Override
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception {
		return reservDao.checkMuBskByMidReserv(reserv);
	}
}
