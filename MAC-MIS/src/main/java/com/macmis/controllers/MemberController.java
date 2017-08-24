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
import com.macmis.models.MemberModel;
import com.macmis.services.EmailService;
import com.macmis.services.MemberService;

/**
 * @author Venu S Reddy
 *
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/addstudent", method = RequestMethod.GET)
	public String addStudent(Model model, @RequestParam(value = "memberId", defaultValue = "0") int memberId,
			@RequestParam(value = "isMyProfile", defaultValue = "0") int isMyProfile) {

		MemberModel memberOnId = new MemberModel();
		if (memberId != 0) {

			memberOnId = memberService.getOne(memberId);
		}
		model.addAttribute("student", memberOnId);
		model.addAttribute("isMyProfile", isMyProfile);
		return "admin/addstudent";
	}

	@RequestMapping(value = "/addstudent", method = RequestMethod.POST)
	public String addStudent(Model model, @ModelAttribute(value = "student") MemberModel student) {

		student.setUsername(student.getEmailId());
		student.setType(3);
		if (student.getSid() == 0) {
			memberService.create(student);
			// Send registration email for a new student
			emailService.sendRegistrationEmail(student.getEmailId(), "Welcome to MAC - Registration Success", student);
		} else
			memberService.create(student);

		return "redirect:/admin/students";
	}

	@RequestMapping(value = "/addstaff", method = RequestMethod.GET)
	public String addStaff(Model model, @RequestParam(value = "memberId", defaultValue = "0") int memberId,
			@RequestParam(value = "isMyProfile", defaultValue = "0") int isMyProfile) {

		MemberModel memberOnId = new MemberModel();
		if (memberId != 0) {

			memberOnId = memberService.getOne(memberId);
		}
		model.addAttribute("student", memberOnId);
		model.addAttribute("isMyProfile", isMyProfile);
		return "admin/addstaff";
	}

	@RequestMapping(value = "/addstaff", method = RequestMethod.POST)
	public String addStaff(Model model, @ModelAttribute(value = "student") MemberModel student) {

		student.setUsername(student.getEmailId());
		student.setType(2);
		if (student.getSid() == 0) {
			memberService.create(student);
			// Send registration email for a new student
			emailService.sendRegistrationEmail(student.getEmailId(), "Welcome to MAC - Registration Success", student);
		} else
			memberService.create(student);

		return "redirect:/admin/stafflist";
	}

	@RequestMapping(value = "/addfaculty", method = RequestMethod.GET)
	public String addFaculty(Model model, @RequestParam(value = "memberId", defaultValue = "0") int memberId,
			@RequestParam(value = "isMyProfile", defaultValue = "0") int isMyProfile) {

		MemberModel memberOnId = new MemberModel();
		if (memberId != 0) {

			memberOnId = memberService.getOne(memberId);
		}
		model.addAttribute("student", memberOnId);
		model.addAttribute("isMyProfile", isMyProfile);
		return "admin/addfaculty";
	}

	@RequestMapping(value = "/addfaculty", method = RequestMethod.POST)
	public String addFaculty(Model model, @ModelAttribute(value = "student") MemberModel student) {

		student.setUsername(student.getEmailId());
		student.setType(1);
		if (student.getSid() == 0) {
			memberService.create(student);
			// Send registration email for a new student
			emailService.sendRegistrationEmail(student.getEmailId(), "Welcome to MAC - Registration Success", student);
		} else
			memberService.create(student);

		return "redirect:/admin/facultylist";
	}

	/*
	 * For Ajax calls
	 */
	@RequestMapping(value = "/getMember", method = RequestMethod.GET)
	public String getMemberViaAjax(Model model, @RequestParam(value = "memberId", defaultValue = "0") String memberId,
			@RequestParam(value = "type", defaultValue = "0") String type) {

		MemberModel memberOnId = new MemberModel();
		if (Integer.parseInt(memberId) != 0) {

			memberOnId = memberService.getOne(Integer.parseInt(memberId));
			model.addAttribute("member", memberOnId);
		}
		if (Integer.parseInt(type) == 3) {
			return "shared/studentModal";
		} else if (Integer.parseInt(type) == 2) {
			return "shared/memberModal";
		} else if (Integer.parseInt(type) == 1) {
			return "shared/memberModal";
		} else
			return "redirect:/admin/students";
	}
}
