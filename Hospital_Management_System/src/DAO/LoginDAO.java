package DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import Com.Login;
import VO.AdminVo;
import VO.LoginVO;

public class LoginDAO {
	static Logger logger = Logger.getLogger(Login.class);
	
	public ArrayList<LoginVO> verify(LoginVO v1) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		List<LoginVO> li1 = new ArrayList<LoginVO>();
		try {
			Query q = session.createQuery("from LoginVO where email= :email and password = :password");
			q.setParameter("email", v1.getEmail());
			q.setParameter("password", v1.getPassword());
			li1 = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		
		return (ArrayList<LoginVO>) li1;
	}

	public void logintime(LoginVO login) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			
			String log = "UPDATE LoginVO set lastlogin =:login1 " + "WHERE id =:id1";
			Query query = session.createQuery(log);
			query.setParameter("login1", login.getLastlogin());
			query.setParameter("id1", login.getId());
			int result = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
	}

	public ArrayList<LoginVO> emailverify(LoginVO v1) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<LoginVO> li1 = new ArrayList<LoginVO>();
		try {
			Query q = session.createQuery("from LoginVO where email= :email");
			q.setParameter("email", v1.getEmail());
			li1 = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return (ArrayList<LoginVO>) li1;
	}
	
	public ArrayList<AdminVo> adminVerify(AdminVo v1) {
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		List<AdminVo> li1 = new ArrayList<AdminVo>();
		try {
			System.out.println(v1.getEmail());
			Query q = session.createQuery("from AdminVo where email= :email and password = :password");
			q.setParameter("email", v1.getEmail());
			q.setParameter("password", v1.getPassword());
			li1 = q.list();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			logger.error("databes error"+e.getStackTrace()[1].getLineNumber());
			e.printStackTrace();
			
		}
		finally {
	        transaction.commit();
	        session.close();
	    }

		return (ArrayList<AdminVo>) li1;
	}

	//	public void forgetPasswordCollege(CollegeVo collegevo, LoginVO login) {
//		try {
//			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//			Session session = sessionfactory.openSession();
//			Transaction transaction = session.beginTransaction();
//			String dep = "UPDATE CollegeVo set password =:password1 " + "WHERE email =:email1";
//			Query query = session.createQuery(dep);
//			query.setParameter("password1", collegevo.getPassword());
//			query.setParameter("email1", collegevo.getEmail());
//
//			String log = "UPDATE LoginVO set password =:password1 " + "WHERE email =:email1";
//			Query query1 = session.createQuery(log);
//			query1.setParameter("password1", login.getPassword());
//			query1.setParameter("email1", login.getEmail());
//
//			int result = query.executeUpdate();
//			int result1 = query1.executeUpdate();
//
//			System.out.println("Rows Affected: " + result + "  " + result1);
//			transaction.commit();
//			session.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//

//
	public String loginupdatePassword(LoginVO login) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			String log = "UPDATE LoginVO set password =:password1 " + "WHERE email =:email1";
			Query query1 = session.createQuery(log);
			query1.setParameter("password1", login.getPassword());
			query1.setParameter("email1", login.getEmail());
			int result1 = query1.executeUpdate();

		} catch (Exception e) {
			return chack = "erorr";
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack = "add";

	}

	public String adminLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.adminid =:adminid");
			q.setParameter("adminid", loginvo.getAdminid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}

	public ArrayList<LoginVO> userNameVerify(LoginVO loginvo) {
		List<LoginVO> li1 = new ArrayList<LoginVO>();
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("from LoginVO where username  =:user");
			q.setParameter("user", loginvo.getUsername());
			li1 = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return (ArrayList<LoginVO>) li1;
	}

	public String loginupdateUsername(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			
			String log = "UPDATE LoginVO set username =:user " + "WHERE email =:email1";
			Query query1 = session.createQuery(log);
			query1.setParameter("user", loginvo.getUsername());
			query1.setParameter("email1", loginvo.getEmail());
			query1.executeUpdate();
		} catch (Exception e) {
			return chack = "erorr";
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack = "add";
	}

	public String doctorLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.doctorid =:doctor");
			q.setParameter("doctor", loginvo.getDoctorid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}
	
	public String nurseLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.nurseloginid =:nurse");
			q.setParameter("nurse", loginvo.getNurseloginid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}
	public String supportStaffLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.supportstaffid =:support");
			q.setParameter("support", loginvo.getSupportstaffloginid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}
	public String pharmacistLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.pharmacistloginid =:pharmacist");
			q.setParameter("pharmacist", loginvo.getPharmacistloginid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}
	
	public String laboratoryStaffLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.laboratoryloginid =:laboratory");
			q.setParameter("laboratory", loginvo.getLaboratoryloginid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}
	
	public String accountantStaffLoginUpdate(LoginVO loginvo) {
		String chack;
		SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			Query q = session.createQuery("update LoginVO as a set a.email =:email1 , a.password =:password1 where a.accountantloginid =:accountant");
			q.setParameter("accountant", loginvo.getAccountantloginid());
			q.setParameter("email1", loginvo.getEmail());
			q.setParameter("password1", loginvo.getPassword());
			q.executeUpdate();
			}
		catch (Exception e) {
			return chack="erorr"; 
		}
		finally {
	        transaction.commit();
	        session.close();
	    }
		return chack="add";
	}

//	public void forgetPasswordProfessor(ProfessorVo professorvo, LoginVO login) {
//		try {
//			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//			Session session = sessionfactory.openSession();
//			Transaction transaction = session.beginTransaction();
//			String dep = "UPDATE ProfessorVo set password =:password1 " + "WHERE email =:email1";
//			Query query = session.createQuery(dep);
//			query.setParameter("password1", professorvo.getPassword());
//			query.setParameter("email1", professorvo.getEmail());
//
//			String log = "UPDATE LoginVO set password =:password1 " + "WHERE email =:email1";
//			Query query1 = session.createQuery(log);
//			query1.setParameter("password1", login.getPassword());
//			query1.setParameter("email1", login.getEmail());
//
//			int result = query.executeUpdate();
//			int result1 = query1.executeUpdate();
//
//			System.out.println("Rows Affected: " + result + "  " + result1);
//			transaction.commit();
//			session.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
//
//	public void forgetPasswordStudent(StudentVo studentvo, LoginVO login) {
//		try {
//			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
//			Session session = sessionfactory.openSession();
//			Transaction transaction = session.beginTransaction();
//			String dep = "UPDATE StudentVo set password =:password1 " + "WHERE email =:email1";
//			Query query = session.createQuery(dep);
//			query.setParameter("password1", studentvo.getPassword());
//			query.setParameter("email1", studentvo.getEmail());
//
//			String log = "UPDATE LoginVO set password =:password1 " + "WHERE email =:email1";
//			Query query1 = session.createQuery(log);
//			query1.setParameter("password1", login.getPassword());
//			query1.setParameter("email1", login.getEmail());
//
//			int result = query.executeUpdate();
//			int result1 = query1.executeUpdate();
//
//			System.out.println("Rows Affected: " + result + "  " + result1);
//			transaction.commit();
//			session.close();
//		} catch (Exception e) {
//		}
//	}

	
}
