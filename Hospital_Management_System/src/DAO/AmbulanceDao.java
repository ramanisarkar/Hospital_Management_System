package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AmbulanceVo;
import VO.BloodDonorVo;
import VO.BloodManageVo;
import VO.TreatmentVo;

public class AmbulanceDao {

	public ArrayList<AmbulanceVo> ambulanceList(AmbulanceVo ambulanceVo) {
		System.out.println(ambulanceVo.getAdminid());
		List<AmbulanceVo> ambulanceList = new ArrayList<AmbulanceVo>();
		System.out.println(ambulanceVo.getAdminid());
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from AmbulanceVo AS d where d.adminid =:id");
			q.setParameter("id", ambulanceVo.getAdminid());
			ambulanceList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<AmbulanceVo>) ambulanceList;
	}

	public String ambulanceInsert(AmbulanceVo ambulanceVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(ambulanceVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public  ArrayList<AmbulanceVo> ambulanceEdit(AmbulanceVo ambulanceVo) {
		List<AmbulanceVo> ambulanceList = new ArrayList<AmbulanceVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from AmbulanceVo AS n where n.id =:id");
			q.setParameter("id", ambulanceVo.getId());
			ambulanceList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<AmbulanceVo>) ambulanceList;
	}

	public String ambulanceUpdate(AmbulanceVo ambulanceVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(ambulanceVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

	public String deleteAmbulance(AmbulanceVo ambulanceVo) {
		String message = null;
		try {
			System.out.println(ambulanceVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from AmbulanceVo AS n where n.id =:id");
			q.setParameter("id", ambulanceVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
}
