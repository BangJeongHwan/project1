package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ReservationDto;
import kh.com.a.model2.ReservationVO;

public interface ReservationDao {

	public boolean dressReserv(ReservationDto rDto);
	
	public List<ReservationDto> dressResrvList();
	
	public List<ReservationDto> dressReservComList(String id);
	
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception;

	public boolean DressReserveAdmit(int rvseq) throws Exception;
	
	//혜영언니
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception;
	public int getNextRvseq() throws Exception;
	public boolean addMuReservation(ReservationDto reserv) throws Exception;
	public ReservationDto getReservByRvseq(int rvseq) throws Exception;
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception;
	
	//정환
	public void wdHallResv(ReservationDto rDto);
	public List<ReservationDto> getWDResvListByPdseqRedate(ReservationDto reserv) throws Exception;
	public List<ReservationVO> getWdRegList(ReservationDto fcal);
}
