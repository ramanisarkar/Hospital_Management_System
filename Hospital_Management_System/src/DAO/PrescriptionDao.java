package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AccountantStaffVo;
import VO.PrescriptionMedicationVo;
import VO.PrescriptionNoteVo;
import VO.PrescriptionReportVo;
import VO.PrescriptionVo;

public class PrescriptionDao {

	public String insertPriscription(PrescriptionVo prescriptionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(prescriptionVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public void insertPriscriptionMedicine(PrescriptionMedicationVo prescriptionMedicationVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(prescriptionMedicationVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
	}

	public void insertPriscriptionCustomFileds(PrescriptionNoteVo prescriptionNoteVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(prescriptionNoteVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		
	}

	public void insertPriscriptionReport(PrescriptionReportVo prescriptionReportVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(prescriptionReportVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
	}

	public ArrayList<PrescriptionVo> listPrescription(PrescriptionVo prescriptionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PrescriptionVo> prescriptionlist = new ArrayList<PrescriptionVo>();
		try {
			Query q = session.createQuery("from PrescriptionVo AS d where d.adminid =:id");
			q.setParameter("id", prescriptionVo.getAdminid());
			prescriptionlist = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PrescriptionVo>) prescriptionlist;
	}

	public ArrayList<PrescriptionVo> listPatientPrescription(PrescriptionVo prescriptionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PrescriptionVo> prescriptionlist = new ArrayList<PrescriptionVo>();
		try {
			Query q = session.createQuery("from PrescriptionVo AS d where d.adminid =:id and patientid =:patientid");
			q.setParameter("id", prescriptionVo.getAdminid());
			q.setParameter("patientid", prescriptionVo.getPatientid());
			prescriptionlist = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PrescriptionVo>) prescriptionlist;
	}

	public ArrayList<PrescriptionMedicationVo> listPrescriptionMedicine(PrescriptionMedicationVo prescriptionMedicationVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PrescriptionMedicationVo> prescriptionMedicinelist = new ArrayList<PrescriptionMedicationVo>();
		try {
			Query q = session.createQuery("from PrescriptionMedicationVo AS d where d.prescriptionid =:id");
			q.setParameter("id", prescriptionMedicationVo.getPrescriptionid());
			prescriptionMedicinelist = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PrescriptionMedicationVo>) prescriptionMedicinelist;
	}
}
