<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Group5.Suhaib.registration" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>

        .bg-dark {
    --bs-bg-opacity: 1;
    background-color: #2C3E50 !important;
}

        .py-5 {
            padding-top: 0rem !important;
            padding-bottom: 0rem !important;
        }

        @media (min-width: 1200px) {
            .container, .container-lg, .container-md, .container-sm, .container-xl {
                max-width: 1099px;
            }
        }
  
.sign-in-link {
    text-align:center;
    font-size: 1rem;
    font-weight: bold;
    color: #34495E;
    text-align: center;
    margin-top: 15px;
}

.sign-in-link a {
    color: #F4F1DE;
    text-decoration: none;
    transition: color 0.3s ease-in-out, transform 0.3s ease-in-out;
}

.sign-in-link a:hover {
    color: #E0DAC6;
    text-decoration: underline;
    transform: scale(1.05);
}
.mt-3 {
    margin-top: 4rem !important;
    margin-left: 8rem;
}
.ms-2 {
    width: 464px;
    /* margin-right: 17rem; */
    margin-left: 0.5rem !important;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>




            <section class="h-100 bg-dark">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card card-registration my-4">
                                <div class="row g-0">
                                    <div class="col-xl-6 d-none d-xl-block">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
                                            alt="Sample photo" class="img-fluid"
                                            style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card-body p-md-5 text-black">
                                            <h3 class="mb-5 text-uppercase">Student registration form</h3>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">

                                                        <asp:TextBox ID="name" runat="server" class="form-control form-control-lg"></asp:TextBox>
                                                        <label class="form-label" for="form3Example1m">Full name</label>
                                                    </div>



                                                    <div data-mdb-input-init class="form-outline">

                                                        <asp:TextBox ID="phone" runat="server" class="form-control form-control-lg"></asp:TextBox>
                                                        <label class="form-label" for="form3Example1m">Phone Number</label>
                                                    </div>
                                                </div>

                                            </div>

                         
                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">

                                                        <asp:TextBox ID="Password" runat="server" class="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                                        <label class="form-label" for="form3Example1m1">Password</label>
                                                    </div>
                                                </div>

                                             

                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">

                                                        <asp:TextBox ID="conpassword" runat="server" class="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                                        <label class="form-label" for="form3Example1m1">Confirm Password</label>
                                                    </div>
                              




                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">

                                                        <asp:TextBox ID="uniID" runat="server" class="form-control form-control-lg"></asp:TextBox>
                                                        <label class="form-label" for="form3Example1m1">University ID</label>
                                                    </div>
                                                </div>



                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">

                                                <asp:TextBox ID="email" runat="server" class="form-control form-control-lg"></asp:TextBox>
                                                <label class="form-label" for="form3Example8">Email</label>
                                            </div>

                                            <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                                                <h6 class="mb-0 me-4">Gender: </h6>

                                                <div class="form-check form-check-inline mb-0 me-4">

                                                    <asp:RadioButton ID="Female" GroupName="Gender" Text="Female" runat="server" />


                                                </div>

                                                <div class="form-check form-check-inline mb-0 me-4">
                                                    <asp:RadioButton ID="Male" GroupName="Gender" Text="Male" runat="server" />

                                                </div>



                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">



                                                    <asp:DropDownList ID="ddlState" runat="server" data-mdb-select-init>
                                                        <asp:ListItem Text="College" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Information tecgnology" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Engineering" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Science" Value="4"></asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                                <div class="col-md-6 mb-4">

                                                    <asp:DropDownList ID="DropDownList1" runat="server" data-mdb-select-init>
                                                        <asp:ListItem Text="Major" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Computer science" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Cyber security" Value="3"></asp:ListItem>

                                                        <asp:ListItem Text="Artificial Intelligence" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Mathmatics" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Statistics" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="Physics" Value="7"></asp:ListItem>
                                                        <asp:ListItem Text="Civil Engneering" Value="8"></asp:ListItem>
                                                        <asp:ListItem Text="Chemical Engneering" Value="9"></asp:ListItem>
                                                        <asp:ListItem Text="Mechanical Engineering" Value="10"></asp:ListItem>


                                                    </asp:DropDownList>

                                                </div>
                                            </div>



                                            <div class="d-flex justify-content-end pt-3">

                                                <asp:Button ID="submit" Text="Register" runat="server" OnClick="submit_Click" data-mdb-button-init data-mdb-ripple-init class="btn btn-warning btn-lg ms-2" />
                                            </div>

                                    
                                            <p class="mt-3">
                                                Already have an account? 
        <a href="Loginpage.aspx" class="text-decoration-none fw-bold" style="color: #2C3E50;">Sign in here
        </a>
                                            </p>
                                        </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>




        </div>
    </form>

</body>--%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Group5.Suhaib.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            validateInput("name", /^[A-Z][a-z]+\s[A-Z][a-z]+$/, "Full name must start with a capital letter.");
            validateInput("phone", /^07\d{8}$/, "Phone number must start with 07 and be 10 digits.");
            validateInput("email", /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, "Invalid email format.");
            validateInput("uniID", /^\d{10}$/, "University ID must be exactly 10 digits.");
            validateInput("Password", /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/, "Password must contain 8+ characters, 1 uppercase, 1 number, and 1 special character.");
        });

        function validateInput(id, regex, errorMsg) {
            let input = document.getElementById(id);
            let errorDiv = document.createElement("div");
            errorDiv.style.color = "red";
            errorDiv.style.fontSize = "12px";
            input.parentNode.appendChild(errorDiv);

            input.addEventListener("input", function () {
                if (!regex.test(input.value)) {
                    errorDiv.innerText = errorMsg;
                } else {
                    errorDiv.innerText = "";
                }
            });
        }

        function validateForm() {
            let errorMessages = document.querySelectorAll("div[style='color: red; font-size: 12px;']");
            for (let error of errorMessages) {
                if (error.innerText !== "") {
                    Swal.fire("Error", "Please fix the errors before submitting.", "error");
                    return false; // Prevent form submission
                }
            }
            return true; // Allow form submission
        }

        function showSuccess() {
            Swal.fire({
                title: "Registration Successful!",
                text: "You will be redirected to login in 2 seconds.",
                icon: "success",
                timer: 2000,
                showConfirmButton: false
            }).then(() => {
                window.location.href = "Loginpage.aspx";
            });
        }

        function showError() {
            Swal.fire({
                title: "Error!",
                text: "Please check your inputs and try again.",
                icon: "error",
                confirmButtonText: "OK"
            });
        }
    </script>


    <style>
        .bg-dark {
            --bs-bg-opacity: 1;
            background-color: #2C3E50 !important;
        }

        .py-5 {
            padding-top: 0rem !important;
            padding-bottom: 0rem !important;
        }

        @media (min-width: 1200px) {
            .container, .container-lg, .container-md, .container-sm, .container-xl {
                max-width: 1099px;
            }
        }
        /* Sign-in Link Styling */
        .sign-in-link {
            text-align: center;
            font-size: 1rem;
            font-weight: bold;
            color: #34495E;
            text-align: center;
            margin-top: 15px;
        }

            .sign-in-link a {
                color: #F4F1DE;
                text-decoration: none;
                transition: color 0.3s ease-in-out, transform 0.3s ease-in-out;
            }

                .sign-in-link a:hover {
                    color: #E0DAC6;
                    text-decoration: underline;
                    transform: scale(1.05);
                }

        .mt-3 {
            margin-left: 4rem;
        }

        .ms-2 {
            width: 464px;
            /* margin-right: 17rem; */
            margin-left: 0.5rem !important;
        }

        .mb-4 {
            margin-bottom: 1.5rem !important;
            margin-top: .5rem;
        }

        .img-fluid {
            max-width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>




            <section class="h-100 bg-dark">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card card-registration my-4">
                                <div class="row g-0">
                                    <div class="col-xl-6 d-none d-xl-block">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
                                            alt="Sample photo" class="img-fluid"
                                            style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card-body p-md-5 text-black">
                                            <h3 class="mb-5 text-uppercase">Student registration form</h3>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">
                                                        <label class="form-label" for="form3Example1m">Full name</label>
                                                        <asp:TextBox ID="name" runat="server" class="form-control form-control-lg"></asp:TextBox>

                                                    </div>

                                                    <div data-mdb-input-init class="form-outline mb-4">
                                                        <label class="form-label" for="form3Example8">Email</label>
                                                        <asp:TextBox ID="email" runat="server" class="form-control form-control-lg"></asp:TextBox>

                                                    </div>

                                                    <div data-mdb-input-init class="form-outline">
                                                        <label class="form-label" for="form3Example1m">Phone Number</label>

                                                        <asp:TextBox ID="phone" runat="server" class="form-control form-control-lg"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">
                                                        <label class="form-label" for="form3Example1m1">Password</label>

                                                        <asp:TextBox ID="Password" runat="server" class="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>



                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">
                                                        <label class="form-label" for="form3Example1m1">Confirm Password</label>

                                                        <asp:TextBox ID="conpassword" runat="server" class="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>




                                                <div class="col-md-6 mb-4">
                                                    <div data-mdb-input-init class="form-outline">
                                                        <label class="form-label" for="form3Example1m1">University ID</label>

                                                        <asp:TextBox ID="uniID" runat="server" class="form-control form-control-lg"></asp:TextBox>
                                                    </div>
                                                </div>



                                            </div>



                                            <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                                                <h6 class="mb-0 me-4">Gender: </h6>

                                                <div class="form-check form-check-inline mb-0 me-4">

                                                    <asp:RadioButton ID="Female" GroupName="Gender" Text="Female" runat="server" />


                                                </div>

                                                <div class="form-check form-check-inline mb-0 me-4">
                                                    <asp:RadioButton ID="Male" GroupName="Gender" Text="Male" runat="server" />

                                                </div>



                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">



                                                    <asp:DropDownList ID="ddlState" runat="server" data-mdb-select-init>
                                                        <asp:ListItem Text="College" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Information tecgnology" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Engineering" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Science" Value="4"></asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                                <div class="col-md-6 mb-4">

                                                    <asp:DropDownList ID="DropDownList1" runat="server" data-mdb-select-init>
                                                        <asp:ListItem Text="Major" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Computer science" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Cyber security" Value="3"></asp:ListItem>

                                                        <asp:ListItem Text="Artificial Intelligence" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Mathmatics" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Statistics" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="Physics" Value="7"></asp:ListItem>
                                                        <asp:ListItem Text="Civil Engneering" Value="8"></asp:ListItem>
                                                        <asp:ListItem Text="Chemical Engneering" Value="9"></asp:ListItem>
                                                        <asp:ListItem Text="Mechanical Engineering" Value="10"></asp:ListItem>


                                                    </asp:DropDownList>

                                                </div>
                                            </div>

                                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>


                                            <div class="d-flex justify-content-end pt-3">

                                                <asp:Button ID="submit" Text="Register" runat="server"
                                                    OnClick="submit_Click"
                                                    OnClientClick="return validateForm();"
                                                    class="btn btn-warning btn-lg ms-2" />

                                            </div>

                                            <!-- Sign-in Link -->
                                            <p class="mt-3">
                                                Already have an account? 
        <a href="Loginpage.aspx" class="text-decoration-none fw-bold" style="color: #2C3E50;">Sign in here
        </a>
                                            </p>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        </section>




        </div>
    </form>

</body>
