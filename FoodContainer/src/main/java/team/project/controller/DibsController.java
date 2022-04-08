package team.project.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.DibsService;
import team.project.vo.DibsVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DibsController {
	
	@Autowired
	private DibsService dibsService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "dibsInsert.do", method = RequestMethod.GET)
	public String dbisInsert(Locale locale, Model model, DibsVO dibsVO) throws Exception {
		
		dibsService.dibsInsert(dibsVO);
		
		return "mypage/interItem";
	}


}
