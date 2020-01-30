package dto;

import java.io.Serializable;

public class MemberDto implements Serializable{
	private String message;
	
	public MemberDto() {
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
