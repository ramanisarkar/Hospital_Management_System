package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AllDataCountVo;
import VO.BedCategoryVo;

public class AllDataCountDao {
	
	
	public String insertBedCategory(BedCategoryVo bedCategoryVo  ) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(bedCategoryVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";

	}

	public void increaseData(AllDataCountVo allDataCountVo , String columnName) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update AllDataCountVo set "+columnName+" = "+columnName+"+1 where adminid =:id");
			q.setParameter("id", allDataCountVo.getAdminid());
			q.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public ArrayList<AllDataCountVo> allDataList(AllDataCountVo allDataCountVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AllDataCountVo> list = new ArrayList<AllDataCountVo>();
		try {
			Query q = session.createQuery("from AllDataCountVo AS n where n.adminid =:id");
			q.setParameter("id", allDataCountVo.getAdminid());
			list = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AllDataCountVo>) list;
	}
}
