package com.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.model.entity.Category;

public class CategoryService {

	public CategoryService() {

	}

	@SuppressWarnings("unchecked")
	public List<Category> getAllCategory() {
		List<Category> allCategory = new ArrayList<>();
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query queryAllProduct = entityManager.createQuery("select e from Category e");
		allCategory = queryAllProduct.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return allCategory;
	}
	
	/*
	 * 
	 */
	public void addCategory(Category c) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(c);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
	}
	
	/*
	 * 
	 * 
	 */
	public void deleteCategory(Category c) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Category category = entityManager.find(Category.class, c.getCategoryId());
		entityManager.getTransaction().begin();
		entityManager.remove(category);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
	}
	
}

