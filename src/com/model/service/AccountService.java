package com.model.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import com.model.entity.Account;

public class AccountService {
	
	public AccountService() {
		
	}

	@SuppressWarnings("unchecked")
	public List<Account> getAllAccount() {
		List<Account> reList = null;
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createQuery("select a from Account a");
		reList = query.getResultList();
		entityManager.close();
		entityManagerFactory.close();
		return reList;
	}
	
	public Account getAccount(String username, String password) {
		List<Account> listAllAccount = getAllAccount();
		for (Account account : listAllAccount) {
			if (account.getUsername().equals(username) && account.getPassword().equals(password)) {
				return account;
			}
		}
		return null;
	}
	
	public Account getAccountByPhone(String phone) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Account account = entityManager.find(Account.class, phone);		
		entityManager.close();
		entityManagerFactory.close();
		if (account.getPassword().equals(phone)) {
			return account;
		}
		return  null;
	}
	
	/*
	 * 
	 */
	public void addAccount(Account a) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();		
		entityManager.persist(a);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
	} 
	/*
	 * 
	 */
	public void deleteAccount(int id) {
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ecommerce");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Account a = entityManager.find(Account.class, id);
		entityManager.getTransaction().begin();		
		entityManager.remove(a);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
	}
}
