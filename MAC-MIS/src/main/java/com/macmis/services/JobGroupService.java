/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.JobGroupEntity;
import com.macmis.models.JobGroupModel;
import com.macmis.repository.JobGroupRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class JobGroupService {

	@Autowired
	private JobGroupRepository jobGroupRepository;

	/*
	 * Load job group using sid
	 */
	public JobGroupModel getOneJobGroup(int sid) {
		// JobGroupModel jobGroupModal = new JobGroupModel();

		JobGroupEntity entity = jobGroupRepository.findOne(sid);
		return jobGroupEntityToModel(entity);
	}

	/*
	 * Load job all groups
	 */
	public List<JobGroupModel> getAll() {
		List<JobGroupModel> jobGroupModalList = new ArrayList<JobGroupModel>();
		List<JobGroupEntity> jobGroupEntityList = jobGroupRepository.findAll();
		for (JobGroupEntity entity : jobGroupEntityList) {

			jobGroupModalList.add(jobGroupEntityToModel(entity));
		}
		return jobGroupModalList;
	}

	/*
	 * Create a job group
	 */
	public void create(JobGroupModel model) {

		JobGroupEntity jobGroupEntity = jobGroupModelToEntity(model);
		// Save the object in the database
		jobGroupRepository.save(jobGroupEntity);
	}

	/*
	 * Convert the list of model objects to list of entity objects
	 */
	private JobGroupEntity jobGroupModelToEntity(JobGroupModel jobGroupModel) {

		JobGroupEntity JobGroupEntity = new JobGroupEntity();
		if (jobGroupModel != null) {

			JobGroupEntity.setSid(jobGroupModel.getSid());
			JobGroupEntity.setDescription(jobGroupModel.getDescription());
		}
		return JobGroupEntity;
	}

	/*
	 * Convert the list of entity objects to list of model objects
	 */
	private JobGroupModel jobGroupEntityToModel(JobGroupEntity jobGroupEntity) {

		JobGroupModel model = new JobGroupModel();
		if (jobGroupEntity != null) {

			model.setSid(jobGroupEntity.getSid());
			model.setDescription(jobGroupEntity.getDescription());
		}
		return model;
	}

}
