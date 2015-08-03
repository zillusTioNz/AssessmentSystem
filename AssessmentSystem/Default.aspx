<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AssessmentSystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Hello World<br />
        <br />
        Username :<dx:ASPxTextBox ID="tbUsername" runat="server" Theme="Default" Width="170px">
        </dx:ASPxTextBox>
        Password :
        <dx:ASPxTextBox ID="tbPassword" runat="server" Width="170px">
        </dx:ASPxTextBox>
        <dx:ASPxButton ID="btLogin" runat="server" Text="Login" OnClick="btLogin_Click">
        </dx:ASPxButton>
    
    </div>
    </form>
</body>
</html>
