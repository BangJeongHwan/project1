package kh.com.a.model;

import java.io.Serializable;
/*
DROP TABLE WD_WHALL CASCADE CONSTRAINTS;
CREATE TABLE WD_WHALL(
    PDSEQ NUMBER(8) PRIMARY KEY,        -- 예식장별 상품 갯수
    WHSEQ NUMBER(8) NOT NULL,           -- 예식장 업체
    HALLNAME VARCHAR2(50) NOT NULL,      -- 홀 이름
    FLOOR VARCHAR2(5) NOT NULL,         -- 층
    MINCOOK NUMBER(10) NOT NULL,          -- 최소가격(식대)
    MAXCOOK NUMBER(10) NOT NULL,          -- 최대가격(식대)
    FORMAT VARCHAR2(5) NOT NULL,        -- 분리, 동시(식사와 같이 가능 여부)
    FACILITY VARCHAR2(50) NOT NULL,     -- 시설 구분
    MINPEOPLE NUMBER(10) NOT NULL,        -- 최대 인원수
    MAXPEOPLE NUMBER(10) NOT NULL,        -- 최소 인원수
    SETPEOPLE VARCHAR2(10) NOT NULL,        -- 착석 인원수
    WSTEP VARCHAR2(10) NOT NULL,          -- 웨딩시간 간격
    PAY VARCHAR2(10) NOT NULL,              -- 사용료
    MENUTYPE VARCHAR2(50) NOT NULL,         -- 식사
    DRINK VARCHAR2(5) NOT NULL,             -- 포함, 미포함
    REGTIME VARCHAR2(50) NOT NULL,           -- 이용시간
    RDATE DATE NOT NULL                   -- 등록일
);

DROP SEQUENCE SEQ_WH_PDSEQ;
CREATE SEQUENCE SEQ_WH_PDSEQ
START WITH 1000 INCREMENT BY 1;

ALTER TABLE WD_WHALL
ADD CONSTRAINT FK_WHALL_WHSEQ FOREIGN KEY(WHSEQ)
REFERENCES WD_WEDDING(WHSEQ);
*/
import java.util.Date;
public class WeddingHallDto implements Serializable {
	private int pdseq;
	private int whseq;
	private String hallname;
	private String floor;
	private int mincook;
	private int maxcook;
	private String format;
	private String facility;
	private int minpeople;
	private int maxpeople;
	private String wstep;
	private String pay;
	private String menutype;
	private String drink;
	private String regtime;
	private Date rdate;
	
	public WeddingHallDto() {}

	public WeddingHallDto(int pdseq, int whseq, String hallname, String floor, int mincook, int maxcook, String format,
			String facility, int minpeople, int maxpeople, String wstep, String pay, String menutype,
			String drink, String regtime, Date rdate) {
		super();
		this.pdseq = pdseq;
		this.whseq = whseq;
		this.hallname = hallname;
		this.floor = floor;
		this.mincook = mincook;
		this.maxcook = maxcook;
		this.format = format;
		this.facility = facility;
		this.minpeople = minpeople;
		this.maxpeople = maxpeople;
		this.wstep = wstep;
		this.pay = pay;
		this.menutype = menutype;
		this.drink = drink;
		this.regtime = regtime;
		this.rdate = rdate;
	}

	public int getPdseq() {
		return pdseq;
	}

	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}

	public int getWhseq() {
		return whseq;
	}

	public void setWhseq(int whseq) {
		this.whseq = whseq;
	}

	public String getHallname() {
		return hallname;
	}

	public void setHallname(String hallname) {
		this.hallname = hallname;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public int getMincook() {
		return mincook;
	}

	public void setMincook(int mincook) {
		this.mincook = mincook;
	}

	public int getMaxcook() {
		return maxcook;
	}

	public void setMaxcook(int maxcook) {
		this.maxcook = maxcook;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public int getMinpeople() {
		return minpeople;
	}

	public void setMinpeople(int minpeople) {
		this.minpeople = minpeople;
	}

	public int getMaxpeople() {
		return maxpeople;
	}

	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}

	public String getWstep() {
		return wstep;
	}

	public void setWstep(String wstep) {
		this.wstep = wstep;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getMenutype() {
		return menutype;
	}

	public void setMenutype(String menutype) {
		this.menutype = menutype;
	}

	public String getDrink() {
		return drink;
	}

	public void setDrink(String drink) {
		this.drink = drink;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "WeddingHallDto [pdseq=" + pdseq + ", whseq=" + whseq + ", hallname=" + hallname + ", floor=" + floor
				+ ", mincook=" + mincook + ", maxcook=" + maxcook + ", format=" + format + ", facility=" + facility
				+ ", minpeople=" + minpeople + ", maxpeople=" + maxpeople + ", wstep=" + wstep + ", pay=" + pay
				+ ", menutype=" + menutype + ", drink=" + drink + ", regtime=" + regtime + ", rdate=" + rdate + "]";
	}
}
