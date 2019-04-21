package com.project.GomBang;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.SynchronousQueue;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.GomBang.DAO.EnterpriseDAO;
import com.project.GomBang.VO.Total;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	EnterpriseDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
		model.addAttribute("popularlist",popularlist);
		model.addAttribute("popularlista",popularlist.get(0).getSaveName());
		model.addAttribute("popularlistb",popularlist.get(1));
		/*model.addAttribute("popularlistc",popularlist.get(2));
		model.addAttribute("popularlistd",popularlist.get(3));*/
	    return "index-14";
	}
	
	@RequestMapping(value = "/gg", method = RequestMethod.GET)
	public String gg(Model model) {
		/*ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
		model.addAttribute("popularlist",popularlist);
		model.addAttribute("popularlista",popularlist.get(0).getSaveName());
		model.addAttribute("popularlistb",popularlist.get(1));*/
		/*model.addAttribute("popularlistc",popularlist.get(2));
		model.addAttribute("popularlistd",popularlist.get(3));*/
	    return "index-14";
	}
	
	@RequestMapping(value = "/goHome", method = RequestMethod.GET)
	public String goHome(Model model) {
		ArrayList<Total> popularlist=new ArrayList<Total>();
	    popularlist=dao.popularproperties();
		model.addAttribute("popularlist",popularlist);
		model.addAttribute("popularlist1",popularlist.get(0));
		model.addAttribute("popularlist2",popularlist.get(1));
	/*	model.addAttribute("popularlist3",popularlist.get(2));
		model.addAttribute("popularlist4",popularlist.get(3));*/
		return "index-14";
	}
	
}
