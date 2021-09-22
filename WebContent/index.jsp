<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function(){
  $("button").click(function(){
    alert("event fired");
    $.ajax({url: "data.json", 
        success: function(result) {
        	$("#form1").css("visibility", "visible");
        	console.log(result)
        	$('#customers').DataTable({
        	    data: result,
        	    columns: [
        	        { data: 'id' },
        	        { data: 'name' },
        	        { data: 'gender' },
        	        { data: 'email' }
        	    ],
        	    "pageLength": 5
        	});
  
}});
  });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>welcome to mysite</h1>
<button>Get user data</button><br><br>
<div id = "form1" style="visibility: hidden;">
<table id="customers">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Gender</th>
             <th>Email</th>
        </tr>
    </thead>
</table>
</div>
</body>
</html>