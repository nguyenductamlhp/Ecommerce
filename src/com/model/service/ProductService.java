package com.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.model.entity.Category;
import com.model.entity.Product;

public class ProductService {

	public ProductService() {
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getAllProduct() {
		List<Product> allProduct = new ArrayList<>();
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query queryAllProduct =  entityManager.createQuery("select e from Product e");
		allProduct = queryAllProduct.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return allProduct;
	}
	
	public Product getProduct(int id) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Product p = entityManager.find(Product.class, id);
		entityManager.close();
		entityManagerFactory.close();
		return p;
	}

	public List<Product> searchProduct(String searchKey) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createQuery("select p from Product p where p.productName like '%" + searchKey + "%'");
		List<Product> listProduct = query.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return listProduct;
	}
	
	
	public List<Product> getProductByCategory(int categoryId) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createQuery("select p from Product p where p.productCategoryId = " + categoryId);
		List<Product> listProduct = query.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return listProduct;
	}
	
	public List<Product> getProductByPrice(int min, int max) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createQuery("select p from Product p where p.productPrice >= " + min + " and " +
																			"p.productPrice <=" + max );
		List<Product> listProduct = query.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return listProduct;
	}
	public String getCategoryName(int categoryId) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createQuery("select c from Category c where c.categoryId = "+ categoryId);
		List<Category> list = query.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return list.get(0).getCategoryName();
	}
	
	public boolean isExist(int id) {
		List<Product> listProduct = getAllProduct();
		for (Product product : listProduct) {
			if (product.getProductId() == id) {
				return true;
			}
		}
		return false;
	}
	
	/*
	 * 
	 * 
	 */
	
	public boolean addProduct(Product p) {
		if (!isExist(p.getProductId())) {
			EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
			EntityManager entityManager = entityManagerFactory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(p);
			entityManager.getTransaction().commit();
			entityManager.close();
			entityManagerFactory.close();
			System.out.println("Ða them!");
			return true;
		}
		return false;
	}
	/*
	 * 
	 */
	public boolean deleteProduct(int id) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Product product = entityManager.find(Product.class, id);
		if (isExist(id)) {			
			entityManager.getTransaction().begin();
			entityManager.remove(product);
			entityManager.getTransaction().commit();
			
			entityManager.close();
			entityManagerFactory.close();
			return true;
		}
		entityManager.close();
		entityManagerFactory.close();
		return false;
	}
}
