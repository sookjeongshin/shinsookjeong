package kr.or.member;

public class MemberVO {
	private String name;
	private int age;
	private String phoneNum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	@Override
	public String toString() {
		return "디버그용MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
	}
}
