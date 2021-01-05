package bean;

import java.util.Date;
public class Book {
	private String fileName, description, ID_category;
	private String path;
	private int id;
	private Date added_Date;

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String fileName, String userName, String description, String ID_category, String path, int id,
			Date added_Date) {
		super();
		this.fileName = fileName;
		this.description = description;
		this.ID_category = ID_category;
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

}
