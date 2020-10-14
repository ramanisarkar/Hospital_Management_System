package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.BloodManageVo;
import VO.BloodOutwordVo;
import VO.BloodStockVo;
import VO.TreatmentVo;

public class BloodManageDao {

	public ArrayList<BloodManageVo> bloodManageList(BloodManageVo bloodManageVo) {
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodManageVo AS d where d.adminid =:id");
			q.setParameter("id", bloodManageVo.getAdminid());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodManageInsert(BloodManageVo bloodManageVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(bloodManageVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public  ArrayList<BloodManageVo> bloodManageEdit(BloodManageVo bloodManageVo) {
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodManageVo AS n where n.id =:id");
			q.setParameter("id", bloodManageVo.getId());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodManageUpdate(BloodManageVo bloodManageVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(bloodManageVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return chack="true";
	}

	public String deleteBloodManage(BloodManageVo bloodManageVo) {
		String message = null;
		try {
			System.out.println(bloodManageVo.getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from BloodManageVo AS n where n.id =:id");
			q.setParameter("id", bloodManageVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<BloodManageVo> checkBloodStock(BloodManageVo bloodManageVo) {
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodManageVo AS b where b.bloodgroup =:blood And b.adminid =:id ");
			q.setParameter("blood", bloodManageVo.getBloodgroup());
			q.setParameter("id", bloodManageVo.getAdminid());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public ArrayList<BloodManageVo> getBloodDonorHistry(BloodManageVo bloodManageVo) {
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			System.out.println(bloodManageVo.getDonorid());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodManageVo AS b where b.donorid =:id");
			q.setParameter("id", bloodManageVo.getDonorid());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodDonorInsert(BloodOutwordVo bloodOutwordVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(bloodOutwordVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<BloodStockVo> bloodGroupList(BloodStockVo bloodStockVo) {
		List<BloodStockVo> bloodManageList = new ArrayList<BloodStockVo>();
		try {
			System.out.println(bloodStockVo.getBloodgroup());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodStockVo AS n where n.bloodgroup =:blood And n.adminid =:id");
			q.setParameter("blood", bloodStockVo.getBloodgroup());
			q.setParameter("id", bloodStockVo.getAdminid());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodStockVo>) bloodManageList;
	}

	public String bloodStockUpdate(BloodStockVo bloodStockVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("update BloodStockVo as a set a.numberofbags =:bag where a.bloodgroup =:id");
			q.setParameter("id", bloodStockVo.getBloodgroup());
			q.setParameter("bag", bloodStockVo.getNumberofbags());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message="true";
	}

	public ArrayList<BloodStockVo> bloodGroupStock(BloodStockVo bloodStockVo) {
		List<BloodStockVo> bloodManageList = new ArrayList<BloodStockVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodStockVo AS n where n.adminid =:id");
			q.setParameter("id", bloodStockVo.getAdminid());
			bloodManageList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodStockVo>) bloodManageList;
	}

	public ArrayList<BloodOutwordVo> bloodOutwordEdit(BloodOutwordVo bloodOutwordVo) {
		List<BloodOutwordVo> bloodOutwordList = new ArrayList<BloodOutwordVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from BloodOutwordVo AS n where n.id =:id");
			q.setParameter("id", bloodOutwordVo.getId());
			bloodOutwordList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<BloodOutwordVo>) bloodOutwordList;
	}

	public String bloodOutwordUpdate(BloodOutwordVo bloodOutwordVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(bloodOutwordVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return chack="true";
	}
	public String deleteBloodOutword(BloodOutwordVo bloodOutwordVo) {
		String message = null;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from BloodOutwordVo AS n where n.id =:id");
			q.setParameter("id", bloodOutwordVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}
}
