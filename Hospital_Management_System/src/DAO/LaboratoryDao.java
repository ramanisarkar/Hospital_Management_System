package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.LaboratoryVo;
import VO.LoginVO;

public class LaboratoryDao {

	public ArrayList<LaboratoryVo> pharmacistList(LaboratoryVo laboratoryVo) {
		List<LaboratoryVo> nurseList = new ArrayList<LaboratoryVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from LaboratoryVo AS d where d.adminid =:id");
			q.setParameter("id", laboratoryVo.getAdminid());
			nurseList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<LaboratoryVo>) nurseList;
	}

	public String laboratoryStaffInsert(LaboratoryVo laboratoryVo, LoginVO loginvo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(laboratoryVo);
			session.save(loginvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<LaboratoryVo> laboratoryStaffEdit(LaboratoryVo laboratoryVo) {
		List<LaboratoryVo> pharmanicistList = new ArrayList<LaboratoryVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from LaboratoryVo AS n where n.id =:id");
			q.setParameter("id", laboratoryVo.getId());
			pharmanicistList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<LaboratoryVo>) pharmanicistList;
	}

	public String deleteLogin(LoginVO loginVO) {
		String message = null;
		try {
			System.out.println(loginVO.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from LoginVO AS n where n.laboratoyloginid =:id");
			q.setParameter("id", loginVO.getLaboratoryloginid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String deleteLaboratoryStaff(LaboratoryVo laboratoryVo) {
		String message = null;
		try {
			System.out.println(laboratoryVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from LaboratoryVo AS n where n.id =:id");
			q.setParameter("id", laboratoryVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String laboratoryStaffUpdateProfile(LaboratoryVo laboratoryVo) {
		System.out.println(laboratoryVo.getEmail()+"  "+laboratoryVo.getPassword());
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(laboratoryVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="Add";
	}
}


