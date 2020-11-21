package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DepartmentVo;

public class DepartmentDao  {
	
	public void insertDepartment(DepartmentVo departmentvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(departmentvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
	}

	public ArrayList<DepartmentVo> departmentList(DepartmentVo departmentvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DepartmentVo> depList = new ArrayList<DepartmentVo>();
		try {
			Query q = session.createQuery("from DepartmentVo AS d where d.departmentadminid =:id");
			q.setParameter("id", departmentvo.getDepartmentadminid());
			depList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<DepartmentVo>) depList;
	}


	public ArrayList<DepartmentVo> chackDepartment(DepartmentVo departmentvo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DepartmentVo> depList = new ArrayList<DepartmentVo>();
		try {
			Query q = session.createQuery("from DepartmentVo AS d where d.department =:daepatname and d.departmentadminid =:admin ");
			q.setParameter("daepatname", departmentvo.getDepartment());
			q.setParameter("admin", departmentvo.getDepartmentadminid());
			depList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<DepartmentVo>) depList;
	}

	public String deleteDepartment(DepartmentVo departmentVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from DepartmentVo AS d where d.id =:id");
			q.setParameter("id", departmentVo.getId());
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
}
