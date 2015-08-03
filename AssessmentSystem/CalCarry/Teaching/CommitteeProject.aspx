<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CommitteeProject.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.CommitteeProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        CommitteeProject Page<dx:ASPxGridView ID="gvTesterProject" runat="server" AutoGenerateColumns="False" DataSourceID="SqlTesterProject" KeyFieldName="id" OnCustomUnboundColumnData="gvTesterProject_CustomUnboundColumnData">
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
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Refer" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="CpW" ReadOnly="True" UnboundType="Decimal" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="CpW" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlTesterProject" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [TesterProject] WHERE [id] = @original_id AND (([StdGroup] = @original_StdGroup) OR ([StdGroup] IS NULL AND @original_StdGroup IS NULL)) AND (([ProjectName] = @original_ProjectName) OR ([ProjectName] IS NULL AND @original_ProjectName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [TesterProject] ([StdGroup], [ProjectName], [Refer], [UserName], [DurationID]) VALUES (@StdGroup, @ProjectName, @Refer, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TesterProject]" UpdateCommand="UPDATE [TesterProject] SET [StdGroup] = @StdGroup, [ProjectName] = @ProjectName, [Refer] = @Refer, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([StdGroup] = @original_StdGroup) OR ([StdGroup] IS NULL AND @original_StdGroup IS NULL)) AND (([ProjectName] = @original_ProjectName) OR ([ProjectName] IS NULL AND @original_ProjectName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdGroup" Type="String" />
                <asp:Parameter Name="original_ProjectName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StdGroup" Type="String" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StdGroup" Type="String" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdGroup" Type="String" />
                <asp:Parameter Name="original_ProjectName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
