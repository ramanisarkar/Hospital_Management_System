package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DepartmentVo;

public class DepartmentDao {
	
	public void insertDepartment(DepartmentVo departmentvo) {
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(departmentvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<DepartmentVo> departmentList(DepartmentVo departmentvo) {
		List<DepartmentVo> depList = new ArrayList<DepartmentVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from DepartmentVo AS d where d.departmentadminid =:id");
			q.setParameter("id", departmentvo.getDepartmentadminid());
			depList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<DepartmentVo>) depList;
	}


	public ArrayList<DepartmentVo> chackDepartment(DepartmentVo departmentvo) {
		List<DepartmentVo> depList = new ArrayList<DepartmentVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from DepartmentVo AS d where d.department =:daepatname and d.departmentadminid =:admin ");
			q.setParameter("daepatname", departmentvo.getDepartment());
			q.setParameter("admin", departmentvo.getDepartmentadminid());
			depList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<DepartmentVo>) depList;
	}

	public String deleteDepartment(DepartmentVo departmentVo) {
		String message = null;
		try {
			System.out.println(departmentVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from DepartmentVo AS d where d.id =:id");
			q.setParameter("id", departmentVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
}
