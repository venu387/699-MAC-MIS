/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.MemberEntity;
import com.macmis.models.MemberModel;
import com.macmis.repository.MemberRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public void create(MemberModel studentModel) {
		MemberEntity entity = studentModelToEntity(studentModel);
		memberRepository.save(entity);
	}

	public List<MemberModel> getAll() {

		List<MemberModel> modelList = new ArrayList<MemberModel>();
		List<MemberEntity> list = memberRepository.findAll();
		for (MemberEntity entity : list) {
			modelList.add(studentEntityToModel(entity));
		}
		return modelList;
	}

	public MemberModel getOne(int sid) {

		MemberModel model = new MemberModel();
		model = studentEntityToModel(memberRepository.findOne(sid));
		return model;
	}

	public MemberModel getOneOnStudentId(String studentId) {

		MemberModel model = new MemberModel();
		model = studentEntityToModel(memberRepository.findByStudentId(studentId));
		return model;
	}

	/*
	 * Convert the list of model objects to list of entity objects
	 */
	private MemberEntity studentModelToEntity(MemberModel studentModel) {
		MemberEntity studentEntity = new MemberEntity();
		if (studentModel != null) {

			studentEntity.setSid(studentModel.getSid());
			studentEntity.setStudentId(studentModel.getStudentId());
			studentEntity.setAddress(studentModel.getAddress());
			studentEntity.setCity(studentModel.getCity());
			studentEntity.setEmailId(studentModel.getEmailId());
			studentEntity.setFirstName(studentModel.getFirstName());
			studentEntity.setMiddleName(studentModel.getMiddleName());
			studentEntity.setLastName(studentModel.getLastName());
			studentEntity.setTelephone(studentModel.getTelephone());
			studentEntity.setCountry(studentModel.getCountry());
			studentEntity.setPostalCode(studentModel.getPostalCode());
			studentEntity.setProvince(studentModel.getProvince());
			studentEntity.setGender(studentModel.getGender());
			studentEntity.setStatus(studentModel.getStatus());
			studentEntity.setCurrstatus(studentModel.getCurrstatus());
			studentEntity.setSemester(studentModel.getSemester());
			studentEntity.setYear(studentModel.getYear());
			studentEntity.setType(studentModel.getType());
			studentEntity.setUsername(studentModel.getUsername());
			studentEntity.setPassword(studentModel.getPassword());
		}
		return studentEntity;
	}

	/*
	 * Convert the list of entity objects to list of model objects
	 */
	private MemberModel studentEntityToModel(MemberEntity studentEntity) {

		MemberModel studentModel = new MemberModel();
		if (studentEntity != null) {

			studentModel.setSid(studentEntity.getSid());
			studentModel.setStudentId(studentEntity.getStudentId());
			studentModel.setAddress(studentEntity.getAddress());
			studentModel.setCity(studentEntity.getCity());
			studentModel.setEmailId(studentEntity.getEmailId());
			studentModel.setFirstName(studentEntity.getFirstName());
			studentModel.setMiddleName(studentEntity.getMiddleName());
			studentModel.setLastName(studentEntity.getLastName());
			studentModel.setTelephone(studentEntity.getTelephone());
			studentModel.setCountry(studentEntity.getCountry());
			studentModel.setPostalCode(studentEntity.getPostalCode());
			studentModel.setProvince(studentEntity.getProvince());
			studentModel.setGender(studentEntity.getGender());
			studentModel.setStatus(studentEntity.getStatus());
			studentModel.setUsername(studentEntity.getUsername());
			studentModel.setPassword(studentEntity.getPassword());
			studentModel.setType(studentEntity.getType());
			studentModel.setCurrstatus(studentEntity.getCurrstatus());
			studentModel.setSemester(studentEntity.getSemester());
			studentModel.setYear(studentEntity.getYear());

		}
		return studentModel;
	}

}
