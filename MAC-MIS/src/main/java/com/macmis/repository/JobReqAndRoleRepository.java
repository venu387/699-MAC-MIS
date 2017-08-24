package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.macmis.entity.JobGroupEntity;
import com.macmis.entity.JobReqAndRoleEntity;

/**
 * @author Venu S Reddy
 *
 */

@Repository
public interface JobReqAndRoleRepository extends CrudRepository<JobReqAndRoleEntity, Integer>{
	
	
	 @Override
	 public List<JobReqAndRoleEntity> findAll();
	 
	 //Find requirements and role by Job ID
	 public List<JobReqAndRoleEntity> findByJobId(int jobid);

}