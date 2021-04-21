package org.edu.vo;

public class ChartVO {
	int Red, Blue, Yellow, Green, Purple, Orange;

	public int getRed() {
		return Red;
	}

	@Override
	public String toString() {
		return "ChartVO [Red=" + Red + ", Blue=" + Blue + ", Yellow=" + Yellow + ", Green=" + Green + ", Purple="
				+ Purple + ", Orange=" + Orange + ", getRed()=" + getRed() + ", getBlue()=" + getBlue()
				+ ", getYellow()=" + getYellow() + ", getGreen()=" + getGreen() + ", getPurple()=" + getPurple()
				+ ", getOrange()=" + getOrange() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public void setRed(int red) {
		Red = red;
	}

	public int getBlue() {
		return Blue;
	}

	public void setBlue(int blue) {
		Blue = blue;
	}

	public int getYellow() {
		return Yellow;
	}

	public void setYellow(int yellow) {
		Yellow = yellow;
	}

	public int getGreen() {
		return Green;
	}

	public void setGreen(int green) {
		Green = green;
	}

	public int getPurple() {
		return Purple;
	}

	public void setPurple(int purple) {
		Purple = purple;
	}

	public int getOrange() {
		return Orange;
	}

	public void setOrange(int orange) {
		Orange = orange;
	}
	
}
