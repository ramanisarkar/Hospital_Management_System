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
import VO.MedicineVo;
import VO.MessageVo;
import VO.NurseVo;

public class MedicineDao {

	public String medicineInsert(MedicineVo medicine) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(medicine);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<MedicineVo> medicineEdit(MedicineVo medicineVo) {
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from MedicineVo AS n where n.id =:id");
			q.setParameter("id", medicineVo.getId());
			medicineList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<MedicineVo>) medicineList;
	}

	public String deleteMedicine(MedicineVo medicineVo) {
		String message = null;
		try {
			System.out.println(medicineVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from MedicineVo AS n where n.id =:id");
			q.setParameter("id", medicineVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String medicineUpdate(MedicineVo medicineVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(medicineVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

	public ArrayList<MedicineVo> medicineList(MedicineVo medicineVo) {
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from MedicineVo AS d where d.adminid =:id");
			q.setParameter("id", medicineVo.getAdminid());
			medicineList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<MedicineVo>) medicineList;
	}

	public ArrayList<MedicineVo> medicineNameChack(MedicineVo medicineVo) {
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from MedicineVo AS d where d.medicinename =:name");
			q.setParameter("name", medicineVo.getMedicinename());
			medicineList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<MedicineVo>) medicineList;
	}

	public ArrayList<MedicineVo> medicineIdChack(MedicineVo medicineVo) {
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from MedicineVo AS d where d.medicineid =:id");
			q.setParameter("id", medicineVo.getMedicineid());
			medicineList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<MedicineVo>) medicineList;
	}

}


