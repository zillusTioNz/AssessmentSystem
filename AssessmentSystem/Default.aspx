<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AssessmentSystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="accountHeader">
    <h2>
        Log In</h2>
    <p>
        Please enter your username and password. 
        <a href="Register.aspx">Register</a> if you don't have an account.</p>
</div>
<dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="User Name:" />
<div class="form-field">
    <dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px">
        <ValidationSettings ValidationGroup="LoginUserValidationGroup">
            <RequiredField ErrorText="User Name is required." IsRequired="true" />
        </ValidationSettings>
    </dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password:" />
<div class="form-field">
    <dx:ASPxTextBox ID="tbPassword" runat="server" Password="true" Width="200px">
        <ValidationSettings ValidationGroup="LoginUserValidationGroup">
            <RequiredField ErrorText="Password is required." IsRequired="true" />
        </ValidationSettings>
    </dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnLogin" runat="server" Text="Log In" ValidationGroup="LoginUserValidationGroup"
    OnClick="btnLogin_Click">
</dx:ASPxButton>
    </form>
</body>
</html>
