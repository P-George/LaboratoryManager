package uno.meng;

import java.sql.SQLException;

import uno.meng.db.DBHelper;

public class reflesh {
	private String name;
	private String salary;
	private String tutorssn;
	private String laboratoryno;
	private String comment;
	private String SSN;
	static String sql = new String();  
    static DBHelper db = null;  
    static int retu = 0;
	 public String getName(){
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getTutorssn() {
		return tutorssn;
	}
	public void setTutorssn(String tutorssn) {
		this.tutorssn = tutorssn;
	}
	public String getLaboratoryno() {
		return laboratoryno;
	}
	public void setLaboratoryno(String laboratoryno) {
		this.laboratoryno = laboratoryno;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String execute(){
		    String result = "success";
		    if(Insert2SSN(Integer.parseInt(SSN),name,salary,tutorssn,laboratoryno) && Insert2Impression(Integer.parseInt(SSN),Integer.parseInt(laboratoryno),comment)){
		       return result;
		    }else{
		    	return "error";
		    }
	 }
	public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
	public boolean Insert2Impression(int SSN,int labno,String comment){
		sql = "insert into STUDENT(SSN,CONTENT,LABORATORYNO) values("+SSN+",\'"+comment+"\',"+labno+")";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            retu = db.pst.executeUpdate(sql);
           if(retu>0){ 
               return true;
            }//显示数据  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
        return false;
	}
	public boolean Insert2SSN(int SSN,String name,String salary,String tutorssn,String laboratoryno){
		sql = "update STUDENT  set NAME =\'"+name+"\',salary=`"+salary+"`,TUTORSSN="+Integer.parseInt(tutorssn)+",LABORATORYNO="+Integer.parseInt(laboratoryno)+" where SSN="+SSN;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            retu = db.pst.executeUpdate(sql);
           if(retu>0){ 
               return true;
            }//显示数据  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
        return false;
	}
}
