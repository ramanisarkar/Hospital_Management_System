package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.CategoryVo;
import VO.MedicineVo;
import VO.NurseVo;

public class CategoryDao{

	public String categoryInsert(CategoryVo categoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(categoryVo);
		} catch (Exception e) {
			return message = "error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}
	public String deleteCategory(CategoryVo categoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from CategoryVo AS d where d.id =:id");
			q.setParameter("id", categoryVo.getId());
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
	public ArrayList<CategoryVo> categoryList(CategoryVo categoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<CategoryVo> categoryList = new ArrayList<CategoryVo>();
		try {
			Query q = session.createQuery("from CategoryVo AS d where d.adminid =:id");
			q.setParameter("id", categoryVo.getAdminid());
			categoryList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<CategoryVo>) categoryList;
	}
	public String deleteMedicine(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from MedicineVo AS d where d.categoryid =:id");
			q.setParameter("id", medicineVo.getCategoryid());
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
