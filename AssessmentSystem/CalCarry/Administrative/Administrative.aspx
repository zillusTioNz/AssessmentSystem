<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Administrative.aspx.cs" Inherits="AssessmentSystem.CalCarry.Administrative.Administrative" %>
<%@ Register src="admpart1.ascx" tagname="admpart1" tagprefix="uc2" %>
<%@ Register src="admpart2.ascx" tagname="admpart2" tagprefix="uc3" %>
<%@ Register src="admpart3.ascx" tagname="admpart3" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
            <uc2:admpart1 ID="ucChancellor" runat="server" LB="อธิการบดี" LBcredit="35" LBtext="อธิการบดี" />
        
                <uc2:admpart1 ID="ucViceChancellor" runat="server" LBcredit="30" LBtext="รองอธิการบดี" />
        
        <uc2:admpart1 ID="ucDean" runat="server" LBcredit="30" LBtext="คณบดี/ผู้อำนวยการ" />
        
        <uc2:admpart1 ID="ucChanAssist" runat="server" LBcredit="26" LBtext="ผู้ช่วยอธิการบดี" />
        
        <uc2:admpart1 ID="ucViceDean" runat="server" LBcredit="24" LBtext="รองคณะบดี/รองผู้อำนวยการ" />
        
        <uc2:admpart1 ID="ucDeptHead" runat="server" LBcredit="20" LBtext="หัวหน้าภาควิชา/หัวหน้าสาขาวิชา"/>
        
        <uc2:admpart1 ID="ucFactCounChief" LBcredit="20" runat="server" LBtext="ประธานสภาคณาจารย์"/>
        
        <uc2:admpart1 ID="ucViceFactCounChief" LBcredit="16" runat="server" LBtext="รองประธานสภาคณาจารย์"/>
        
        <uc2:admpart1 ID="ucCouncillores" LBcredit="16" runat="server" LBtext="กรรมการสภามหาวิทยาลัย/สภาคณาจารย์/สภาวิชาการ"/>
        
        <uc2:admpart1 ID="ucSecretary" LBcredit="16" runat="server" LBtext="เลขานุการคณะกรรมการที่แต่งตั้งโดยสภามหาวิทยาลัย"/>
        
        <uc2:admpart1 ID="ucDeanOffHead" LBcredit="16" runat="server" LBtext="หัวหน้าสำนักงานคณะบดี/เลขาธิการคณาจารย์และข้าราชการ"/>
        
        <uc2:admpart1 ID="ucDeanAssist" LBcredit="14" runat="server" LBtext="ผู้ช่วยคณะบดี/ผู้ช่วยผู้อำนวยการ"/>
        
        <uc2:admpart1 ID="ucBranchHD" LBcredit="14" runat="server" LBtext="หัวหน้าสาขาที่ขึ้นตรงต่อภาควิชา/หัวหน้าฝ่าย"/>
        
        <uc2:admpart1 ID="ucViceDept" LBcredit="12" runat="server" LBtext="หัวหน้างาน/หัวหน้าแผนก (รองหัวหน้าภาค และหัวหน้าธุรการภาค)"/>
        
        <uc2:admpart1 ID="ucBranchHI" LBcredit="12" runat="server" LBtext="(หัวหน้าสาขาในงานภาควิชา)"/>
        <uc2:admpart1 ID="ucFactBoard" LBcredit="12" runat="server" LBtext="กรรมการประจำคณะประเภทคณาจารย์ประจำ"/>
            
        
        
                <uc3:admpart2 ID="ucBranchBCmd" runat="server" LBcredit="10" LBtext="กรรมการฝ่ายต่างๆ" />
            
        
        
                <uc4:admpart3 ID="ucAssignCmd" runat="server" LBcredit="10" LBtext="งานที่ผู้บังคับบัญชามอบหมาย"/>
            
                <table style="width:100%;">
                    <tr>
                        <td align="right" style="width: 90%">
                            รวมภาระงานบริหาร/งานส่วนกลาง</td>
                        <td align="right" style="width: 10%">
                            <dx:ASPxTextBox ID="tbAllTotal" runat="server" Width="80px">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 90%">
                            &nbsp;</td>
                        <td align="right" style="width: 10%">
                            <br />
            
                <dx:ASPxButton ID="btSubmit" runat="server" OnClick="btSubmit_Click" Text="บันทึกข้อมูล">
                </dx:ASPxButton>

                        </td>
                    </tr>
            </table>
            
                </asp:Content>
