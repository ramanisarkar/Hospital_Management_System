package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.BloodManageVo;
import VO.EventForVo;
import VO.EventVo;

public class EventDao {

	public String insertEvent(EventVo eventVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(eventVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String insertEventFor(EventForVo eventForVo) {
		String message;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(eventForVo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public ArrayList<EventForVo> listEventFor(EventForVo eventForVo) {
		List<EventForVo> medicineList = new ArrayList<EventForVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from EventForVo AS d where d.eventid =:id");
			q.setParameter("id", eventForVo.getEventid());
			medicineList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<EventForVo>) medicineList;
	}

	public ArrayList<EventVo> listEvent(EventVo eventVo) {
		List<EventVo> medicineList = new ArrayList<EventVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from EventVo AS d where d.adminid =:id");
			q.setParameter("id", eventVo.getAdminid());
			medicineList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<EventVo>) medicineList;
	}

	public ArrayList<EventVo> editEvent(EventVo eventVo) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<EventForVo> editEventFor(EventForVo eventForVo) {
		List<EventForVo> eventList = new ArrayList<EventForVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from EventForVo AS n where n.eventid =:id");
			q.setParameter("id", eventForVo.getEventid());
			eventList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<EventForVo>) eventList;
	}

	public String deleteEventFor(EventForVo eventForVo) {
		String message = null;
		try {
			System.out.println(eventForVo.getEventid().getId());
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from EventForVo AS d where d.eventid =:id");
			q.setParameter("id", eventForVo.getEventid());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String deleteEvent(EventVo eventVo) {
		String message = null;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("delete from EventVo AS d where d.id =:id");
			q.setParameter("id", eventVo.getId());
			q.executeUpdate();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			return message = "error";
		}
		return message = "true";
	}

	public String updateEvent(EventVo eventVo) {
		String chack;
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.update(eventVo);
			transaction.commit();
			session.close();
			}
		catch (Exception e) {
			return chack="error";
		}
		return chack="true";
	}
}
