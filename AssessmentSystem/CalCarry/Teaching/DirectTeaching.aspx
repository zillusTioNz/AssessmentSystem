<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DirectTeaching.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.DirectTeaching" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        DirectTeaching Page<dx:ASPxGridView ID="gvDirectTeaching" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDirectTeaching" KeyFieldName="id" OnCustomUnboundColumnData="gvDirectTeaching_CustomUnboundColumnData">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFooter="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อวิชา" FieldName="Subject" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="ภาระงานทฤษฎี" VisibleIndex="9">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="หน่วยกิต/สัปดาห์" VisibleIndex="0" UnboundType="Decimal" FieldName="TheoryCpW" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="สัดส่วนที่สอน" VisibleIndex="8">
                    <Columns>
                        <dx:GridViewDataSpinEditColumn Caption="สัปดาห์(ทฤษฎี)" FieldName="TheoryWeek" VisibleIndex="0">
                            <PropertiesSpinEdit DisplayFormatString="g">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn Caption="สัปดาห์(ปฏิบัติ)" FieldName="PracticeWeek" VisibleIndex="1">
                            <PropertiesSpinEdit DisplayFormatString="g">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="ภาระงานปฏิบัติ" VisibleIndex="10">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="หน่วยกิต/สัปดาห์" FieldName="PracticeCpW" UnboundType="Decimal" VisibleIndex="0" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn Caption="รวมภาระงาน/สัปดาห์" FieldName="TotalinRow" UnboundType="Decimal" VisibleIndex="11" ReadOnly="True" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn Caption="กลุ่มนักศึกษา" FieldName="StdGroup" VisibleIndex="3">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataSpinEditColumn Caption="จำนวนนักศึกษา" FieldName="StdNumber" VisibleIndex="4">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataSpinEditColumn Caption="หน่วยกิต(ทฤษฎี)" FieldName="TheoryCredit" VisibleIndex="6">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataSpinEditColumn Caption="หน่วยกิต(ปฏิบัติ)" FieldName="PracticeCredit" VisibleIndex="7">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="TotalinRow" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDirectTeaching" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [DirectTeaching] WHERE [id] = @original_id AND (([StdGroup] = @original_StdGroup) OR ([StdGroup] IS NULL AND @original_StdGroup IS NULL)) AND (([StdNumber] = @original_StdNumber) OR ([StdNumber] IS NULL AND @original_StdNumber IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([TheoryCredit] = @original_TheoryCredit) OR ([TheoryCredit] IS NULL AND @original_TheoryCredit IS NULL)) AND (([PracticeCredit] = @original_PracticeCredit) OR ([PracticeCredit] IS NULL AND @original_PracticeCredit IS NULL)) AND (([TheoryWeek] = @original_TheoryWeek) OR ([TheoryWeek] IS NULL AND @original_TheoryWeek IS NULL)) AND (([PracticeWeek] = @original_PracticeWeek) OR ([PracticeWeek] IS NULL AND @original_PracticeWeek IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [DirectTeaching] ([StdGroup], [StdNumber], [Subject], [TheoryCredit], [PracticeCredit], [TheoryWeek], [PracticeWeek], [UserName], [DurationID]) VALUES (@StdGroup, @StdNumber, @Subject, @TheoryCredit, @PracticeCredit, @TheoryWeek, @PracticeWeek, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DirectTeaching]" UpdateCommand="UPDATE [DirectTeaching] SET [StdGroup] = @StdGroup, [StdNumber] = @StdNumber, [Subject] = @Subject, [TheoryCredit] = @TheoryCredit, [PracticeCredit] = @PracticeCredit, [TheoryWeek] = @TheoryWeek, [PracticeWeek] = @PracticeWeek, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([StdGroup] = @original_StdGroup) OR ([StdGroup] IS NULL AND @original_StdGroup IS NULL)) AND (([StdNumber] = @original_StdNumber) OR ([StdNumber] IS NULL AND @original_StdNumber IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([TheoryCredit] = @original_TheoryCredit) OR ([TheoryCredit] IS NULL AND @original_TheoryCredit IS NULL)) AND (([PracticeCredit] = @original_PracticeCredit) OR ([PracticeCredit] IS NULL AND @original_PracticeCredit IS NULL)) AND (([TheoryWeek] = @original_TheoryWeek) OR ([TheoryWeek] IS NULL AND @original_TheoryWeek IS NULL)) AND (([PracticeWeek] = @original_PracticeWeek) OR ([PracticeWeek] IS NULL AND @original_PracticeWeek IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdGroup" Type="Int32" />
                <asp:Parameter Name="original_StdNumber" Type="Int32" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_TheoryCredit" Type="Int32" />
                <asp:Parameter Name="original_PracticeCredit" Type="Int32" />
                <asp:Parameter Name="original_TheoryWeek" Type="Int32" />
                <asp:Parameter Name="original_PracticeWeek" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StdGroup" Type="Int32" />
                <asp:Parameter Name="StdNumber" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="TheoryCredit" Type="Int32" />
                <asp:Parameter Name="PracticeCredit" Type="Int32" />
                <asp:Parameter Name="TheoryWeek" Type="Int32" />
                <asp:Parameter Name="PracticeWeek" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StdGroup" Type="Int32" />
                <asp:Parameter Name="StdNumber" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="TheoryCredit" Type="Int32" />
                <asp:Parameter Name="PracticeCredit" Type="Int32" />
                <asp:Parameter Name="TheoryWeek" Type="Int32" />
                <asp:Parameter Name="PracticeWeek" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdGroup" Type="Int32" />
                <asp:Parameter Name="original_StdNumber" Type="Int32" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_TheoryCredit" Type="Int32" />
                <asp:Parameter Name="original_PracticeCredit" Type="Int32" />
                <asp:Parameter Name="original_TheoryWeek" Type="Int32" />
                <asp:Parameter Name="original_PracticeWeek" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
