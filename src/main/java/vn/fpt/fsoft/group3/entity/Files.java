package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;

import java.util.Date;
import java.util.List;
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

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Files")
public class Files implements Serializable {

	private static final long serialVersionUID = 6L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long fileid;
	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "data", nullable = false)
	private byte[] data;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "orderid", nullable = false)
	private Orders order;
	public long getFileid() {
		return fileid;
	}
	public void setFileid(long fileid) {
		this.fileid = fileid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
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
