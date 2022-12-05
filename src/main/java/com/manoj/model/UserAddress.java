package com.manoj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "user_address")
public class UserAddress {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long aId;
	@NotBlank(message = "City field is required!")
	@Column(length = 20)
	private String cityOrVillage;
	@NotBlank(message = "State field is required!")
	@Column(length = 20)
	private String state;
	@NotNull(message = "Pin code field is required!")
	private Integer pinCode;

	public Long getaId() {
		return aId;
	}

	public void setaId(Long aId) {
		this.aId = aId;
	}

	public String getCityOrVillage() {
		return cityOrVillage;
	}

	public void setCityOrVillage(String cityOrVillage) {
		this.cityOrVillage = cityOrVillage;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getPinCode() {
		return pinCode;
	}

	public void setPinCode(Integer pinCode) {
		this.pinCode = pinCode;
	}

	@Override
	public String toString() {
		return "Address [city/village=" + cityOrVillage + ", state=" + state + ", pinCode=" + pinCode + "]";
	}
}
