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
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			Query q = session.createQuery("from BloodManageVo AS d where d.adminid =:id");
			q.setParameter("id", bloodManageVo.getAdminid());
			bloodManageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodManageInsert(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(bloodManageVo);
		} catch (Exception e) {
			return message = "error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public  ArrayList<BloodManageVo> bloodManageEdit(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			Query q = session.createQuery("from BloodManageVo AS n where n.id =:id");
			q.setParameter("id", bloodManageVo.getId());
			bloodManageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodManageUpdate(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(bloodManageVo);
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return chack="true";
	}

	public String deleteBloodManage(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			System.out.println(bloodManageVo.getId());
			Query q = session.createQuery("delete from BloodManageVo AS n where n.id =:id");
			q.setParameter("id", bloodManageVo.getId());
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

	public ArrayList<BloodManageVo> checkBloodStock(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			Query q = session.createQuery("from BloodManageVo AS b where b.bloodgroup =:blood And b.adminid =:id ");
			q.setParameter("blood", bloodManageVo.getBloodgroup());
			q.setParameter("id", bloodManageVo.getAdminid());
			bloodManageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public ArrayList<BloodManageVo> getBloodDonorHistry(BloodManageVo bloodManageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodManageVo> bloodManageList = new ArrayList<BloodManageVo>();
		try {
			Query q = session.createQuery("from BloodManageVo AS b where b.donorid =:id");
			q.setParameter("id", bloodManageVo.getDonorid());
			bloodManageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodManageVo>) bloodManageList;
	}

	public String bloodDonorInsert(BloodOutwordVo bloodOutwordVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(bloodOutwordVo);
		} catch (Exception e) {
			return message = "error";
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public ArrayList<BloodStockVo> bloodGroupList(BloodStockVo bloodStockVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodStockVo> bloodManageList = new ArrayList<BloodStockVo>();
		try {
			Query q = session.createQuery("from BloodStockVo AS n where n.bloodgroup =:blood And n.adminid =:id");
			q.setParameter("blood", bloodStockVo.getBloodgroup());
			q.setParameter("id", bloodStockVo.getAdminid());
			bloodManageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodStockVo>) bloodManageList;
	}

	public String bloodStockUpdate(BloodStockVo bloodStockVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			Query q = session.createQuery("update BloodStockVo as a set a.numberofbags =:bag where a.bloodgroup =:id");
			q.setParameter("id", bloodStockVo.getBloodgroup());
			q.setParameter("bag", bloodStockVo.getNumberofbags());
			q.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return message="true";
	}

	public ArrayList<BloodStockVo> bloodGroupStock(BloodStockVo bloodStockVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodStockVo> bloodManageList = new ArrayList<BloodStockVo>();
		try {
			Query q = session.createQuery("from BloodStockVo AS n where n.adminid =:id");
			q.setParameter("id", bloodStockVo.getAdminid());
			bloodManageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodStockVo>) bloodManageList;
	}

	public ArrayList<BloodOutwordVo> bloodOutwordEdit(BloodOutwordVo bloodOutwordVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BloodOutwordVo> bloodOutwordList = new ArrayList<BloodOutwordVo>();
		try {
			Query q = session.createQuery("from BloodOutwordVo AS n where n.id =:id");
			q.setParameter("id", bloodOutwordVo.getId());
			bloodOutwordList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<BloodOutwordVo>) bloodOutwordList;
	}

	public String bloodOutwordUpdate(BloodOutwordVo bloodOutwordVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(bloodOutwordVo);
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		return chack="true";
	}
	public String deleteBloodOutword(BloodOutwordVo bloodOutwordVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from BloodOutwordVo AS n where n.id =:id");
			q.setParameter("id", bloodOutwordVo.getId());
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
