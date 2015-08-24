<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="StdDevelopment.aspx.cs" Inherits="AssessmentSystem.CalCarry.StudentDevelopment.StdDevelopment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <table class="table table-striped" style="width:100%;">
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>เอกสารอ้างอิง</th>
                        <th>จำนวนโครงการ</th>
                        <th>ภาระงาน/สัปดาห์/ชั่วโมง</th>
                        <th>ภาระงาน/สัปดาห์</th>
                    </tr>
                </thead>
                <tr>
                    <td style="font-weight: bold">คณะกรรมการ คณะทำงาน</td>
                    <td>
                        <dx:ASPxPageControl ID="pageControl3" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                            <TabPages>
                                <dx:TabPage Text="รายชื่อไฟล์">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxGridView ID="gvFileDetail3" runat="server" AutoGenerateColumns="False" ClientInstanceName="Gridview" DataSourceID="SqlDocuments" KeyFieldName="id" OnRowDeleting="gvFileDetail3_RowDeleting">
                                                <Columns>
                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Iden" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TableNameID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataHyperLinkColumn Caption="ชื่อไฟล์" FieldName="Path" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <PropertiesHyperLinkEdit Target="_blank" TextField="FileName">
                                                        </PropertiesHyperLinkEdit>
                                                    </dx:GridViewDataHyperLinkColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="อัพโหลดไฟล์">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxUploadControl ID="ASPxUploadControl4" runat="server" OnFileUploadComplete="ASPxUploadControl4_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                                <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview.Refresh();
}" />
                                            </dx:ASPxUploadControl>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                        <asp:SqlDataSource ID="SqlDocuments" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_Iden" Type="Int32" />
                                <asp:Parameter Name="original_TableNameID" />
                                <asp:Parameter Name="original_TableName" Type="String" />
                                <asp:Parameter Name="original_Path" Type="String" />
                                <asp:Parameter Name="original_FileName" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Iden" Type="Int32" />
                                <asp:Parameter Name="TableNameID" />
                                <asp:Parameter Name="Path" Type="String" />
                                <asp:Parameter Name="FileName" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="Iden" SessionField="id" Type="Int32" />
                                <asp:Parameter DefaultValue="9" Name="TableNameID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Iden" Type="Int32" />
                                <asp:Parameter Name="TableNameID" />
                                <asp:Parameter Name="Path" Type="String" />
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_Iden" Type="Int32" />
                                <asp:Parameter Name="original_TableNameID" />
                                <asp:Parameter Name="original_Path" Type="String" />
                                <asp:Parameter Name="original_FileName" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seCmtPro" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seCmtPro_NumberChanged">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="tbCmtProCredit" runat="server" Text="1" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="tbCmtProTotal" runat="server" AutoPostBack="True" ReadOnly="True" Text="0" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">อาจารย์ที่ปรึกษานักศึกษา</td>
                    <td>
                        <dx:ASPxPageControl ID="pageControl1" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                            <TabPages>
                                <dx:TabPage Text="รายชื่อไฟล์">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxGridView ID="gvFileDetail1" runat="server" AutoGenerateColumns="False" ClientInstanceName="Gridview2" DataSourceID="SqlDocuments1" KeyFieldName="id" OnRowDeleting="gvFileDetail1_RowDeleting">
                                                <Columns>
                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Iden" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TableNameID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataHyperLinkColumn Caption="ชื่อไฟล์" FieldName="Path" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <PropertiesHyperLinkEdit Target="_blank" TextField="FileName">
                                                        </PropertiesHyperLinkEdit>
                                                    </dx:GridViewDataHyperLinkColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="อัพโหลดไฟล์">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxUploadControl ID="ASPxUploadControl2" runat="server" OnFileUploadComplete="ASPxUploadControl2_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                                <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview2.Refresh();
}" />
                                            </dx:ASPxUploadControl>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                        <asp:SqlDataSource ID="SqlDocuments1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_Iden" Type="Int32" />
                                <asp:Parameter Name="original_TableNameID" />
                                <asp:Parameter Name="original_TableName" Type="String" />
                                <asp:Parameter Name="original_Path" Type="String" />
                                <asp:Parameter Name="original_FileName" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Iden" Type="Int32" />
                                <asp:Parameter Name="TableNameID" />
                                <asp:Parameter Name="Path" Type="String" />
                                <asp:Parameter Name="FileName" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="Iden" SessionField="id" Type="Int32" />
                                <asp:Parameter DefaultValue="13" Name="TableNameID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Iden" Type="Int32" />
                                <asp:Parameter Name="TableNameID" />
                                <asp:Parameter Name="Path" Type="String" />
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_Iden" Type="Int32" />
                                <asp:Parameter Name="original_TableNameID" />
                                <asp:Parameter Name="original_Path" Type="String" />
                                <asp:Parameter Name="original_FileName" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seAsp" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seAsp_NumberChanged">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="tbAspCredit" runat="server" ReadOnly="True" Text="2" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="tbAspTotal" runat="server" ReadOnly="True" Text="0" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">อาจารย์ที่ปรึกษาชมรม/สโมสร/องค์กรนักศึกษา</td>
                    <td>
                        <dx:ASPxPageControl ID="pageControl2" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                            <TabPages>
                                <dx:TabPage Text="รายชื่อไฟล์">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxGridView ID="gvFileDetail2" runat="server" AutoGenerateColumns="False" ClientInstanceName="Gridview3" DataSourceID="SqlDocuments2" KeyFieldName="id" OnRowDeleting="gvFileDetail2_RowDeleting">
                                                <Columns>
                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Iden" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TableNameID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataHyperLinkColumn Caption="ชื่อไฟล์" FieldName="Path" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <PropertiesHyperLinkEdit Target="_blank" TextField="FileName">
                                                        </PropertiesHyperLinkEdit>
                                                    </dx:GridViewDataHyperLinkColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="อัพโหลดไฟล์">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxUploadControl ID="ASPxUploadControl3" runat="server" OnFileUploadComplete="ASPxUploadControl3_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                                <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview3.Refresh();
}" />
                                            </dx:ASPxUploadControl>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                        <asp:SqlDataSource ID="SqlDocuments2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_Iden" Type="Int32" />
                                <asp:Parameter Name="original_TableNameID" />
                                <asp:Parameter Name="original_TableName" Type="String" />
                                <asp:Parameter Name="original_Path" Type="String" />
                                <asp:Parameter Name="original_FileName" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Iden" Type="Int32" />
                                <asp:Parameter Name="TableNameID" />
                                <asp:Parameter Name="Path" Type="String" />
                                <asp:Parameter Name="FileName" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="Iden" SessionField="id" Type="Int32" />
                                <asp:Parameter DefaultValue="14" Name="TableNameID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Iden" Type="Int32" />
                                <asp:Parameter Name="TableNameID" />
                                <asp:Parameter Name="Path" Type="String" />
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_Iden" Type="Int32" />
                                <asp:Parameter Name="original_TableNameID" />
                                <asp:Parameter Name="original_Path" Type="String" />
                                <asp:Parameter Name="original_FileName" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seAcp" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seAcp_NumberChanged">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="tbAcpCredit" runat="server" ReadOnly="True" Text="2" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="tbAcpTotal" runat="server" ReadOnly="True" Text="0" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr class="warning">
                    <td align="right" colspan="4" style="font-weight: bold">ภาระงานพัฒนานักศึกษารวม</td>
                    <td>
                        <dx:ASPxTextBox ID="tbAllTotal" runat="server" ReadOnly="True" Text="0" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <dx:ASPxButton ID="btSubmit" runat="server" Height="100%" OnClick="btSubmit_Click" Text="บันทึกข้อมูล" Width="100%">
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
</asp:Content>
