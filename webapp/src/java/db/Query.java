package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;


/**
 * CS 474 GP4
 *
 * @author Jeffrey Antetomaso, Matthew Bowyer, Zach, Quentin
 */
public class Query {

    public String div_name;
    public String b0and10symbol;
    public String b11and15symbol;
    public String b16and20symbol;
    public String over20symbol;
    public String salarysymbol;
    public double b0and10;
    public double b11and15;
    public double b16and20;
    public double over20;
    public double salary;
    
    public ArrayList<String> counties = new ArrayList<String>();
    public ArrayList<Double> salaries = new ArrayList<Double>();
    public String sql;
    

    //private double[][] data;

    public Query(HttpServletRequest request) {
        b0and10 = parseDouble(request, "b0and10");
        b11and15 = parseDouble(request, "b11and15");
        b16and20 = parseDouble(request, "b16and20");
        over20 = parseDouble(request, "over20");
        salary = parseDouble (request, "salary");
        b0and10symbol = parseStr(request, "b0and10symbol");
        b11and15symbol = parseStr(request, "b11and15symbol");
        b16and20symbol = parseStr(request, "b16and20symbol");
        over20symbol = parseStr(request, "over20symbol");
        salarysymbol = parseStr(request, "salarysymbol");
    }

    private int parseInt(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException exc) {
            return 0;
        }
    }

    private String parseStr(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        if (str != null)
          return str;
        
        else
          return ">";
        
    }
    
    private double parseDouble(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        try {
            if (str != null)
              return Double.parseDouble(str);
            else
              return 0.0;
        } catch (NumberFormatException exc) {
            return 0.0;
        }
    }

    public void getData() {
        
        // TODO Step 3: Execute SQL
        sql = "SELECT DISTINCT absentee.div_name, teacher.average_salary" +
                " FROM teacher " +
                    "JOIN absentee ON teacher.div_num = absentee.div_num " +
                    "AND absentee.b0and10 " + b0and10symbol + " ? " +
                    "AND absentee.b11and15 " + b11and15symbol + " ? " +
                    "AND absentee.b16and20 " + b16and20symbol + " ? " +
                    "AND absentee.over20 " + over20symbol + " ? " +
                    "AND teacher.average_salary " + salarysymbol + " ? " + 
                    "ORDER BY teacher.average_salary ASC";
        try {
            Connection db = Database.open();
            PreparedStatement st;
            ResultSet rs;
            // execute query, save results         
            
            st = db.prepareStatement(sql);
            st.setDouble(1, b0and10);
            st.setDouble(2, b11and15);
            st.setDouble(3, b16and20);
            st.setDouble(4, over20);
            st.setDouble(5, salary);
            
            rs = st.executeQuery();

            while(rs.next())
            {   
                counties.add(rs.getString(1));
                salaries.add(rs.getDouble(2));
            }  
            
            rs.close();
            st.close();
            db.close();
            // close database resources
        } catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
    }

}
