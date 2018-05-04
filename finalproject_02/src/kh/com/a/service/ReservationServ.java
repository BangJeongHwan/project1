package kh.com.a.service;

import java.util.List;

import kh.com.a.model.ReservationDto;

public interface ReservationServ {

	public boolean dressReserv(ReservationDto rDto);
	
	public List<ReservationDto> dressResrvList();
	
	public List<ReservationDto> dressReservComList(String id);
	
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception;

	public boolean DressReserveAdmit(int rvseq) throws Exception;
	
	//
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception;
	public int getNextRvseq() throws Exception;
	public boolean addMuReservation(ReservationDto reserv) throws Exception;
	public ReservationDto getReservByRvseq(int rvseq) throws Exception;
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception;
	
	//정환
	public void wdHallResv(ReservationDto rDto);
	public List<ReservationDto> getWDResvListByPdseqRedate(ReservationDto reserv) throws Exception;
	public List<ReservationDto> getWdRegList(ReservationDto fcal);
}
