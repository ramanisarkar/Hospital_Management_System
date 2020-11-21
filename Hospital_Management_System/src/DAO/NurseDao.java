package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DoctorVo;
import VO.LoginVO;
import VO.NurseVo;

public class NurseDao {
	
	public ArrayList<NurseVo> nurseList(NurseVo nurseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<NurseVo> nurseList = new ArrayList<NurseVo>();
	    try {
	        Query q = session.createQuery("from NurseVo AS d where d.adminid =:id");
	        q.setParameter("id", nurseVo.getAdminid());
	        nurseList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<NurseVo>) nurseList;
	}

	public String nurseInsert(NurseVo nurseVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(nurseVo);
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

	public ArrayList<NurseVo> nurseEdit(NurseVo nurseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<NurseVo> nurseList = new ArrayList<NurseVo>();
	    try {
	        Query q = session.createQuery("from NurseVo AS n where n.id =:id");
	        q.setParameter("id", nurseVo.getId());
	        nurseList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<NurseVo>) nurseList;
	}

	public String deleteLogin(LoginVO loginVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
	    try {
	        System.out.println(loginVO.getId());
	        Query q = session.createQuery("delete from LoginVO AS n where n.nurseloginid =:id");
	        q.setParameter("id", loginVO.getNurseloginid());
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

	public  String deleteNurse(NurseVo nurseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
	    try {
	        System.out.println(nurseVo.getId());
	        Query q = session.createQuery("delete from NurseVo AS n where n.id =:id");
	        q.setParameter("id", nurseVo.getId());
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

	public String nurseUpdateProfile(NurseVo nurseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
	    try {
	        session.update(nurseVo);
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


