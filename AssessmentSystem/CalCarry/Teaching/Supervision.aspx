<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Supervision.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.Supervision" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Supervision Page<dx:ASPxGridView ID="gvSupervision" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSupervision" KeyFieldName="id" OnCustomUnboundColumnData="gvSupervision_CustomUnboundColumnData">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Refer" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Username" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/คน/สัปดาห์" FieldName="CarryCredit" VisibleIndex="5" ReadOnly="True" UnboundType="Decimal">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="CpW" ReadOnly="True" UnboundType="Decimal" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn Caption="จำนวนนักศึกษา" FieldName="StdNumber" VisibleIndex="4">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlSupervision" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Supervision] WHERE [id] = @original_id AND (([StdNumber] = @original_StdNumber) OR ([StdNumber] IS NULL AND @original_StdNumber IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL))" InsertCommand="INSERT INTO [Supervision] ([StdNumber], [Refer], [Username]) VALUES (@StdNumber, @Refer, @Username)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Supervision]" UpdateCommand="UPDATE [Supervision] SET [StdNumber] = @StdNumber, [Refer] = @Refer, [Username] = @Username WHERE [id] = @original_id AND (([StdNumber] = @original_StdNumber) OR ([StdNumber] IS NULL AND @original_StdNumber IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdNumber" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StdNumber" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StdNumber" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdNumber" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
