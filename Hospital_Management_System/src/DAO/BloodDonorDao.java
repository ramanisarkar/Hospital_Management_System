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

public class BloodDonorDao  {
	
	public ArrayList<BloodDonorVo> bloodDonorList(BloodDonorVo bloodDonorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodDonorVo> bloodDonorList = new ArrayList<BloodDonorVo>();
		try {
			Query q = session.createQuery("from BloodDonorVo AS d where d.adminid =:id");
			q.setParameter("id", bloodDonorVo.getAdminid());
			bloodDonorList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodDonorVo>) bloodDonorList;
	}

	public String bloodDonorInsert(BloodDonorVo bloodDonorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(bloodDonorVo);
		} catch (Exception e) {
			return message = "error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public  ArrayList<BloodDonorVo> bloodDonorEdit(BloodDonorVo bloodDonorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodDonorVo> bloodDonorList = new ArrayList<BloodDonorVo>();
		try {
			Query q = session.createQuery("from BloodDonorVo AS n where n.id =:id");
			q.setParameter("id", bloodDonorVo.getId());
			bloodDonorList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodDonorVo>) bloodDonorList;
	}

	public String bloodDonorUpdate(BloodDonorVo bloodDonorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(bloodDonorVo);
			}
		catch (Exception e) {
			return chack="error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return chack="true";
	}

	public String deleteBloodDonor(BloodDonorVo bloodDonorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from BloodDonorVo AS n where n.id =:id");
			q.setParameter("id", bloodDonorVo.getId());
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

	public ArrayList<BloodDonorVo> getlastrecord() {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodDonorVo> donorList = new ArrayList<BloodDonorVo>();
		try {
			Query q = session.createQuery("from BloodDonorVo ORDER BY id DESC LIMIT 1;");
			donorList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodDonorVo>) donorList;
	}

	public String deleteBloodManage(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from BloodManageVo AS n where n.donorid =:id");
			q.setParameter("id", bloodManageVo.getDonorid());
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

	public ArrayList<BloodOutwordVo> bloodOutwordList(BloodOutwordVo bloodOutwordVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodOutwordVo> bloodDonorList = new ArrayList<BloodOutwordVo>();
		try {
			Query q = session.createQuery("from BloodOutwordVo AS d where d.adminid =:id");
			q.setParameter("id", bloodOutwordVo.getAdminid());
			bloodDonorList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodOutwordVo>) bloodDonorList;
	}
}
