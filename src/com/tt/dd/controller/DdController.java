package com.tt.dd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tt.dd.service.DdServiceDAO;

@Controller
@RequestMapping(value="/ddController")
public class DdController {
	private static final String CONTEXT_PATH="dd";

	
	@Autowired
	private DdServiceDAO ddServiceDAO;
	

}
