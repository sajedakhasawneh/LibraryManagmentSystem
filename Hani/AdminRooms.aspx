<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRooms.aspx.cs" Inherits="Group5.Hani.AdminRooms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Reservations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center">Manage Reservations</h2>
            <asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                OnRowCommand="gvReservations_RowCommand">
                <Columns>
                    <asp:BoundField DataField="RoomID" HeaderText="Room ID" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
     
                            <asp:Button ID="btnAccept" runat="server" CommandName="Accept" CommandArgument='<%# Eval("RoomID") %>'
                                Text="Accept" CssClass="btn btn-success btn-sm"
                                Visible='<%# Eval("Status").ToString() == "Pending" %>' />

                            <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Eval("RoomID") %>'
                                Text="Reject" CssClass="btn btn-danger btn-sm"
                                Visible='<%# Eval("Status").ToString() == "Pending" %>' />


                            <asp:Button ID="btnApproveCancel" runat="server" CommandName="ApproveCancel" CommandArgument='<%# Eval("RoomID") %>'
                                Text="Approve Cancellation" CssClass="btn btn-warning btn-sm"
                                Visible='<%# Eval("Status").ToString() == "Cancel Pending" %>' />


                            <asp:Button ID="btnRejectCancel" runat="server" CommandName="RejectCancel" CommandArgument='<%# Eval("RoomID") %>'
                                Text="Reject Cancellation" CssClass="btn btn-secondary btn-sm"
                                Visible='<%# Eval("Status").ToString() == "Cancel Pending" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRooms.aspx.cs" Inherits="Group5.Hani.AdminRooms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
           body {
        background-color: #2C3E50;
        color: #F4F1DE;
        /*            font-family: Garamond;*/
    }
    </style>
    <script type="text/javascript">
        function confirmDelete(roomId) {
            if (confirm("Are you sure you want to delete this room?")) {
                document.getElementById('<%= HiddenFieldRoomId.ClientID %>').value = roomId;
                document.getElementById('<%= btnConfirmDelete.ClientID %>').click();  // Triggers server-side delete
            }
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">

            <!-- Top Buttons -->
            <div class="d-flex justify-content-between mb-3">
                <h2>Manage Rooms</h2>
                <div>
                    <asp:Button ID="btnTakeMeBack" runat="server" CssClass="btn btn-warning" Text="Dashboard" OnClick="TakeMeBack_Click" />
                    <asp:Button ID="btnRequests" runat="server" CssClass="btn btn-secondary me-2" Text="Requests" PostBackUrl="Requests.aspx" />
                    <asp:Button ID="btnAddRoom" runat="server" CssClass="btn btn-success" Text="Add Room" PostBackUrl="AddRoom.aspx" />
                    <asp:Button ID="btnExportRooms" runat="server" CssClass="btn btn-info me-2" Text="Export Rooms" OnClick="ExportRooms_Click" />

                </div>
            </div>

            <!-- Room Cards -->
            <div class="d-flex flex-wrap justify-content-center" runat="server" id="RoomContainer"></div>

            <!-- Hidden Field to Store Room ID for Deletion -->
            <asp:HiddenField ID="HiddenFieldRoomId" runat="server" />

            <!-- Button to Trigger Server-side Deletion -->
            <asp:Button ID="btnConfirmDelete" runat="server" CssClass="d-none" OnClick="ConfirmDelete_Click" />


        </div>
    </form>
</body>
</html>
