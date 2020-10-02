package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DoctorVo;
import VO.LoginVO;
import VO.SpecializationVo;

public class DoctorDao {

	public String doctorInsert(DoctorVo doctorVo, LoginVO loginvo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(doctorVo);
			session.save(loginvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<DoctorVo> doctorList(DoctorVo doctorVo) {
		List<DoctorVo> doctorList = new ArrayList<DoctorVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from DoctorVo AS d where d.adminid =:id");
			q.setParameter("id", doctorVo.getAdminid());
			doctorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<DoctorVo>) doctorList;
	}

	public ArrayList<DoctorVo> doctorEdit(DoctorVo doctorVo) {
		List<DoctorVo> doctorList = new ArrayList<DoctorVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from DoctorVo AS d where d.id =:id");
			q.setParameter("id", doctorVo.getId());
			doctorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<DoctorVo>) doctorList;
	}

	public String doctorUpdateProfile(DoctorVo doctorVo) {
		System.out.println(doctorVo.getEmail()+"  "+doctorVo.getPassword());
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(doctorVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="Add";
	}

	public String deleteDoctor(DoctorVo doctorVo) {
		String message = null;
		try {
			System.out.println(doctorVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from DoctorVo AS d where d.id =:id");
			q.setParameter("id", doctorVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String deleteLogin(LoginVO loginVO) {
		String message = null;
		try {
			System.out.println(loginVO.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from LoginVO AS d where d.doctorid =:id");
			q.setParameter("id", loginVO.getDoctorid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

}
