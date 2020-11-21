package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.LoginVO;
import VO.Support_StaffVo;

public class SupportStaffDao{

	public ArrayList<Support_StaffVo> supportStaffList(Support_StaffVo supportstaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<Support_StaffVo> nurseList = new ArrayList<Support_StaffVo>();
		try {
			Query q = session.createQuery("from Support_StaffVo AS d where d.adminid =:id");
			q.setParameter("id", supportstaffVo.getAdminid());
			nurseList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<Support_StaffVo>) nurseList;
	}

	public String supportStaffInsert(Support_StaffVo supportstaffVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(supportstaffVo);
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

	public ArrayList<Support_StaffVo> supportStaffEdit(Support_StaffVo supportstaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<Support_StaffVo> nurseList = new ArrayList<Support_StaffVo>();
		try {
			Query q = session.createQuery("from Support_StaffVo AS n where n.id =:id");
			q.setParameter("id", supportstaffVo.getId());
			nurseList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<Support_StaffVo>) nurseList;
	}

	public String deleteLogin(LoginVO loginVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from LoginVO AS n where n.supportstaffloginid =:id");
			q.setParameter("id", loginVO.getSupportstaffloginid());
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

	public String deleteSupportstaff(Support_StaffVo supportstaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from Support_StaffVo AS n where n.id =:id");
			q.setParameter("id", supportstaffVo.getId());
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

	public String supportStaffUpdateProfile(Support_StaffVo supportstaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(supportstaffVo);
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


