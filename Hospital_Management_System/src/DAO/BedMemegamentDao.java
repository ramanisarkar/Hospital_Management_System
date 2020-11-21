package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AddBedVo;
import VO.AssginBedNurseVo;
import VO.AssignBedVo;
import VO.BedCategoryVo;
import VO.TransferBedVo;

public class BedMemegamentDao {

	public String insertBedCategory(BedCategoryVo bedCategoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(bedCategoryVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";

	}

	public ArrayList<BedCategoryVo> editBedCategory(BedCategoryVo bedCategoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BedCategoryVo> bedList = new ArrayList<BedCategoryVo>();
	    try {
	        Query q = session.createQuery("from BedCategoryVo AS n where n.id =:id");
	        q.setParameter("id", bedCategoryVo.getId());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<BedCategoryVo>) bedList;
	}

	public ArrayList<BedCategoryVo> listBedCategory(BedCategoryVo bedCategoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<BedCategoryVo> bedList = new ArrayList<BedCategoryVo>();
	    try {
	        Query q = session.createQuery("from BedCategoryVo AS n where n.adminid =:id");
	        q.setParameter("id", bedCategoryVo.getAdminid());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<BedCategoryVo>) bedList;
	}

	public String updateBedMenegamen(BedCategoryVo bedCategoryVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.update(bedCategoryVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public String insertAddBed(AddBedVo addBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(addBedVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public ArrayList<AddBedVo> listAddBed(AddBedVo addBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AddBedVo> bedList = new ArrayList<AddBedVo>();
	    try {
	        Query q = session.createQuery("from AddBedVo AS n where n.adminid =:id");
	        q.setParameter("id", addBedVo.getAdminid());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AddBedVo>) bedList;
	}

	public ArrayList<AddBedVo> editAddBed(AddBedVo addBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AddBedVo> bedList = new ArrayList<AddBedVo>();
	    try {
	        Query q = session.createQuery("from AddBedVo AS n where n.id =:id");
	        q.setParameter("id", addBedVo.getId());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AddBedVo>) bedList;
	}

	public String updateAddBed(AddBedVo addBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.update(addBedVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public ArrayList<AddBedVo> checkAddBed(AddBedVo addBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AddBedVo> bedList = new ArrayList<AddBedVo>();
	    try {
	        Query q = session.createQuery("from AddBedVo AS n where n.bedcategoryid =:id and bednumber =:number");
	        q.setParameter("id", addBedVo.getBedcategoryid());
	        q.setParameter("number", addBedVo.getBednumber());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AddBedVo>) bedList;
	}

	public String insertAssignBed(AssignBedVo assignBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(assignBedVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public void insertAssignBedNurse(AssginBedNurseVo assginBedNurseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
	    try {
	        session.save(assginBedNurseVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public ArrayList<AssignBedVo> listAssignBed(AssignBedVo assignBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AssignBedVo> bedList = new ArrayList<AssignBedVo>();
	    try {
	        Query q = session.createQuery("from AssignBedVo AS n where n.adminid =:id");
	        q.setParameter("id", assignBedVo.getAdminid());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AssignBedVo>) bedList;
	}

	public String insertTransferBed(TransferBedVo transferBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(transferBedVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public ArrayList<AssignBedVo> editAssginBed(AssignBedVo assignBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AssignBedVo> bedList = new ArrayList<AssignBedVo>();
	    try {
	        Query q = session.createQuery("from AssignBedVo AS n where n.id =:id");
	        q.setParameter("id", assignBedVo.getId());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AssignBedVo>) bedList;
	}

	public ArrayList<AddBedVo> listAddBedNumber(AddBedVo addBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AddBedVo> bedList = new ArrayList<AddBedVo>();
	    try {
	        Query q = session.createQuery("from AddBedVo AS n where bedcategoryid =:bedid");
	        q.setParameter("bedid", addBedVo.getBedcategoryid());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AddBedVo>) bedList;
	}

	public ArrayList<AssignBedVo> checkAssginBed(AssignBedVo assignBedVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AssignBedVo> bedList = new ArrayList<AssignBedVo>();
	    try {
			Query q = session.createQuery("FROM AssignBedVo  WHERE bedId =:id AND allotmentdate BETWEEN  :start AND :end OR expectedDischargeDate BETWEEN :start AND :end");
			q.setParameter("id", assignBedVo.getBedid());
			q.setParameter("start", assignBedVo.getAllotmentdate());
			q.setParameter("end", assignBedVo.getExpecteddischargedate());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<AssignBedVo>) bedList;
	}
}
