package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.PaymentDao;
import kh.com.a.service.PaymentServ;

@Service
public class PaymentServImpl implements PaymentServ {
	
	@Autowired
	private PaymentDao payDao;

}
