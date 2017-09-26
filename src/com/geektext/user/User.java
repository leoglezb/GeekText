package com.geektext.user;

public final class User {
	
	private final String id;
	private final String name;
	private String password;
	private int enabled;

	public User(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public String getId() {
		return id;
	}
	
}
