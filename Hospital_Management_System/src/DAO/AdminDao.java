package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AdminVo;
import VO.LoginVO;

public class AdminDao{
	
	public void adminInsert(AdminVo adminVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(adminVo);
			session.save(loginvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
	}

	public ArrayList<AdminVo> editAdminProfile(AdminVo adminVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AdminVo> adminList = new ArrayList<AdminVo>();
		try {
			Query q = session.createQuery("from AdminVo where id=" + adminVo.getId());
			adminList = q.list();
		} catch (Exception e) {
			return (ArrayList<AdminVo>) adminList;
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AdminVo>) adminList;
	}

	public void updateAdminProfile(AdminVo adminVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(adminVo);
			transaction.commit();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
	}

	public String getpatient() {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String adminList;
		try {
			Query q = session.createQuery("SELECT COUNT(Id) FROM patientregistration;");
			Iterator count = q.iterate();
			adminList= (String) count.next();
		} catch (Exception e) {
			return adminList= "error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return adminList;
	}

}
