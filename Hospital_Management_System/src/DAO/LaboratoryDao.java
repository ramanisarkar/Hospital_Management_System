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

public class LaboratoryDao  {

	public ArrayList<LaboratoryVo> pharmacistList(LaboratoryVo laboratoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<LaboratoryVo> nurseList = new ArrayList<LaboratoryVo>();
	    try {
	        Query q = session.createQuery("from LaboratoryVo AS d where d.adminid =:id");
	        q.setParameter("id", laboratoryVo.getAdminid());
	        nurseList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<LaboratoryVo>) nurseList;
	}

	public String laboratoryStaffInsert(LaboratoryVo laboratoryVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(laboratoryVo);
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

	public ArrayList<LaboratoryVo> laboratoryStaffEdit(LaboratoryVo laboratoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<LaboratoryVo> pharmanicistList = new ArrayList<LaboratoryVo>();
	    try {
	        Query q = session.createQuery("from LaboratoryVo AS n where n.id =:id");
	        q.setParameter("id", laboratoryVo.getId());
	        pharmanicistList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<LaboratoryVo>) pharmanicistList;
	}

	public String deleteLogin(LoginVO loginVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
	    try {
	        System.out.println(loginVO.getId());
	        Query q = session.createQuery("delete from LoginVO AS n where n.laboratoyloginid =:id");
	        q.setParameter("id", loginVO.getLaboratoryloginid());
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

	public String deleteLaboratoryStaff(LaboratoryVo laboratoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
	    try {
	        System.out.println(laboratoryVo.getId());
	        Query q = session.createQuery("delete from LaboratoryVo AS n where n.id =:id");
	        q.setParameter("id", laboratoryVo.getId());
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

	public String laboratoryStaffUpdateProfile(LaboratoryVo laboratoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
	    String chack;
	    try {
	        session.update(laboratoryVo);
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
