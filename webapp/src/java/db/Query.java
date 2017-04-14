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

    public String div_name;

    private double[][] data;

    public Query(HttpServletRequest request) {
        div_name = parseStr(request, "div_name");
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

    public double[][] getData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        // TODO Step 3: Execute SQL
        String sql = "SELECT sch_year, b0and10, b11and15, b16and20, over20 FROM absentee WHERE"
                + " div_name ILIKE ?"
                + " ORDER BY sch_year ASC";
        try {
            Connection db = Database.open();
            PreparedStatement st;
            ResultSet rs;
            
            // execute query, save results
            data = new double[6][5];
            
            st = db.prepareStatement(sql);
            div_name =  "%" + div_name + "%";
            st.setString(1, div_name);
            
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
