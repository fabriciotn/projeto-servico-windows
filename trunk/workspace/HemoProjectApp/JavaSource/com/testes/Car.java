package com.testes;

public class Car {

	private String id;
	private String random;
	private int year;
	private String color;
	private int price;
	private boolean state;
	private String brand;
	
	
	
	


	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public Car(String id, String random, int year, String colour, int price,
			boolean state) {
		super();
		this.id = id;
		this.random = random;
		this.year = year;
		this.color = colour;
		this.price = price;
		this.state = state;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getRandom() {
		return random;
	}



	public void setRandom(String random) {
		this.random = random;
	}



	public int getYear() {
		return year;
	}



	public void setYear(int year) {
		this.year = year;
	}



	public String getColour() {
		return color;
	}



	public void setColour(String colour) {
		this.color = colour;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public boolean isState() {
		return state;
	}



	public void setState(boolean state) {
		this.state = state;
	}
	
	
}
