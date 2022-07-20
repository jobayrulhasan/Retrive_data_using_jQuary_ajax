<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DamoPractice.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data retrive using jQuary Ajax</title>
    <script src="jquery-3.6.0.min.js"></script><%-- jQuary link--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnGetEmployee').click(function () {
                var empId = $('#textId').val();
                $.ajax({
                    url: 'EmployeeService.asmx/GetEmployeeId',
                    data: { employeeId: empId },
                    method: 'post',
                    dataType: 'xml',
                    success: function (data) {
                        var mydata = $(data);
                        $('#txtName').val(mydata.find('Name').text());
                        $('#txtGender').val(mydata.find('Gender').text());
                        $('#txtSalary').val(mydata.find('Salary').text());
                    },
                    error: function (err) {
                        alert(err);
                    }
                })
            });
        });
    </script>
</head>
<body style="font-family:Arial">
     ID: <input id="textId" style="width:100px" />
    <input type="button" id="btnGetEmployee" value="Get Employee" />
    <br /><br />
    <table border="1" style="border-collapse:collapse">
        <tr>
            <td>Name</td>
            <td><input id="txtName" type="text" /></td>
        </tr>
         <tr>
            <td>Gender</td>
            <td><input id="txtGender" type="text" /></td>
        </tr>
         <tr>
            <td>Salary</td>
            <td><input id="txtSalary" type="number" /></td>
        </tr>
    </table>
</body>
</html>
