package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Requirements")
public class Requirements implements Serializable {

	private static final long serialVersionUID = 5L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "requirementid")
	private Integer requirementid;
	@Column(name = "properties", length = 50, nullable = false)
	private String properties;
	@Column(name = "value", length = 50, nullable = false)
	private String value;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "orderid", nullable = false)
	private Orders order;
	
	public Integer getRequirementid() {
		return requirementid;
	}
	public void setRequirementid(Integer requirementid) {
		this.requirementid = requirementid;
	}
	public String getProperties() {
		return properties;
	}
	public void setProperties(String properties) {
		this.properties = properties;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
