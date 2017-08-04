package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Countries;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


public interface CountryRepository extends JpaRepository<Countries, Integer>{
    
}