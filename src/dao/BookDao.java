package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Book;

public class BookDao {
	private Connection con;

	public BookDao() {
		con = servlet.db.DB.getConnection();
	}
	
	public void addBook(Book book) {
		try {
			PreparedStatement preparedStatement = con
					.prepareStatement("insert into name(filename,description,path,ID_category,added_date) values (?, ?, ?, ? ,?)");
			// Parameters start with 1
			preparedStatement.setString(1, book.getFileName());
			preparedStatement.setString(2, book.getDescription());
			preparedStatement.setString(3, book.getID_category());
			preparedStatement.setString(4, book.getPath());
			preparedStatement.setDate(5, (Date) book.getAdded_Date());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateBook(Book book) {
		try {
			PreparedStatement preparedStatement = con
					.prepareStatement("update name set filename=?,description=?,ID_category=? where id=? "); // sql update query
			preparedStatement.setString(1, book.getFileName());
			preparedStatement.setString(2, book.getDescription());
			preparedStatement.setString(3, book.getID_category());
			preparedStatement.setInt(4, book.getId());
			preparedStatement.executeUpdate(); // execute query

			preparedStatement.close(); // close statement

			con.close(); // close connection

			//return "UPDATE SUCCESS"; // if valid return "UPDATE SUCCESS" string
		} catch (Exception e) {
			e.printStackTrace();
		}

		//return "FAIL UPDATE"; // if invalid return "FAIL UPDATE" string
	}
	public List<Book> listAllBooks()  {            
        List<Book> books = new ArrayList<Book>();
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("select * from name");
			while (rs.next()) {
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setFileName(rs.getString("filename"));
				book.setDescription(rs.getString("description"));
				book.setID_category(rs.getString("ID_category"));
				book.setPath(rs.getString("path"));
				book.setAdded_Date(rs.getDate("Added_date"));
			
				books.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
    }
     
    public void deleteBook(int id) {   
        try {
			PreparedStatement preparedStatement = con.prepareStatement("delete from name where id=?");
			// Parameters start with 1
			preparedStatement.setInt(1,id);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

    public Book getBook(int id) {
    	Book book = new Book();
		try {
			PreparedStatement preparedStatement = con.prepareStatement("select * from name where id=?");
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				book.setId(rs.getInt("id"));
				book.setFileName(rs.getString("filename"));
				book.setDescription(rs.getString("description"));
				book.setID_category(rs.getString("ID_category"));
				book.setPath(rs.getString("path"));
				book.setAdded_Date(rs.getDate("Added_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return book;
    }


}
