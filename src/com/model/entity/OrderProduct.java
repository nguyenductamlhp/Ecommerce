package com.model.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the order_product database table.
 * 
 */
@Entity
@Table(name="order_product")
@NamedQuery(name="OrderProduct.findAll", query="SELECT o FROM OrderProduct o")
public class OrderProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private OrderProductPK id;

	private int quantity;

	public OrderProduct() {
	}

	public OrderProductPK getId() {
		return this.id;
	}

	public void setId(OrderProductPK id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}