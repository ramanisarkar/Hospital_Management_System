package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.InvoiceCollectVo;
import VO.InvoiceExpenseLabelVo;
import VO.InvoiceExpenseVo;
import VO.InvoiceHospitalVo;
import VO.InvoiceIncomeLabelVo;
import VO.InvoiceIncomeVo;
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

	public void insertInvoiceChages(InvoiceCollectVo collectVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
	    try {
	        session.save(collectVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public ArrayList<InvoiceHospitalVo> editInvoice(InvoiceHospitalVo invoiceHospitalVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InvoiceHospitalVo> invoiceList = new ArrayList<InvoiceHospitalVo>();
	    try {
	        Query q = session.createQuery("from InvoiceHospitalVo AS n where n.id =:id");
	        q.setParameter("id", invoiceHospitalVo.getId());
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

	public String UpdateInvoice(InvoiceHospitalVo invoiceHospitalVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update InvoiceHospitalVo set status =:st , totalamount =:total , paidamount =:paid where id =:id");
			q.setParameter("id", invoiceHospitalVo.getId());
			q.setParameter("total", invoiceHospitalVo.getTotalamount());
			q.setParameter("st", invoiceHospitalVo.getStatus());
			q.setParameter("paid", invoiceHospitalVo.getPaidamount());
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

	public String insertInvoiceIncome(InvoiceIncomeVo invoiceIncomeVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(invoiceIncomeVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}

	public ArrayList<InvoiceIncomeLabelVo> listOfInvoiceIncome(InvoiceIncomeLabelVo invoiceIncomeLabelVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InvoiceIncomeLabelVo> incomeList = new ArrayList<InvoiceIncomeLabelVo>();
	    try {
	        Query q = session.createQuery("from InvoiceIncomeLabelVo AS n where n.adminid =:id");
	        q.setParameter("id", invoiceIncomeLabelVo.getAdminid());
	        incomeList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InvoiceIncomeLabelVo>) incomeList;
	}

	public String insertInvoiceIncomeLabel(InvoiceIncomeLabelVo invoiceIncomeLabelVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(invoiceIncomeLabelVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}

	public String insertExpense(InvoiceExpenseVo invoiceExpenseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(invoiceExpenseVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}

	public String insertExpenseLabel(InvoiceExpenseLabelVo invoiceExpenseLabelVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(invoiceExpenseLabelVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}
	
	public ArrayList<InvoiceExpenseVo> listOfInvoiceExpense(InvoiceExpenseVo invoiceExpenseVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InvoiceExpenseVo> expenseList = new ArrayList<InvoiceExpenseVo>();
	    try {
	        Query q = session.createQuery("from InvoiceExpenseVo AS n where n.adminid =:id");
	        q.setParameter("id", invoiceExpenseVo.getAdminid());
	        expenseList = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InvoiceExpenseVo>) expenseList;
	}

	public ArrayList<InvoiceCollectVo> listOfInvoiceCharges(InvoiceCollectVo invoiceCollectVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<InvoiceCollectVo> invoiceChargeList = new ArrayList<InvoiceCollectVo>();
	    try {
	        Query invoiceChargeCollectList = session.createQuery("from InvoiceCollectVo AS n where n.invoiceid =:id");
	        invoiceChargeCollectList.setParameter("id", invoiceCollectVo.getInvoiceid());
	        invoiceChargeList = invoiceChargeCollectList.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<InvoiceCollectVo>) invoiceChargeList;
	}
}
