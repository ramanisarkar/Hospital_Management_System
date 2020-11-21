package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AccountantStaffVo;
import VO.AmbulanceVo;
import VO.DiagnosisReportAddVo;
import VO.DiagnosisReportApplyVo;
import VO.LoginVO;
import VO.MedicineVo;
import VO.PatientRegistretionVo;

public class PatientRegistreationDao  {
	
	public ArrayList<PatientRegistretionVo> getlastrecord() {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			Query q = session.createQuery("from PatientRegistretionVo ORDER BY id DESC LIMIT 1;");
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public String insertPatient(PatientRegistretionVo patientRegistretionVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(patientRegistretionVo);
			session.save(loginvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public ArrayList<PatientRegistretionVo> editPatient(PatientRegistretionVo patientRegistretionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			Query q = session.createQuery("from PatientRegistretionVo AS n where n.id =:id");
			q.setParameter("id", patientRegistretionVo.getId());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public String UpdatePatientProfile(PatientRegistretionVo patientRegistretionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(patientRegistretionVo);
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

	public String deletePatient(PatientRegistretionVo patientRegistretionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from PatientRegistretionVo AS n where n.id =:id");
			q.setParameter("id", patientRegistretionVo.getId());
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

	public ArrayList<PatientRegistretionVo> userNameVerify(PatientRegistretionVo patientRegistretionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientRegistretionVo> li1 = new ArrayList<PatientRegistretionVo>();
		try {
			Query q = session.createQuery("from PatientRegistretionVo where username  =:user");
			q.setParameter("user", patientRegistretionVo.getUsername());
			li1 = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientRegistretionVo>) li1;
	}

	public ArrayList<PatientRegistretionVo> patientRegistrationList(PatientRegistretionVo patientRegistretionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println("------------------");
		System.out.println(patientRegistretionVo.getAdminid().getId());
		System.out.println("------------------");
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			Query q = session.createQuery("from PatientRegistretionVo AS n where n.adminid =:id");
			q.setParameter("id", patientRegistretionVo.getAdminid());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public ArrayList<PatientRegistretionVo> getPatient(PatientRegistretionVo patientRegistretionVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			Query q = session.createQuery("from PatientRegistretionVo AS n where n.id =:id");
			q.setParameter("id", patientRegistretionVo.getId());
			patientList = q.list();
			System.out.println(patientList);
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public void diagnosisReportInsert(DiagnosisReportAddVo diagnosisReportAddVo, DiagnosisReportApplyVo diagnosisReportApplyVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(diagnosisReportAddVo);
			session.save(diagnosisReportApplyVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
	}
}
