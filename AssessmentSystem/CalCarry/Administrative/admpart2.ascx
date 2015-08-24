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
.dxtcLite_Office2010Blue.dxtc-top > .dxtc-stripContainer .dxtc-leftIndent,
.dxtcLite_Office2010Blue.dxtc-top > .dxtc-stripContainer .dxtc-spacer,
.dxtcLite_Office2010Blue.dxtc-top > .dxtc-stripContainer .dxtc-rightIndent,
.dxtcLite_Office2010Blue.dxtc-top > .dxtc-stripContainer .dxtc-sbWrapper,
.dxtcLite_Office2010Blue.dxtc-top > .dxtc-stripContainer .dxtc-sbIndent,
.dxtcLite_Office2010Blue.dxtc-top > .dxtc-stripContainer .dxtc-sbSpacer
{
    padding-bottom: 1px;
}
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-link,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-leftIndent,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-rightIndent
{
	text-decoration: none;
	white-space: nowrap;
}
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-leftIndent,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-rightIndent
{
	width: 5px;
}
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-tab,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-activeTab,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-leftIndent,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-spacer,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-rightIndent,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-sbWrapper,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-sbIndent,
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-sbSpacer
{
	display: block;
	margin: 0;
	float: left;
	border-bottom: 1px solid #859ebf;
	overflow: hidden;
}
.dxtcLite_Office2010Blue > .dxtc-stripContainer .dxtc-spacer
{
	width: 1px;
}
.dxgvControl_Office2010Blue,
.dxgvDisabled_Office2010Blue
{
	border: 1px solid #8ba0bc;
	font: 11px Verdana, Geneva, sans-serif;
	background-color: #e4effa;
	color: Black;
	cursor: default;
}
.dxgvTable_Office2010Blue
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxgvTable_Office2010Blue
{
	background-color: White;
	border-width: 0;
	border-collapse: separate!important;
	overflow: hidden;
}
.dxgvHeader_Office2010Blue
{
	cursor: pointer;
	white-space: nowrap;
	padding: 5px 6px;
	border: 1px solid #8ba0bc;
	
	overflow: hidden;
	font-weight: normal;
	text-align: left;
}
.dxgvCommandColumn_Office2010Blue
{
	padding: 2px;
}

.dxgvPagerTopPanel_Office2010Blue,
.dxgvPagerBottomPanel_Office2010Blue
{
	background: #e4effa none;
}
</style>

<table style="width: 100%;">
    <tr>
        <td class="auto-style1" style="width: 40%">
            <asp:Label ID="lbText" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="auto-style4" style="width: 30%">
                                <dx:ASPxPageControl runat="server" EnableCallBacks="True" ActiveTabIndex="0" ID="pageControl"><TabPages>
<dx:TabPage Text="รายชื่อไฟล์"><ContentCollection>
<dx:ContentControl runat="server">
                                                    <dx:ASPxGridView runat="server" KeyFieldName="id" AutoGenerateColumns="False" DataSourceID="SqlDocuments" ID="gvFileDetail" OnRowDeleting="gvFileDetail_RowDeleting" ClientInstanceName="Gridview"><Columns>
<dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Iden" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TableNameID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5"></dx:GridViewDataTextColumn>
<dx:GridViewDataHyperLinkColumn FieldName="Path" ShowInCustomizationForm="True" Caption="ชื่อไฟล์" VisibleIndex="4">
<PropertiesHyperLinkEdit Target="_blank" TextField="FileName"></PropertiesHyperLinkEdit>
</dx:GridViewDataHyperLinkColumn>
</Columns>
</dx:ASPxGridView>

                                                </dx:ContentControl>
</ContentCollection>
</dx:TabPage>
<dx:TabPage Text="อัพโหลดไฟล์"><ContentCollection>
<dx:ContentControl runat="server">
                                                    <dx:ASPxUploadControl runat="server" UploadMode="Auto" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" Width="280px" ID="ASPxUploadControl1" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
                                                        <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview.Refresh();
}" />
                                                    </dx:ASPxUploadControl>

                                                </dx:ContentControl>
</ContentCollection>
</dx:TabPage>
</TabPages>
</dx:ASPxPageControl>

                                <asp:SqlDataSource runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" ID="SqlDocuments">
                                    <DeleteParameters>
<asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
<asp:Parameter Name="original_Iden" Type="Int32"></asp:Parameter>
<asp:Parameter Name="original_TableNameID"></asp:Parameter>
<asp:Parameter Name="original_TableName" Type="String"></asp:Parameter>
<asp:Parameter Name="original_Path" Type="String"></asp:Parameter>
<asp:Parameter Name="original_FileName" Type="String"></asp:Parameter>
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="Iden" Type="Int32"></asp:Parameter>
<asp:Parameter Name="TableNameID"></asp:Parameter>
<asp:Parameter Name="Path" Type="String"></asp:Parameter>
<asp:Parameter Name="FileName" Type="String"></asp:Parameter>
</InsertParameters>
<SelectParameters>
<asp:SessionParameter SessionField="id" Name="Iden" Type="Int32"></asp:SessionParameter>
<asp:Parameter DefaultValue="2" Name="TableNameID"></asp:Parameter>
</SelectParameters>
<UpdateParameters>
<asp:Parameter Name="Iden" Type="Int32"></asp:Parameter>
<asp:Parameter Name="TableNameID"></asp:Parameter>
<asp:Parameter Name="Path" Type="String"></asp:Parameter>
<asp:Parameter Name="FileName" Type="String"></asp:Parameter>
<asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
<asp:Parameter Name="original_Iden" Type="Int32"></asp:Parameter>
<asp:Parameter Name="original_TableNameID"></asp:Parameter>
<asp:Parameter Name="original_Path" Type="String"></asp:Parameter>
<asp:Parameter Name="original_FileName" Type="String"></asp:Parameter>
</UpdateParameters>
</asp:SqlDataSource>

        </td>
        <td style="width: 10%">
            <dx:ASPxSpinEdit ID="seNumber" runat="server" Number="0" AutoPostBack="True" Width="80px" />
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

