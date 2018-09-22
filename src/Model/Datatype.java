package Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Datatype entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "datatype", catalog = "metadata")
public class Datatype implements java.io.Serializable {

	// Fields

	private String name;
	private String describe;

	// Constructors

	/** default constructor */
	public Datatype() {
	}

	/** minimal constructor */
	public Datatype(String name) {
		this.name = name;
	}

	/** full constructor */
	public Datatype(String name, String describe) {
		this.name = name;
		this.describe = describe;
	}

	// Property accessors
	@Id
	@Column(name = "name", unique = true, nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "describe", length = 100)
	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

}