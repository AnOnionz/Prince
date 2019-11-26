package beans;

public class item {
	String type="";
	String imageurl="";
	String muatienmat="";
	String muack="";
	String bantienmat="";
	String banck="";
	public item() {
	
	}
	@Override
	public String toString() {
		
		return "type: "+type+"mua chuyen khoan : "+muack;
	}
	public String getType() {
		return type;
	}
	public String getMuatienmat() {
		return muatienmat;
	}
	public String getMuack() {
		return muack;
	}
	public String getBantienmat() {
		return bantienmat;
	}
	public String getBanck() {
		return banck;
	}
	
	
	

}
