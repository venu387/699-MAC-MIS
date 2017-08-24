/**
 * 
 */
package com.macmis.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.macmis.models.CompanyModel;
import com.macmis.services.CompanyService;

/**
 * @author Venu S Reddy
 *
 */
@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@RequestMapping(method = RequestMethod.GET)
	public String getAll(Model model) {
		List<CompanyModel> companyList = companyService.getCompanyList();
		model.addAttribute("companyList", companyList);
		return "company/company";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model, @RequestParam(value = "companyId", defaultValue = "0") int companyId) {
		CompanyModel companyOnId = new CompanyModel();
		if (companyId != 0) {

			companyOnId = companyService.getCompanyOnId(companyId);
		}
		model.addAttribute("company", companyOnId);
		return "company/addcompany";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@ModelAttribute("company") CompanyModel company, Model model) {
		if (company != null && company.getName() != null && company.getName() != "")
			companyService.create(company);
		return "redirect:/company";
	}

	/*
	 * For Ajax calls
	 */
	@RequestMapping(value = "/getCompany", method = RequestMethod.GET)
	public String getSearchResultViaAjax(Model model,
			@RequestParam(value = "companyId", defaultValue = "0") String companyId) {

		CompanyModel companyOnId = new CompanyModel();
		if (Integer.parseInt(companyId) != 0) {

			companyOnId = companyService.getCompanyOnId(Integer.parseInt(companyId));
			model.addAttribute("company", companyOnId);
		}
		return "shared/companyModal";

	}
}
