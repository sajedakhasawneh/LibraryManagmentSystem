<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminBooks.aspx.cs" Inherits="Group5.Mona.AdminBooks" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #2C3E50;
            color: #F4F1DE;
            /*            font-family: Garamond;*/
        }

        .container {
            margin-top: 50px;
        }

        .btn-primary {
            background-color: #2C3E50;
            border-color: #F1C40F;
        }

            .btn-primary:hover {
                background-color: #F1C40F;
                color: #2C3E50;
            }

        .table thead {
            background-color: #F1C40F;
            color: #2C3E50;
        }



        .navbar-light.sticky-top {
            top: -100px;
            transition: .5s;
        }



        /* Footer */
        .footer {
            margin-left: 30vw;
        }

        .pf {
            font-size: 0.9rem;
            margin-left: 5vw;
        }

        .footer a {
            color: #F1C40F;
            text-decoration: none;
        }

        .navbar {
            margin-top: 0;
            margin-bottom: 0;
            padding-top: 0;
            padding-bottom: 0;
        }

        .head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 0vw;
            margin: 0;
        }

        .logo {
            width: 12vw;
            margin: 0;
        }

        .btn-dashboard {
            margin-right: 1vw;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <!-- Navbar Start -->
        <nav class=" head">
            <img src="img/logo11.png" alt="Logo" class="logo" />
            <asp:HyperLink ID="btnBackToDashboard" runat="server" CssClass="btn btn-primary btn-dashboard" NavigateUrl="/Habib/Habib1.aspx">
    <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
            </asp:HyperLink>

        </nav>
        <!-- Navbar End -->
        <div class="container">
            <h2 class="text-center">Book Management</h2>
            <div id="form2" runat="server">
                <div class="mb-3">
                    <label for="txtBookId" class="form-label">Book ID</label>
                    <asp:TextBox ID="txtBookId" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtBookName" class="form-label">Book Name</label>
                    <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtAuthor" class="form-label">Author</label>
                    <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtDescription" class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="fileUpload" class="form-label">Book Image</label>
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                </div>

                <!-- Image Preview -->
                <%-- <div class="mb-3">
                    <asp:Image ID="imgPreview" runat="server" CssClass="img-thumbnail" Width="150px" Height="150px" Visible="false" />
                </div>--%>



                <asp:Button ID="btnAdd" runat="server" Text="Add Book" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update Book" CssClass="btn btn-warning" OnClick="btnUpdate_Click" Visible="false" />
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                <asp:HiddenField ID="hiddenOriginalBookId" runat="server" />
                <asp:HiddenField ID="hiddenOriginalBookName" runat="server" />

                <h3 class="mt-4 d-flex justify-content-between">Book List
   
                    <asp:LinkButton ID="btnDownloadBooksPDF" runat="server" CssClass="btn btn-outline-light btn-sm"
                        OnClick="btnDownloadBooksPDF_Click" ToolTip="Download as PDF">
        <i class="fa fa-download"></i>
    </asp:LinkButton>
                </h3>

                <asp:GridView ID="gvBooks" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                        <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                        <asp:BoundField DataField="Author" HeaderText="Author" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <%--<asp:BoundField DataField="Status" HeaderText="Status" />--%>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='<%# Eval("ImagePath") %>' alt="Book Image" width="50" height="50" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm"
                                    CommandArgument='<%# Eval("BookID") %>' OnClick="btnEdit_Click"
                                    CausesValidation="false" UseSubmitBehavior="false" />

                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("BookID") %>' OnClick="btnDelete_Click"
                                    CausesValidation="false" UseSubmitBehavior="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <h3 class="mt-4 d-flex justify-content-between">Borrow Requests
   
                    <asp:LinkButton ID="btnDownloadRequestsPDF" runat="server" CssClass="btn btn-outline-light btn-sm"
                        OnClick="btnDownloadRequestsPDF_Click" ToolTip="Download as PDF">
        <i class="fa fa-download"></i>
    </asp:LinkButton>
                </h3>
                <asp:GridView ID="gvRequestedBooks" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                        <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                        <asp:BoundField DataField="Author" HeaderText="Author" />
                        <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" />
                        <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-success btn-sm"
                                    CommandArgument='<%# Eval("BookID") %>' OnClick="btnApprove_Click"
                                    Visible='<%# Eval("ShowActionButtons") %>' CausesValidation="false" UseSubmitBehavior="false" />

                                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("BookID") %>' OnClick="btnReject_Click"
                                    Visible='<%# Eval("ShowActionButtons") %>' CausesValidation="false" UseSubmitBehavior="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>



            </div>
        </div>
        <!-- Policy & Copyright Section -->
        <div class="footer">
            <p class="pf">&copy; 2025 Horizon Library. All rights reserved. <a href="policy.aspx">Privacy Policy</a> | <a href="terms.aspx">Terms of Service</a></p>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
    </form>
</body>
</html>

