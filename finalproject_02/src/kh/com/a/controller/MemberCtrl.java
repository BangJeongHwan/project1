package kh.com.a.controller;

import java.util.Date;
import java.util.HashMap;
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

import kh.com.a.model.CompanyDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.service.MemberServ;

@Controller
public class MemberCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Autowired
	private MemberServ memberServ;
	
	@RequestMapping(value="index.do", method={RequestMethod.GET,RequestMethod.POST})
	public String index(Model model) {
		return "index.tiles";
	}

	@RequestMapping(value="login.do", method={RequestMethod.GET,RequestMethod.POST})
	public String login(Model model) throws Exception{
		logger.info("KhBbsController login" + new Date());
		return "login.tiles";
	}
	
//	로그인
	@ResponseBody
	@RequestMapping(value="loginAf.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req, LoginDto loginDto, Model model)throws Exception {
		logger.info("KhMemberController loginAf " + new Date());
		LoginDto login = memberServ.login(loginDto);
		if(login == null || login.getId().equals("")) {
			req.getSession().invalidate();	
			return "false";
		}else {
			req.getSession().setAttribute("login", login);			
			return "true";				// 로그인 성공
		}		
	}
	
//	로그아웃
	@RequestMapping(value="logout.do", method={RequestMethod.GET,RequestMethod.POST})
	public String logout(Model model, HttpServletRequest req) throws Exception{
		req.getSession().invalidate();
		return "index.tiles";
	}
		
	@RequestMapping(value="SelectRegi.do", method={RequestMethod.GET,RequestMethod.POST})
	public String SelectRegi(Model model) throws Exception{
		logger.info("KhBbsController SelectRegi" + new Date());
		return "SelectRegi.tiles";
	}
	
	@RequestMapping(value="viewCompanyJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String viewCompanyJoin(Model model) throws Exception{
		logger.info("KhBbsController viewCompanyJoin" + new Date());
		return "companyJoin.tiles";
	}
	
	@RequestMapping(value="companyJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String companyJoin(Model model, CompanyDto company) throws Exception{
		logger.info("KhBbsController companyJoin" + new Date());
		
		// 확인용
		System.out.println("license -------------> "+ company.getLicense());
		System.out.println(company.toString());
		
		boolean b = memberServ.addCompany(company);
		if(b) {
			System.out.println("가입을 축하합니다.");
			return "index.tiles";
		}else {
			System.out.println("가입에 실패했습니다.");
			return "redirect:/viewCompanyJoin.do";
		}
		
	}

//	회원가입창을 띄워준다.
	@RequestMapping(value="viewMemberJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String viewMemberJoin(Model model) throws Exception{
		logger.info("[MemberCtrl] viewMemberJoin" + new Date());
		return "memberJoin.tiles";
	}
	
//	회원가입
	@RequestMapping(value="memberJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String memberJoin(Model model, MemberDto member) throws Exception {
		logger.info("[MemberCtrl] memberJoin" + new Date());
		System.out.println(member.toString());
		
		if (memberServ.addMember(member)) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		return "index.tiles";
	}
	
//	ajax : 회원가입시 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="checkId.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkId(String id) throws Exception {
		logger.info("[MemberCtrl] checkId" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "id");
		
		if (memberServ.checkId(id)) {
			map.put("message", "true");
		} else {
			map.put("message", "false");
		}
		return map;
	}
	
//	ajax : 회원가입시 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="checkEmail.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkEmail(String email) throws Exception {
		logger.info("[MemberCtrl] checkEmail" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "email");
		if (memberServ.checkEmail(email)) {
			map.put("message", "true");
		} else {
			map.put("message", "false");
		}
		return map;
	}
	
//	관리자(admin) 기능 : 기업의 등급을 올려준다.
	@ResponseBody
	@RequestMapping(value="upCompanyGrade.do", method={RequestMethod.GET,RequestMethod.POST})
	public void upCompanyGrade(String cid) throws Exception {
		logger.info("[MemberCtrl] upCompanyGrade" + new Date());
		memberServ.upCompanyGrade(cid);
	}

//	ajax : 기업의 등급이 1이면 CompanyDto를 반환한다.
	@ResponseBody
	@RequestMapping(value="checkCompanyGrade.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkCompanyGrade(String cid) throws Exception {
		logger.info("[MemberCtrl] checkCompanyGrade" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		CompanyDto company = memberServ.getCompanyByCid(cid);
		if (company == null) {
			map.put("message", "null");
		} else if (company.getGrade() == 1) {		// 기업 등급이 1일 때만 게시글 작성 가능
			map.put("message", company);
		} else {
			map.put("message", "false");
		}
	
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="checkLicense.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkLicense(String license) throws Exception {
		logger.info("[MemberCtrl] checkLicense" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean b = memberServ.checkLicense(license);
		if(b){
			map.put("message", "true");
		}else {
			map.put("message", "false");
		}
		return map;
	}
	
	//해당 기능에 대한 뷰로 이동
	@RequestMapping(value="company.do", method={RequestMethod.GET,RequestMethod.POST})
	public String detail(Model model) throws Exception{
		logger.info("KhMemberController company" + new Date());
		return "company.tiles";
	}
	
	
	
}
