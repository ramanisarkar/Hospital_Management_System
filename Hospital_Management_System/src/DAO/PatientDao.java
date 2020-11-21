package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.CommonDataVo;
import VO.PatientDoctorVo;
import VO.PatientGuardianInfo;
import VO.PatientOtherInfo;

public class PatientDao {

	public ArrayList<PatientOtherInfo> patientList(PatientOtherInfo patientVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientOtherInfo> patientList = new ArrayList<PatientOtherInfo>();
		try {
			
			Query q = session.createQuery("from PatientOtherInfo AS d where d.adminid =:id");
			q.setParameter("id", patientVo.getAdminid());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}

		return (ArrayList<PatientOtherInfo>) patientList;
	}

//	public ArrayList<PatientVo> getlastrecord() {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		List<PatientVo> patientList = new ArrayList<PatientVo>();
//		try {
//			Query q = session.createQuery("from PatientVo ORDER BY id DESC LIMIT 1;");
//			patientList = q.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//
//		return (ArrayList<PatientVo>) patientList;
//	}
//
//
//
//	public ArrayList<PatientVo> editPatient(PatientVo patientVo) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		List<PatientVo> patientList = new ArrayList<PatientVo>();
//		try {
//			Query q = session.createQuery("from PatientVo AS n where n.id =:id");
//			q.setParameter("id", patientVo.getId());
//			patientList = q.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//		return (ArrayList<PatientVo>) patientList;
//	}
//
//	public String patientUpdateProfile(PatientVo patientVo) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		String chack;
//		try {
//			session.update(patientVo);
//			}
//		catch (Exception e) {
//			return chack="error";
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//		return chack="Add";
//	}
//
//	public String deletePatient(PatientVo patientVo) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		String message = null;
//		try {
//			Query q = session.createQuery("delete from PatientVo AS p where p.id =:id");
//			q.setParameter("id", patientVo.getDoctorid());
//			q.executeUpdate();
//		} catch (Exception e) {
//			return message = "error";
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//		return message = "true";
//	}
//	
//	public String deleteLogin(LoginVO loginVO) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		String message = null;
//		try {
//			Query q = session.createQuery("delete from LoginVO AS d where d.patientloginid =:id");
//			q.setParameter("id", loginVO.getPatientloginid());
//			q.executeUpdate();
//		} catch (Exception e) {
//			return message = "error";
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//		return message = "true";
//	}
//
//	public ArrayList<PatientVo> getlistofpatient(PatientVo patientVo) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		List<PatientVo> patientList = new ArrayList<PatientVo>();
//		try {
//			Query q = session.createQuery("from PatientVo AS n where n.patientregistreationid =:id");
//			q.setParameter("id", patientVo.getPatientregistreationid());
//			patientList = q.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//		return (ArrayList<PatientVo>) patientList;
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

//	public ArrayList<OutPatientVo> outPatientChack(OutPatientVo outPatientVo) {
//		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionfactory.openSession();
//		Transaction transaction = session.beginTransaction();
//		List<OutPatientVo> patientList = new ArrayList<OutPatientVo>();
//		try {
//			Query q = session.createQuery("from OutPatientVo AS n where n.patientregistreation =:id and adminid =:adminid");
//			q.setParameter("id", outPatientVo.getPatientregistreation());
//			q.setParameter("adminid", outPatientVo.getAdminid());
//			patientList = q.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//        finally {
//			transaction.commit();
//			session.close();
//		}
//		return (ArrayList<OutPatientVo>) patientList;
//	}

	public void deletePatientSymptomes(CommonDataVo commonDataVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from CommonDataVo AS d where d.symptomspatientid =:id");
			q.setParameter("id", commonDataVo.getSymptomspatientid());
			q.executeUpdate();
		} catch (Exception e) {
		}
        finally {
			transaction.commit();
			session.close();
		}
	}

	public String patientInsert(PatientOtherInfo patientOtherInfo, PatientGuardianInfo patientGuardianInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(patientOtherInfo);
			session.save(patientGuardianInfo);
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public ArrayList<PatientDoctorVo> checkPatientDoctor(PatientDoctorVo patientVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientDoctorVo> patientList = new ArrayList<PatientDoctorVo>();
		try {
			Query q = session.createQuery("from PatientVo AS n where n.doctorid =:id and n.patienttype =:type and adminid =:adminid");
			q.setParameter("id", patientVo.getDoctorid());
			q.setParameter("type", patientVo.getPatienttype());
			q.setParameter("adminid", patientVo.getAdminid());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientDoctorVo>) patientList;
	}

	public void patientDoctorInsert(PatientDoctorVo patientVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(patientVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
	}

	public ArrayList<PatientOtherInfo> patientCheck(PatientOtherInfo patientOtherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientOtherInfo> patientList = new ArrayList<PatientOtherInfo>();
		try {
			Query q = session.createQuery("from PatientVo AS n where patientregistrationid =:patientid and adminid =:adminid");
			q.setParameter("patientid", patientOtherInfo.getPatientregistrationid());
			q.setParameter("adminid", patientOtherInfo.getAdminid());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientOtherInfo>) patientList;
	}

	public String patientUpdate(PatientOtherInfo patientOtherInfo, PatientGuardianInfo patientGuardianInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(patientOtherInfo);
			session.update(patientGuardianInfo);
			}
		catch (Exception e) {
			return chack="error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return chack="Add";
	}

	public ArrayList<PatientOtherInfo> guardianCheck(PatientGuardianInfo patientGuardianInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientOtherInfo> patientList = new ArrayList<PatientOtherInfo>();
		try {
			Query q = session.createQuery("from PatientVo AS n where patientregistrationid =:patientid and adminid =:adminid");
			q.setParameter("patientid", patientGuardianInfo.getPatientotherinfoid());
			q.setParameter("adminid", patientGuardianInfo.getAdminid());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientOtherInfo>) patientList;
	}

	public String outPatientInsert(PatientOtherInfo patientOtherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(patientOtherInfo);
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public String outPatientUpdate(PatientOtherInfo patientOtherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(patientOtherInfo);
			}
		catch (Exception e) {
			return chack="error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return chack="Add";
	}

	public ArrayList<PatientOtherInfo> inPatientList(PatientOtherInfo patientOtherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<PatientOtherInfo> patientList = new ArrayList<PatientOtherInfo>();
		try {
			Query q = session.createQuery("from PatientOtherInfo AS n where patienttype =:patientType and adminid =:adminId");
			q.setParameter("patientType", patientOtherInfo.getPatienttype());
			q.setParameter("adminId", patientOtherInfo.getAdminid());
			patientList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<PatientOtherInfo>) patientList;
	}

	public void patientUpdateStatus(PatientOtherInfo otherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update PatientOtherInfo as a set a.status =:status where a.patientregistrationid=:id");
			q.setParameter("id", otherInfo.getPatientregistrationid());
			q.setParameter("status", otherInfo.getStatus());
			q.executeUpdate();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
	}
}
