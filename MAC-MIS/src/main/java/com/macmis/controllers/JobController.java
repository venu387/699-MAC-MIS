/**
 * 
 */
package com.macmis.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.macmis.models.CompanyModel;
import com.macmis.models.JobGroupModel;
import com.macmis.models.JobModel;
import com.macmis.models.JobReqAndRoleModel;
import com.macmis.models.MemberModel;
import com.macmis.services.CompanyService;
import com.macmis.services.EmailService;
import com.macmis.services.JobGroupService;
import com.macmis.services.JobService;
import com.macmis.services.MemberService;

/**
 * @author Venu S Reddy
 *
 */

@Controller
@RequestMapping("/job")
public class JobController {

	@Autowired
	private JobService jobService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private JobGroupService jobGroupService;
	@Autowired
	private EmailService emailService;

	@RequestMapping(method = RequestMethod.GET)
	public String getAll(Model model) {
		List<JobModel> jobList = jobService.getJobList();
		model.addAttribute("jobList", jobList);
		return "job/job";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model, @RequestParam(value = "jobId", defaultValue = "0") int jobId) {

		List<JobReqAndRoleModel> reqList = new ArrayList<JobReqAndRoleModel>();
		List<JobReqAndRoleModel> roleList = new ArrayList<JobReqAndRoleModel>();
		JobModel jobOnId = new JobModel();
		List<JobGroupModel> jobGroups = jobGroupService.getAll();
		List<CompanyModel> companyList = companyService.getCompanyList();
		List<MemberModel> studentList = memberService.getAll();
		// Filter only "Current Students"
		studentList.removeIf((MemberModel m) -> m.getType() != 3 || m.getCurrstatus() != 1);

		if (jobId != 0) {

			jobOnId = jobService.getJobOnId(jobId);
			if (jobOnId.getReqRoleList() != null && jobOnId.getReqRoleList().size() > 0) {

				for (JobReqAndRoleModel modelReq : jobOnId.getReqRoleList()) {
					if (modelReq.getType() == 1)
						reqList.add(modelReq);
					else if (modelReq.getType() == 2)
						roleList.add(modelReq);
				}
			}
		}
		model.addAttribute("job", jobOnId);
		model.addAttribute("reqList", reqList);
		model.addAttribute("roleList", roleList);
		// Get list of job groups & companies
		model.addAttribute("jobGroups", jobGroups);
		model.addAttribute("companyList", companyList);
		model.addAttribute("studentList", studentList);
		return "job/addjob";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@ModelAttribute("job") @Valid JobModel job, Model model, BindingResult bindingResult) {
		if (job != null && job.getTitle() != null && job.getTitle() != "") {
			String hdnListToStudentId = job.getHdnIdList();
			String allOrSome = job.getSendAlert();
			if (job.getSid() != 0) {
				jobService.create(job);
			} else {
				job.setSid(jobService.create(job));
				// Reload the company information
				job = jobService.getJobOnId(job.getSid());

				// Send job alert email to students
				List<MemberModel> studentList = memberService.getAll();
				// Filter only "Current Students"
				studentList.removeIf((MemberModel m) -> m.getType() != 3 || m.getCurrstatus() != 1);
				if (allOrSome.equals("1")) {
					// Send email to all students
					for (MemberModel memberModel : studentList) {
						// Send email to each student
						emailService.sendJobAlertEmail(memberModel.getEmailId(),
								"Job Alert - MAC Management Information System", job, memberModel);
					}
				} else if (allOrSome.equals("2")) {
					// Send email to selected students
					List<String> intSidList = new ArrayList<String>(Arrays.asList(hdnListToStudentId.split(",")));
					studentList.removeIf((MemberModel m) -> !intSidList.contains(Integer.toString(m.getSid())));
					for (MemberModel memberModel : studentList) {
						// Send email to each student
						emailService.sendJobAlertEmail(memberModel.getEmailId(),
								"MAC Job Alert: " + job.getCompany().getName() + "-" + job.getTitle(), job,
								memberModel);
					}
				}
			}
		}
		return "redirect:/job";
	}

	@RequestMapping(value = "/createGroup", method = RequestMethod.GET)
	public String createJobGroup(Model model) {

		model.addAttribute("jobGroup", new JobGroupModel());
		return "job/createGroup";
	}

	@RequestMapping(value = "/createGroup", method = RequestMethod.POST)
	public String createJobGroup(@ModelAttribute("jobGroup") JobGroupModel jobgroup, Model model) {
		if (jobgroup != null && jobgroup.getDescription() != null && jobgroup.getDescription() != "")
			jobGroupService.create(jobgroup);
		return "redirect:/job";

	}

	/*
	 * For Ajax calls
	 */
	@RequestMapping(value = "/getJob", method = RequestMethod.GET)
	public String getSearchResultViaAjax(Model model, @RequestParam(value = "jobId", defaultValue = "0") String jobId) {

		JobModel jobOnId = new JobModel();
		if (Integer.parseInt(jobId) != 0) {

			jobOnId = jobService.getJobOnId(Integer.parseInt(jobId));
			model.addAttribute("job", jobOnId);
		}
		return "shared/jobModal";

	}
}
