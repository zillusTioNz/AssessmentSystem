<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Supervision.aspx.cs" Inherits="AssessmentSystem.CalCarry.Teaching.Supervision" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ShowFilesPopup(id) {
            popup.SetContentUrl('SupervisionFV.aspx?id=' + id);
            popup.Show();
        }
    </script>
    <p>
        Supervision Page<dx:ASPxGridView ID="gvSupervision" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSupervision" KeyFieldName="id" OnCustomUnboundColumnData="gvSupervision_CustomUnboundColumnData" OnRowUpdating="gvSupervision_RowUpdating">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/คน/สัปดาห์" FieldName="CarryCredit" VisibleIndex="5" ReadOnly="True" UnboundType="Decimal">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="CpW" ReadOnly="True" UnboundType="Decimal" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn Caption="จำนวนนักศึกษา" FieldName="StdNumber" VisibleIndex="4">
                    <PropertiesSpinEdit DisplayFormatString="g">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataHyperLinkColumn Caption="เอกสารอ้างอิง" FieldName="id" VisibleIndex="3">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="javascript:ShowFilesPopup('{0}');" Text="click for view">
                    </PropertiesHyperLinkEdit>
                    <EditItemTemplate>
                        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" FileUploadMode="OnPageLoad" OnFilesUploadComplete="ASPxUploadControl1_FilesUploadComplete" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowAddRemoveButtons="True" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                            <ValidationSettings AllowedFileExtensions=".jpg, .pdf, .docx" MaxFileSize="4194304">
                            </ValidationSettings>
                        </dx:ASPxUploadControl>
                    </EditItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlSupervision" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [Supervision] WHERE [id] = @original_id AND (([StdNumber] = @original_StdNumber) OR ([StdNumber] IS NULL AND @original_StdNumber IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [Supervision] ([StdNumber], [Refer], [UserName], [DurationID]) VALUES (@StdNumber, @Refer, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Supervision]" UpdateCommand="UPDATE [Supervision] SET [StdNumber] = @StdNumber, [Refer] = @Refer, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([StdNumber] = @original_StdNumber) OR ([StdNumber] IS NULL AND @original_StdNumber IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdNumber" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StdNumber" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StdNumber" Type="Int32" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_StdNumber" Type="Int32" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <dx:ASPxPopupControl ID="popupControl" runat="server" ClientInstanceName="popup" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        </dx:ASPxPopupControl>
    </p>
</asp:Content>
