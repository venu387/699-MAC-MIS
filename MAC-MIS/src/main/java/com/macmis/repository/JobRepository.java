package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.macmis.entity.JobEntity;
import com.macmis.entity.JobGroupEntity;

/**
 * @author Venu S Reddy
 *
 */

@Repository
public interface JobRepository extends CrudRepository<JobEntity, Integer>{
	
	
	 @Override
	 public List<JobEntity> findAll();
	 
	 public JobEntity findOne(@Param("sid") int sid);

}