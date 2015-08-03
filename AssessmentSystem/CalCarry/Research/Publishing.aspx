<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Publishing.aspx.cs" Inherits="AssessmentSystem.CalCarry.Thesis.Publishing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Publishing Page<dx:ASPxGridView ID="gvResearchPublish" runat="server" AutoGenerateColumns="False" DataSourceID="SqlResearchPublish" KeyFieldName="id" OnCustomUnboundColumnData="gvResearchPublish_CustomUnboundColumnData">
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFooter="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อบทความวิจัย" FieldName="ResName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="เอกสารอ้างอิง" FieldName="Refer" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DurationID" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="การตีพิมพ์" FieldName="ResTypeID" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlResearchType" TextField="ResType" ValueField="ResTypeID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="สถานะงานวิจัย" FieldName="ResStatusID" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlResearchStatus" TextField="ResStatus" ValueField="ResStatusID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="หัวข้องานวิจัย" FieldName="ResNumber" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="SqlResearch" TextField="ResName" ValueField="id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ภาระงาน/สัปดาห์" FieldName="CpW" ReadOnly="True" UnboundType="Decimal" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="CpW" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlResearchPublish" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [ResearchPublish] WHERE [id] = @original_id AND (([ResName] = @original_ResName) OR ([ResName] IS NULL AND @original_ResName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([ResTypeID] = @original_ResTypeID) OR ([ResTypeID] IS NULL AND @original_ResTypeID IS NULL)) AND (([ResStatusID] = @original_ResStatusID) OR ([ResStatusID] IS NULL AND @original_ResStatusID IS NULL)) AND (([ResNumber] = @original_ResNumber) OR ([ResNumber] IS NULL AND @original_ResNumber IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))" InsertCommand="INSERT INTO [ResearchPublish] ([ResName], [Refer], [ResTypeID], [ResStatusID], [ResNumber], [UserName], [DurationID]) VALUES (@ResName, @Refer, @ResTypeID, @ResStatusID, @ResNumber, @UserName, @DurationID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ResearchPublish]" UpdateCommand="UPDATE [ResearchPublish] SET [ResName] = @ResName, [Refer] = @Refer, [ResTypeID] = @ResTypeID, [ResStatusID] = @ResStatusID, [ResNumber] = @ResNumber, [UserName] = @UserName, [DurationID] = @DurationID WHERE [id] = @original_id AND (([ResName] = @original_ResName) OR ([ResName] IS NULL AND @original_ResName IS NULL)) AND (([Refer] = @original_Refer) OR ([Refer] IS NULL AND @original_Refer IS NULL)) AND (([ResTypeID] = @original_ResTypeID) OR ([ResTypeID] IS NULL AND @original_ResTypeID IS NULL)) AND (([ResStatusID] = @original_ResStatusID) OR ([ResStatusID] IS NULL AND @original_ResStatusID IS NULL)) AND (([ResNumber] = @original_ResNumber) OR ([ResNumber] IS NULL AND @original_ResNumber IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ResName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_ResTypeID" Type="Int32" />
                <asp:Parameter Name="original_ResStatusID" Type="Int32" />
                <asp:Parameter Name="original_ResNumber" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="ResTypeID" Type="Int32" />
                <asp:Parameter Name="ResStatusID" Type="Int32" />
                <asp:Parameter Name="ResNumber" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResName" Type="String" />
                <asp:Parameter Name="Refer" Type="String" />
                <asp:Parameter Name="ResTypeID" Type="Int32" />
                <asp:Parameter Name="ResStatusID" Type="Int32" />
                <asp:Parameter Name="ResNumber" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="DurationID" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_ResName" Type="String" />
                <asp:Parameter Name="original_Refer" Type="String" />
                <asp:Parameter Name="original_ResTypeID" Type="Int32" />
                <asp:Parameter Name="original_ResStatusID" Type="Int32" />
                <asp:Parameter Name="original_ResNumber" Type="Int32" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_DurationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlResearchType" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [ResearchType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlResearchStatus" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT * FROM [ResearchStatus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlResearch" runat="server" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" SelectCommand="SELECT [ResName], [id] FROM [Research]"></asp:SqlDataSource>
    </p>
</asp:Content>
