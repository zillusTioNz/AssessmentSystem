<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admpart1.ascx.cs" Inherits="AssessmentSystem.CalCarry.Administrative.admpart1" %>
<style type="text/css">
    .auto-style1 {
        width: 427px;
    }
</style>

                <table style="width:100%;">
                    <tr>
                        <td class="auto-style1" style="width: 70%">
                            <asp:Label ID="lbText" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td dir="ltr" style="width: 10%">
                            <dx:ASPxCheckBox ID="cbPosition" runat="server" AutoPostBack="True">
                            </dx:ASPxCheckBox>
                        </td>
                        <td style="width: 10%">
                            <asp:Label ID="lbCredit" runat="server"></asp:Label>
                        </td>
                        <td style="width: 10%">
                            <dx:ASPxTextBox ID="tbTotal" runat="server" Width="80px" Text="0">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                </table>

