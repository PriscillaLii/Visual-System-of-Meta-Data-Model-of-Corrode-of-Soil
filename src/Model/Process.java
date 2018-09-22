package Model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Process entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Process", catalog = "metadata")
public class Process implements java.io.Serializable {

	// Fields

	private String name;
	private String input;
	private String output;
	private String contributor;
	private Date setupDate;
	private String state;
	private String relationship;

	// Constructors

	/** default constructor */
	public Process() {
	}

	/** minimal constructor */
	public Process(String name) {
		this.name = name;
	}

	/** full constructor */
	public Process(String name, String input, String output,
			String contributor, Date setupDate, String state,
			String relationship) {
		this.name = name;
		this.input = input;
		this.output = output;
		this.contributor = contributor;
		this.setupDate = setupDate;
		this.state = state;
		this.relationship = relationship;
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

	@Column(name = "input", length = 45)
	public String getInput() {
		return this.input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	@Column(name = "output", length = 45)
	public String getOutput() {
		return this.output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	@Column(name = "contributor", length = 45)
	public String getContributor() {
		return this.contributor;
	}

	public void setContributor(String contributor) {
		this.contributor = contributor;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "setupDate", length = 10)
	public Date getSetupDate() {
		return this.setupDate;
	}

	public void setSetupDate(Date setupDate) {
		this.setupDate = setupDate;
	}

	@Column(name = "state", length = 11)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "relationship", length = 200)
	public String getRelationship() {
		return this.relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

}