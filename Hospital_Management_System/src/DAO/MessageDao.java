package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.MessageVo;

public class MessageDao{

	public String insertMessage(MessageVo messageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message;
		try {
			session.save(messageVo);
		} catch (Exception e) {
			return message = "error";
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return message = "true";
	}

	public ArrayList<MessageVo> messageList(MessageVo messageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<MessageVo> messageList = new ArrayList<MessageVo>();
		try {
			Query q = session.createQuery("from MessageVo AS d where d.adminid =:id");
			q.setParameter("id", messageVo.getAdminid());
			messageList = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return (ArrayList<MessageVo>) messageList;
	}

	public String messageDelete(MessageVo messageVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		String message = null;
		try {
			Query q = session.createQuery("delete from MessageVo AS n where n.id =:id");
			q.setParameter("id", messageVo.getId());
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
