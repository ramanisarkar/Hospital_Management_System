package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.InvoiceExpenseVo;
import VO.ParsonRollVo;
import VO.UserRoleVo;

public class ParsonRollDao {

	public String insertUserRole(ParsonRollVo parsonRollVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.save(parsonRollVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return "true";
	}

	public ArrayList<ParsonRollVo> editParsonRole(ParsonRollVo parsonRollVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<ParsonRollVo> parsonRolelist = new ArrayList<ParsonRollVo>();
	    try {
	        Query q = session.createQuery("from ParsonRollVo AS n where n.adminid =:id and userid =:userroleid");
	        q.setParameter("id", parsonRollVo.getAdminid());
	        q.setParameter("userroleid", parsonRollVo.getUserid());
	        parsonRolelist = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (ArrayList<ParsonRollVo>) parsonRolelist;
	}
	public List<Object[]> getListUserRole(UserRoleVo userRoleVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<Object[]> parsonRolelist = new ArrayList<Object[]>();
		System.out.println(userRoleVo.getUser());
	    try {
	    	Query q = session.createSQLQuery("SELECT a.Owndata , a.ViewData , a.AddData , a.EditData , a.DeleteData , a.RollName  , p.User  FROM  userrolepermissions a INNER JOIN userrole p ON a.UserId IN (SELECT Id FROM userrole WHERE USER =:user  AND AdminId = :adminid )");
	        q.setParameter("adminid", userRoleVo.getAdminid());
	        q.setParameter("user", userRoleVo.getUser());
	        parsonRolelist = q.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	    return (List<Object[]>) parsonRolelist;
	}

	public void updateUserRole(ParsonRollVo parsonRollVo) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
	        session.update(parsonRollVo);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    finally {
	        transaction.commit();
	        session.close();
	    }
	}
}
