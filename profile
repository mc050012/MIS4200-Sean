<%@ Page Title="" Language="C#" MasterPageFile="~/mis4200.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="profile.aspx.cs" Inherits="profile" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph1" Runat="Server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" Runat="Server">
    <br />
    <asp:FormView ID="fvContent" runat="server" DataKeyNames="CID" DataSourceID="sdsTextBox">
        <EditItemTemplate>
            &nbsp;<FTB:FreeTextBox ID="ftbEditContent" runat="server" Text='<%# Bind("SectionContent") %> ' toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu|InsertRule,InsertDate,InsertTime"
height="600px" Width="100%" />

            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="lbAdd" runat="server" CommandName="New"></asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            &nbsp;<FTB:FreeTextBox ID="ftbInsertContent" runat="server" Text='<%# Bind("SectionContent") %> ' toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu|InsertRule,InsertDate,InsertTime"
height="600px" Width="100%" />

            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:Label ID="SectionContentLabel" runat="server" Text='<%# Bind("SectionContent") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="sdsTextBox" runat="server" ConnectionString="<%$ ConnectionStrings:csCentric %>" DeleteCommand="DELETE FROM [Content] WHERE [CID] = @CID" InsertCommand="INSERT INTO [Content] ([Page], [Section], [SectionContent]) VALUES (@Page, @Section, @SectionContent)" SelectCommand="SELECT [CID], [Page], [Section], [SectionContent] FROM [Content] WHERE (([Page] = @Page) AND ([Section] = @Section))" UpdateCommand="UPDATE [Content] SET [SectionContent] = @SectionContent WHERE [CID] = @CID">
        <DeleteParameters>
            <asp:Parameter Name="CID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DefaultValue="Profile" Name="Page" Type="String" />
            <asp:Parameter DefaultValue="Main" Name="Section" Type="String" />
            <asp:Parameter Name="SectionContent" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="Profile" Name="Page" Type="String" />
            <asp:Parameter DefaultValue="Main" Name="Section" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Page" Type="String" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="SectionContent" Type="String" />
            <asp:Parameter Name="CID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph3" Runat="Server">
    <br />
    <asp:DetailsView ID="dvEmployeeStuff" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsEmployeeInfo" Height="50px" Width="500px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="lbNew" runat="server" CommandName="New" ForeColor="White">Add user information</asp:LinkButton>
        </EmptyDataTemplate>
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="jobTitle" HeaderText="jobTitle" SortExpression="jobTitle" />
            <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            <asp:BoundField DataField="fName" HeaderText="fName" SortExpression="fName" />
            <asp:BoundField DataField="lName" HeaderText="lName" SortExpression="lName" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="sdsEmployeeInfo" runat="server" ConnectionString="<%$ ConnectionStrings:csCentric %>" SelectCommand="SELECT [ID], [username], [password], [email], [jobTitle], [location], [fName], [lName] FROM [EmployeeInfo]" DeleteCommand="DELETE FROM [EmployeeInfo] WHERE [ID] = @ID" InsertCommand="INSERT INTO [EmployeeInfo] ([username], [password], [email], [jobTitle], [location], [fName], [lName]) VALUES (@username, @password, @email, @jobTitle, @location, @fName, @lName)" UpdateCommand="UPDATE [EmployeeInfo] SET [username] = @username, [password] = @password, [email] = @email, [jobTitle] = @jobTitle, [location] = @location, [fName] = @fName, [lName] = @lName WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="jobTitle" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="fName" Type="String" />
            <asp:Parameter Name="lName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="jobTitle" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="fName" Type="String" />
            <asp:Parameter Name="lName" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    </asp:Content>
