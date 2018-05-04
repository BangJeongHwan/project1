package kh.com.a.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.BasketDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.ReservationDto;
import kh.com.a.model2.BasketParam;
import kh.com.a.model2.LoginDto;
import kh.com.a.service.BasketServ;
import kh.com.a.service.MakeupServ;
import kh.com.a.service.MemberServ;
import kh.com.a.service.PaymentServ;
import kh.com.a.service.ReservationServ;
import kh.com.a.util.CalendarUtil;
import kh.com.a.util.myCal;

@Controller
public class PayCtrl {

	@Autowired
	ReservationServ reservServ;
	
	@Autowired
	BasketServ bskServ;
	
	@Autowired
	MemberServ memServ;
	
	@Autowired
	PaymentServ payServ;
	@Autowired
	MakeupServ muServ;

	
	private static final Logger logger = LoggerFactory.getLogger(PayCtrl.class);
	
	@RequestMapping(value="reservationDressList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String dressResrvList(Model model, HttpServletRequest req) throws Exception{
		logger.info("PayCtrl dressResrvList " + new Date());
		
		String id = ((LoginDto)req.getSession().getAttribute("login")).getId();
		List<ReservationDto> rDto = reservServ.dressReservComList(id);

			
		model.addAttribute("rDtoList", rDto);
		return "reservationDressList.tiles";
	}
	
	@RequestMapping(value="reservationDress.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String dressReservationInsert(Model model, ReservationDto rDto, HttpServletRequest req) throws Exception {
		logger.info("PayCtrl dressReservation " + new Date());
		
		MemberDto m = memServ.getMemberByMid(rDto.getMid());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		System.out.println("   login auth : " + login.getAuth());
		
		if(login.getAuth().equals("member")) {
			boolean b = reservServ.dressReserv(rDto);
			model.addAttribute("dflag", "DsSucc");
		}else {
			model.addAttribute("dflag", "DsFail");
		}
		
		return "redirect:/dressDetail.do?dsseq="+rDto.getPdseq();
	}
	
	
	@ResponseBody
	@RequestMapping(value="getDSReservListByPdseqRedate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		logger.info("PayCtrl getDSReservListByPdseqRedate " + new Date());
		
		System.out.println("	" + reserv.getRedate() + " / " + reserv.getPdseq());
		
		List<ReservationDto> reservListDS = reservServ.getDSReservListByPdseqRedate(reserv);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservListDS", reservListDS);
		
		return map;
	}
	
	@RequestMapping(value="DressReserveAdmit.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String DressReserveAdmit(Model model, int rvseq, HttpServletRequest req) throws Exception{
		logger.info("PayCtrl DressReserveAdmit " + new Date());
		
		boolean b = reservServ.DressReserveAdmit(rvseq);
	
		return "redirect:/reservationDressList.do";
		
	}
	
//	개인의 장바구니 화면을 띄운다.
	@RequestMapping(value="basketListView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String basketListView(Model model, HttpServletRequest req) throws Exception {
		logger.info("[PayCtrl] basketListView " + new Date());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		System.out.println("   login auth : " + login.getAuth());
		if (!login.getAuth().equals("member")) {
			return "redirect:/index.do";
		}
		
		String mid = login.getId();
		List<BasketParam> bskList = bskServ.getBasketListByMid(mid);
		for (int i = 0; i < bskList.size(); i++) {
			ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
			bskList.get(i).setReservDto(reservDto);
			int pdseq = bskList.get(i).getPdseq();
//			TODO
			if (pdseq >= 5000 && pdseq < 6000) {
				bskList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
			}
		}
		
		model.addAttribute("bskList", bskList);
		return "basketList.tiles";
	}

//	선택된 장바구니 리스트를 삭제한다.
	@RequestMapping(value="bskDel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String bskDel(Model model, int[] bkseq) throws Exception {
		logger.info("[PayCtrl] bskDel " + new Date());
		
		System.out.println("bkseq size : " + bkseq.length);
		for (int i = 0; i < bkseq.length; i++) {
			System.out.println("bkseq[" + i + "] : " + bkseq[i]);
		}
		bskServ.delBskByBkseq(bkseq);
		
		return "redirect:/basketListView.do";
	}
	
//	mu : 해당 날짜의 예약(결제완료) 리스트를 불러온다.
	@ResponseBody
	@RequestMapping(value="getMuReservListByPdseqRedate.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		logger.info("[PayCtrl] getMuReservListByPdseqRedate" + new Date());
		
//		System.out.println("redate : " + redate + " / " + "pdseq : " + pdseq);
		System.out.println("	" + reserv.getRedate() + " / " + reserv.getPdseq());
		
		List<ReservationDto> reservList = reservServ.getMuReservListByPdseqRedate(reserv);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservList", reservList);
		
		return map;
	}
	
//	mu : 장바구니 담기
	@RequestMapping(value="muBasket.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muBasket(Model model, ReservationDto reserv, BasketDto bsk, HttpServletRequest req) throws Exception {
		logger.info("[PayCtrl] muBasket " + new Date());
		
		String mid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		reserv.setMid(mid);
		bsk.setMid(mid);
		
		int rvseq = reservServ.getNextRvseq();
		reserv.setRvseq(rvseq);
		bsk.setRvseq(rvseq);
		
//		pdseq, redate, retime이 일치하는 상품이 장바구니에 이미 있는지 확인
//		true : 상품이 존재함(추가로 담지 않음) / false : 상품이 존재하지 않음(장바구니에 추가)
		if (reservServ.checkMuBskByMidReserv(reserv)) {
			model.addAttribute("flag", "bskFail");
		} else {
			if (reservServ.addMuReservation(reserv)) {
				if(bskServ.addMuBasket(bsk)) {
					model.addAttribute("flag", "bsk");
				}
			}
		}
		
		model.addAttribute("museq", reserv.getPdseq());
		return "redirect:/muDetailView.do";
	}
	
	// weddingHall 예약(정환)
	@RequestMapping(value="reservationWd.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reservationWd(Model model, ReservationDto rDto) throws Exception {
		logger.info("PayCtrl reservationWd " + new Date());
		System.out.println(rDto.toString());
		reservServ.wdHallResv(rDto);		
		
		model.addAttribute("whseq", rDto.getPdseq());
		return "redirect:/hallView.do";
	}
	
	//예약 현황 확인
	@ResponseBody
	@RequestMapping(value="getWDResvListByPdseqRedate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getWDResvListByPdseqRedate(ReservationDto resv) throws Exception {
		logger.info("PayCtrl getDSReservListByPdseqRedate " + new Date());
		
		System.out.println("	" + resv.getRedate() + " / " + resv.getPdseq());
		
		List<ReservationDto> WdResvList = reservServ.getWDResvListByPdseqRedate(resv);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("WdResvList", WdResvList);
		
		return map;
	}
	
	// 캘린더 정보
	@ResponseBody
	@RequestMapping(value="calenderDate.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> calenderDate(Model model, myCal jcal, int pdseq) throws Exception {
		logger.info("WeddingHallCtrl calenderDate " + new Date());
		
		jcal.calculate();
		String yymm = CalendarUtil.yyyymm(jcal.getYear(), jcal.getMonth());	// yyyy/mm
		
		ReservationDto fcal = new ReservationDto();
		fcal.setPdseq(pdseq);
		fcal.setRedate(yymm);
		
		
		System.out.println("----------->"+yymm);
		System.out.println("----------->"+jcal.getDateStr());
		
		List<ReservationDto> flist = reservServ.getWdRegList(fcal);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jcal", jcal);
		map.put("flist", flist);
		
		return map;
	}
}

















