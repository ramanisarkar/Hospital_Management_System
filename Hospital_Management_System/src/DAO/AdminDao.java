package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AdminVo;
import VO.LoginVO;

public class AdminDao {

	public void adminInsert(AdminVo adminVo, LoginVO loginvo) {
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(adminVo);
			session.save(loginvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AdminVo> editAdminProfile(AdminVo adminVo) {
		List<AdminVo> adminList = new ArrayList<AdminVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from AdminVo where id=" + adminVo.getId());
			adminList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return (ArrayList<AdminVo>) adminList;
		}
		return (ArrayList<AdminVo>) adminList;
	}

	public void updateAdminProfile(AdminVo adminVo) {
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(adminVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
