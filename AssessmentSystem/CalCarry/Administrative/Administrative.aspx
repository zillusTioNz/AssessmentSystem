<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Administrative.aspx.cs" Inherits="AssessmentSystem.CalCarry.Administrative.Administrative" %>
<%@ Register src="admpart1.ascx" tagname="admpart1" tagprefix="uc2" %>
<%@ Register src="admpart2.ascx" tagname="admpart2" tagprefix="uc3" %>
<%@ Register src="admpart3.ascx" tagname="admpart3" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <table style="width: 100%;">
        <tr class="active">
            <td style="width: 70%; font-weight: bold;">&nbsp; ตำแหน่ง</td>
            <td style="width: 10%; font-weight: bold;">ดำรงตำแหน่ง</td>
            <td style="width: 10%; font-weight: bold;">ภาระงาน/สัปดาห์</td>
            <td style="width: 10%; font-weight: bold;">ภาระงาน/สัปดาห์</td>
        </tr>
        </table>
            <table style="width:100%;" class="table">
                <tr>
                    <td>
    
    
            <uc2:admpart1 ID="ucChancellor" runat="server" LB="อธิการบดี" LBcredit="35" LBtext="อธิการบดี" />
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
                <uc2:admpart1 ID="ucViceChancellor" runat="server" LBcredit="30" LBtext="รองอธิการบดี" />
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucDean" runat="server" LBcredit="30" LBtext="คณบดี/ผู้อำนวยการ" />
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
        <uc2:admpart1 ID="ucChanAssist" runat="server" LBcredit="26" LBtext="ผู้ช่วยอธิการบดี" />
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucViceDean" runat="server" LBcredit="24" LBtext="รองคณะบดี/รองผู้อำนวยการ" />
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
        <uc2:admpart1 ID="ucDeptHead" runat="server" LBcredit="20" LBtext="หัวหน้าภาควิชา/หัวหน้าสาขาวิชา"/>
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucFactCounChief" LBcredit="20" runat="server" LBtext="ประธานสภาคณาจารย์"/>
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
        <uc2:admpart1 ID="ucViceFactCounChief" LBcredit="16" runat="server" LBtext="รองประธานสภาคณาจารย์"/>
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucCouncillores" LBcredit="16" runat="server" LBtext="กรรมการสภามหาวิทยาลัย/สภาคณาจารย์/สภาวิชาการ"/>
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
        <uc2:admpart1 ID="ucSecretary" LBcredit="16" runat="server" LBtext="เลขานุการคณะกรรมการที่แต่งตั้งโดยสภามหาวิทยาลัย"/>
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucDeanOffHead" LBcredit="16" runat="server" LBtext="หัวหน้าสำนักงานคณะบดี/เลขาธิการคณาจารย์และข้าราชการ"/>
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
        <uc2:admpart1 ID="ucDeanAssist" LBcredit="14" runat="server" LBtext="ผู้ช่วยคณะบดี/ผู้ช่วยผู้อำนวยการ"/>
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucBranchHD" LBcredit="14" runat="server" LBtext="หัวหน้าสาขาที่ขึ้นตรงต่อภาควิชา/หัวหน้าฝ่าย"/>
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
        
        <uc2:admpart1 ID="ucViceDept" LBcredit="12" runat="server" LBtext="หัวหน้างาน/หัวหน้าแผนก (รองหัวหน้าภาค และหัวหน้าธุรการภาค)"/>
        
                    </td>
                </tr>
                <tr>
                    <td>
        
        <uc2:admpart1 ID="ucBranchHI" LBcredit="12" runat="server" LBtext="(หัวหน้าสาขาในงานภาควิชา)"/>
                    </td>
                </tr>
                <tr class="active">
                    <td>
        <uc2:admpart1 ID="ucFactBoard" LBcredit="12" runat="server" LBtext="กรรมการประจำคณะประเภทคณาจารย์ประจำ"/>
            
        
        
                    </td>
                </tr>
                <tr>
                    <td>
            
        
        
                <uc3:admpart2 ID="ucBranchBCmd" runat="server" LBcredit="10" LBtext="กรรมการฝ่ายต่างๆ" />
            
        
        
                    </td>
                </tr>
                <tr class="active">
                    <td>
            
        
        
                <uc4:admpart3 ID="ucAssignCmd" runat="server" LBcredit="10" LBtext="งานที่ผู้บังคับบัญชามอบหมาย"/>
            
                    </td>
                </tr>
                </table>
    
    
                <table style="width:100%;" class="table">
                    <tr class="warning">
                        <td align="right" style="width: 90%">
                            รวมภาระงานบริหาร/งานส่วนกลาง</td>
                        <td align="right" style="width: 10%">
                            <dx:ASPxTextBox ID="tbAllTotal" runat="server" Width="80px">
                            </dx:ASPxTextBox>
                        </td>
                        <td align="right" style="width: 15%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 90%">
                            &nbsp;</td>
                        <td align="right" style="width: 10%">
            
                <dx:ASPxButton ID="btSubmit" runat="server" OnClick="btSubmit_Click" Text="บันทึกข้อมูล" Height="100%" Width="100%">
                </dx:ASPxButton>

                            <br />
            
                        </td>
                        <td align="right" style="width: 15%">
            
                            &nbsp;</td>
                    </tr>
            </table>
            
                </asp:Content>
