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

public class DoctorDao  {

	public String doctorInsert(DoctorVo doctorVo, LoginVO loginvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(doctorVo);
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

	public ArrayList<DoctorVo> doctorList(DoctorVo doctorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DoctorVo> doctorList = new ArrayList<DoctorVo>();
		try {
			Query q = session.createQuery("from DoctorVo AS d where d.adminid =:id");
			q.setParameter("id", doctorVo.getAdminid());
			doctorList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
        }
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<DoctorVo>) doctorList;
	}

	public ArrayList<DoctorVo> doctorEdit(DoctorVo doctorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DoctorVo> doctorList = new ArrayList<DoctorVo>();
		try {
			Query q = session.createQuery("from DoctorVo AS d where d.id =:id");
			q.setParameter("id", doctorVo.getId());
			doctorList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
        }
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<DoctorVo>) doctorList;
	}

	public String doctorUpdateProfile(DoctorVo doctorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(doctorVo);
			}
		catch (Exception e) {
			e.printStackTrace();
        }
        finally {
			transaction.commit();
			session.close();
		}
		return chack="Add";
	}

	public String deleteDoctor(DoctorVo doctorVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			System.out.println(doctorVo.getId());
			Query q = session.createQuery("delete from DoctorVo AS d where d.id =:id");
			q.setParameter("id", doctorVo.getId());
			q.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
        }
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public String deleteLogin(LoginVO loginVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			System.out.println(loginVO.getId());
			Query q = session.createQuery("delete from LoginVO AS d where d.doctorid =:id");
			q.setParameter("id", loginVO.getDoctorid());
			q.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
        }
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}
}
