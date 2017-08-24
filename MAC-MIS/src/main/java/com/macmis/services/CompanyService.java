/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.CompanyEntity;
import com.macmis.models.CompanyModel;
import com.macmis.repository.CompanyRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;

	public void create(CompanyModel company) {
		List<CompanyModel> tempList = new ArrayList<CompanyModel>();
		tempList.add(company);
		CompanyEntity companyEntity = companyModelToEntity(tempList).get(0);
		// Save the object in the database
		companyRepository.save(companyEntity);

		// CompanyEntity companyObj = companyRepository.findOne(entityObj.getSid());
		// companyObj.setName("Govindaaaaaaa 3");
		// companyRepository.save(companyObj);
	}

	public List<CompanyModel> getCompanyList() {
		List<CompanyEntity> companyEntityList = companyRepository.findAll();
		List<CompanyModel> companyList = companyEntityToModel(companyEntityList);
		return companyList;
	}

	public CompanyModel getCompanyOnId(int sid) {
		CompanyEntity companyEntity = companyRepository.findOne(sid);
		List<CompanyEntity> tempList = new ArrayList<CompanyEntity>();
		tempList.add(companyEntity);
		List<CompanyModel> companyList = companyEntityToModel(tempList);
		return companyList.get(0);
	}

	/*
	 * Convert the list of model objects to list of entity objects
	 */
	private List<CompanyEntity> companyModelToEntity(List<CompanyModel> companyList) {
		List<CompanyEntity> companyEntityList = new ArrayList<CompanyEntity>();

		if (companyList != null) {

			for (CompanyModel company : companyList) {

				CompanyEntity companyEntity = new CompanyEntity();
				companyEntity.setSid(company.getSid());
				companyEntity.setName(company.getName());
				companyEntity.setAddress(company.getAddress());
				companyEntity.setName(company.getName());
				companyEntity.setSid(company.getSid());
				companyEntity.setCity(company.getCity());
				companyEntity.setContactEmailId(company.getContactEmailId());
				companyEntity.setContactFirstName(company.getContactFirstName());
				companyEntity.setContactLastName(company.getContactLastName());
				companyEntity.setContactPosition(company.getContactPosition());
				companyEntity.setContactTelephone(company.getContactTelephone());
				companyEntity.setCountry(company.getCountry());
				companyEntity.setNotes(company.getNotes());
				companyEntity.setPostalCode(company.getPostalCode());
				companyEntity.setProvince(company.getProvince());
				companyEntity.setWebsite(company.getWebsite());

				companyEntityList.add(companyEntity);
			}
		}
		return companyEntityList;
	}

	/*
	 * Convert the list of entity objects to list of model objects
	 */
	private List<CompanyModel> companyEntityToModel(List<CompanyEntity> companyEntityList) {

		List<CompanyModel> companyList = new ArrayList<CompanyModel>();
		if (companyEntityList != null) {

			for (CompanyEntity companyEntity : companyEntityList) {
				CompanyModel company = new CompanyModel();
				company.setSid(companyEntity.getSid());
				company.setName(companyEntity.getName());
				company.setAddress(companyEntity.getAddress());
				company.setCity(companyEntity.getCity());
				company.setContactEmailId(companyEntity.getContactEmailId());
				company.setContactFirstName(companyEntity.getContactFirstName());
				company.setContactLastName(companyEntity.getContactLastName());
				company.setContactPosition(companyEntity.getContactPosition());
				company.setContactTelephone(companyEntity.getContactTelephone());
				company.setCountry(companyEntity.getCountry());
				company.setNotes(companyEntity.getNotes());
				company.setPostalCode(companyEntity.getPostalCode());
				company.setProvince(companyEntity.getProvince());
				company.setWebsite(companyEntity.getWebsite());

				companyList.add(company);
			}
		}
		return companyList;
	}

}
