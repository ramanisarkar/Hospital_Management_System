package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AccountantStaffVo;
import VO.LoginVO;

public class AccountantStaffDao {

	public ArrayList<AccountantStaffVo> accountantStaffList(AccountantStaffVo accountantStaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AccountantStaffVo> nurseList = new ArrayList<AccountantStaffVo>();
		try {
			Query q = session.createQuery("from AccountantStaffVo AS d where d.adminid =:id");
			q.setParameter("id", accountantStaffVo.getAdminid());
			nurseList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AccountantStaffVo>) nurseList;
	}

	public String accountantStaffStaffInsert(AccountantStaffVo accountantStaffVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(accountantStaffVo);
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

	public ArrayList<AccountantStaffVo> accountantStaffStaffEdit(AccountantStaffVo accountantStaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AccountantStaffVo> pharmanicistList = new ArrayList<AccountantStaffVo>();
		try {
			Query q = session.createQuery("from AccountantStaffVo AS n where n.id =:id");
			q.setParameter("id", accountantStaffVo.getId());
			pharmanicistList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AccountantStaffVo>) pharmanicistList;
	}

	public String deleteLogin(LoginVO loginVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from LoginVO AS n where n.accountantloginid =:id");
			q.setParameter("id", loginVO.getAccountantloginid());
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

	public String deleteAccountantStaff(AccountantStaffVo accountantStaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from AccountantStaffVo AS n where n.id =:id");
			q.setParameter("id", accountantStaffVo.getId());
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

	public String accountantStaffUpdateProfile(AccountantStaffVo accountantStaffVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(accountantStaffVo);
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


