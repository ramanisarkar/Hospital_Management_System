package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.AdminVo;
import VO.AmbulanceVo;
import VO.AssignBedVo;
import VO.BedCategoryVo;
import VO.InstrumentAssignVO;
import VO.InstrumentVO;
import VO.PatientRegistretionVo;

public class InstrumentDao {

	public String insertInstrument(InstrumentVO instrumentVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(instrumentVO);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}

	public ArrayList<InstrumentVO> listInstrument(InstrumentVO instrumentVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InstrumentVO> instrumentList = new ArrayList<InstrumentVO>();
	    try {
	        Query q = session.createQuery("from InstrumentVO AS n where n.adminid =:id");
	        q.setParameter("id", instrumentVO.getAdminid());
	        instrumentList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InstrumentVO>) instrumentList;
	}

	public ArrayList<InstrumentVO> editIstrument(InstrumentVO instrumentVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InstrumentVO> instrumentList = new ArrayList<InstrumentVO>();
		try {
			Query q = session.createQuery("from InstrumentVO AS d where d.id =:id");
			q.setParameter("id", instrumentVO.getId());
			instrumentList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			transaction.commit();
			session.close();
		}
		 return (ArrayList<InstrumentVO>) instrumentList;
	}

	public String updateInstrument(InstrumentVO instrumentVO) {
		// TODO Auto-generated method stub
		return null;
	}

	public String insertInstrumentAssgin(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(instrumentAssignVO);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}

	public ArrayList<InstrumentAssignVO> listInstrumentAssign(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InstrumentAssignVO> instrumentList = new ArrayList<InstrumentAssignVO>();
	    try {
	        Query q = session.createQuery("from InstrumentAssignVO AS n where n.adminid =:id");
	        q.setParameter("id", instrumentAssignVO.getAdminid());
	        instrumentList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InstrumentAssignVO>) instrumentList;
	}

	public ArrayList<InstrumentAssignVO> editIstrumentAssign(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InstrumentAssignVO> instrumentList = new ArrayList<InstrumentAssignVO>();
	    try {
	        Query q = session.createQuery("from InstrumentAssignVO AS n where n.id =:id");
	        q.setParameter("id", instrumentAssignVO.getId());
	        instrumentList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InstrumentAssignVO>) instrumentList;
	}

	public ArrayList<InstrumentAssignVO> checkInstrumentDate(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InstrumentAssignVO> bedList = new ArrayList<InstrumentAssignVO>();
	    try {
			Query q = session.createQuery("FROM InstrumentAssignVO  WHERE instrumnetid =:id AND startdate BETWEEN  :start AND :end OR expectedenddate BETWEEN :start AND :end");
			q.setParameter("id", instrumentAssignVO.getInstrumnetid());
			q.setParameter("start", instrumentAssignVO.getStartdate());
			q.setParameter("end", instrumentAssignVO.getExpectedenddate());
	        bedList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InstrumentAssignVO>) bedList;
	}

	public ArrayList<InstrumentAssignVO> checkInstrumentTime(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InstrumentAssignVO> instrumentList = new ArrayList<InstrumentAssignVO>();
	    try {
			Query q = session.createQuery("FROM InstrumentAssignVO  WHERE instrumnetid =:id AND startdate =:start AND starttime BETWEEN  :stime AND :etime OR expectedendtime BETWEEN :stime AND :etime");
			q.setParameter("id", instrumentAssignVO.getInstrumnetid());
			q.setParameter("start", instrumentAssignVO.getStartdate());
			q.setParameter("stime", instrumentAssignVO.getStarttime());
			q.setParameter("etime", instrumentAssignVO.getExpectedendtime());
			instrumentList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InstrumentAssignVO>) instrumentList;
	}

	public List<Object[]> checkInstrumentAssginHourly(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<Object[]> instrumentList = new ArrayList<Object[]>();
	    try {
			Query q = session.createSQLQuery("SELECT  p.FirstName ,p.PatientId,a.ExpectedEndDate,MIN(ExpectedEndTime) FROM instrumentassign a INNER JOIN patientregistration p ON a.ExpectedEndDate IN (SELECT MIN(ExpectedEndDate) FROM instrumentassign WHERE EndDate IS NULL AND InstrumentId =:id )WHERE EndDate IS NULL AND InstrumentId =:id GROUP BY ExpectedEndTime LIMIT 1");
			q.setParameter("id", instrumentAssignVO.getInstrumnetid());
			instrumentList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (List<Object[]>) instrumentList;
	}

	public List<Object[]> checkInsertInstrumentAssginDaly(InstrumentAssignVO instrumentAssignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<Object[]> instrumentList = new ArrayList<Object[]>();
	    try {
	    	Query q = session.createSQLQuery("SELECT  p.FirstName ,p.PatientId, MIN(ExpectedEndDate) FROM instrumentassign a INNER JOIN patientregistration p ON a.PatientId = p.Id WHERE EndDate IS NULL AND InstrumentId =:idins GROUP BY ExpectedEndDate LIMIT 1");
	    	q.setParameter("idins", instrumentAssignVO.getInstrumnetid());
			instrumentList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (List<Object[]>) instrumentList;
	}


	public String updateInstrumentStock(InstrumentVO instrumentVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update InstrumentVO as a set a.Stock =:stock where a.id =:id");
			q.setParameter("id", instrumentVO.getId());
			q.setParameter("stock", instrumentVO.getStock());
			q.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return "true";
	}

	public String updateInstrumentAssginEndDate(InstrumentAssignVO assignVO) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update InstrumentAssignVO as a set a.enddate =:date where a.id =:id");
			q.setParameter("id", assignVO.getId());
			q.setParameter("date", assignVO.getEnddate());
			q.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return "true";
	}
}
