package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.macmis.entity.JobGroupEntity;

/**
 * @author Venu S Reddy
 *
 */

@Repository
public interface JobGroupRepository extends CrudRepository<JobGroupEntity, Integer>{
	
	
	 @Override
	 public List<JobGroupEntity> findAll();
	 
	 public JobGroupEntity findOne(@Param("sid") int sid);

}