package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.PatientDoctorVo;

public class PatientDoctorDao {

	public void insert(PatientDoctorVo patientDoctorVo) {
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(patientDoctorVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PatientDoctorVo> patientDoctorList(PatientDoctorVo patientDoctorVo) {
		List<PatientDoctorVo> doctorList = new ArrayList<PatientDoctorVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from PatientDoctorVo AS p where p.patientid =:id");
			q.setParameter("id", patientDoctorVo.getPatientid());
			doctorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<PatientDoctorVo>) doctorList;
	}

}
