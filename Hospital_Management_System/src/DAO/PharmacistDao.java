package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.LoginVO;
import VO.PharmacistVo;

public class PharmacistDao  {

	public ArrayList<PharmacistVo> pharmacistList(PharmacistVo pharmancistVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PharmacistVo> nurseList = new ArrayList<PharmacistVo>();
		try {
			Query q = session.createQuery("from PharmacistVo AS d where d.adminid =:id");
			q.setParameter("id", pharmancistVo.getAdminid());
			nurseList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PharmacistVo>) nurseList;
	}

	public String pharmacistInsert(PharmacistVo pharmancistVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(pharmancistVo);
			session.save(loginvo);
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public ArrayList<PharmacistVo> pharmacistEdit(PharmacistVo pharmancistVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PharmacistVo> pharmanicistList = new ArrayList<PharmacistVo>();
		try {
			Query q = session.createQuery("from PharmacistVo AS n where n.id =:id");
			q.setParameter("id", pharmancistVo.getId());
			pharmanicistList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PharmacistVo>) pharmanicistList;
	}

	public String deleteLogin(LoginVO loginVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from LoginVO AS n where n.pharmacistloginid =:id");
			q.setParameter("id", loginVO.getPharmacistloginid());
			q.executeUpdate();
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public String deletePharmacist(PharmacistVo pharmancistVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from PharmacistVo AS n where n.id =:id");
			q.setParameter("id", pharmancistVo.getId());
			q.executeUpdate();
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public String pharmancistUpdateProfile(PharmacistVo pharmancistVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println(pharmancistVo.getEmail()+"  "+pharmancistVo.getPassword());
		String chack;
		try {
			session.update(pharmancistVo);
			}
		catch (Exception e) {
			return chack="error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return chack="Add";
	}
}


