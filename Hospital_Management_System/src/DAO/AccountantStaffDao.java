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
		List<AccountantStaffVo> nurseList = new ArrayList<AccountantStaffVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from AccountantStaffVo AS d where d.adminid =:id");
			q.setParameter("id", accountantStaffVo.getAdminid());
			nurseList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<AccountantStaffVo>) nurseList;
	}

	public String accountantStaffStaffInsert(AccountantStaffVo accountantStaffVo, LoginVO loginvo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(accountantStaffVo);
			session.save(loginvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<AccountantStaffVo> accountantStaffStaffEdit(AccountantStaffVo accountantStaffVo) {
		List<AccountantStaffVo> pharmanicistList = new ArrayList<AccountantStaffVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from AccountantStaffVo AS n where n.id =:id");
			q.setParameter("id", accountantStaffVo.getId());
			pharmanicistList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<AccountantStaffVo>) pharmanicistList;
	}

	public String deleteLogin(LoginVO loginVO) {
		String message = null;
		try {
			System.out.println(loginVO.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from LoginVO AS n where n.accountantloginid =:id");
			q.setParameter("id", loginVO.getAccountantloginid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String deleteAccountantStaff(AccountantStaffVo accountantStaffVo) {
		String message = null;
		try {
			System.out.println(accountantStaffVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from AccountantStaffVo AS n where n.id =:id");
			q.setParameter("id", accountantStaffVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String accountantStaffUpdateProfile(AccountantStaffVo accountantStaffVo) {
		System.out.println(accountantStaffVo.getEmail()+"  "+accountantStaffVo.getPassword());
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(accountantStaffVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="Add";
	}
}


