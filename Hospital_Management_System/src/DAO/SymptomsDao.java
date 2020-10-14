package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.SymptomsVo;

public class SymptomsDao {

	public String insertaSymptoms(SymptomsVo symptomsVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(symptomsVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<SymptomsVo> symptomsList(SymptomsVo symptomsVo) {
		List<SymptomsVo> reportList = new ArrayList<SymptomsVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from SymptomsVo AS d where d.adminid =:id");
			q.setParameter("id", symptomsVo.getAdminid());
			reportList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<SymptomsVo>) reportList;
	}

	public String deleteSymptomes(SymptomsVo symptomsVo) {
		String message = null;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from SymptomsVo AS n where n.id =:id");
			q.setParameter("id", symptomsVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

}
