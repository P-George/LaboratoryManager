package uno.meng;

import java.sql.ResultSet;
import java.sql.SQLException;

import uno.meng.db.DBHelper;

public class addmetocourse {
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
    private String SSN;
    public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
	public String getProjectno() {
		return projectno;
	}
	public void setProjectno(String projectno) {
		this.projectno = projectno;
	}
	private String projectno;
    public String execute(){
	    String result = "success";
	    if(InsertProject(Integer.parseInt(SSN),Integer.parseInt(projectno))){
	    		return result;
	    }
	    return "success";
    }
    public boolean InsertProject(int SSN,int projectno){
		sql = "insert into STUDY(SSN,COURSENO) values("+SSN+","+projectno+")";//SQL语句  
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
}
