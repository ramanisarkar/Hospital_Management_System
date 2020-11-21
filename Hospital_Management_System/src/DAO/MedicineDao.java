package DAO;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.DispatchedMedicineVo;
import VO.MedicineVo;

public class MedicineDao  {

	public String medicineInsert(MedicineVo medicine) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(medicine);
	    } catch (Exception e) {
	        return message = "error";
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public ArrayList<MedicineVo> medicineEdit(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
	    try {
	        Query q = session.createQuery("from MedicineVo AS n where n.id =:id");
	        q.setParameter("id", medicineVo.getId());
	        medicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<MedicineVo>) medicineList;
	}

	public String deleteMedicine(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
	    try {
	        System.out.println(medicineVo.getId());
	        Query q = session.createQuery("delete from MedicineVo AS n where n.id =:id");
	        q.setParameter("id", medicineVo.getId());
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

	public String medicineUpdate(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
	    try {
	        session.update(medicineVo);
	        }
	    catch (Exception e) {
	        return chack="error";
	    }
	    return chack="true";
	}

	public ArrayList<MedicineVo> medicineList(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
	    try {
	        Query q = session.createQuery("from MedicineVo AS d where d.adminid =:id");
	        q.setParameter("id", medicineVo.getAdminid());
	        medicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<MedicineVo>) medicineList;
	}

	public ArrayList<MedicineVo> medicineNameChack(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
	    try {
	        Query q = session.createQuery("from MedicineVo AS d where d.medicinename =:name");
	        q.setParameter("name", medicineVo.getMedicinename());
	        medicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<MedicineVo>) medicineList;
	}

	public ArrayList<MedicineVo> medicineIdChack(MedicineVo medicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<MedicineVo> medicineList = new ArrayList<MedicineVo>();
	    try {
	        Query q = session.createQuery("from MedicineVo AS d where d.medicineid =:id");
	        q.setParameter("id", medicineVo.getMedicineid());
	        medicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<MedicineVo>) medicineList;
	}

	public ArrayList<DispatchedMedicineVo> dispatchedMedicineList(DispatchedMedicineVo dispatchedMedicineVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<DispatchedMedicineVo> dispatchedMedicineList = new ArrayList<DispatchedMedicineVo>();
	    try {
	        Query q = session.createQuery("from DispatchedMedicineVo AS d where d.adminid =:id");
	        q.setParameter("id", dispatchedMedicineVo.getAdminid());
	        dispatchedMedicineList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<DispatchedMedicineVo>) dispatchedMedicineList;
	}
}


