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
          <select name="div_name" id = "div_name">
                <option value ="Albemarle">Albemarle</option>
                <option value ="Alexandria">Alexandria</option>
                <option value ="Alleghany">Alleghany</option>
                <option value ="Amelia">Amelia</option>
                <option value ="Amherst">Amherst</option>
                <option value ="Appomattox">Appomattox</option>
                <option value ="Arlington">Arlington</option>
                <option value ="Augusta">Augusta</option>
                <option value ="Bath">Bath</option>
                <option value ="Bedford">Bedford</option>
                <option value ="Bland">Bland</option>
                <option value ="Botetourt">Botetourt</option>
                <option value ="Bristol">Bristol</option>
                <option value ="Brunswick">Brunswick</option>
                <option value ="Buchanan">Buchanan</option>
                <option value ="Buckingham">Buckingham</option>
                <option value ="Buena Vista">Buena Vista</option>
                <option value ="Campbell">Campbell</option>
                <option value ="Caroline">Caroline</option>
                <option value ="Carroll">Carroll</option>
                <option value ="Charles City">Charles City</option>
                <option value ="Charlotte">Charlotte</option>
                <option value ="Charlottesville">Charlottesville</option>
                <option value ="Chesapeake">Chesapeake</option>
                <option value ="Chesterfield">Chesterfield</option>
                <option value ="Clarke">Clarke</option>
                <option value ="Colonial Beach">Colonial Beach</option>
                <option value ="Colonial Heights">Colonial Heights</option>
                <option value ="Covington">Covington</option>
                <option value ="Craig">Craig</option>
                <option value ="Culpeper">Culpeper</option>
                <option value ="Cumberland">Cumberland</option>
                <option value ="Danville">Danville</option>
                <option value ="Dickenson">Dickenson</option>
                <option value ="Dinwiddie">Dinwiddie</option>
                <option value ="Emporia">Emporia</option>
                <option value ="Essex">Essex</option>
                <option value ="Fairfax">Fairfax</option>
                <option value ="Falls Church">Falls Church</option>
                <option value ="Fauquier">Fauquier</option>
                <option value ="Floyd">Floyd</option>
                <option value ="Fluvanna">Fluvanna</option>
                <option value ="Franklin">Franklin</option>
                <option value ="Franklin">Franklin</option>
                <option value ="Frederick">Frederick</option>
                <option value ="Fredericksburg">Fredericksburg</option>
                <option value ="Galax">Galax</option>
                <option value ="Giles">Giles</option>
                <option value ="Gloucester">Gloucester</option>
                <option value ="Goochland">Goochland</option>
                <option value ="Grayson">Grayson</option>
                <option value ="Greene">Greene</option>
                <option value ="Greensville">Greensville</option>
                <option value ="Halifax">Halifax</option>
                <option value ="Hampton">Hampton</option>
                <option value ="Hanover">Hanover</option>
                <option value ="Harrisonburg">Harrisonburg</option>
                <option value ="Henrico">Henrico</option>
                <option value ="Henry">Henry</option>
                <option value ="Highland">Highland</option>
                <option value ="Hopewell">Hopewell</option>
                <option value ="Isle Of Wight">Isle Of Wight</option>
                <option value ="James City">James City</option>
                <option value ="King & Queen">King & Queen</option>
                <option value ="King George">King George</option>
                <option value ="King William">King William</option>
                <option value ="Lancaster">Lancaster</option>
                <option value ="Lee">Lee</option>
                <option value ="Lexington">Lexington</option>
                <option value ="Loudoun">Loudoun</option>
                <option value ="Louisa">Louisa</option>
                <option value ="Lunenburg">Lunenburg</option>
                <option value ="Lynchburg">Lynchburg</option>
                <option value ="Madison">Madison</option>
                <option value ="Manassas">Manassas</option>
                <option value ="Manassas Park">Manassas Park</option>
                <option value ="Martinsville">Martinsville</option>
                <option value ="Mathews">Mathews</option>
                <option value ="Mecklenburg">Mecklenburg</option>
                <option value ="Middlesex">Middlesex</option>
                <option value ="Montgomery">Montgomery</option>
                <option value ="Nelson">Nelson</option>
                <option value ="New Kent">New Kent</option>
                <option value ="Newport News">Newport News</option>
                <option value ="Norfolk">Norfolk</option>
                <option value ="Northampton">Northampton</option>
                <option value ="Northumberland">Northumberland</option>
                <option value ="Norton">Norton</option>
                <option value ="Nottoway">Nottoway</option>
                <option value ="Orange">Orange</option>
                <option value ="Page">Page</option>
                <option value ="Patrick">Patrick</option>
                <option value ="Petersburg">Petersburg</option>
                <option value ="Pittsylvania">Pittsylvania</option>
                <option value ="Poquoson">Poquoson</option>
                <option value ="Portsmouth">Portsmouth</option>
                <option value ="Powhatan">Powhatan</option>
                <option value ="Prince Edward">Prince Edward</option>
                <option value ="Prince George">Prince George</option>
                <option value ="Prince William">Prince William</option>
                <option value ="Pulaski">Pulaski</option>
                <option value ="Radford">Radford</option>
                <option value ="Rappahannock">Rappahannock</option>
                <option value ="Richmond">Richmond</option>
                <option value ="Richmond City">Richmond City</option>
                <option value ="Roanoke">Roanoke</option>
                <option value ="Roanoke City">Roanoke City</option>
                <option value ="Rockbridge">Rockbridge</option>
                <option value ="Rockingham">Rockingham</option>
                <option value ="Russell">Russell</option>
                <option value ="Salem">Salem</option>
                <option value ="Scott">Scott</option>
                <option value ="Shenandoah">Shenandoah</option>
                <option value ="Smyth">Smyth</option>
                <option value ="Southampton">Southampton</option>
                <option value ="Spotsylvania">Spotsylvania</option>
                <option value ="Stafford">Stafford</option>
                <option value ="Staunton">Staunton</option>
                <option value ="Suffolk">Suffolk</option>
                <option value ="Surry">Surry</option>
                <option value ="Sussex">Sussex</option>
                <option value ="Tazewell">Tazewell</option>
                <option value ="Virginia Beach">Virginia Beach</option>
                <option value ="Warren">Warren</option>
                <option value ="Washington">Washington</option>
                <option value ="Waynesboro">Waynesboro</option>
                <option value ="West Point">West Point</option>
                <option value ="Westmoreland">Westmoreland</option>
                <option value ="Williamsburg">Williamsburg</option>
                <option value ="Winchester">Winchester</option>
                <option value ="Wise">Wise</option>
                <option value ="Wythe">Wythe</option>
                <option value ="York">York</option>
              
        
        
        
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

                data.addColumn('string', 'sch_year');
                data.addColumn('number', '0 to 10');
                data.addColumn('number', '11 to 15');
                data.addColumn('number', '16 to 20');
                data.addColumn('number', 'Over 20');

                data.addRows([
                    <% 
                        if(request.getParameter("submit") != null)
                        {
                            int[][] data = query.getData();
                            
                            //out.print("["); //first one
                            for (int i = 0; i < 6; i++)
                            {
                                out.print("["); //for each
                                
                                for (int j = 0; j < 5; j++)
                                {
                                    if (j == 0)
                                    {
                                        out.print("\"" + data[i][j] + "\", ");
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