package com.neu.me.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="herbs")
public class Herbs {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="herbid")
	private int herbid;
	
	@Column(name="herbname",unique = true)
	private String herbName;
	
	@Column(name="imagename",unique = true)
	private String imageName;
	
	@Column(name="description")
	private String description;
	
	@Column(name="scientificname")
	private String scientificname;
	
	@Transient
	private MultipartFile herbImage;
	
	public Herbs()
	{
		
	}
	
	
	public MultipartFile getHerbImage() {
		return herbImage;
	}


	public void setHerbImage(MultipartFile herbImage) {
		this.herbImage = herbImage;
	}


	public String getScientificname() {
		return scientificname;
	}
	public void setScientificname(String scientificname) {
		this.scientificname = scientificname;
	}
	public int getHerbid() {
		return herbid;
	}
	public void setHerbid(int herbid) {
		this.herbid = herbid;
	}
	
	
	public String getHerbName() {
		return herbName;
	}


	public void setHerbName(String herbName) {
		this.herbName = herbName;
	}


	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
