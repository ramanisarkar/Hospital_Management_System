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

public class SupportStaffDao {

	public ArrayList<Support_StaffVo> supportStaffList(Support_StaffVo supportstaffVo) {
		List<Support_StaffVo> nurseList = new ArrayList<Support_StaffVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from Support_StaffVo AS d where d.adminid =:id");
			q.setParameter("id", supportstaffVo.getAdminid());
			nurseList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<Support_StaffVo>) nurseList;
	}

	public String supportStaffInsert(Support_StaffVo supportstaffVo, LoginVO loginvo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(supportstaffVo);
			session.save(loginvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<Support_StaffVo> supportStaffEdit(Support_StaffVo supportstaffVo) {
		List<Support_StaffVo> nurseList = new ArrayList<Support_StaffVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from Support_StaffVo AS n where n.id =:id");
			q.setParameter("id", supportstaffVo.getId());
			nurseList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<Support_StaffVo>) nurseList;
	}

	public String deleteLogin(LoginVO loginVO) {
		String message = null;
		try {
			System.out.println(loginVO.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from LoginVO AS n where n.supportstaffloginid =:id");
			q.setParameter("id", loginVO.getSupportstaffloginid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String deleteSupportstaff(Support_StaffVo supportstaffVo) {
		String message = null;
		try {
			System.out.println(supportstaffVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from Support_StaffVo AS n where n.id =:id");
			q.setParameter("id", supportstaffVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String supportStaffUpdateProfile(Support_StaffVo supportstaffVo) {
		System.out.println(supportstaffVo.getEmail()+"  "+supportstaffVo.getPassword());
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(supportstaffVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="Add";
	}
}


