/**
 * 
 */
package com.macmis.controllers;

import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.macmis.models.MemberModel;
import com.macmis.services.HomeService;

/**
 * @author Venu S Reddy
 *
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping("/hello")
	public String hello(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        return "hello1";
    }
	
	@RequestMapping(value = "/home/index", method = RequestMethod.GET)
	public String index(Model model) {
        return "home/index";
    }
	
	@RequestMapping(value = "/home/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("login", new MemberModel()); 
		return "home/login";
    }
	
	@RequestMapping(value = "/home/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("login") MemberModel login, Model model, HttpSession session) {
		
		homeService.login(session, login);
        return "redirect:/home/index";
    }
	
	@RequestMapping(value = "/home/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		homeService.logout(session);
		return "home/index";
    }
	
	@RequestMapping(value = "/home/about", method = RequestMethod.GET)
	public String about(Model model) {
        return "home/about";
    }
}
