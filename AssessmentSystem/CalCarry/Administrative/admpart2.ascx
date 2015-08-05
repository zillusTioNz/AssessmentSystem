<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admpart2.ascx.cs" Inherits="AssessmentSystem.CalCarry.Administrative.admpart2" %>
<style type="text/css">
    .auto-style1 {
        width: 162px;
    }
    .auto-style2 {
        width: 227px;
    }
    .auto-style3 {
        width: 226px;
    }
    .auto-style4 {
        width: 291px;
    }
</style>

<table style="width: 100%;">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="lbText" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="auto-style4">
            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" UploadMode="Auto" Width="280px">
            </dx:ASPxUploadControl>
        </td>
        <td class="auto-style3">
            <dx:ASPxSpinEdit ID="seNumber" runat="server" Number="0" AutoPostBack="True" />
        </td>
        <td class="auto-style2">
            <asp:Label ID="lbCredit" runat="server"></asp:Label>
        </td>
        <td>
            <dx:ASPxTextBox ID="tbTotal" runat="server" Width="170px">
            </dx:ASPxTextBox>
        </td>
    </tr>
</table>

