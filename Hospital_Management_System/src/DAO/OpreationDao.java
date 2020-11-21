package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.CommonDataVo;
import VO.OperationVo;
import VO.OpreationAddVo;
import VO.PatientOtherInfo;

public class OpreationDao {

	public void insertOpreationAdd(OpreationAddVo opreationAddVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
	    try {
	        session.save(opreationAddVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public String insertOpreationApply(OperationVo operationVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(operationVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public void insertOpreationApplyDoctor(CommonDataVo commonDataVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
	    try {
	        session.save(commonDataVo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public void updatePatientStatus(PatientOtherInfo otherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update PatientOtherInfo as a set a.status =:status where a.patientregistrationid =:id");
			q.setParameter("status", otherInfo.getStatus());
			q.setParameter("id", otherInfo.getPatientregistrationid());
			q.executeUpdate();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public ArrayList<OpreationAddVo> editOperationAdd(OpreationAddVo otherInfo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<OpreationAddVo> operationList = new ArrayList<OpreationAddVo>();
	    try {
	        Query q = session.createQuery("from OpreationAddVo AS n where n.id =:id");
	        q.setParameter("id", otherInfo.getId());
	        operationList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<OpreationAddVo>) operationList;
	}

	public ArrayList<OpreationAddVo> operationList(OpreationAddVo opreationAddVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<OpreationAddVo> operationList = new ArrayList<OpreationAddVo>();
	    try {
	        Query q = session.createQuery("from OpreationAddVo AS n where n.adminid =:id");
	        q.setParameter("id", opreationAddVo.getAdminid());
	        operationList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<OpreationAddVo>) operationList;
	}

	public ArrayList<OpreationAddVo> operationEdit(OpreationAddVo opreationAddVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<OpreationAddVo> operationList = new ArrayList<OpreationAddVo>();
	    try {
	        Query q = session.createQuery("from OpreationAddVo AS n where n.id =:id");
	        q.setParameter("id", opreationAddVo.getId());
	        operationList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<OpreationAddVo>) operationList;
	}

	public ArrayList<OperationVo> operationApplyList(OperationVo operationVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<OperationVo> operationList = new ArrayList<OperationVo>();
	    try {
	        Query q = session.createQuery("from OperationVo AS n where n.adminid =:id");
	        q.setParameter("id", operationVo.getAdminid());
	        operationList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<OperationVo>) operationList;
	}

	public ArrayList<CommonDataVo> doctorList(CommonDataVo commonDataVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<CommonDataVo> doctorList = new ArrayList<CommonDataVo>();
	    try {
	        Query q = session.createQuery("from CommonDataVo AS n where n.opreationid =:id");
	        q.setParameter("id", commonDataVo.getOpreationid());
	        doctorList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<CommonDataVo>) doctorList;
	}
}
