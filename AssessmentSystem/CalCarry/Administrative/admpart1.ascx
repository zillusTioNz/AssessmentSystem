<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admpart1.ascx.cs" Inherits="AssessmentSystem.CalCarry.Administrative.admpart1" %>
<style type="text/css">
    .auto-style1 {
        width: 427px;
    }
</style>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lbText" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <dx:ASPxCheckBox ID="cbPosition" runat="server" AutoPostBack="True">
                    </dx:ASPxCheckBox>
                </td>
                <td>
                    <asp:Label ID="lbCredit" runat="server"></asp:Label>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbTotal" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
