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

public class CategoryDao {

	public String categoryInsert(CategoryVo categoryVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(categoryVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
	public String deleteCategory(CategoryVo categoryVo) {
		String message = null;
		try {
			System.out.println(categoryVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from CategoryVo AS d where d.id =:id");
			q.setParameter("id", categoryVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
	public ArrayList<CategoryVo> categoryList(CategoryVo categoryVo) {
		List<CategoryVo> categoryList = new ArrayList<CategoryVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from CategoryVo AS d where d.adminid =:id");
			q.setParameter("id", categoryVo.getAdminid());
			categoryList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<CategoryVo>) categoryList;
	}
	public String deleteMedicine(MedicineVo medicineVo) {
		String message = null;
		try {
			System.out.println(medicineVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from MedicineVo AS d where d.categoryid =:id");
			q.setParameter("id", medicineVo.getCategoryid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
		
	}
}
