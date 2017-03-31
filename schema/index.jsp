<%@page import="java.util.*, db.*" %>
<!--Jeffrey Antetomaso, antetojl@dukes.jmu.edu-->
<!DOCTYPE html>
<html>
    <head>
        <title>Absentee Data by County</title>
        <link href="hw4.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <h1>Query</h1>
        <form>
          Division:
          <input type="text" name="div_name" id = "div_name">
          <br>
          <br>
          
          
        
        <br>
        <br />
        
        
        <input type="submit" name = "submit"/>
        <br>
              
        <%
            Query query = new Query(request);
        %>
        <script>
            document.getElementById("div_name").value = "<%= query.div_name %>";
        </script>

        <h1>Results</h1>
        <table style="text-align: center">
            <thead>
                <tr bgcolor="lightyellow">
                    <th>sch_year</th>
                    <th>0 to 10</th>
                    <th>11 to 15</th>
                    <th>16 to 20</th>
                    <th>Over 20</th>
                </tr>
            </thead>
            <tbody>
                <%
                      if(request.getParameter("submit") != null)  { 
                      
                      int[][] data = query.getData();
                      out.print("<tbody>");
                      for (int i = 0; i < data.length; i++)
                      {
			out.println("<tr>");
                        
			for (int j = 0; j < data[0].length; j++)
			{
                          out.println("<td align="+ "\"center\">" + data[i][j] + "</td>");
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

                data.addColumn('number', 'sch_year');
                data.addColumn('number', '0 to 10');
                data.addColumn('number', '11 to 15');
                data.addColumn('number', '16 to 20');
                data.addColumn('number', 'Over 20');

                data.addRows(
                    <% 
                        if(request.getParameter("submit") != null)
                        {
                            int[][] data = query.getData();
                            
                            out.print("["); //first one
                            for (int i = 0; i < 6; i++)
                            {
                                out.print("["); //for each
                                
                                for (int j = 0; j < 5; j++)
                                {
                                    if (j != 5)
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
                            
                            out.print("]");//last one
                     }
                    %>


                );

                var options = {
                    hAxis: {
                        title: 'Year'
                    },
                    vAxis: {
                        title: 'Count'
                    },
                };

                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>

    </body>
</html>