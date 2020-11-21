package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.NurseVo;
import VO.TreatmentVo;

public class TreatmentDao{

	public ArrayList<TreatmentVo> treatmentList(TreatmentVo treatmentVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<TreatmentVo> treatmentList = new ArrayList<TreatmentVo>();
		try {
			Query q = session.createQuery("from TreatmentVo AS d where d.adminid =:id");
			q.setParameter("id", treatmentVo.getAdminid());
			treatmentList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<TreatmentVo>) treatmentList;
	}

	public String treatmentInsert(TreatmentVo treatmentVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(treatmentVo);
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public ArrayList<TreatmentVo> treatmentEdit(TreatmentVo treatmentVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<TreatmentVo> treatmentList = new ArrayList<TreatmentVo>();
		try {
			Query q = session.createQuery("from TreatmentVo AS n where n.id =:id");
			q.setParameter("id", treatmentVo.getId());
			treatmentList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<TreatmentVo>) treatmentList;
	}

	public String treatmeatUpdate(TreatmentVo treatmentVo) {
		
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(treatmentVo);
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

	public String deleteTreatment(TreatmentVo treatmentVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from TreatmentVo AS n where n.id =:id");
			q.setParameter("id", treatmentVo.getId());
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

}
