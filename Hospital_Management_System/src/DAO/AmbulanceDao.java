package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AmbulanceVo;
import VO.BloodDonorVo;
import VO.BloodManageVo;
import VO.TreatmentVo;

public class AmbulanceDao{
	
	public ArrayList<AmbulanceVo> ambulanceList(AmbulanceVo ambulanceVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AmbulanceVo> ambulanceList = new ArrayList<AmbulanceVo>();
		try {
			Query q = session.createQuery("from AmbulanceVo AS d where d.adminid =:id");
			q.setParameter("id", ambulanceVo.getAdminid());
			ambulanceList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AmbulanceVo>) ambulanceList;
	}

	public String ambulanceInsert(AmbulanceVo ambulanceVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(ambulanceVo);
		} catch (Exception e) {
			return message = "error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public  ArrayList<AmbulanceVo> ambulanceEdit(AmbulanceVo ambulanceVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AmbulanceVo> ambulanceList = new ArrayList<AmbulanceVo>();
		try {
			Query q = session.createQuery("from AmbulanceVo AS n where n.id =:id");
			q.setParameter("id", ambulanceVo.getId());
			ambulanceList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AmbulanceVo>) ambulanceList;
	}

	public String ambulanceUpdate(AmbulanceVo ambulanceVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(ambulanceVo);
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

	public String deleteAmbulance(AmbulanceVo ambulanceVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from AmbulanceVo AS n where n.id =:id");
			q.setParameter("id", ambulanceVo.getId());
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

	public ArrayList<AmbulanceVo> getlastrecord() {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AmbulanceVo> ambulanceList = new ArrayList<AmbulanceVo>();
		try {
			Query q = session.createQuery("from AmbulanceVo ORDER BY id DESC LIMIT 1;");
			ambulanceList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<AmbulanceVo>) ambulanceList;
	}
}
