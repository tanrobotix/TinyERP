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

@Entity
@Table(name = "Types")
public class Types implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "tid")
	private Integer tid;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "value", length = 2, nullable = false, unique=true)
	private String value;
	@OneToMany(mappedBy = "type", fetch = FetchType.EAGER)
	private Set<Customers> customers;

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
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
