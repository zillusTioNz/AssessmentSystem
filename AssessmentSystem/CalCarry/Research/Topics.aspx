<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="AssessmentSystem.CalCarry.Thesis.Topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Topics Page<dx:ASPxGridView ID="gvResearch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlResearch" KeyFieldName="id" OnCustomUnboundColumnData="gvResearch_CustomUnboundColumnData">
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
                <dx:GridViewDataTextColumn FieldName="Refer" Visible="False" VisibleIndex="4">
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
        <asp:SqlDataSource ID="SqlResearch" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Research] WHERE [id] = @original_id AND (([ResName] = @original_ResName) OR ([ResName] IS NULL AND @original_ResName IS NULL)) AND (([RoundID] = @original_RoundID) OR ([RoundID] IS NULL AND @original_RoundID IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([ProfessorStatusID] = @original_ProfessorStatusID) OR ([ProfessorStatusID] IS NULL AND @original_ProfessorStatusID IS NULL)) AND (([Percentage] = @original_Percentage) OR ([Percentage] IS NULL AND @original_Percentage IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [Research] ([ResName], [RoundID], [Refer], [ProfessorStatusID], [Percentage], [UserName], [DurationID]) VALUES (@ResName, @RoundID, @Refer, @ProfessorStatusID, @Percentage, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Research]" UpdateCommand="UPDATE [Research] SET [ResName] = @ResName, [RoundID] = @RoundID, [Refer] = @Refer, [ProfessorStatusID] = @ProfessorStatusID, [Percentage] = @Percentage, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([ResName] = @original_ResName) OR ([ResName] IS NULL AND @original_ResName IS NULL)) AND (([RoundID] = @original_RoundID) OR ([RoundID] IS NULL AND @original_RoundID IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([ProfessorStatusID] = @original_ProfessorStatusID) OR ([ProfessorStatusID] IS NULL AND @original_ProfessorStatusID IS NULL)) AND (([Percentage] = @original_Percentage) OR ([Percentage] IS NULL AND @original_Percentage IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ResName" Type="String" />
                <asp:Parameter Name="original_RoundID" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="original_Percentage" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResName" Type="String" />
                <asp:Parameter Name="RoundID" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="Percentage" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResName" Type="String" />
                <asp:Parameter Name="RoundID" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="Percentage" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ResName" Type="String" />
                <asp:Parameter Name="original_RoundID" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_ProfessorStatusID" Type="Int32" />
                <asp:Parameter Name="original_Percentage" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRound" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [Round]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlProfessorStatus" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [ProfessorStatus]"></asp:SqlDataSource>
    </p>
</asp:Content>
