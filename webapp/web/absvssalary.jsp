<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.*, db.*" %>
<!--Jeffrey Antetomaso, antetojl@dukes.jmu.edu-->
<!DOCTYPE html>
<html>
    <head>
        <title>Absentee VS Salary</title>
        <link href="webapp.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <h1>Query</h1>
        <form>
          Absentee Percentages:
          
          <br>
          
          Between 0 and 10:   
          
          <select name="b0and10symbol" id = "b0and10symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          
          
          <input type="text" name = "b0and10" id = "b0and10">
          
          <br>
          Between 11 and 15:
          <select name="b11and15symbol" id = "b11and15symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          
          
          <input type="text" name = "b11and15" id = "b11and15">
          
          <br>
          Between 16 and 20:
          <select name="b16and20symbol" id = "b16and20symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          
          
          <input type="text" name = "b16and20" id = "b16and20">
          
          <br>
          Over 20: 
          <select name="over20symbol" id = "over20symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          
          
          <input type="text" name = "over20" id = "over20">
          
          <br>
          
          Teacher salary:
          <select name="salarysymbol" id = "salarysymbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          
          
          <input type="text" name = "salary" id = "salary">
          
          <br>
          
          
          
          <input type="submit" name = "submit"/>
        </form>
        
        <br>
              
        <%
            Query query = new Query(request);
        %>
        <script>
            document.getElementById("b0and10").value = "<%= query.b0and10 %>";
            document.getElementById("b11and15").value = "<%= query.b11and15 %>";
            document.getElementById("b16and20").value = "<%= query.b16and20 %>";
            document.getElementById("over20").value = "<%= query.over20 %>";
            document.getElementById("b0and10symbol").value = "<%= query.b0and10symbol %>";
            document.getElementById("b11and15symbol").value = "<%= query.b11and15symbol %>";
            document.getElementById("b16and20symbol").value = "<%= query.b16and20symbol %>";
            document.getElementById("over20symbol").value = "<%= query.over20symbol %>";
        </script>

        <h1>Results</h1>
        <table style="text-align: center">
            <thead>
                <tr bgcolor="lightyellow">
                    <th>Year</th>
                    <th>0 to 10</th>
                    <th>11 to 15</th>
                    <th>16 to 20</th>
                    <th>Over 20</th>
                </tr>
            </thead>
            <tbody>
                <%
                      if(request.getParameter("submit") != null)  { 
                      
                      double[][] data = query.getData();
                      out.print("<tbody>\n");
                      for (int i = 0; i < data.length; i++)
                      {
			out.println("<tr>");
                        
			for (int j = 0; j < data[0].length; j++)
			{
                            if (j == 0)
                            {
                                Double d = new Double(data[i][j]);
                                int yr = d.intValue();
                                out.println("<td align="+ "\"center\">" + yr + "</td>");
                            }    
                            else{
                                Double toBeTruncated = new Double("3.5789055");

                                Double rounded = BigDecimal.valueOf(data[i][j])
                                .setScale(2, RoundingMode.HALF_UP)
                                .doubleValue();
                                out.println("<td align="+ "\"center\">" + rounded + "</td>");
                            }
			}  
                        
			out.println("</tr>");
                      }    
													
                      out.println("</trbody></table>");}

                %>
        <br>
        
        


            </tbody>
        </table>

        <h1>Chart</h1>
        <div id="chart_div" style="width: 700px; height: 350px;"></div>

        <script type="text/javascript">
            google.charts.load('current', {packages: ['corechart', 'bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();

                data.addColumn('string', 'sch_year');
                data.addColumn('number', '0 to 10');
                data.addColumn('number', '11 to 15');
                data.addColumn('number', '16 to 20');
                data.addColumn('number', 'Over 20');

                data.addRows([
                    <% 
                        if(request.getParameter("submit") != null)
                        {
                            double[][] data = query.getData();
                            
                            //out.print("["); //first one
                            for (int i = 0; i < 6; i++)
                            {
                                out.print("["); //for each
                                
                                for (int j = 0; j < 5; j++)
                                {
                                    if (j == 0)
                                    {
                                        Double d = new Double(data[i][j]);
                                        int yr = d.intValue();
                                        out.print("\"" + yr + "\", ");
                                    }    
                                    
                                    else if (j != 4)
                                    {
                                        out.print(data[i][j] + ", ");
                                    }   
                                    
                                    else
                                    {
                                        out.print(data[i][j]);
                                    }    
                                    
                                }
                                
                                if (i == 5)
                                {
                                    out.print("]"); //for each
                                }    
                                
                                else
                                {
                                    out.print("], ");
                                }    
                                
             
                            } 
                            
                            //out.print("]");//last one
                     }
                    %>


                ]);

                var options = {
                    hAxis: {
                        title: 'Count'
                    },
                    vAxis: {
                        title: 'Year'
                    },
                };

                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>

    </body>
</html>