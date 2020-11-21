package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.InvoiceHospitalVo;
import VO.PatientChargesHistoryVo;
import VO.PatientRegistretionVo;

public class InvoiceHospitalDao {

	public ArrayList<InvoiceHospitalVo> getlastrecord() {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InvoiceHospitalVo> invoiceList = new ArrayList<InvoiceHospitalVo>();
		try {
			Query q = session.createQuery("from InvoiceHospitalVo ORDER BY id DESC LIMIT 1;");
			invoiceList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<InvoiceHospitalVo>) invoiceList;
	}

	public String insertInvoice(InvoiceHospitalVo invoiceHospitalVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
	    try {
	        session.save(invoiceHospitalVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return message = "true";
	}

	public ArrayList<InvoiceHospitalVo> listOfInvoice(InvoiceHospitalVo invoiceHospitalVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InvoiceHospitalVo> invoiceList = new ArrayList<InvoiceHospitalVo>();
	    try {
	        Query q = session.createQuery("from InvoiceHospitalVo AS n where n.adminid =:id");
	        q.setParameter("id", invoiceHospitalVo.getAdminid());
	        invoiceList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InvoiceHospitalVo>) invoiceList;
	}

}
