package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

/**
 * CS 474 HW5: Dynamic Charts
 *
 * @author Jeffrey Antetomaso
 */
public class Query {

    public String div_name;

    private int[][] data;

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
          return null;
        
    }

    public int[][] getData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        // TODO Step 3: Execute SQL
        String sql = "SELECT sch_year, b0and10_cnt, b11and15_cnt, b16and20_cnt, over20_cnt FROM absentee WHERE"
                + " div_name LIKE ?"
                + " ORDER BY sch_year ASC";
        try {
            Connection db = Database.open();
            PreparedStatement st;
            ResultSet rs;
            
            // execute query, save results
            data = new int[6][5];
            
            st = db.prepareStatement(sql);
            div_name = "'%" + div_name + "%'"; 
            st.setString(1, div_name);
            
            rs = st.executeQuery();
            
            
            int rowNumber = 0;
            
            for (int i = 0; i < 6; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    System.out.print(5);
                }    
            }    
            
            while(rs.next())
            {   if (rowNumber < 6)
                {
                    data[rowNumber][0] = rs.getInt(1);
                    data[rowNumber][1] = rs.getInt(2);
                    data[rowNumber][2] = rs.getInt(3);
                    data[rowNumber][3] = rs.getInt(4);
                    data[rowNumber][4] = rs.getInt(5);
                    rs.next();
                }
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
