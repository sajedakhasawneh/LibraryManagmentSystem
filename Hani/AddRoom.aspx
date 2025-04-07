<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRoom.aspx.cs" Inherits="Group5.Hani.AddRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
            body{
        background-color:#2C3E50;
    }


                .p-4 {
    transition: 1.5s;
    margin-top: 10rem;
    padding: 1.5rem !important;
}
    </style>
</head>
<body class="container mt-4">
    <form id="form1" runat="server">
        <div class="card p-4 shadow-lg">
            <h2 class="text-center">Add Room</h2>

            <!-- Room Name -->
            <div class="mb-3">
                <asp:Label ID="lblRoomName" runat="server" AssociatedControlID="txtRoomName" CssClass="form-label" Text="Room Name"></asp:Label>
                <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Capacity -->
            <div class="mb-3">
                <asp:Label ID="lblCapacity" runat="server" AssociatedControlID="txtCapacity" CssClass="form-label" Text="Capacity"></asp:Label>
                <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <asp:Label ID="lblDescription" runat="server" AssociatedControlID="txtDescription" CssClass="form-label" Text="Description"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>

            <!-- File Upload -->
            <div class="mb-3">
                <asp:Label ID="lblImage" runat="server" AssociatedControlID="fuImage" CssClass="form-label" Text="Upload Image"></asp:Label>
                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            </div>

            <!-- Submit Button -->
            <div class="mb-3 text-center">
                <asp:Button ID="btnAddRoom" runat="server" Text="Add Room" CssClass="btn btn-primary"
                    
        Style="background-color: #F1C40F; border-color: #F1C40F; color: white;" 
                    
                    OnClick="btnAddRoom_Click" />
            </div>

            <!-- Success/Error Message -->
            <div class="mb-3 text-center">
                <asp:Label ID="lblmsg" runat="server" CssClass="fw-bold" ForeColor="Green" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
    <script>  function confirmCancel() {
            return confirm("Are you sure you want to cancel this reservation? This will require admin approval.");
        }</script>
</body>
</html>
