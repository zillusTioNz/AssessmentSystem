<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="AssessmentSystem.CalCarry.AcademicService.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="5" DataSourceID="SqlAcademicService">
        <Items>
            <dx:LayoutItem FieldName="id" Visible="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E1" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem ColSpan="3">
            </dx:EmptyLayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E27" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E26" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E28" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="เอกสารอ้างอิง" FieldName="CommitteeRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="จำนวนงาน" FieldName="CommitteeProject">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E2" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E29" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E30" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem ColSpan="3">
            </dx:EmptyLayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E31" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E32" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E33" runat="server" Text="ASPxLabel">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="เอกสารอ้างอิง" FieldName="ExpertInRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertInHours">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E4" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertInPracHours">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E6" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertInPracRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertOutHours">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E8" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertOutRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertOutPracHours">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E10" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ExpertOutPracRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeAcPerson">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E12" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeAcRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeCrPerson">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E14" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeCrRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeBsPerson">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E16" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeBsRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E17" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeThPerson">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E18" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="CommitteeThRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E19" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ServiceAnalysisTimes">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E20" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ServiceAnalysisRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E21" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ServiceOtherTimes">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E22" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="ServiceOtherRefer">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E23" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="DurationID">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E24" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="UserName">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="ASPxFormLayout1_E25" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
    <asp:SqlDataSource ID="SqlAcademicService" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AssessmentSystem %>" DeleteCommand="DELETE FROM [AcademicService] WHERE [id] = @original_id AND (([CommitteeProject] = @original_CommitteeProject) OR ([CommitteeProject] IS NULL AND @original_CommitteeProject IS NULL)) AND (([CommitteeRefer] = @original_CommitteeRefer) OR ([CommitteeRefer] IS NULL AND @original_CommitteeRefer IS NULL)) AND (([ExpertInHours] = @original_ExpertInHours) OR ([ExpertInHours] IS NULL AND @original_ExpertInHours IS NULL)) AND (([ExpertInRefer] = @original_ExpertInRefer) OR ([ExpertInRefer] IS NULL AND @original_ExpertInRefer IS NULL)) AND (([ExpertInPracHours] = @original_ExpertInPracHours) OR ([ExpertInPracHours] IS NULL AND @original_ExpertInPracHours IS NULL)) AND (([ExpertInPracRefer] = @original_ExpertInPracRefer) OR ([ExpertInPracRefer] IS NULL AND @original_ExpertInPracRefer IS NULL)) AND (([ExpertOutHours] = @original_ExpertOutHours) OR ([ExpertOutHours] IS NULL AND @original_ExpertOutHours IS NULL)) AND (([ExpertOutRefer] = @original_ExpertOutRefer) OR ([ExpertOutRefer] IS NULL AND @original_ExpertOutRefer IS NULL)) AND (([ExpertOutPracHours] = @original_ExpertOutPracHours) OR ([ExpertOutPracHours] IS NULL AND @original_ExpertOutPracHours IS NULL)) AND (([ExpertOutPracRefer] = @original_ExpertOutPracRefer) OR ([ExpertOutPracRefer] IS NULL AND @original_ExpertOutPracRefer IS NULL)) AND (([CommitteeAcPerson] = @original_CommitteeAcPerson) OR ([CommitteeAcPerson] IS NULL AND @original_CommitteeAcPerson IS NULL)) AND (([CommitteeAcRefer] = @original_CommitteeAcRefer) OR ([CommitteeAcRefer] IS NULL AND @original_CommitteeAcRefer IS NULL)) AND (([CommitteeCrPerson] = @original_CommitteeCrPerson) OR ([CommitteeCrPerson] IS NULL AND @original_CommitteeCrPerson IS NULL)) AND (([CommitteeCrRefer] = @original_CommitteeCrRefer) OR ([CommitteeCrRefer] IS NULL AND @original_CommitteeCrRefer IS NULL)) AND (([CommitteeBsPerson] = @original_CommitteeBsPerson) OR ([CommitteeBsPerson] IS NULL AND @original_CommitteeBsPerson IS NULL)) AND (([CommitteeBsRefer] = @original_CommitteeBsRefer) OR ([CommitteeBsRefer] IS NULL AND @original_CommitteeBsRefer IS NULL)) AND (([CommitteeThPerson] = @original_CommitteeThPerson) OR ([CommitteeThPerson] IS NULL AND @original_CommitteeThPerson IS NULL)) AND (([CommitteeThRefer] = @original_CommitteeThRefer) OR ([CommitteeThRefer] IS NULL AND @original_CommitteeThRefer IS NULL)) AND (([ServiceAnalysisTimes] = @original_ServiceAnalysisTimes) OR ([ServiceAnalysisTimes] IS NULL AND @original_ServiceAnalysisTimes IS NULL)) AND (([ServiceAnalysisRefer] = @original_ServiceAnalysisRefer) OR ([ServiceAnalysisRefer] IS NULL AND @original_ServiceAnalysisRefer IS NULL)) AND (([ServiceOtherTimes] = @original_ServiceOtherTimes) OR ([ServiceOtherTimes] IS NULL AND @original_ServiceOtherTimes IS NULL)) AND (([ServiceOtherRefer] = @original_ServiceOtherRefer) OR ([ServiceOtherRefer] IS NULL AND @original_ServiceOtherRefer IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL))" InsertCommand="INSERT INTO [AcademicService] ([CommitteeProject], [CommitteeRefer], [ExpertInHours], [ExpertInRefer], [ExpertInPracHours], [ExpertInPracRefer], [ExpertOutHours], [ExpertOutRefer], [ExpertOutPracHours], [ExpertOutPracRefer], [CommitteeAcPerson], [CommitteeAcRefer], [CommitteeCrPerson], [CommitteeCrRefer], [CommitteeBsPerson], [CommitteeBsRefer], [CommitteeThPerson], [CommitteeThRefer], [ServiceAnalysisTimes], [ServiceAnalysisRefer], [ServiceOtherTimes], [ServiceOtherRefer], [DurationID], [UserName]) VALUES (@CommitteeProject, @CommitteeRefer, @ExpertInHours, @ExpertInRefer, @ExpertInPracHours, @ExpertInPracRefer, @ExpertOutHours, @ExpertOutRefer, @ExpertOutPracHours, @ExpertOutPracRefer, @CommitteeAcPerson, @CommitteeAcRefer, @CommitteeCrPerson, @CommitteeCrRefer, @CommitteeBsPerson, @CommitteeBsRefer, @CommitteeThPerson, @CommitteeThRefer, @ServiceAnalysisTimes, @ServiceAnalysisRefer, @ServiceOtherTimes, @ServiceOtherRefer, @DurationID, @UserName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AcademicService]" UpdateCommand="UPDATE [AcademicService] SET [CommitteeProject] = @CommitteeProject, [CommitteeRefer] = @CommitteeRefer, [ExpertInHours] = @ExpertInHours, [ExpertInRefer] = @ExpertInRefer, [ExpertInPracHours] = @ExpertInPracHours, [ExpertInPracRefer] = @ExpertInPracRefer, [ExpertOutHours] = @ExpertOutHours, [ExpertOutRefer] = @ExpertOutRefer, [ExpertOutPracHours] = @ExpertOutPracHours, [ExpertOutPracRefer] = @ExpertOutPracRefer, [CommitteeAcPerson] = @CommitteeAcPerson, [CommitteeAcRefer] = @CommitteeAcRefer, [CommitteeCrPerson] = @CommitteeCrPerson, [CommitteeCrRefer] = @CommitteeCrRefer, [CommitteeBsPerson] = @CommitteeBsPerson, [CommitteeBsRefer] = @CommitteeBsRefer, [CommitteeThPerson] = @CommitteeThPerson, [CommitteeThRefer] = @CommitteeThRefer, [ServiceAnalysisTimes] = @ServiceAnalysisTimes, [ServiceAnalysisRefer] = @ServiceAnalysisRefer, [ServiceOtherTimes] = @ServiceOtherTimes, [ServiceOtherRefer] = @ServiceOtherRefer, [DurationID] = @DurationID, [UserName] = @UserName WHERE [id] = @original_id AND (([CommitteeProject] = @original_CommitteeProject) OR ([CommitteeProject] IS NULL AND @original_CommitteeProject IS NULL)) AND (([CommitteeRefer] = @original_CommitteeRefer) OR ([CommitteeRefer] IS NULL AND @original_CommitteeRefer IS NULL)) AND (([ExpertInHours] = @original_ExpertInHours) OR ([ExpertInHours] IS NULL AND @original_ExpertInHours IS NULL)) AND (([ExpertInRefer] = @original_ExpertInRefer) OR ([ExpertInRefer] IS NULL AND @original_ExpertInRefer IS NULL)) AND (([ExpertInPracHours] = @original_ExpertInPracHours) OR ([ExpertInPracHours] IS NULL AND @original_ExpertInPracHours IS NULL)) AND (([ExpertInPracRefer] = @original_ExpertInPracRefer) OR ([ExpertInPracRefer] IS NULL AND @original_ExpertInPracRefer IS NULL)) AND (([ExpertOutHours] = @original_ExpertOutHours) OR ([ExpertOutHours] IS NULL AND @original_ExpertOutHours IS NULL)) AND (([ExpertOutRefer] = @original_ExpertOutRefer) OR ([ExpertOutRefer] IS NULL AND @original_ExpertOutRefer IS NULL)) AND (([ExpertOutPracHours] = @original_ExpertOutPracHours) OR ([ExpertOutPracHours] IS NULL AND @original_ExpertOutPracHours IS NULL)) AND (([ExpertOutPracRefer] = @original_ExpertOutPracRefer) OR ([ExpertOutPracRefer] IS NULL AND @original_ExpertOutPracRefer IS NULL)) AND (([CommitteeAcPerson] = @original_CommitteeAcPerson) OR ([CommitteeAcPerson] IS NULL AND @original_CommitteeAcPerson IS NULL)) AND (([CommitteeAcRefer] = @original_CommitteeAcRefer) OR ([CommitteeAcRefer] IS NULL AND @original_CommitteeAcRefer IS NULL)) AND (([CommitteeCrPerson] = @original_CommitteeCrPerson) OR ([CommitteeCrPerson] IS NULL AND @original_CommitteeCrPerson IS NULL)) AND (([CommitteeCrRefer] = @original_CommitteeCrRefer) OR ([CommitteeCrRefer] IS NULL AND @original_CommitteeCrRefer IS NULL)) AND (([CommitteeBsPerson] = @original_CommitteeBsPerson) OR ([CommitteeBsPerson] IS NULL AND @original_CommitteeBsPerson IS NULL)) AND (([CommitteeBsRefer] = @original_CommitteeBsRefer) OR ([CommitteeBsRefer] IS NULL AND @original_CommitteeBsRefer IS NULL)) AND (([CommitteeThPerson] = @original_CommitteeThPerson) OR ([CommitteeThPerson] IS NULL AND @original_CommitteeThPerson IS NULL)) AND (([CommitteeThRefer] = @original_CommitteeThRefer) OR ([CommitteeThRefer] IS NULL AND @original_CommitteeThRefer IS NULL)) AND (([ServiceAnalysisTimes] = @original_ServiceAnalysisTimes) OR ([ServiceAnalysisTimes] IS NULL AND @original_ServiceAnalysisTimes IS NULL)) AND (([ServiceAnalysisRefer] = @original_ServiceAnalysisRefer) OR ([ServiceAnalysisRefer] IS NULL AND @original_ServiceAnalysisRefer IS NULL)) AND (([ServiceOtherTimes] = @original_ServiceOtherTimes) OR ([ServiceOtherTimes] IS NULL AND @original_ServiceOtherTimes IS NULL)) AND (([ServiceOtherRefer] = @original_ServiceOtherRefer) OR ([ServiceOtherRefer] IS NULL AND @original_ServiceOtherRefer IS NULL)) AND (([DurationID] = @original_DurationID) OR ([DurationID] IS NULL AND @original_DurationID IS NULL)) AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_CommitteeProject" Type="Int32" />
            <asp:Parameter Name="original_CommitteeRefer" Type="String" />
            <asp:Parameter Name="original_ExpertInHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertInRefer" Type="String" />
            <asp:Parameter Name="original_ExpertInPracHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertInPracRefer" Type="String" />
            <asp:Parameter Name="original_ExpertOutHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertOutRefer" Type="String" />
            <asp:Parameter Name="original_ExpertOutPracHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertOutPracRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeAcPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeAcRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeCrPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeCrRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeBsPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeBsRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeThPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeThRefer" Type="String" />
            <asp:Parameter Name="original_ServiceAnalysisTimes" Type="Int32" />
            <asp:Parameter Name="original_ServiceAnalysisRefer" Type="String" />
            <asp:Parameter Name="original_ServiceOtherTimes" Type="Int32" />
            <asp:Parameter Name="original_ServiceOtherRefer" Type="String" />
            <asp:Parameter Name="original_DurationID" Type="Int32" />
            <asp:Parameter Name="original_UserName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CommitteeProject" Type="Int32" />
            <asp:Parameter Name="CommitteeRefer" Type="String" />
            <asp:Parameter Name="ExpertInHours" Type="Int32" />
            <asp:Parameter Name="ExpertInRefer" Type="String" />
            <asp:Parameter Name="ExpertInPracHours" Type="Int32" />
            <asp:Parameter Name="ExpertInPracRefer" Type="String" />
            <asp:Parameter Name="ExpertOutHours" Type="Int32" />
            <asp:Parameter Name="ExpertOutRefer" Type="String" />
            <asp:Parameter Name="ExpertOutPracHours" Type="Int32" />
            <asp:Parameter Name="ExpertOutPracRefer" Type="String" />
            <asp:Parameter Name="CommitteeAcPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeAcRefer" Type="String" />
            <asp:Parameter Name="CommitteeCrPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeCrRefer" Type="String" />
            <asp:Parameter Name="CommitteeBsPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeBsRefer" Type="String" />
            <asp:Parameter Name="CommitteeThPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeThRefer" Type="String" />
            <asp:Parameter Name="ServiceAnalysisTimes" Type="Int32" />
            <asp:Parameter Name="ServiceAnalysisRefer" Type="String" />
            <asp:Parameter Name="ServiceOtherTimes" Type="Int32" />
            <asp:Parameter Name="ServiceOtherRefer" Type="String" />
            <asp:Parameter Name="DurationID" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CommitteeProject" Type="Int32" />
            <asp:Parameter Name="CommitteeRefer" Type="String" />
            <asp:Parameter Name="ExpertInHours" Type="Int32" />
            <asp:Parameter Name="ExpertInRefer" Type="String" />
            <asp:Parameter Name="ExpertInPracHours" Type="Int32" />
            <asp:Parameter Name="ExpertInPracRefer" Type="String" />
            <asp:Parameter Name="ExpertOutHours" Type="Int32" />
            <asp:Parameter Name="ExpertOutRefer" Type="String" />
            <asp:Parameter Name="ExpertOutPracHours" Type="Int32" />
            <asp:Parameter Name="ExpertOutPracRefer" Type="String" />
            <asp:Parameter Name="CommitteeAcPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeAcRefer" Type="String" />
            <asp:Parameter Name="CommitteeCrPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeCrRefer" Type="String" />
            <asp:Parameter Name="CommitteeBsPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeBsRefer" Type="String" />
            <asp:Parameter Name="CommitteeThPerson" Type="Int32" />
            <asp:Parameter Name="CommitteeThRefer" Type="String" />
            <asp:Parameter Name="ServiceAnalysisTimes" Type="Int32" />
            <asp:Parameter Name="ServiceAnalysisRefer" Type="String" />
            <asp:Parameter Name="ServiceOtherTimes" Type="Int32" />
            <asp:Parameter Name="ServiceOtherRefer" Type="String" />
            <asp:Parameter Name="DurationID" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_CommitteeProject" Type="Int32" />
            <asp:Parameter Name="original_CommitteeRefer" Type="String" />
            <asp:Parameter Name="original_ExpertInHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertInRefer" Type="String" />
            <asp:Parameter Name="original_ExpertInPracHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertInPracRefer" Type="String" />
            <asp:Parameter Name="original_ExpertOutHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertOutRefer" Type="String" />
            <asp:Parameter Name="original_ExpertOutPracHours" Type="Int32" />
            <asp:Parameter Name="original_ExpertOutPracRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeAcPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeAcRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeCrPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeCrRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeBsPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeBsRefer" Type="String" />
            <asp:Parameter Name="original_CommitteeThPerson" Type="Int32" />
            <asp:Parameter Name="original_CommitteeThRefer" Type="String" />
            <asp:Parameter Name="original_ServiceAnalysisTimes" Type="Int32" />
            <asp:Parameter Name="original_ServiceAnalysisRefer" Type="String" />
            <asp:Parameter Name="original_ServiceOtherTimes" Type="Int32" />
            <asp:Parameter Name="original_ServiceOtherRefer" Type="String" />
            <asp:Parameter Name="original_DurationID" Type="Int32" />
            <asp:Parameter Name="original_UserName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
