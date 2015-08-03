<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Administrative.aspx.cs" Inherits="AssessmentSystem.CalCarry.Administrative.Administrative" %>
<%@ Register src="Administrative.ascx" tagname="Administrative" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Administrative Page</p>
    <uc1:Administrative ID="Administrative1" runat="server" />
</asp:Content>
