package team.project.controller;

import java.util.Locale;
import java.text.DateFormat;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class recipeController {
	private static final Logger logger = LoggerFactory.getLogger(recipeController.class);

	
	@RequestMapping(value = "/recipe/recipemain.do", method = RequestMethod.GET)
	public String recipe(Locale locale, Model model) {
		return "recipe/recipemain";
	}
	@RequestMapping(value = "/recipe/recipewrite.do", method = RequestMethod.GET)
	public String recipe2(Locale locale, Model model) {
		return "recipe/recipewrite";
	}
}
