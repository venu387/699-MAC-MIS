/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.JobEntity;
import com.macmis.models.JobModel;
import com.macmis.repository.JobRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class JobService {

	@Autowired
	private JobRepository jobRepository;
	@SuppressWarnings("unused")
	@Autowired
	private JobReqAndRoleService reqService;
	@Autowired
	private JobGroupService jobGroupService;
	@Autowired
	private CompanyService companyService;

	/*
	 * Save job
	 */
	public int create(JobModel jobModel) {
		JobEntity entity = new JobEntity();
		entity = jobModelToEntity(jobModel);
		// Save the object in the database
		return jobRepository.save(entity).getSid();
	}

	/*
	 * Get all list of jobs
	 */
	public List<JobModel> getJobList() {
		List<JobEntity> jobEntityList = jobRepository.findAll();
		List<JobModel> jobModelList = jobEntityToModel(jobEntityList);

		return jobModelList;
	}

	/*
	 * Get one job based on jobid
	 */
	public JobModel getJobOnId(int sid) {

		JobEntity jobEntity = jobRepository.findOne(sid);
		List<JobEntity> tempList = new ArrayList<JobEntity>();
		tempList.add(jobEntity);
		List<JobModel> jobModelList = jobEntityToModel(tempList);

		return jobModelList.get(0);
	}

	/*
	 * Convert the list of model objects to list of entity objects
	 */
	private JobEntity jobModelToEntity(JobModel jobModel) {

		JobEntity JobEntity = new JobEntity();
		if (jobModel != null) {

			JobEntity.setSid(jobModel.getSid());
			JobEntity.setCompany(jobModel.getCompany().getSid());
			JobEntity.setContactEmailId(jobModel.getContactEmailId());
			JobEntity.setDescription(jobModel.getDescription());
			// JobEntity.setExpDoj(jobModel.getExpDoj());
			JobEntity.setGroup(jobModel.getGroup().getSid());
			JobEntity.setInternshipType(jobModel.getInternshipType());
			JobEntity.setSalary(jobModel.getSalary());
			JobEntity.setStatus(jobModel.getStatus());
			JobEntity.setTitle(jobModel.getTitle());
			JobEntity.setUrl(jobModel.getUrl());

			// Save the requirement
			// if (jobModel.getReqRoleList() != null) {
			//
			// for (JobReqAndRoleModel reqModel : jobModel.getReqRoleList()) {
			// if (reqModel != null) {
			//
			// reqModel.setJobId(JobEntity.getSid());
			// reqService.create(reqModel);
			// }
			// }
			// }

		}
		return JobEntity;
	}

	private List<JobModel> jobEntityToModel(List<JobEntity> jobEntityList) {
		// TODO Auto-generated method stub

		List<JobModel> jobModelList = new ArrayList<JobModel>();
		if (jobEntityList != null) {

			for (JobEntity entity : jobEntityList) {
				JobModel jobModel = new JobModel();
				jobModel.setSid(entity.getSid());
				jobModel.setContactEmailId(entity.getContactEmailId());
				jobModel.setDescription(entity.getDescription());
				// jobModel.setExpDoj(entity.getExpDoj());
				jobModel.setInternshipType(entity.getInternshipType());
				jobModel.setSalary(entity.getSalary());
				jobModel.setStatus(entity.getStatus());
				jobModel.setTitle(entity.getTitle());
				jobModel.setUrl(entity.getUrl());

				// Load the sub classes
				// jobModel.setReqRoleList(reqService.getJobReqAndRole(jobModel.getSid()));

				jobModel.setGroup(jobGroupService.getOneJobGroup(entity.getGroup()));

				jobModel.setCompany(companyService.getCompanyOnId(entity.getCompany()));

				jobModelList.add(jobModel);
			}
		}
		return jobModelList;
	}

}
