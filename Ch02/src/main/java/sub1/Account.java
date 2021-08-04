package sub1;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class Account {
	
	private String bank;
	private String id;
	private String name;
	private int money;
	
	public Account(String bank,String id,String name,int money) {
		this.bank =bank;
		this.id = id;
		this.name = name;
		this.money = money;
		
	}
	
	public void deposit(int money) {
		this.money += money;
	}
	public void withdraw(int money) {
		this.money -= money;
}
	public void show(JspWriter out) throws IOException {
			out.print("<p>");
			out.print("은행명 :  "+this.bank+"<br/>");
			out.print("계좌번호 : "+ this.id+"<br/>" );
			out.print("입금주 : "+ this.name+"<br/>");
			out.print("현재잔액 : "+ this.money+"<br/>");
			out.print("<p>");
}
}