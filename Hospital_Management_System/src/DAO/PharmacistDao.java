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

public class PharmacistDao {

	public ArrayList<PharmacistVo> pharmacistList(PharmacistVo pharmancistVo) {
		List<PharmacistVo> nurseList = new ArrayList<PharmacistVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PharmacistVo AS d where d.adminid =:id");
			q.setParameter("id", pharmancistVo.getAdminid());
			nurseList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PharmacistVo>) nurseList;
	}

	public String pharmacistInsert(PharmacistVo pharmancistVo, LoginVO loginvo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(pharmancistVo);
			session.save(loginvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<PharmacistVo> pharmacistEdit(PharmacistVo pharmancistVo) {
		List<PharmacistVo> pharmanicistList = new ArrayList<PharmacistVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PharmacistVo AS n where n.id =:id");
			q.setParameter("id", pharmancistVo.getId());
			pharmanicistList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PharmacistVo>) pharmanicistList;
	}

	public String deleteLogin(LoginVO loginVO) {
		String message = null;
		try {
			System.out.println(loginVO.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from LoginVO AS n where n.pharmacistloginid =:id");
			q.setParameter("id", loginVO.getPharmacistloginid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String deletePharmacist(PharmacistVo pharmancistVo) {
		String message = null;
		try {
			System.out.println(pharmancistVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from PharmacistVo AS n where n.id =:id");
			q.setParameter("id", pharmancistVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String pharmancistUpdateProfile(PharmacistVo pharmancistVo) {
		System.out.println(pharmancistVo.getEmail()+"  "+pharmancistVo.getPassword());
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(pharmancistVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="Add";
	}
}


