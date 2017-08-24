/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.StudentInternshipEntity;
import com.macmis.models.StudentInternshipModel;
import com.macmis.repository.StudentInternshipRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class StudentInternshipService {

	@Autowired
	private StudentInternshipRepository studentInternshipRepository;
	@Autowired
	private MemberService memberService;
	@Autowired
	private JobService jobService;

	public void create(StudentInternshipModel studentModel) {
		StudentInternshipEntity entity = internshipModelToEntity(studentModel);
		studentInternshipRepository.save(entity);
	}

	public List<StudentInternshipModel> getAll() {

		List<StudentInternshipModel> modelList = new ArrayList<StudentInternshipModel>();
		List<StudentInternshipEntity> list = studentInternshipRepository.findAll();
		for (StudentInternshipEntity entity : list) {
			modelList.add(internshipEntityToModel(entity));
		}
		return modelList;
	}

	public StudentInternshipModel getOne(int sid) {

		StudentInternshipEntity entity = studentInternshipRepository.findOne(sid);
		StudentInternshipModel internshipEntityToModel = internshipEntityToModel(entity);
		return internshipEntityToModel;
	}

	private StudentInternshipEntity internshipModelToEntity(StudentInternshipModel studentModel) {
		// TODO Auto-generated method stub
		StudentInternshipEntity entity = new StudentInternshipEntity();
		if (studentModel != null) {
			entity.setSid(studentModel.getSid());
			entity.setJobId(studentModel.getJob().getSid());
			entity.setMemberId(studentModel.getMember().getSid());
			entity.setStudentId(studentModel.getMember().getStudentId());
		}
		return entity;
	}

	private StudentInternshipModel internshipEntityToModel(StudentInternshipEntity entity) {
		// TODO Auto-generated method stub
		StudentInternshipModel model = new StudentInternshipModel();
		if (entity != null) {
			model.setSid(entity.getSid());
			// Load objects
			model.setJob(jobService.getJobOnId(entity.getJobId()));
			model.setMember(memberService.getOne(entity.getMemberId()));
		}
		return model;
	}
}
