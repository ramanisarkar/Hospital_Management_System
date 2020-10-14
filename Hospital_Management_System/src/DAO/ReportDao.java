package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.ReportVo;

public class ReportDao {

	public ArrayList<ReportVo> reportList(ReportVo reportVo) {
		List<ReportVo> reportList = new ArrayList<ReportVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from ReportVo AS d where d.adminid =:id");
			q.setParameter("id", reportVo.getAdminid());
			reportList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<ReportVo>) reportList;
	}

	public String insertaReport(ReportVo reportVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(reportVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<ReportVo> reportEdit(ReportVo reportVo) {
		List<ReportVo> reportList = new ArrayList<ReportVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from ReportVo AS d where d.id =:id");
			q.setParameter("id", reportVo.getId());
			reportList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<ReportVo>) reportList;
	}

	public String updateReport(ReportVo reportVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(reportVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}

}
