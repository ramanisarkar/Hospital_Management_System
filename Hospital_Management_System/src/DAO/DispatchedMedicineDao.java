package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DispatchMedicineInfoVo;
import VO.DispatchedMedicineVo;
import VO.MedicineVo;

public class DispatchedMedicineDao {

	public String insertDispatchedMedicince(DispatchedMedicineVo dispatchedMedicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(dispatchedMedicineVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public String insertDispatchedMedicinceInfo(DispatchMedicineInfoVo dispatchMedicineInfoVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(dispatchMedicineInfoVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	    }

	public ArrayList<DispatchedMedicineVo> editDispatechedMedicine(DispatchedMedicineVo dispatchedMedicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DispatchedMedicineVo> dispatchedMedicineList = new ArrayList<DispatchedMedicineVo>();
	    try {
	        Query q = session.createQuery("from DispatchedMedicineVo AS n where n.id =:id");
	        q.setParameter("id", dispatchedMedicineVo.getId());
	        dispatchedMedicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<DispatchedMedicineVo>) dispatchedMedicineList;
	}

	public ArrayList<DispatchMedicineInfoVo> editDispatechedMedicineInfo(
			DispatchMedicineInfoVo dispatchMedicineInfoVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DispatchMedicineInfoVo> dispatchedMedicineList = new ArrayList<DispatchMedicineInfoVo>();
	    try {
	        Query q = session.createQuery("from DispatchMedicineInfoVo AS n where n.dispatchedmedicineid =:id");
	        q.setParameter("id", dispatchMedicineInfoVo.getDispatchedmedicineid());
	        dispatchedMedicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<DispatchMedicineInfoVo>) dispatchedMedicineList;
	}
	

}
