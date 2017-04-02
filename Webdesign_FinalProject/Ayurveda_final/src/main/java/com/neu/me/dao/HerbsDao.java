package com.neu.me.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.me.exception.UserException;

import com.neu.me.pojo.Herbs;



public class HerbsDao extends DAO {

    public HerbsDao() {
    }

    public List<Herbs> getAll()
           {
        try {
            begin();
            Query q = getSession().createQuery("from Herbs");
            List<Herbs> herblist = new ArrayList<Herbs>();
            herblist = q.list() ;
            System.out.println("size of herbs"+herblist.size());
            commit();
            return herblist;
        } catch (HibernateException e) {
            rollback();
           
        }
		return null;
    }

    public Herbs get(int herbid)
            throws UserException {
        try {
            begin();
            Query q = getSession().createQuery("from Herbs where herbid = :herbid");
            q.setInteger("herbid", herbid);
            Herbs herb = (Herbs) q.uniqueResult();
            commit();
            return herb;
        } catch (HibernateException e) {
            rollback();
            throw new UserException("Could not get herb " + herbid, e);
        }
        finally{
			close();
		}
    }

   public Herbs create(Herbs herb)
            throws UserException {
        try {
      
        	begin();
            getSession().save(herb);
            commit();
            return herb;
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            throw new UserException("Exception while creating herb: " + e.getMessage());
        }
    }

    public void delete(Herbs herb)
            throws UserException {
        try {
            begin();
            getSession().delete(herb);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw new UserException("Could not delete herb " + herb.getHerbName(), e);
        }
    }
    
    public void update(Herbs herb) throws UserException {
        try {
            begin();
            
            getSession().update(herb);
            commit();
            
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create the category", e);
            throw new UserException("Exception while updating herb: " + e.getMessage());
        }
        finally{
			close();
		}
    }
    
}
