<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ArtandCulture.aspx.cs" Inherits="AssessmentSystem.CalCarry.ArtCulture.ArtandCulture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Art and Culture Page<dx:ASPxGridView ID="gvCulture" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCulture" KeyFieldName="id" OnCustomUnboundColumnData="gvCulture_CustomUnboundColumnData">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="เอกสารอ้างอิง" FieldName="Refer" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ReadOnly="True" UnboundType="String" VisibleIndex="2">
                    <DataItemTemplate>
                        เป็นคณะกรรมการ คณะทำงาน ตามคำสั่งของหัวหน้าส่วนราชการ
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn Caption="จำนวนโครงการ" FieldName="ProjectNumber" VisibleIndex="4">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์/คณะกรรมการ" FieldName="CarryCredit" ReadOnly="True" UnboundType="Decimal" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="Total" ReadOnly="True" UnboundType="Decimal" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlCulture" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Culture] WHERE [id] = @original_id AND (([ProjectNumber] = @original_ProjectNumber) OR ([ProjectNumber] IS NULL AND @original_ProjectNumber IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [Culture] ([ProjectNumber], [Refer], [UserName], [DurationID]) VALUES (@ProjectNumber, @Refer, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Culture]" UpdateCommand="UPDATE [Culture] SET [ProjectNumber] = @ProjectNumber, [Refer] = @Refer, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([ProjectNumber] = @original_ProjectNumber) OR ([ProjectNumber] IS NULL AND @original_ProjectNumber IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ProjectNumber" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProjectNumber" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProjectNumber" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ProjectNumber" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
