package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Fields;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


public interface FieldRepository extends JpaRepository<Fields, Integer>{
	
	public Fields findByValue(String value);
	
}