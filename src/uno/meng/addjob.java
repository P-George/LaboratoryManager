package uno.meng;

import java.sql.ResultSet;
import java.sql.SQLException;

import uno.meng.db.DBHelper;

public class addjob {
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
    private String SSN;
    private String school;
    private String start;
    private String end;
    private String degree;
    public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
    public String execute(){
	    String result = "success";
	    if(Insert(Integer.parseInt(SSN),school,start,end,degree)){
	    		return result;
	    }
	    return "error";
    }
    public boolean Insert(int SSN,String school,String start,String end,String degree){
		sql = "insert into JOB(SSN,STARTDATE,ENDDATE,DEPARTMENT,APPOINTMENT) values("+SSN+",\'"+start+"\',\'"+end+"\',\'"+school+"\',\'"+degree+"\')";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            retu = db.pst.executeUpdate(sql);
           if(retu>0){ 
               return true;
            }//显示数据  
            db.close();//关闭连接  
        } catch (SQLException e){  
            e.printStackTrace();  
        }
        return false;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
}
