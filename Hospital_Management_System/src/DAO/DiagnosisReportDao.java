package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DiagnosisReportAddVo;
import VO.DiagnosisReportApplyVo;

public class DiagnosisReportDao {

	public String insretDiagnosisReport(DiagnosisReportAddVo diagnosisReportAddVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(diagnosisReportAddVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public String insretDiagnosisReportApply(DiagnosisReportApplyVo diagnosisReportApplyVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(diagnosisReportApplyVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public ArrayList<DiagnosisReportAddVo> listDiagnosisReportAdd(DiagnosisReportAddVo diagnosisReportAddVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DiagnosisReportAddVo> diagnosisReport = new ArrayList<DiagnosisReportAddVo>();
	    try {
	        Query q = session.createQuery("from DiagnosisReportAddVo AS n where n.adminid =:id");
	        q.setParameter("id", diagnosisReportAddVo.getAdminid());
	        diagnosisReport = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<DiagnosisReportAddVo>) diagnosisReport;
	}

	public ArrayList<DiagnosisReportApplyVo> editDiagnosisReportApply(DiagnosisReportApplyVo diagnosisReportApplyVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DiagnosisReportApplyVo> diagnosisReport = new ArrayList<DiagnosisReportApplyVo>();
	    try {
	        Query q = session.createQuery("from DiagnosisReportApplyVo AS n where n.id =:id");
	        q.setParameter("id", diagnosisReportApplyVo.getId());
	        diagnosisReport = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<DiagnosisReportApplyVo>) diagnosisReport;
	}

}
