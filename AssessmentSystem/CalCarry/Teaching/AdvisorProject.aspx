<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="AdvisorProject.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.AdvisorBachelor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        AdvisorProject Page<dx:ASPxGridView ID="gvAdvisorProject" runat="server" AutoGenerateColumns="False" DataSourceID="SqlAdvisorProject" KeyFieldName="id" OnCustomUnboundColumnData="gvAdvisorProject_CustomUnboundColumnData">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFooter="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="กลุ่มนักศึกษา" FieldName="StdGroup" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อโครงงาน" FieldName="ProjectName" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Refer" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Username" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="สถานะที่ปรึกษา" FieldName="StatusID" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="SqlStatus" TextField="Status" ValueField="StatusID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="CpW" ReadOnly="True" UnboundType="Decimal" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="CpW" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlAdvisorProject" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [AdvisorProject] WHERE [id] = @original_id AND (([StdGroup] = @original_StdGroup) OR ([StdGroup] IS NULL AND @original_StdGroup IS NULL)) AND (([ProjectName] = @original_ProjectName) OR ([ProjectName] IS NULL AND @original_ProjectName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL)) AND (([StatusID] = @original_StatusID) OR ([StatusID] IS NULL AND @original_StatusID IS NULL))" InsertCommand="INSERT INTO [AdvisorProject] ([StdGroup], [ProjectName], [Refer], [Username], [DurationID], [StatusID]) VALUES (@StdGroup, @ProjectName, @Refer, @Username, @DurationID, @StatusID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AdvisorProject]" UpdateCommand="UPDATE [AdvisorProject] SET [StdGroup] = @StdGroup, [ProjectName] = @ProjectName, [Refer] = @Refer, [Username] = @Username, [DurationID] = @DurationID, [StatusID] = @StatusID WHERE [id] = @original_id AND (([StdGroup] = @original_StdGroup) OR ([StdGroup] IS NULL AND @original_StdGroup IS NULL)) AND (([ProjectName] = @original_ProjectName) OR ([ProjectName] IS NULL AND @original_ProjectName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL)) AND (([StatusID] = @original_StatusID) OR ([StatusID] IS NULL AND @original_StatusID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdGroup" Type="String" />
                <asp:Parameter Name="original_ProjectName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
                <asp:Parameter Name="original_StatusID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StdGroup" Type="String" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="StatusID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StdGroup" Type="String" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="StatusID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdGroup" Type="String" />
                <asp:Parameter Name="original_ProjectName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
                <asp:Parameter Name="original_StatusID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlStatus" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [StatusAdvisor]"></asp:SqlDataSource>
    </p>
</asp:Content>
