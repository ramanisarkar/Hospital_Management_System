package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.BloodManageVo;
import VO.TreatmentVo;

public class BloodManageDao {

	public ArrayList<BloodManageVo> bloodManageList(BloodManageVo bloodManageVo) {
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodManageVo AS d where d.adminid =:id");
			q.setParameter("id", bloodManageVo.getAdminid());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodManageInsert(BloodManageVo bloodManageVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(bloodManageVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public  ArrayList<BloodManageVo> bloodManageEdit(BloodManageVo bloodManageVo) {
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodManageVo AS n where n.id =:id");
			q.setParameter("id", bloodManageVo.getId());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodManageUpdate(BloodManageVo bloodManageVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(bloodManageVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

	public String deleteBloodManage(BloodManageVo bloodManageVo) {
		String message = null;
		try {
			System.out.println(bloodManageVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from BloodManageVo AS n where n.id =:id");
			q.setParameter("id", bloodManageVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
}
