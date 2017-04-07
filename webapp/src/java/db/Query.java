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

    public int div_num;
    public int sch_num;
    public String race;
    public String gender;
    public String disabil;
    public String lep;
    public String disadva;

    private int[][] data;

    public Query(HttpServletRequest request) {
        div_num = parseInt(request, "div_num");
        sch_num = parseInt(request, "sch_num");
        race = parseStr(request, "race");
        gender = parseStr(request, "gender");
        disabil = parseStr(request, "disabil");
        lep = parseStr(request, "lep");
        disadva = parseStr(request, "disadva");
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
        if (str != null) {
            return str;
        } else {
            return "ALL";
        }
    }

    public int[][] getData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        // TODO Step 3: Execute SQL
        String sql = "SELECT sch_year, avg_score FROM sol_test_data WHERE"
                + " div_num = ? AND "
                + "sch_num = ? AND "
                + "race = ? AND "
                + "gender = ? AND "
                + "disabil = ? AND "
                + "lep = ? AND "
                + "disadva = ? AND "
                + "test_name = 'ALL' AND test_level != 'ALL 3-8'"
                + " ORDER BY sch_year ASC, subject ASC";
        try {
            Connection db = Database.open();
            PreparedStatement st;
            ResultSet rs;
            
            // execute query, save results
            data = new int[9][6];
            
            st = db.prepareStatement(sql);
            st.setInt(1, div_num);
            st.setInt(2, sch_num);
            st.setString(3, race);
            st.setString(4, gender);
            st.setString(5, disabil);
            st.setString(6, lep);
            st.setString(7, disadva);
            
            rs = st.executeQuery();
            
            
            int rowNumber = 0;
            
            while(rs.next())
            {   if (rowNumber < 9)
                {
                    data[rowNumber][0] = rs.getInt(1);
                    data[rowNumber][1] = rs.getInt(2);
                    rs.next();
                    data[rowNumber][2] = rs.getInt(2);
                    rs.next();
                    data[rowNumber][3] = rs.getInt(2);
                    rs.next();
                    data[rowNumber][4] = rs.getInt(2);
                    rs.next();
                    data[rowNumber][5] = rs.getInt(2);
                    rowNumber++;
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
