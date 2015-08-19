<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="AdvisorThesis.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.AdvisorMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <dx:ASPxGridView ID="gvAdvisorThesis" runat="server" AutoGenerateColumns="False" DataSourceID="SqlAdvisorThesis" KeyFieldName="id" OnCustomUnboundColumnData="gvAdvisorThesis_CustomUnboundColumnData" OnRowDeleting="gvAdvisorThesis_RowDeleting">
            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
            <Templates>
                <DetailRow>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <dx:ASPxPageControl ID="pageControl" runat="server" ActiveTabIndex="0" AutoPostBack="True" EnableCallBacks="True">
                                <TabPages>
                                    <dx:TabPage Text="รายชื่อไฟล์" Visible="true">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:ASPxGridView ID="gvFileDetail" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDocuments" KeyFieldName="id" OnBeforePerformDataSelect="gvFileDetail_BeforePerformDataSelect" OnRowDeleting="gvFileDetail_RowDeleting">
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
                                                            <PropertiesHyperLinkEdit TextField="FileName">
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
                                                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete1" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                                                </dx:ASPxUploadControl>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="pageControl" EventName="TabClick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </DetailRow>
            </Templates>
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFooter="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อนักศึกษาปริญญาโท" FieldName="ThesisName" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="สถานะที่ปรึกษา" FieldName="StatusID" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="SqlStatus" TextField="Status" ValueField="StatusID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/คน/สัปดาห์" FieldName="CpW" ReadOnly="True" UnboundType="Decimal" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="CpW" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlAdvisorThesis" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [AdvisorThesis] WHERE [id] = @original_id AND [ThesisName] = @original_ThesisName AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL)) AND (([StatusID] = @original_StatusID) OR ([StatusID] IS NULL AND @original_StatusID IS NULL))" InsertCommand="INSERT INTO [AdvisorThesis] ([ThesisName], [UserName], [DurationID], [StatusID]) VALUES (@ThesisName, @UserName, @DurationID, @StatusID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT id, ThesisName, UserName, DurationID, StatusID FROM AdvisorThesis WHERE (UserName = @UserName) AND (DurationID = @DurationID)" UpdateCommand="UPDATE [AdvisorThesis] SET [ThesisName] = @ThesisName, [UserName] = @UserName, [DurationID] = @DurationID, [StatusID] = @StatusID WHERE [id] = @original_id AND [ThesisName] = @original_ThesisName AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL)) AND (([StatusID] = @original_StatusID) OR ([StatusID] IS NULL AND @original_StatusID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ThesisName" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
                <asp:Parameter Name="original_StatusID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ThesisName" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="StatusID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" />
                <asp:SessionParameter Name="DurationID" SessionField="DurationID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ThesisName" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="StatusID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ThesisName" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
                <asp:Parameter Name="original_StatusID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlStatus" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [StatusAdvisor]"></asp:SqlDataSource>
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
                <asp:Parameter DefaultValue="4" Name="TableNameID" />
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
    </p>
</asp:Content>
