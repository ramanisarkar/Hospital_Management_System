package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.BloodDonorVo;
import VO.BloodManageVo;
import VO.TreatmentVo;

public class BloodDonorDao {

	public ArrayList<BloodDonorVo> bloodDonorList(BloodDonorVo bloodDonorVo) {
		System.out.println(bloodDonorVo.getAdminid());
		List<BloodDonorVo> bloodDonorList = new ArrayList<BloodDonorVo>();
		System.out.println(bloodDonorVo.getAdminid());
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodDonorVo AS d where d.adminid =:id");
			q.setParameter("id", bloodDonorVo.getAdminid());
			bloodDonorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodDonorVo>) bloodDonorList;
	}

	public String bloodDonorInsert(BloodDonorVo bloodDonorVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(bloodDonorVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public  ArrayList<BloodDonorVo> bloodDonorEdit(BloodDonorVo bloodDonorVo) {
		List<BloodDonorVo> bloodDonorList = new ArrayList<BloodDonorVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodDonorVo AS n where n.id =:id");
			q.setParameter("id", bloodDonorVo.getId());
			bloodDonorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodDonorVo>) bloodDonorList;
	}

	public String bloodDonorUpdate(BloodDonorVo bloodDonorVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(bloodDonorVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

	public String deleteBloodDonor(BloodDonorVo bloodDonorVo) {
		String message = null;
		try {
			System.out.println(bloodDonorVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from BloodDonorVo AS n where n.id =:id");
			q.setParameter("id", bloodDonorVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
}
