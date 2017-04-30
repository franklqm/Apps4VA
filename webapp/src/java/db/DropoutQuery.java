/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class DropoutQuery {

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
    public int div_num;
    
    public ArrayList<String> counties = new ArrayList<String>();
    public ArrayList<Double> salaries = new ArrayList<Double>();
    
    public ArrayList<Double> chart_dropout = new ArrayList<Double>();
    public ArrayList<Double> chart_over20 = new ArrayList<Double>();

    
    public ArrayList<Integer> years_general = new ArrayList<Integer>();
    public ArrayList<Integer> years_specific = new ArrayList<Integer>();
    public ArrayList<Double> dropout_general = new ArrayList<Double>();
    public ArrayList<Double> dropout_specific = new ArrayList<Double>();
    public String sql;
    

    //private double[][] data;

    public DropoutQuery(HttpServletRequest request) {
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
    
    public void dropOutGeneral() {
        
        String sql_avg_abs, sql_avg_pass;
    // Create backbone of query
    // Gets average absentee of all division by school year


        sql_avg_abs = "SELECT sch_year, AVG(b0and10), AVG(b11and15), AVG(b16and20), AVG(over20)\n" +
            "FROM absentee\n" +
            "WHERE sch_year < 2014\n" +
            "GROUP BY sch_year";

        // Gets average pass rate of all division
        sql_avg_pass = "SELECT sch_year, dropout_rate\n" +
            "FROM pass_rate\n" +
            "WHERE sch_year > 2009\n" +
            "AND div_num = 0\n" +
            "AND sch_num = 0\n" +
            "AND race = 'ALL'\n" +
            "AND gender = 'ALL'\n" +
            "AND disabil = 'ALL'\n" +
            "AND lep = 'ALL' \n" +
            "AND disadva = 'ALL';";

        try {
            Connection db = Database.open();    // Open connection to Database
            PreparedStatement st_abs, st_pass;
            ResultSet rs_abs, rs_pass;
            
            st_abs = db.prepareStatement(sql_avg_abs);      // Set params inputed from user
            st_pass = db.prepareStatement(sql_avg_pass);
            
            rs_abs = st_abs.executeQuery();             // Execute query, get result set
            rs_pass = st_pass.executeQuery();
            
            
            int count = 0;
            double[] pass_rates = new double[4];
            while(rs_pass.next())
            {
                pass_rates[count] = rs_pass.getDouble(2);
                count++;
            }
            
            NumberFormat formatter = new DecimalFormat("#0.00");     
            //System.out.println(formatter.format(4.0));
            count = 0;
            while(rs_abs.next())                    // Add clmns of tuples to attrs
            {   
                years_general.add(rs_abs.getInt(1));
                dropout_general.add(Double.parseDouble(formatter.format(pass_rates[count])));
                dropout_general.add(Double.parseDouble(formatter.format(rs_abs.getDouble(2))));
                dropout_general.add(Double.parseDouble(formatter.format(rs_abs.getDouble(3))));
                dropout_general.add(Double.parseDouble(formatter.format(rs_abs.getDouble(4))));
//                dropout_data.add((double)total_pop[0]);
                dropout_general.add(Double.parseDouble(formatter.format(rs_abs.getDouble(5))));
                count++;
            }  
            
            rs_abs.close();                         // Close connection to Database
            rs_pass.close();
            st_abs.close();
            st_pass.close();
            db.close();
            
        } catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
    }
    
    public void dropOutSpecific() 
    {
        
        String sql_abs, sql_pass;

        sql_abs = "WITH sub AS(\n" +
            "  SELECT div_num\n" +
            "  FROM division\n" +
            "  WHERE div_name ILIKE '%" + div_name + "%')\n" +
            "SELECT sch_year, b0and10, b11and15, b16and20, over20\n" +
            "FROM absentee\n" +
            "  JOIN sub ON sub.div_num = absentee.div_num\n" +
            "WHERE sch_year < 2014";

        // Gets average pass rate of all division
        sql_pass = "WITH sub AS(\n" +
            "  SELECT div_num\n" +
            "  FROM division\n" +
            "  WHERE div_name ILIKE '%" + div_name + "%')\n" +
            "SELECT p.dropout_rate\n" +
            "FROM pass_rate AS p\n" +
            "  JOIN sub ON sub.div_num = p.div_num\n" +
            "WHERE sch_year > 2009\n" +
            "AND sch_num = 0\n" +
            "AND race = 'ALL'\n" +
            "AND gender = 'ALL'\n" +
            "AND disabil = 'ALL'\n" +
            "AND lep = 'ALL' \n" +
            "AND disadva = 'ALL'";

        try {
            Connection db = Database.open();    // Open connection to Database
            PreparedStatement st_abs, st_pass;
            ResultSet rs_abs, rs_pass;
            
            st_abs = db.prepareStatement(sql_abs);      // Set params inputed from user
            st_pass = db.prepareStatement(sql_pass);
            
            
            
            rs_abs = st_abs.executeQuery();             // Execute query, get result set
            rs_pass = st_pass.executeQuery();
            
            
            int count = 0;
            double[] pass_rates = new double[4];
            while(rs_pass.next())
            {
                pass_rates[count] = rs_pass.getDouble(1);
                chart_dropout.add(pass_rates[count]);
                count++;
            }
            
            NumberFormat formatter = new DecimalFormat("#0.00");     
            //System.out.println(formatter.format(4.0));
            count = 0;
            
//            for (int i = 0; i < 4; i++)
//            {
//                years_specific.add((int)pass_rates[i]);
//            }
            
            int general_count = 0;
            while(rs_abs.next())                    // Add clmns of tuples to attrs
            {   
                years_specific.add(rs_abs.getInt(1));
//                years_specific.set(general_count, 9);
//                general_count++;

                dropout_specific.add(dropout_general.get(general_count));
                general_count++;
                dropout_specific.add(Double.parseDouble(formatter.format(pass_rates[count])));
                count++;
                dropout_specific.add(dropout_general.get(general_count));
                general_count++;
                dropout_specific.add(Double.parseDouble(formatter.format(rs_abs.getDouble(2))));
                dropout_specific.add(dropout_general.get(general_count));
                general_count++;
                dropout_specific.add(Double.parseDouble(formatter.format(rs_abs.getDouble(3))));
                dropout_specific.add(dropout_general.get(general_count));
                general_count++;
                dropout_specific.add(Double.parseDouble(formatter.format(rs_abs.getDouble(4))));
                dropout_specific.add(dropout_general.get(general_count));
                general_count++;
                dropout_specific.add(Double.parseDouble(formatter.format(rs_abs.getDouble(5))));
                chart_over20.add(rs_abs.getDouble(5));
            }  
            
            rs_abs.close();                         // Close connection to Database
            rs_pass.close();
            st_abs.close();
            st_pass.close();
            db.close();
            
        } catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
    }
}
