package bean;

import java.util.Date;

public class Book {
	private String fileName, description, ID_category, name;
	private String path;
	private int id;
	private Date added_Date;

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String fileName, String description, String iD_category, String name, String path, int id,
			Date added_Date) {
		super();
		this.fileName = fileName;
		this.description = description;
		ID_category = iD_category;
		this.name = name;
		this.path = path;
		this.id = id;
		this.added_Date = added_Date;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getID_category() {
		return ID_category;
	}

	public void setID_category(String iD_category) {
		ID_category = iD_category;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getAdded_Date() {
		return added_Date;
	}

	public void setAdded_Date(Date added_Date) {
		this.added_Date = added_Date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
