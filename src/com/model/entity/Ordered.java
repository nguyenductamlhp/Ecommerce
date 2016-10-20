package com.model.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the ordered database table.
 * 
 */
@Entity
@NamedQuery(name="Ordered.findAll", query="SELECT o FROM Ordered o")
public class Ordered implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="order_id")
	private int orderId;

	@Column(name="account_id")
	private int accountId;

	@Column(name="order_date")
	private String orderDate;

	private String status;

	public Ordered() {
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getAccountId() {
		return this.accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}