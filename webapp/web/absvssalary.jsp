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
          <select name = "b0and10symbol" id = "b0and10symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          <input type="text" name = "b0and10" id = "b0and10">
          <br>
          
          Between 11 and 15:
          <select name = "b11and10symbols" id = "b11and15symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          <input type="text" name = "b11and15" id = "b11and15">
          <br>
          
          Between 16 and 20:
          <select name = "b16and020symbols" id = "b16and20symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          <input type="text" name = "b16and20" id = "b16and20">
          <br>
          
          Over 20: 
          <select name = "over20symbol" id = "over20symbol">
                <option value ="<">Less than</option>
                <option value ="<=">Less than or equal to</option>
                <option value ="=">Equal to</option>
                <option value =">=">Greater than or equal to</option>
                <option value =">">Greater than</option>
          </select>     
          <input type="text" name = "over20" id = "over20">
          <br>
          
          Teacher salary:
          <select name = "salarysymbol" id = "salarysymbol">
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
            document.getElementById("salary").value = "<%= query.salary %>";
            document.getElementById("b0and10symbol").value = "<%= query.b0and10symbol %>";
            document.getElementById("b11and15symbol").value = "<%= query.b11and15symbol %>";
            document.getElementById("b16and20symbol").value = "<%= query.b16and20symbol %>";
            document.getElementById("over20symbol").value = "<%= query.over20symbol %>";
            document.getElementById("salarysymbol").value = "<%= query.salarysymbol %>";
            
        </script>

        
        
        <h1>Results</h1>
        <table style="text-align: center">
            <thead>
                <tr bgcolor="lightyellow">
                    <th>County</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
                <%
                      if(request.getParameter("submit") != null)  { 
                      
                          
                      query.getData();
                      ArrayList<String> counties = query.counties;
                      ArrayList<Double> salaries = query.salaries;
                      
                      for (int i = 0; i < counties.size(); i++)
                      {
			out.println("<tr>");
                        out.println("<td align="+ "\"center\">" + counties.get(i) + "</td>");
                        out.println("<td align="+ "\"center\">" + salaries.get(i) + "</td>");
			out.println("</tr>");
                      }    
													
                   

                    }%>
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

                data.addColumn('string', 'county');
                data.addColumn('number', 'salary');

                data.addRows([
                    <% 
                        if(request.getParameter("submit") != null)
                        {
                            ArrayList<String> counties = query.counties;
                            ArrayList<Double> salaries = query.salaries;
                            //out.print("["); //first one
                            for (int i = 0; i < counties.size(); i++)
                            {
                                if (i == counties.size() - 1)
                                  out.print("[\"" + counties.get(i) + "\", " + salaries.get(i) + "]");
                                else
                                  out.print("[\"" + counties.get(i) + "\", " + salaries.get(i) + "], ");
                            }
                        }
                    %>
                ]);

                var options = {
                    hAxis: {
                        title: 'Count'
                    },
                    vAxis: {
                        title: 'Year'
                    }
                };

                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>

    </body>
</html>