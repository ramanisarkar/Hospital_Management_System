package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DepartmentVo;
import VO.SpecializationVo;

public class SpecializationDao {

	public ArrayList<SpecializationVo> chackDepartment(SpecializationVo specializationVo) {
		List<SpecializationVo> sepList = new ArrayList<SpecializationVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session
					.createQuery("from SpecializationVo AS d where d.specialization =:special and d.adminid =:admin ");
			q.setParameter("special", specializationVo.getSpecialization());
			q.setParameter("admin", specializationVo.getAdminid());
			sepList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<SpecializationVo>) sepList;
	}

	public ArrayList<SpecializationVo> specializationList(SpecializationVo specializationVo) {
		List<SpecializationVo> specializationList = new ArrayList<SpecializationVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from SpecializationVo AS d where d.adminid =:id");
			q.setParameter("id", specializationVo.getAdminid());
			specializationList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<SpecializationVo>) specializationList;
	}

	public void insertSpecialization(SpecializationVo specializationVo) {
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(specializationVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String deleteSpecailization(SpecializationVo specializationVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from SpecializationVo AS d where d.id =:id");
			q.setParameter("id", specializationVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<SpecializationVo> editSpecailization(SpecializationVo specializationVo) {
		List<SpecializationVo> specializationList = new ArrayList<SpecializationVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from SpecializationVo AS d where d.id =:id");
			q.setParameter("id", specializationVo.getId());
			specializationList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<SpecializationVo>) specializationList;
	}

	public String updateSpecailization(SpecializationVo specializationVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			String log = "UPDATE SpecializationVo set specialization =:name " + "WHERE id =:id";
			Query query1 = session.createQuery(log);
			query1.setParameter("name", specializationVo.getSpecialization());
			query1.setParameter("id", specializationVo.getId());
			query1.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<SpecializationVo> searchSpecailization(SpecializationVo specializationVo) {
		List<SpecializationVo> specializationList = new ArrayList<SpecializationVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from SpecializationVo AS d where d.departmentid =:depid");
			q.setParameter("depid", specializationVo.getDepartmentid());
			specializationList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<SpecializationVo>) specializationList;
	}
}
