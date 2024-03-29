package com.roisin.spring.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.roisin.spring.model.Process;

@Repository
public interface ProcessRepository extends JpaRepository<Process, Integer> {

	@Query("select p from Process p where p.preprocessedData.id = ?1 and p.algorithm = 'roisinnull'")
	Collection<Process> findNullDataProcesses(int dataId);

	@Query("select p from Process p where p.preprocessedData.id = ?1 and p.algorithm = ?2")
	Collection<Process> findByAlgorithmAndDataId(int dataId, String algorithm);

	@Query("select p from Process p where p.label.id =?1")
	Collection<Process> findProcessByLabelId(int labelId);

}
