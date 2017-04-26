<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.*, db.*" %>
<!--Jeffrey Antetomaso, antetojl@dukes.jmu.edu-->
<!DOCTYPE html>
<html>
    <head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Absentee VS Salary</title>
        <link href="webapp.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    
    <center>
    <body>
        <h1>Query</h1>
        <form>
          
            <table style="color: #F2D16D; text-shadow: 1px 1px 2px black;">
            <tr>
                <th style="height: 50px">
                    <em style="font-size: 125%">Absentee Percentages</em>:
                    <br>
                </th>
            </tr>
            <tr>
                <td>
                    Between 0 and 10:
                </td>
                <td>
                  <select name = "b0and10symbol" id = "b0and10symbol">
                    <option value ="<">Less than</option>
                    <option value ="<=">Less than or equal to</option>
                    <option value ="=">Equal to</option>
                    <option value =">=">Greater than or equal to</option>
                    <option value =">">Greater than</option>
                  </select>    
                </td>
                <td>
                    <input type="text" name = "b0and10" id = "b0and10">
                </td>
            </tr>
            <tr>
                <td>
                    Between 11 and 15:
                </td>
                <td>
                    <select name = "b11and10symbols" id = "b11and15symbol">
                        <option value ="<">Less than</option>
                        <option value ="<=">Less than or equal to</option>
                        <option value ="=">Equal to</option>
                        <option value =">=">Greater than or equal to</option>
                        <option value =">">Greater than</option>
                    </select>
                </td>
                <td>
                    <input type="text" name = "b11and15" id = "b11and15">
                </td>
            </tr>
            <tr>
                <td>
                    Between 16 and 20:
                </td>
                <td>
                  <select name = "b16and020symbols" id = "b16and20symbol">
                    <option value ="<">Less than</option>
                    <option value ="<=">Less than or equal to</option>
                    <option value ="=">Equal to</option>
                    <option value =">=">Greater than or equal to</option>
                    <option value =">">Greater than</option>
                  </select>  
                </td>
                <td>
                    <input type="text" name = "b16and20" id = "b16and20">
                </td>
            </tr>
            <tr>
                <td>
                    Over 20: 
                </td>
                <td>
                    <select name = "over20symbol" id = "over20symbol">
                        <option value ="<">Less than</option>
                        <option value ="<=">Less than or equal to</option>
                        <option value ="=">Equal to</option>
                        <option value =">=">Greater than or equal to</option>
                        <option value =">">Greater than</option>
                    </select>    
                </td>
                <td>
                    <input type="text" name = "over20" id = "over20">
                </td>
            </tr>
            <tr>
                <td>
                    Teacher salary:
                </td>
                <td>
                    <select name = "salarysymbol" id = "salarysymbol">
                        <option value ="<">Less than</option>
                        <option value ="<=">Less than or equal to</option>
                        <option value ="=">Equal to</option>
                        <option value =">=">Greater than or equal to</option>
                        <option value =">">Greater than</option>
                    </select>
                </td>
                <td style="text-align: left">
                    <input type="text" name = "salary" id = "salary">
                </td>
            </tr>
          </table>
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

                <%
                    if(request.getParameter("submit") != null)  
                    { 
                        query.getData();
                        ArrayList<String> counties = query.counties;
                        ArrayList<Double> salaries = query.salaries;

                        out.println("<hr style=\"border-style: outset; "
                                    + "width: 750px;\"/>");
                        out.println("<h1>Results</h1>");

                        out.println("<table id=\"results\" style=\"text-align: center\">");
                        out.println("<tr bgcolor=\"lightyellow\">");
                        out.println("<th align=\"left\" id=\"results_th\">County</th>");
                        out.println("<th align=\"left\">Salary</th>");

                        for (int i = 0; i < counties.size(); i++)
                        {
                          out.println("<tr id=\"results\">");
                          out.println("<td align="+ "\"left\">" + counties.get(i) + "</td>");
                          out.println("<td align="+ "\"left\">" + salaries.get(i) + "</td>");
                          out.println("</tr>");
                        }  
                        
                        out.println("</table>");
                    }
                %>
        <br>
        <br>

            <% 
                if(request.getParameter("submit") != null)
                {
                    ArrayList<String> counties = query.counties;
                    ArrayList<Double> salaries = query.salaries;

                    out.println("<hr style=\"border-style: outset; "
                                + "width: 750px;\"/>");

                    out.println("<h1>Chart</h1>");
                    out.println("<div id=\"chart_div\" "
                                + "style=\"width: 700px; "
                                + "height: 350px;\"></div>");

                    out.println("<script type=\"text/javascript\">");
                    out.println("google.charts.load('current', "
                                + "{packages: ['corechart', 'bar']});");
                    out.println("google.charts.setOnLoadCallback" 
                                + "(drawChart);");

                    out.println("function drawChart() {");

                    out.println("var data = "
                        + "new google.visualization.DataTable();");

                    out.println("data.addColumn('string', 'county');");
                    out.println("data.addColumn('number', 'salary');");

                    out.println("data.addRows([");
                    for (int i = 0; i < counties.size(); i++)
                    {
                        if (i == counties.size() - 1)
                          out.print("[\"" + counties.get(i) 
                                    + "\", " + salaries.get(i) + "]");
                        else
                          out.print("[\"" + counties.get(i) 
                                    + "\", " + salaries.get(i) + "], ");
                    }
                    out.println("]);");

                    out.println("var options = {");

                        out.println("hAxis: {");
                        out.println("title: 'Count'");
                        out.println("},");

                        out.println("vAxis: {");
                        out.println("title: 'Year'");
                        out.println("}");

                    out.println("};");

                    out.println("var chart = new google.visualization"
                                + ".BarChart(document.getElementById"
                                + "('chart_div'));");
                    out.println("chart.draw(data, options);");

                    out.println("}");

                    out.println("</script>");
                }
            %>

    </body>
    </center>
</html>
