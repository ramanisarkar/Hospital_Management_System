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

public class TreatmentDao {

	public ArrayList<TreatmentVo> treatmentList(TreatmentVo treatmentVo) {
		List<TreatmentVo> treatmentList = new ArrayList<TreatmentVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from TreatmentVo AS d where d.adminid =:id");
			q.setParameter("id", treatmentVo.getAdminid());
			treatmentList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<TreatmentVo>) treatmentList;
	}

	public String treatmentInsert(TreatmentVo treatmentVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(treatmentVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<TreatmentVo> treatmentEdit(TreatmentVo treatmentVo) {
		List<TreatmentVo> treatmentList = new ArrayList<TreatmentVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from TreatmentVo AS n where n.id =:id");
			q.setParameter("id", treatmentVo.getId());
			treatmentList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<TreatmentVo>) treatmentList;
	}

	public String treatmeatUpdate(TreatmentVo treatmentVo) {
		
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(treatmentVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

	public String deleteTreatment(TreatmentVo treatmentVo) {
		String message = null;
		try {
			System.out.println(treatmentVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from TreatmentVo AS n where n.id =:id");
			q.setParameter("id", treatmentVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

}
