package beans;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.cj.jdbc.Blob;

public class UserAccount {
	private int USER_ID;
	
	private String IDENTIFY;

	private String USERNAME;

	private String EMAIL;

	private String PASSWORD;
	
	private String AVATAR;

	public String getAVATAR() {
		return AVATAR;
	}
	public void setAVATAR(String avatar) {
		AVATAR = avatar;
	}

	private Timestamp CREATED_TIME;

	private String EMAIL_VERIFICATION_HASH;

	private int EMAIL_VERIFICATION_ATTEMPTS;

	private int STATUS;

	private String FIRSTNAME;

	private String LASTNAME;

	private String GENDER;

	private java.sql.Date DATEOFBIRTH;

	private int AGE;

	private int SCORE;

	private String CODE;

	private String PAYMENT;

	private int ROLE_ID;
	
	public UserAccount() {
		super();
	}
	public int getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public Timestamp getCREATED_TIME() {
		return CREATED_TIME;
	}

	public void setCREATED_TIME(Timestamp cREATED_TIME) {
		CREATED_TIME = cREATED_TIME;
	}

	public String getEMAIL_VERIFICATION_HASH() {
		return EMAIL_VERIFICATION_HASH;
	}

	public void setEMAIL_VERIFICATION_HASH(String eMAIL_VERIFICATION_HASH) {
		EMAIL_VERIFICATION_HASH = eMAIL_VERIFICATION_HASH;
	}

	public int getEMAIL_VERIFICATION_ATTEMPTS() {
		return EMAIL_VERIFICATION_ATTEMPTS;
	}

	public void setEMAIL_VERIFICATION_ATTEMPTS(int eMAIL_VERIFICATION_ATTEMPTS) {
		EMAIL_VERIFICATION_ATTEMPTS = eMAIL_VERIFICATION_ATTEMPTS;
	}

	public int getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}

	public String getFIRSTNAME() {
		return FIRSTNAME;
	}

	public void setFIRSTNAME(String fIRSTNAME) {
		FIRSTNAME = fIRSTNAME;
	}

	public String getLASTNAME() {
		return LASTNAME;
	}

	public void setLASTNAME(String lASTNAME) {
		LASTNAME = lASTNAME;
	}

	public String getGENDER() {
		return GENDER;
	}

	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}

	public java.sql.Date getDATEOFBIRTH() {
		return DATEOFBIRTH;
	}

	public void setDATEOFBIRTH(java.sql.Date date) {
		DATEOFBIRTH = date;
	}

	public int getAGE() {
		return AGE;
	}

	public void setAGE(int aGE) {
		AGE = aGE;
	}

	public int getSCORE() {
		return SCORE;
	}

	public void setSCORE(int sCORE) {
		SCORE = sCORE;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getPAYMENT() {
		return PAYMENT;
	}

	public void setPAYMENT(String pAYMENT) {
		PAYMENT = pAYMENT;
	}

	public int getROLE_ID() {
		return ROLE_ID;
	}

	public void setROLE_ID(int rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getIDENTIFY() {
		return IDENTIFY;
	}
	public void setIDENTIFY(String iDENTIFY) {
		IDENTIFY = iDENTIFY;
	}
	public static int getDay(String date) throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		int day = f.parse(date).getDate();
		return day;
	}
	
	public static int getMonth(String date) throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		int month = f.parse(date).getMonth();
		return month;
	}
	public static int getYear(String date) throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		int year = f.parse(date).getYear();
		return year;
	}
	 @Override
	    public String toString()
	    {
	        return "ClassPojo [USER_ID = "+USER_ID+", EMAIL = "+EMAIL+", USERNAME = "+USERNAME+", EMAIL_VERIFICATION_HASH = "+EMAIL_VERIFICATION_HASH+", EMAIL_VERIFICATION_ATTEMPTS = "+EMAIL_VERIFICATION_ATTEMPTS+", PASSWORD = "+PASSWORD+", STATUS = "+STATUS+", CREATED_TIME = "+CREATED_TIME+", ROLE_ID = "+ROLE_ID+", SCORE = "+ SCORE +"]";
	    }
}
