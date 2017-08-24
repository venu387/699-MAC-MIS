/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.JobReqAndRoleEntity;
import com.macmis.models.JobReqAndRoleModel;
import com.macmis.repository.JobReqAndRoleRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class JobReqAndRoleService {

	@Autowired
	private JobReqAndRoleRepository jobReqAndRoleRepository;

	/*
	 * Load job group using sid
	 */
	public List<JobReqAndRoleModel> getJobReqAndRole(int jobid){
		
		List<JobReqAndRoleModel> modelList = new ArrayList<JobReqAndRoleModel>();
		List<JobReqAndRoleEntity> entityList = jobReqAndRoleRepository.findByJobId(jobid);
		for(JobReqAndRoleEntity entity: entityList) {
			modelList.add(jobReqAndRoleEntityToModel(entity));
		}
		return modelList;
	}
	
	/*
	 * Create a job group
	 */
	public void create(JobReqAndRoleModel model) {
		
		JobReqAndRoleEntity jobReqAndRoleEntity = jobReqAndRoleModelToEntity(model);
		//Save the object in the database
		jobReqAndRoleRepository.save(jobReqAndRoleEntity);
	}

	/*
	 * Convert the list of model objects to list of entity objects
	 */
	private JobReqAndRoleEntity jobReqAndRoleModelToEntity(JobReqAndRoleModel JobReqAndRoleModel) {

		JobReqAndRoleEntity JobReqAndRoleEntity = new JobReqAndRoleEntity();
		JobReqAndRoleEntity.setSid(JobReqAndRoleModel.getSid());
		JobReqAndRoleEntity.setDescription(JobReqAndRoleModel.getDescription());
		JobReqAndRoleEntity.setJobId(JobReqAndRoleModel.getJobId());
		JobReqAndRoleEntity.setType(JobReqAndRoleModel.getType());
		return JobReqAndRoleEntity;
	}

	/*
	 * Convert the list of entity objects to list of model objects
	 */
	private JobReqAndRoleModel jobReqAndRoleEntityToModel(JobReqAndRoleEntity jobReqAndRoleEntity) {

		JobReqAndRoleModel model = new JobReqAndRoleModel();
		model.setSid(jobReqAndRoleEntity.getSid());
		model.setDescription(jobReqAndRoleEntity.getDescription());
		model.setJobId(jobReqAndRoleEntity.getJobId());
		model.setType(jobReqAndRoleEntity.getType());
		return model;
	}

}
