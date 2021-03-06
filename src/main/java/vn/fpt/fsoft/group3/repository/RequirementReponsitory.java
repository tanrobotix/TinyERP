package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Fields;
import vn.fpt.fsoft.group3.entity.Requirements;
import vn.fpt.fsoft.group3.entity.Types;

import java.util.List;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface RequirementReponsitory extends JpaRepository<Requirements, Long>{

}
