<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CommitteeThesis.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.CommitteeThesis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        CommitteeThesis Page<dx:ASPxGridView ID="gvTesterThesis" runat="server" AutoGenerateColumns="False" DataSourceID="SqlTesterThesis" KeyFieldName="id" OnCustomUnboundColumnData="gvTesterThesis_CustomUnboundColumnData">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFooter="True" ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อเรื่องวิทยานิพนธ์ หรือหัวข้อเสนอทำวิทยานิพนธ์ หรือชื่อนักศึกษาปริญญาโท" FieldName="ThesisName" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Refer" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="CpW" UnboundType="Decimal" VisibleIndex="6" ReadOnly="True">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="CpW" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlTesterThesis" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [TesterThesis] WHERE [id] = @original_id AND (([ThesisName] = @original_ThesisName) OR ([ThesisName] IS NULL AND @original_ThesisName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [TesterThesis] ([ThesisName], [Refer], [UserName], [DurationID]) VALUES (@ThesisName, @Refer, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TesterThesis]" UpdateCommand="UPDATE [TesterThesis] SET [ThesisName] = @ThesisName, [Refer] = @Refer, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([ThesisName] = @original_ThesisName) OR ([ThesisName] IS NULL AND @original_ThesisName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ThesisName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ThesisName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ThesisName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ThesisName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
