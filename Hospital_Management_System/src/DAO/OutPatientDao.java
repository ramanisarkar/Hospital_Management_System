package DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.CommonDataVo;

public class OutPatientDao{

//	public String insertOutPatient(OutPatientVo outPatientVo, LoginVO loginvo) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		String message;
//		try {
//			session.save(outPatientVo);
//			session.save(loginvo);
//		} catch (Exception e) {
//			return message = "error";
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//
//		return message = "true";
//	}
	
	public void insertSymptoms(CommonDataVo commonDataVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(commonDataVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		
	}
}
