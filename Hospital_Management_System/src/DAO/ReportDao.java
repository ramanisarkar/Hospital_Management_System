package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.ReportVo;

public class ReportDao{

	public ArrayList<ReportVo> reportList(ReportVo reportVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<ReportVo> reportList = new ArrayList<ReportVo>();
		try {
			Query q = session.createQuery("from ReportVo AS d where d.adminid =:id");
			q.setParameter("id", reportVo.getAdminid());
			reportList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<ReportVo>) reportList;
	}

	public String insertaReport(ReportVo reportVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(reportVo);
		} catch (Exception e) {
			return message = "error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return message = "true";
	}

	public ArrayList<ReportVo> reportEdit(ReportVo reportVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<ReportVo> reportList = new ArrayList<ReportVo>();
		try {
			Query q = session.createQuery("from ReportVo AS d where d.id =:id");
			q.setParameter("id", reportVo.getId());
			reportList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
			transaction.commit();
			session.close();
		}
		return (ArrayList<ReportVo>) reportList;
	}

	public String updateReport(ReportVo reportVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String chack;
		try {
			session.update(reportVo);
			}
		catch (Exception e) {
			return chack="error";
		}
        finally {
			transaction.commit();
			session.close();
		}
		return chack="true";
	}

	public String deleteReport(ReportVo reportVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from ReportVo AS n where n.id =:id");
			q.setParameter("id", reportVo.getId());
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
