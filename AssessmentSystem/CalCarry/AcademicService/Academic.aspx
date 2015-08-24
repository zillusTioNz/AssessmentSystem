<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Academic.aspx.cs" Inherits="AssessmentSystem.CalCarry.AcademicService.Academic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <table class="table table-striped" style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td style="font-weight: bold">จำนวนงาน</td>
                <td style="font-weight: bold">ภาระงาน/สัปดาห์/คณะกรรมการ</td>
                <td style="font-weight: bold">ภาระงาน/สัปดาห์</td>
            </tr>
            <tr>
                <td>คณะกรรมการ คณะทำงาน</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl1" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments2" KeyFieldName="id" OnRowDeleting="gvFileDetail1_RowDeleting" ClientInstanceName="Gridview1">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview1.Refresh();
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
                            <asp:Parameter DefaultValue="1" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seCmtPro" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seCmtPro_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtCredit" runat="server" ReadOnly="True" Text="0.3" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                     <dx:ASPxTextBox ID="tbCmtTotal" runat="server" ReadOnly="True" Text="0" Width="70px">
                     </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td style="font-weight: bold">จำนวนชั่วโมง</td>
                <td style="font-weight: bold">ภาระงาน/สัปดาห์/ชั่วโมง</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>วิทยากรฝึกอบรมตามโครงการบริการทางวิชาการของหน่วยงาน (วิทยากรบรรยาย)</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl2" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments2" KeyFieldName="id" OnRowDeleting="gvFileDetail2_RowDeleting" ClientInstanceName="Gridview2">
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
                            <asp:Parameter DefaultValue="15" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seEih" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seEih_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEihCredit" runat="server" Text="1" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEihTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>วิทยากรฝึกอบรมตามโครงการบริการทางวิชาการของหน่วยงาน (วิทยากรปฏิบัติ)</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl3" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments3" KeyFieldName="id" OnRowDeleting="gvFileDetail3_RowDeleting" ClientInstanceName="Gridview3">
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
                    <asp:SqlDataSource ID="SqlDocuments3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="16" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seEip" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seEip_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEipCredit" runat="server" ReadOnly="True" Text="0.5" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEipTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>วิทยากรบรรยายให้หน่วยงานภายนอก ที่มีหนังสือขอความร่วมมือและหัวหน้าส่วนราชการเห็นชอบ</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl4" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments4" KeyFieldName="id" OnRowDeleting="gvFileDetail4_RowDeleting" ClientInstanceName="Gridview4">
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
	Gridview4.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="17" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seEoh" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seEoh_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEohCredit" runat="server" ReadOnly="True" Text="1" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEohTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>วิทยากรปฏิบัติให้หน่วยงานภายนอก ที่มีหนังสือขอความร่วมมือและหัวหน้าส่วนราชการเห็นชอบ</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl5" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments5" KeyFieldName="id" OnRowDeleting="gvFileDetail5_RowDeleting" ClientInstanceName="Gridview5">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl5" runat="server" OnFileUploadComplete="ASPxUploadControl5_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview5.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="18" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seEop" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seEop_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEopCredit" runat="server" ReadOnly="True" Text="0.5" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEopTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: bold">การเป็นผู้ทรงคุณวุฒิ</td>
                <td style="font-weight: bold">จำนวน(ราย)</td>
                <td style="font-weight: bold">ภาระงาน/สัปดาห์/ราย</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>กรรมการพิจารณาผลงานทางวิชาการ หรืออ่านตำราทั้งภายในและภายนอกมหาวิทยาลัย</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl6" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments6" KeyFieldName="id" OnRowDeleting="gvFileDetail6_RowDeleting" ClientInstanceName="Gridview6">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl6" runat="server" OnFileUploadComplete="ASPxUploadControl6_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview6.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="19" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seCmtAp" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seCmtAp_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtApCredit" runat="server" ReadOnly="True" Text="2" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtApTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>กรรมการวิชาชีพ</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl7" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments7" KeyFieldName="id" OnRowDeleting="gvFileDetail7_RowDeleting" ClientInstanceName="Gridview7">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl7" runat="server" OnFileUploadComplete="ASPxUploadControl7_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview7.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments7" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="20" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seCmtCp" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seCmtCp_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtCpCredit" runat="server" ReadOnly="True" Text="2" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtCpTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>กรรมการร่างระเบียบและมาตรฐาน</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl8" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail8" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments8" KeyFieldName="id" OnRowDeleting="gvFileDetail8_RowDeleting" ClientInstanceName="Gridview8">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl8" runat="server" OnFileUploadComplete="ASPxUploadControl8_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview8.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments8" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="21" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seCmtBp" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seCmtBp_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtBpCredit" runat="server" ReadOnly="True" Text="2" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtBpTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>กรรมการสอบวิทยานิพนธ์ของหน่วยงานภายนอก</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl9" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail9" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments9" KeyFieldName="id" OnRowDeleting="gvFileDetail9_RowDeleting" ClientInstanceName="Gridview9">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl9" runat="server" OnFileUploadComplete="ASPxUploadControl9_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview9.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments9" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="22" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seCmtTp" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seCmtTp_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtTpCredit" runat="server" ReadOnly="True" Text="1" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbCmtTpTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td style="font-weight: bold">จำนวน(ครั้ง)</td>
                <td style="font-weight: bold">ภาระงาน/สัปดาห์</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>การให้บริการวิเคราะห์ ทดสอบ ตรวจสอบ ตรวจซ่อมฯ </td>
                <td>
                    <dx:ASPxPageControl ID="pageControl10" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail10" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments10" KeyFieldName="id" OnRowDeleting="gvFileDetail10_RowDeleting" ClientInstanceName="Gridview10">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl10" runat="server" OnFileUploadComplete="ASPxUploadControl10_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview10.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments10" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="23" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seSat" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seSat_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbSatCredit" runat="server" ReadOnly="True" Text="1" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbSatTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>งานบริการวิชาการอื่นๆที่ไม่อยู่ในแผนของมหาวิทยาลัย ถ้ามีการขอความร่วมมือจากหน่วยงานภายนอกให้ช่วยบริการวิชาการและวิชาชีพ</td>
                <td>
                    <dx:ASPxPageControl ID="pageControl11" runat="server" ActiveTabIndex="0" EnableCallBacks="True">
                        <TabPages>
                            <dx:TabPage Text="รายชื่อไฟล์">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvFileDetail11" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments11" KeyFieldName="id" OnRowDeleting="gvFileDetail11_RowDeleting" ClientInstanceName="Gridview11">
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
                                        <dx:ASPxUploadControl ID="ASPxUploadControl11" runat="server" OnFileUploadComplete="ASPxUploadControl11_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                            <ClientSideEvents FilesUploadComplete="function(s, e) {
	Gridview11.Refresh();
}" />
                                        </dx:ASPxUploadControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDocuments11" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Documents] WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableNameID] IS NULL AND @original_TableName IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))" InsertCommand="INSERT INTO [Documents] ([Iden], [TableNameID], [Path], [FileName]) VALUES (@Iden, @TableNameID, @Path, @FileName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] WHERE (([Iden] = @Iden) AND ([TableNameID] = @TableNameID))" UpdateCommand="UPDATE [Documents] SET [Iden] = @Iden, [TableNameID] = @TableNameID, [Path] = @Path, [FileName] = @FileName WHERE [id] = @original_id AND (([Iden] = @original_Iden) OR ([Iden] IS NULL AND @original_Iden IS NULL)) AND (([TableNameID] = @original_TableNameID) OR ([TableName] IS NULL AND @original_TableNameID IS NULL)) AND (([Path] = @original_Path) OR ([Path] IS NULL AND @original_Path IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL))">
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
                            <asp:Parameter DefaultValue="24" Name="TableNameID" />
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
                    <dx:ASPxSpinEdit ID="seSot" runat="server" AutoPostBack="True" Number="0" OnNumberChanged="seSot_NumberChanged" Width="50px">
                    </dx:ASPxSpinEdit>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbSotCredit" runat="server" ReadOnly="True" Text="7" Width="70px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbSotTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr class="warning">
                <td align="right" colspan="4" style="font-weight: bold">ภาระงานบริการวิชาการรวม</td>
                <td>
                    <dx:ASPxTextBox ID="tbAllTotal" runat="server" ReadOnly="True" Width="70px" Text="0">
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
    <p>
        &nbsp;</p>
    </asp:Content>
