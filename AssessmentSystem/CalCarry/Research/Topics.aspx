<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="AssessmentSystem.CalCarry.Thesis.Topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <dx:ASPxGridView ID="gvResearch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlResearch" KeyFieldName="id" OnCustomUnboundColumnData="gvResearch_CustomUnboundColumnData" OnRowDeleting="gvResearch_RowDeleting">
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
                <dx:GridViewDataTextColumn Caption="ชื่อหัวข้องานวิจัย" FieldName="ResName" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ดำเนินการ (%)" FieldName="Percentage" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="สถานะการวิจัย" FieldName="ProfessorStatusID" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlProfessorStatus" TextField="Status" ValueField="ProfessorStatusID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="รอบประเมิน" FieldName="RoundID" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlRound" TextField="Round" ValueField="RoundID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="ResCredit" UnboundType="Decimal" VisibleIndex="9" ReadOnly="True">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="ResCredit" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlResearch" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Research] WHERE [id] = @original_id AND (([ResName] = @original_ResName) OR ([ResName] IS NULL AND @original_ResName IS NULL)) AND (([RoundID] = @original_RoundID) OR ([RoundID] IS NULL AND @original_RoundID IS NULL)) AND (([ProfessorStatusID] = @original_ProfessorStatusID) OR ([ProfessorStatusID] IS NULL AND @original_ProfessorStatusID IS NULL)) AND (([Percentage] = @original_Percentage) OR ([Percentage] IS NULL AND @original_Percentage IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [Research] ([ResName], [RoundID], [ProfessorStatusID], [Percentage], [UserName], [DurationID]) VALUES (@ResName, @RoundID, @ProfessorStatusID, @Percentage, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT id, ResName, RoundID, ProfessorStatusID, Percentage, UserName, DurationID FROM Research WHERE (UserName = @UserName) AND (DurationID = @DurationID)" UpdateCommand="UPDATE [Research] SET [ResName] = @ResName, [RoundID] = @RoundID, [ProfessorStatusID] = @ProfessorStatusID, [Percentage] = @Percentage, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([ResName] = @original_ResName) OR ([ResName] IS NULL AND @original_ResName IS NULL)) AND (([RoundID] = @original_RoundID) OR ([RoundID] IS NULL AND @original_RoundID IS NULL)) AND (([ProfessorStatusID] = @original_ProfessorStatusID) OR ([ProfessorStatusID] IS NULL AND @original_ProfessorStatusID IS NULL)) AND (([Percentage] = @original_Percentage) OR ([Percentage] IS NULL AND @original_Percentage IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ResName" Type="String" />
                <asp:Parameter Name="original_RoundID" Type="Int32" />
                <asp:Parameter Name="original_ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="original_Percentage" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResName" Type="String" />
                <asp:Parameter Name="RoundID" Type="Int32" />
                <asp:Parameter Name="ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="Percentage" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" />
                <asp:SessionParameter DefaultValue="" Name="DurationID" SessionField="DurationID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResName" Type="String" />
                <asp:Parameter Name="RoundID" Type="Int32" />
                <asp:Parameter Name="ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="Percentage" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ResName" Type="String" />
                <asp:Parameter Name="original_RoundID" Type="Int32" />
                <asp:Parameter Name="original_ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="original_Percentage" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRound" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [Round]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProfessorStatus" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [ProfessorStatus]"></asp:SqlDataSource>
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
                <asp:Parameter DefaultValue="7" Name="TableNameID" />
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
