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
import VO.LoginVO;
import VO.MedicineVo;
import VO.PatientRegistretionVo;

public class PatientRegistreationDao {
	
	public ArrayList<PatientRegistretionVo> getlastrecord() {
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PatientRegistretionVo ORDER BY id DESC LIMIT 1;");
			patientList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public String insertPatient(PatientRegistretionVo patientRegistretionVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(patientRegistretionVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<PatientRegistretionVo> editPatient(PatientRegistretionVo patientRegistretionVo) {
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PatientRegistretionVo AS n where n.id =:id");
			q.setParameter("id", patientRegistretionVo.getId());
			patientList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public String UpdatePatientProfile(PatientRegistretionVo patientRegistretionVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(patientRegistretionVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

	public String deletePatient(PatientRegistretionVo patientRegistretionVo) {
		String message = null;
		try {
			System.out.println(patientRegistretionVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from PatientRegistretionVo AS n where n.id =:id");
			q.setParameter("id", patientRegistretionVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<PatientRegistretionVo> userNameVerify(PatientRegistretionVo patientRegistretionVo) {
		List<PatientRegistretionVo> li1 = new ArrayList<PatientRegistretionVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PatientRegistretionVo where username  =:user");
			q.setParameter("user", patientRegistretionVo.getUsername());
			li1 = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PatientRegistretionVo>) li1;
	}

	public ArrayList<PatientRegistretionVo> patientRegistrationList(PatientRegistretionVo patientRegistretionVo) {
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PatientRegistretionVo AS d where d.adminid =:id");
			q.setParameter("id", patientRegistretionVo.getAdminid());
			patientList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}

	public ArrayList<PatientRegistretionVo> getPatient(PatientRegistretionVo patientRegistretionVo) {
		List<PatientRegistretionVo> patientList = new ArrayList<PatientRegistretionVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PatientRegistretionVo AS n where n.patientid =:id");
			q.setParameter("id", patientRegistretionVo.getPatientid());
			patientList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PatientRegistretionVo>) patientList;
	}
}
