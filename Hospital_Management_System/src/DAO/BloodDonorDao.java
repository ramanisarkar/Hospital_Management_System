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
import VO.BloodOutwordVo;
import VO.PatientRegistretionVo;
import VO.TreatmentVo;

public class BloodDonorDao {

	public ArrayList<BloodDonorVo> bloodDonorList(BloodDonorVo bloodDonorVo) {
		List<BloodDonorVo> bloodDonorList = new ArrayList<BloodDonorVo>();
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

	public ArrayList<BloodDonorVo> getlastrecord() {
		List<BloodDonorVo> donorList = new ArrayList<BloodDonorVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodDonorVo ORDER BY id DESC LIMIT 1;");
			donorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodDonorVo>) donorList;
	}

	public String deleteBloodManage(BloodManageVo bloodManageVo) {
		String message = null;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from BloodManageVo AS n where n.donorid =:id");
			q.setParameter("id", bloodManageVo.getDonorid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<BloodOutwordVo> bloodOutwordList(BloodOutwordVo bloodOutwordVo) {
		List<BloodOutwordVo> bloodDonorList = new ArrayList<BloodOutwordVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodOutwordVo AS d where d.adminid =:id");
			q.setParameter("id", bloodOutwordVo.getAdminid());
			bloodDonorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodOutwordVo>) bloodDonorList;
	}
}
