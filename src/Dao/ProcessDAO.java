package Dao;

import java.util.Date;
import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import Model.Process;

/**
 * A data access object (DAO) providing persistence and search support for
 * Process entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Model.Process
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ProcessDAO {
	private static final Logger log = LoggerFactory.getLogger(ProcessDAO.class);
	// property constants
	public static final String INPUT = "input";
	public static final String OUTPUT = "output";
	public static final String CONTRIBUTOR = "contributor";
	public static final String STATE = "state";
	public static final String RELATIONSHIP = "relationship";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Process transientInstance) {
		log.debug("saving Process instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Process persistentInstance) {
		log.debug("deleting Process instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public void deleteByName(String name){
		log.debug("deleting Process instance");
		Process p = findByName(name);
		delete(p);
	}
	
	public Process findById(java.lang.String id) {
		log.debug("getting Process instance with id: " + id);
		try {
			Process instance = (Process) getCurrentSession().get("Dao.Process",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Process> findByExample(Process instance) {
		log.debug("finding Process instance by example");
		try {
			List<Process> results = (List<Process>) getCurrentSession()
					.createCriteria("Dao.Process").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Process instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Process as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public Process findByName(String name) {
		String queryString = "";
		queryString = "from Process p where p.name = '"  +name+"'";
		Query queryObject = getCurrentSession().createQuery(queryString);
		if(queryObject.list()!=null){
			return (Process) queryObject.list().get(0);}
		else{ return null;}
	}

	public List<Process> findByInput(Object input) {
		return findByProperty(INPUT, input);
	}

	public List<Process> findByOutput(Object output) {
		return findByProperty(OUTPUT, output);
	}

	public List<Process> findByContributor(Object contributor) {
		return findByProperty(CONTRIBUTOR, contributor);
	}

	public List<Process> findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List<Process> findByRelationship(Object relationship) {
		return findByProperty(RELATIONSHIP, relationship);
	}
	
	public List<Process> findByNameInputOutput(String name, String input,
			String output){
		String queryString = "";
		//000
		if(name=="" && input == "" && output == ""){
			queryString = "from Process";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		}
		//100
		else if(name!="" && input == "" && output == ""){
			queryString = "from Process p where p.name = '"  +name+"'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		}
		//010
		else if(name =="" && input != "" && output == "")
			return  findByInput(input);
		//001
		else if(name =="" && input == "" && output != "")
			return  findByOutput(output);
		//110
		else if(name !="" && input != "" && output == ""){
			queryString = "from Process p where p.name = '"  +name+"' and p.input= '"+input+"'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		}
		//101
		else if(name !="" && input == "" && output != ""){
			queryString = "from Process p where p.name = '"  +name+"' and p.output= '"+output+"'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		}
		//011
		else if(name =="" && input != "" && output != ""){
			queryString = "from Process p where p.output = '"  +output+"' and p.input= '"+input+"'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		}
		//111
		else {
			queryString = "from Process p where p.output = '"  +output+"' and p.input= '"+input+"'and p.name= '"+name+"'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		}	
	}



	public List findAll() {
		log.debug("finding all Process instances");
		try {
			String queryString = "from Process";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Process merge(Process detachedInstance) {
		log.debug("merging Process instance");
		try {
			Process result = (Process) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Process instance) {
		log.debug("attaching dirty Process instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Process instance) {
		log.debug("attaching clean Process instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProcessDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProcessDAO) ctx.getBean("ProcessDAO");
	}
}