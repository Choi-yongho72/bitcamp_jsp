package dto;

import java.io.Serializable;

/*
CREATE TABLE CUSTUSER(
	ID VARCHAR2(50) PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL,
	ADDRESS VARCHAR2(50) NOT NULL
)
*/

public class CustUserDto implements Serializable{
	private int id;
	private String name;
	
	public CustUserDto() {
	
	}

	public CustUserDto(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "CustUserDto [id=" + id + ", name=" + name + "]";
	}
	
}
