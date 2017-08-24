/**
 * 
 */
package com.macmis.controllers;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.SerializationUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.macmis.models.CompanyModel;
import com.macmis.models.JobModel;
import com.macmis.models.MemberModel;
import com.macmis.models.StudentInternshipModel;
import com.macmis.models.reports.ReportsModel;
import com.macmis.services.CompanyService;
import com.macmis.services.EmailService;
import com.macmis.services.JobService;
import com.macmis.services.MemberService;
import com.macmis.services.StudentInternshipService;

/**
 * @author Venu S Reddy
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private StudentInternshipService studentInternshipService;
	@SuppressWarnings("unused")
	@Autowired
	private CompanyService companyService;
	@Autowired
	private JobService jobService;
	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Model model, @RequestParam(value = "status", defaultValue = "") String status) {

		model.addAttribute("flag", status);
		return "admin/upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST, consumes = "multipart/form-data")
	public String upload(Model model, @RequestParam(name = "file") MultipartFile file) throws IOException {

		try {

			Workbook workbook = new XSSFWorkbook(file.getInputStream());

			Sheet sheet = workbook.getSheetAt(0);

			int i = 0;
			for (Row row : sheet) {
				if (i > 0) {
					// data.put(i, new ArrayList<String>());
					MemberModel student = new MemberModel();
					for (Cell cell : row) {
						switch (cell.getColumnIndex()) {
						case 0:
							int s = (int) cell.getNumericCellValue();
							student.setStudentId(String.valueOf(s));
							break;
						case 1:
							student.setFirstName(cell.getStringCellValue());
							break;
						case 2:
							student.setMiddleName(cell.getStringCellValue());
							break;
						case 3:
							student.setLastName(cell.getStringCellValue());
							break;
						case 4:
							student.setEmailId(cell.getStringCellValue());
							break;
						case 5:
							student.setTelephone(cell.getStringCellValue());
							break;
						case 6:
							String gender = cell.getStringCellValue();
							if (gender.toLowerCase().equals("male"))
								student.setGender(1);
							else if (gender.toLowerCase().equals("female"))
								student.setGender(2);
							else
								student.setGender(3);
							break;
						case 7:
							String status = cell.getStringCellValue();
							if (status.toLowerCase().equals("international"))
								student.setStatus(1);
							else if (status.toLowerCase().equals("citizen"))
								student.setStatus(2);
							else if (status.toLowerCase().equals("permanent resident"))
								student.setStatus(3);
							else
								student.setStatus(4);
							break;
						}
					}
					student.setUsername(student.getEmailId());
					student.setPassword("test");
					student.setType(3);
					memberService.create(student);
				}
				i++;
			}
			workbook.close();

		} catch (Exception ex) {
			return "redirect:/admin/upload?status=fail";
		}
		return "redirect:/admin/upload?status=success";
	}

	@RequestMapping(value = "/students", method = RequestMethod.GET)
	public String studentList(Model model) {

		List<MemberModel> studentList = memberService.getAll();
		// Remove all members except students
		studentList.removeIf((MemberModel student) -> student.getType() != 3);
		model.addAttribute("studentsList", studentList);
		return "admin/students";

	}

	@RequestMapping(value = "/internshipList", method = RequestMethod.GET)
	public String studentInternshipList(Model model) {
		List<StudentInternshipModel> studentList = studentInternshipService.getAll();
		model.addAttribute("studentsList", studentList);
		return "admin/studentInternshipDetails";
	}

	@RequestMapping(value = "/addstudentinternship", method = RequestMethod.GET)
	public String addStudentInternship(Model model,
			@RequestParam(value = "internshipId", defaultValue = "0") int internshipId) {
		StudentInternshipModel internshipOnId = new StudentInternshipModel();
		if (internshipId != 0) {

			internshipOnId = studentInternshipService.getOne(internshipId);
		}
		List<MemberModel> studentList = memberService.getAll();
		// Remove all members except students
		studentList.removeIf((MemberModel student) -> student.getType() != 3);

		// List<CompanyModel> companyList = companyService.getCompanyList();
		// model.addAttribute("companyList", companyList);
		List<JobModel> jobList = jobService.getJobList();
		model.addAttribute("jobList", jobList);
		model.addAttribute("internship", internshipOnId);
		model.addAttribute("studentList", studentList);
		return "admin/addstudentinternship";
	}

	@RequestMapping(value = "/addstudentinternship", method = RequestMethod.POST)
	public String addStudentInternship(Model model,
			@ModelAttribute(value = "internship") StudentInternshipModel internship) {
		studentInternshipService.create(internship);
		return "redirect:/admin/internshipList";
	}

	@RequestMapping(value = "/stafflist", method = RequestMethod.GET)
	public String staffList(Model model) {

		List<MemberModel> studentList = memberService.getAll();
		// Remove all members except students
		studentList.removeIf((MemberModel student) -> student.getType() != 2);
		model.addAttribute("studentsList", studentList);

		return "admin/stafflist";
	}

	@RequestMapping(value = "/facultylist", method = RequestMethod.GET)
	public String facultyList(Model model) {

		List<MemberModel> studentList = memberService.getAll();
		// Remove all members except students
		studentList.removeIf((MemberModel student) -> student.getType() != 1);
		model.addAttribute("studentsList", studentList);

		return "admin/facultylist";
	}

	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String reports(Model model) {

		// TO-DO: Load StudentList, CompanyList, JobList, JobGroupList
		// Add each list to the model

		List<StudentInternshipModel> internshipList = new ArrayList<StudentInternshipModel>();
		internshipList = studentInternshipService.getAll();
		List<MemberModel> studentList = memberService.getAll();
		List<CompanyModel> companyList = companyService.getCompanyList();
		List<JobModel> jobList = jobService.getJobList();

		model.addAttribute("companyList", companyList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("internshipList", internshipList);
		// Remove all members except students
		studentList.removeIf((MemberModel student) -> student.getType() != 3);
		model.addAttribute("studentList", studentList);
		model.addAttribute("report", new ReportsModel());

		return "admin/reports";
	}

	@RequestMapping(value = "/reports", method = RequestMethod.POST)
	public void reports(Model model, @ModelAttribute(value = "report") ReportsModel report, HttpServletRequest request,
			HttpServletResponse response) {

		List<MemberModel> studentList = memberService.getAll();
		studentList.removeIf((MemberModel student) -> student.getType() != 3);

		if (report.isIncludeStudent() == true && report.getStudentFilter() != null) {
			// Student ID
			if (!report.getStudentFilter().getStudentId().equals("")) {
				studentList.removeIf(
						(MemberModel m) -> !m.getStudentId().equals(report.getStudentFilter().getStudentId()));
			}
			if (report.getStudentFilter().getIdList() != null && !report.getStudentFilter().getIdList().equals("")) {
				List<String> listIds = Arrays.asList(report.getStudentFilter().getIdList().split(","));
				studentList.removeIf((MemberModel m) -> !listIds.contains(Integer.toString(m.getSid())));
			}
			if (!report.getStudentFilter().getCity().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getCity().toLowerCase()
						.equals(report.getStudentFilter().getCity().toLowerCase()));
			}
			if (!report.getStudentFilter().getCountry().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getCountry().toLowerCase()
						.equals(report.getStudentFilter().getCountry().toLowerCase()));
			}
			if (report.getStudentFilter().getCurrstatusList() != null
					&& !report.getStudentFilter().getCurrstatusList().equals("")) {
				List<String> listIds = Arrays.asList(report.getStudentFilter().getCurrstatusList().split(","));
				studentList.removeIf((MemberModel m) -> !listIds.contains(Integer.toString(m.getCurrstatus())));
			}
			if (!report.getStudentFilter().getEmailId().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getEmailId().toLowerCase()
						.equals(report.getStudentFilter().getEmailId().toLowerCase()));
			}
			if (!report.getStudentFilter().getFirstName().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getFirstName().toLowerCase()
						.equals(report.getStudentFilter().getFirstName().toLowerCase()));
			}
			if (!report.getStudentFilter().getLastName().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getLastName().toLowerCase()
						.equals(report.getStudentFilter().getLastName().toLowerCase()));
			}
			if (report.getStudentFilter().getGenderList() != null
					&& !report.getStudentFilter().getGenderList().equals("")) {
				List<String> listIds = Arrays.asList(report.getStudentFilter().getGenderList().split(","));
				studentList.removeIf((MemberModel m) -> !listIds.contains(Integer.toString(m.getGender())));
			}
			if (!report.getStudentFilter().getProvince().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getProvince().toLowerCase()
						.equals(report.getStudentFilter().getProvince().toLowerCase()));
			}
			if (report.getStudentFilter().getStatusList() != null
					&& !report.getStudentFilter().getStatusList().equals("")) {
				List<String> listIds = Arrays.asList(report.getStudentFilter().getStatusList().split(","));
				studentList.removeIf((MemberModel m) -> !listIds.contains(Integer.toString(m.getStatus())));
			}
			if (!report.getStudentFilter().getTelephone().equals("")) {
				studentList.removeIf((MemberModel m) -> !m.getTelephone().toLowerCase()
						.equals(report.getStudentFilter().getTelephone().toLowerCase()));
			}
		}
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Sheet 1");

		Map<String, Object[]> data = new HashMap<String, Object[]>();
		int keyIndex = 1;
		data.put(Integer.toString(keyIndex), new Object[] { "Student#", "First Name", "Last Name", "Email ID", "Gender",
				"Telephone", "Semester", "Year", "City", "Province", "Country" });
		keyIndex++;
		for (MemberModel member : studentList) {
			data.put(Integer.toString(keyIndex),
					new Object[] { member.getStudentId(), member.getFirstName(), member.getLastName(),
							member.getEmailId(), ((member.getGender() == 1) ? "Male" : "Female"), member.getTelephone(),
							((member.getSemester() == 1) ? "Fall" : "Winter"), member.getYear() + "", member.getCity(),
							member.getProvince(), member.getCountry() });
			keyIndex++;
		}
		// data.put("2", new Object[] {1d, "John", 1500000d});
		// data.put("3", new Object[] {2d, "Sam", 800000d});
		// data.put("4", new Object[] {3d, "Dean", 700000d});

		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset) {
			Row row = sheet.createRow(rownum++);
			Object[] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof Date)
					cell.setCellValue((Date) obj);
				else if (obj instanceof Boolean)
					cell.setCellValue((Boolean) obj);
				else if (obj instanceof String)
					cell.setCellValue((String) obj);
				else if (obj instanceof Double)
					cell.setCellValue((Double) obj);
			}
		}

		try {
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
			Date now = new Date();
			String strDate = sdfDate.format(now);

			ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
			workbook.write(outByteStream);
			byte[] outArray = outByteStream.toByteArray();

			// byte[] outArray = SerializationUtils.serialize((Serializable) studentList);

			response.setContentType("application/ms-excel");
			response.setContentLength(outArray.length);
			response.setHeader("Expires:", "0"); // eliminates browser caching
			response.setHeader("Content-Disposition", "attachment; filename=Report_" + strDate + ".xls");
			OutputStream outStream = response.getOutputStream();
			outStream.write(outArray);
			outStream.flush();
			workbook.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// return "redirect:/admin/reports";
	}

}
