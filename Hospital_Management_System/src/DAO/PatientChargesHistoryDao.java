package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.LaboratoryVo;
import VO.PatientChargesHistoryVo;

public class PatientChargesHistoryDao {

	public void insertCharges(PatientChargesHistoryVo chargesHistoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(chargesHistoryVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		
	}

	public ArrayList<PatientChargesHistoryVo> editPatientHistory(PatientChargesHistoryVo chargesHistoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientChargesHistoryVo> pharmanicistList = new ArrayList<PatientChargesHistoryVo>();
	    try {
	        Query q = session.createQuery("from PatientChargesHistoryVo AS n where n.patientid =:id and pramenttype =:Pramenttype");
	        q.setParameter("id", chargesHistoryVo.getPatientid());
	        q.setParameter("Pramenttype", chargesHistoryVo.getPramenttype());
	        pharmanicistList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<PatientChargesHistoryVo>) pharmanicistList;
	}

}
