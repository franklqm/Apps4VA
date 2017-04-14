package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

/**
 * CS 474 GP4
 *
 * @author Jeffrey Antetomaso, Matthew Bowyer, Zach, Quentin
 */
public class Query {

    public String div_name = null;
    public String b0and10symbol = null;
    public String b11and15symbol = null;
    public String b16and20symbol = null;
    public String over20symbol = null;
    public String salarysymbol = null;
    public double b0and10 = 0.0;
    public double b11and15 = 0.0;
    public double b16and20 = 0.0;
    public double over20 = 0.0;
    public double salary = 0.0;
    

    private double[][] data;

    public Query(HttpServletRequest request) {
        b0and10 = parseDouble(request, "b0and10");
        b11and15 = parseDouble(request, "b11and15");
        b16and20 = parseDouble(request, "b16and20");
        over20 = parseDouble(request, "over20");
        b0and10symbol = parseStr(request, "b0and10symbol");
        b11and15symbol = parseStr(request, "b11and15symbol");
        b16and20symbol = parseStr(request, "b16and20symbol");
        over20symbol = parseStr(request, "over20symbol");
        salary = parseDouble (request, "salary");
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
          return "";
        
    }
    
    private Double parseDouble(HttpServletRequest request, String name) {
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

    public double[][] getData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        // TODO Step 3: Execute SQL
        
        if (b0and10symbol == null)
            b0and10symbol = ">";
        if (b11and15symbol == null)
            b11and15symbol = ">";
        if (b16and20symbol == null)
            b16and20symbol = ">";
        if (over20symbol == null)
            over20symbol = ">";
        if (salarysymbol == null)
            salarysymbol = ">";
        if (b0and10symbol == null)
            b0and10symbol = ">";
        if (b11and15symbol == null)
            b11and15symbol = ">";
        if (b16and20symbol == null)
            b16and20symbol = ">";
        if (over20symbol == null)
            over20symbol = ">";
        if (salarysymbol == null)
            salarysymbol = ">";
        
        
        
        String sql = "SELECT DISTINCT a.div_name, t.average_salary" +
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
            
            int size= 0;
            while (rs.next()) {
                size++;
            }
            
            data = new double[size][2];
            
            rs = st.executeQuery();

            int rowNumber = 0;
            
            while(rs.next())
            {   if (rowNumber < 6)
                {
                    data[rowNumber][0] = rs.getDouble(1);
                    data[rowNumber][1] = rs.getDouble(2);
                    data[rowNumber][2] = rs.getDouble(3);
                    data[rowNumber][3] = rs.getDouble(4);
                    data[rowNumber][4] = rs.getDouble(5);    
                }
                rowNumber++;
            }  
            
            rs.close();
            st.close();
            db.close();
            // close database resources

            return data;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }

}
