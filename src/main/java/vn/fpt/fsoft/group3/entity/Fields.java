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
@Table(name = "Fields")
public class Fields implements Serializable {

	private static final long serialVersionUID = 3L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fieldid")
	private Integer fieldid;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "value", length = 1, nullable = false, unique = true)
	private String value;
	@JsonIgnore
	@OneToMany(mappedBy = "field",  fetch = FetchType.EAGER)
	private Set<Customers> customers;
	
	public Integer getFieldid() {
		return fieldid;
	}
	public void setFieldid(Integer fieldid) {
		this.fieldid = fieldid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Set<Customers> getCustomers() {
		return customers;
	}
	public void setCustomers(Set<Customers> customers) {
		this.customers = customers;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
