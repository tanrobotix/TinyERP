package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Countries")
public class Countries implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "countryid")
	private Integer countryid;
	@Column(name = "lef", length = 6, nullable = false)
	private Integer lef;
	@Column(name = "top", length = 6, nullable = false)
	private Integer top;
	@Column(name = "name", length = 66, nullable = false, unique=true)
	private String name;
	@Column(name = "countrycode", length = 6, nullable = false)
	private Integer countrycode;
	
	public Integer getCountryid() {
		return countryid;
	}
	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}
	public Integer getLef() {
		return lef;
	}
	public void setLef(Integer lef) {
		this.lef = lef;
	}
	public Integer getTop() {
		return top;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCountrycode() {
		return countrycode;
	}
	public void setCountrycode(Integer countrycode) {
		this.countrycode = countrycode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}