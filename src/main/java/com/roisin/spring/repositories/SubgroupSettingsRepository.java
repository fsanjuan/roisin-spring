package com.roisin.spring.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.roisin.spring.model.SubgroupSettings;

/**
 * Subgroup settings repository
 * 
 * @author Félix Miguel Sanjuán Segovia <felsanseg@alum.us.es>
 *
 */
@Repository
public interface SubgroupSettingsRepository extends JpaRepository<SubgroupSettings, Integer> {

}
