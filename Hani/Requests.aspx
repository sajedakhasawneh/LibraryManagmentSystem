<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="Group5.Hani.Requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Requets</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
      <style>
         body {
      background-color: #2C3E50;
      color: #F4F1DE;
      /*            font-family: Garamond;*/
  }
  </style>
</head>
<body>    <form id="form1" runat="server">
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

                <asp:Button ID="btnTakeMeBack" runat="server" CssClass="btn btn-warning" Text="Room Controll" OnClick="TakeMeBack_Click" />

        </div>
    </form>
</body>
</html>
