<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Habib1.aspx.cs" Inherits="Group5.Habib.Habib1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
</head>
<style>
    /* Googlefont Poppins CDN Link */
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Garamond,sans-serif;
    }
    /*AAFTER EDIT FORM MONA */
    .chart-container {
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  margin: 30px 0;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.chart-container .head {
  margin-bottom: 20px;
}
.chart-container .head h3 {
  font-size: 24px;
  font-weight: 500;
  color: #333;
  margin: 0;
}
/ Optional: make the canvas container responsive /
.chart-wrapper {
  position: relative;
  height: 300px; / adjust as needed */
  width: 100%;
}
    /* Form Container */
    .edit-room-form {
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        max-width: 672px;
        margin: 69px auto;
    }

        .edit-room-form h2 {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

    /* Form Group */
    .form-group {
        margin-bottom: 20px;
    }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #555;
            margin-bottom: 8px;
        }

    /* Form Controls */
    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 6px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            outline: none;
        }

    /* File Upload */
    .file-upload {
        padding: 8px;
        background: #f8f9fa;
        border: 1px dashed #ddd;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.3s ease, border-color 0.3s ease;
    }

        .file-upload:hover {
            background: #e9ecef;
            border-color: #007bff;
        }

    .file-upload-hint {
        display: block;
        font-size: 12px;
        color: #888;
        margin-top: 4px;
    }

    /* Save Button */
    .save-btn {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        background: linear-gradient(135deg, #007bff, #0056b3);
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        margin-top: 71px;
    }

        .save-btn:hover {
            background: linear-gradient(135deg, #0056b3, #004080);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .save-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.3);
        }
    /*edit rooms*/
    /*asdads*/
    /* Table Container */
    .order {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-top: 71px;
    }

        /* Table Styles */
        .order table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .order table th,
            .order table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            .order table th {
                background-color: #f8f9fa;
                font-weight: 600;
                color: #333;
                text-transform: uppercase;
                font-size: 14px;
            }

            .order table tbody tr {
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

                .order table tbody tr:hover {
                    background-color: #f1f1f1;
                    /*    transform: translateY(-2px);*/
                }

    /* Status Styles */
    .status {
        display: inline-block;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

        .status.pending {
            background-color: #ffc107; /* Yellow */
            color: #000;
        }

        .status.complete {
            background-color: #28a745; /* Green */
            color: #fff;
        }

    /* Approved Button Styles */
    .approved-btn {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 8px 16px;
        font-size: 12px;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

        .approved-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .approved-btn:active {
            background-color: #1e7e34;
            transform: scale(0.98);
        }

    /* Animation for Table Rows */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .order table tbody tr {
        animation: fadeIn 0.5s ease-in-out;
    }

    /* Responsive Table */
    @media (max-width: 768px) {
        .order table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }

            .order table th,
            .order table td {
                min-width: 120px; /* Ensure columns don't get too narrow */
            }
    }
    /*sadad*/
    /*new*/
    add-btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

    .add-btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .add-btn:active {
        background-color: #004080;
        transform: scale(0.98);
    }

    .edit-btn {
        background-color: #ffc107; /* Yellow */
        color: #000;
        border: none;
        padding: 8px 16px;
        font-size: 12px;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        width: 65px;
    }

        .edit-btn:hover {
            background-color: #e0a800;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .edit-btn:active {
            background-color: #c79100;
            transform: scale(0.98);
        }

    .delete-btn {
        background-color: #dc3545; /* Red */
        color: white;
        border: none;
        padding: 8px 16px;
        font-size: 12px;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

        .delete-btn:hover {
            background-color: #c82333;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .delete-btn:active {
            background-color: #bd2130;
            transform: scale(0.98);
        }

    /* Responsive Table */
    @media (max-width: 768px) {
        .order table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }

            .order table th,
            .order table td {
                min-width: 120px; /* Ensure columns don't get too narrow */
            }
    }

    .add-btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

        .add-btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .add-btn:active {
            background-color: #004080;
            transform: scale(0.98);
        }

    /*new*/
    .nav-links a.active {
        background: #081d45;
    }

    #ss {
        margin-top: 57px;
    }

    #dd {
        width: 100%;
    }

    .ask {
        background-color: transparent;
        color: #F1C40F;
        border: none;
    }

    .approved-btn {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 15px;
        font-size: 10px;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

        .approved-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .approved-btn:active {
            background-color: #1e7e34;
            transform: scale(0.98);
        }

    .sidebar {
        position: fixed;
        height: 100%;
        width: 240px;
        background: #1F2A35;
        transition: all 0.5s ease;
    }

    :root {
        --poppins: "Poppins", sans-serif;
        --lato: "Lato", sans-serif;
        --light: #f9f9f9;
        --blue: #3c91e6;
        --light-blue: #cfe8ff;
        --grey: #f5f5f5;
        --dark-grey: #aaaaaa;
        --dark: #342e37;
        --red: #db504a;
        --yellow: #ffce26;
        --light-yellow: #fff2c6;
        --orange: #fd7238;
        --light-orange: #ffe0d3;
    }
    /* General button styling */
    .action-btn {
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        color: white;
    }

    /* Edit Button */
    .edit-btn {
        background-color: #ffc107; /* Yellow */
    }

        .edit-btn:hover {
            background-color: #e0a800;
            transform: scale(1.05);
        }

    /* Delete Button */
    .delete-btn {
        background-color: #dc3545; /* Red */
    }

        .delete-btn:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

    /* Add New Button */
    .add-btn {
        background-color: #28a745; /* Green */
    }

        .add-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

    html {
        overflow-x: hidden;
    }

    body {
        background: #425262;
        overflow-x: hidden;
    }

        body.dark {
            --light: #0c0c1e;
            --grey: #060714;
            --dark: #fbfbfb;
        }

    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        /*	background: var(--light);*/
        height: 100%;
        width: 237px;
        z-index: 2000;
        font-family: var(--lato);
        transition: 0.3s ease;
        overflow-x: hidden;
        scrollbar-width: none;
    }

        .sidebar.hide {
            width: 60px;
        }

        .sidebar::-webkit-scrollbar {
            display: none;
        }

        .sidebar .logo {
            font-size: 24px;
            font-weight: 700;
            height: 56px;
            display: flex;
            align-items: center;
            color: var(--blue);
            position: sticky;
            top: 0;
            left: 0;
            background: var(--light);
            z-index: 500;
            padding-bottom: 20px;
            box-sizing: content-box;
        }

            .sidebar .logo i {
                min-width: 60px;
                display: flex;
                justify-content: center;
            }

        .sidebar .side-menu {
            width: 100%;
            margin-top: 48px;
        }

            .sidebar .side-menu li {
                height: 100px;
                margin-left: 6px;
                background: transparent;
                border-radius: 48px 0 0 48px;
                padding: 4px;
            }

                .sidebar .side-menu li.active {
                    position: relative;
                    background: var(--grey);
                }

                    .sidebar .side-menu li.active::before {
                        content: "";
                        position: absolute;
                        height: 40px;
                        width: 40px;
                        border-radius: 50%;
                        right: 0;
                        top: -40px;
                        z-index: -1;
                        box-shadow: 20px 20px 0 var(--grey);
                    }

                    .sidebar .side-menu li.active::after {
                        content: "";
                        position: absolute;
                        height: 40px;
                        width: 40px;
                        border-radius: 50%;
                        right: 0;
                        bottom: -40px;
                        z-index: -1;
                        box-shadow: 20px -20px 0 var(--grey);
                    }

                .sidebar .side-menu li a {
                    height: 100%;
                    width: 100%;
                    background: var(--light);
                    display: flex;
                    align-items: center;
                    border-radius: 48px;
                    font-size: 16px;
                    color: var(--dark);
                    white-space: nowrap;
                    overflow-x: hidden;
                }

        .sidebar.hide .side-menu li a {
            width: calc(48px - (4px * 2));
            transition: 0.3s ease;
        }

        .sidebar .side-menu li.active a {
            color: var(--blue);
        }

        .sidebar .side-menu.top li a:hover {
            color: var(--blue);
        }

        .sidebar .side-menu li a.logout {
            color: var(--red);
        }

        .sidebar .side-menu li a i {
            min-width: calc(60px - ((4px + 6px) * 2));
            display: flex;
            justify-content: center;
        }

    .content {
        position: relative;
        width: calc(100% - 280px);
        left: 280px;
        transition: 0.3s ease;
    }

    .sidebar.hide ~ .content {
        width: calc(100% - 60px);
        left: 60px;
    }

    .content nav {
        height: 56px;
        background: var(--light);
        padding: 0 24px;
        display: flex;
        align-items: center;
        gap: 24px;
        font-family: var(--lato);
        position: sticky;
        top: 0;
        left: 0;
        z-index: 1000;
    }

        .content nav::before {
            content: "";
            position: absolute;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            left: 0;
            bottom: -40px;
            box-shadow: -20px -20px 0 var(--light);
        }

        .content nav a {
            color: var(--dark);
        }

        .content nav .fa-bars {
            cursor: pointer;
            color: var(--dark);
        }

        .content nav .nav-link {
            font-size: 16px;
            transition: 0.3s ease;
        }

            .content nav .nav-link:hover {
                color: var(--blue);
            }

        .content nav form {
            max-width: 400px;
            width: 400px;
            margin-right: auto;
        }

            .content nav form .form-input {
                display: flex;
                align-items: center;
                height: 36px;
            }

                .content nav form .form-input input {
                    flex-grow: 1;
                    padding: 0 16px;
                    height: 100%;
                    border: none;
                    background: var(--grey);
                    border-radius: 36px 0 0 36px;
                    outline: none;
                    width: 100%;
                    color: var(--dark);
                }

                .content nav form .form-input button {
                    width: 36px;
                    height: 100%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background: var(--blue);
                    color: var(--light);
                    font-size: 18px;
                    border: none;
                    outline: none;
                    border-radius: 0 36px 36px 0;
                    cursor: pointer;
                }

        .content nav .switch-mode {
            display: block;
            min-width: 50px;
            height: 25px;
            border-radius: 25px;
            background: var(--grey);
            cursor: pointer;
            position: relative;
        }

            .content nav .switch-mode::before {
                content: "";
                position: absolute;
                top: 2px;
                left: 2px;
                bottom: 2px;
                width: calc(25px - 4px);
                background: var(--blue);
                border-radius: 50%;
                transition: 0.3s ease;
            }

        .content nav #switch-mode:checked + .switch-mode::before {
            left: calc(100% - (25px - 4px) - 2px);
        }

        .content nav .notification {
            font-size: 20px;
            position: relative;
        }

            .content nav .notification .num {
                position: absolute;
                top: -6px;
                right: -6px;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                border: 2px solid var(--light);
                background: var(--red);
                color: var(--light);
                font-weight: 700;
                font-size: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

        .content nav .profile img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
        }

    .content main {
        width: 100%;
        padding: 36px 100px;
        font-family: var(--poppins);
        max-height: calc(100vh - 56px);
        overflow-y: auto;
    }

        .content main .head-title {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            flex-wrap: wrap;
        }

            .content main .head-title .left h1 {
                font-size: 36px;
                font-weight: 600;
                margin-bottom: 10px;
                color: var(--dark);
            }

            .content main .head-title .left .breadcrumb {
                display: flex;
                align-items: center;
                gap: 16px;
            }

                .content main .head-title .left .breadcrumb i {
                    color: var(--dark);
                }

                .content main .head-title .left .breadcrumb li a {
                    color: var(--dark-grey);
                    pointer-events: none;
                }

                    .content main .head-title .left .breadcrumb li a.active {
                        color: var(--blue);
                        pointer-events: unset;
                    }

            .content main .head-title .download-btn {
                height: 36px;
                padding: 0 16px;
                border-radius: 36px;
                background: var(--blue);
                color: var(--light);
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                font-weight: 500;
            }

        .content main .box-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 24px;
            margin-top: 36px;
        }

            .content main .box-info li {
                padding: 24px;
                background: var(--light);
                border-radius: 20px;
                display: flex;
                align-items: center;
                gap: 24px;
            }

                .content main .box-info li i {
                    width: 80px;
                    height: 80px;
                    border-radius: 10px;
                    font-size: 36px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .content main .box-info li:nth-child(1) i {
                    background: var(--light-orange);
                    color: var(--orange);
                }

                .content main .box-info li:nth-child(2) i {
                    background: var(--light-blue);
                    color: var(--blue);
                }

                .content main .box-info li:nth-child(3) i {
                    background: var(--light-yellow);
                    color: var(--yellow);
                }

                .content main .box-info li .text h3 {
                    font-size: 24px;
                    font-weight: 600;
                    color: var(--dark);
                }

                .content main .box-info li .text p {
                    color: var(--dark);
                }

        .content main .table-data {
            display: flex;
            flex-wrap: wrap;
            gap: 24px;
            margin-top: 24px;
            width: 100%;
            color: var(--dark);
        }

            .content main .table-data > div {
                border-radius: 20px;
                background: #F4F1DE;
                padding: 24px;
                overflow-x: auto;
                margin-top: 57px;
            }

            .content main .table-data .head {
                display: flex;
                align-items: center;
                gap: 16px;
                margin-bottom: 24px;
            }

                .content main .table-data .head h3 {
                    margin-right: auto;
                    font-size: 24px;
                    font-weight: 600;
                }

                .content main .table-data .head i {
                    cursor: pointer;
                }

            .content main .table-data .order {
                flex-grow: 1;
                flex-basis: 500px;
                margin-top: 40px;
            }

                .content main .table-data .order table {
                    width: 100%;
                    border-collapse: collapse;
                }

                    .content main .table-data .order table th {
                        padding-bottom: 12px;
                        font-size: 13px;
                        text-align: left;
                        border-bottom: 1px solid var(--grey);
                    }

                    .content main .table-data .order table td {
                        padding: 16px 0;
                    }

                        .content main .table-data .order table td:first-child {
                            display: flex;
                            align-items: center;
                            gap: 12px;
                            padding-left: 6px;
                        }

                        .content main .table-data .order table td img {
                            width: 36px;
                            height: 36px;
                            border-radius: 50%;
                            object-fit: cover;
                        }

                    .content main .table-data .order table tr:hover {
                        /*	background: var(--grey);*/
                    }

                    .content main .table-data .order table tr td .status {
                        font-size: 10px;
                        padding: 6px 16px;
                        color: var(--light);
                        border-radius: 20px;
                        font-weight: 700;
                    }

                        .content main .table-data .order table tr td .status.pending {
                            background: var(--orange);
                        }

                        .content main .table-data .order table tr td .status.process {
                            background: var(--yellow);
                        }

                        .content main .table-data .order table tr td .status.complete {
                            background: var(--blue);
                        }

        .content main .todo {
            flex-grow: 1;
            flex-basis: 300px;
        }

            .content main .todo .todo-list {
                width: 100%;
            }

                .content main .todo .todo-list li {
                    width: 100%;
                    margin-bottom: 16px;
                    background: var(--grey);
                    border-radius: 10px;
                    padding: 14px 20px;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

                    .content main .todo .todo-list li i {
                        cursor: pointer;
                    }

                    .content main .todo .todo-list li.completed {
                        border-left: 10px solid var(--blue);
                    }

                    .content main .todo .todo-list li.not-completed {
                        border-left: 10px solid var(--orange);
                    }

                    .content main .todo .todo-list li:last-child {
                        margin-bottom: 0;
                    }

    ::-webkit-scrollbar {
        width: 0.5rem;
        height: 0.5rem;
    }

    ::-webkit-scrollbar-track {
        background: #d9d9d9;
    }

    ::-webkit-scrollbar-thumb {
        background: var(--blue);
        border-radius: 5rem;
    }

    @media (max-width: 768px) {
        .sidebar {
            width: 200px;
        }

        .content {
            width: calc(100% - 200px);
            left: 200px;
        }

            .content nav .nav-link {
                display: none;
            }
    }

    @media (max-width: 576px) {
        .content nav form .form-input input {
            display: none;
        }

        .content nav form .form-input button {
            width: auto;
            height: auto;
            background: transparent;
            border-radius: none;
            color: var(--dark);
        }

        .content nav form.show .form-input input {
            display: block;
            width: 100%;
        }

        .content nav form.show .form-input button {
            width: 36px;
            height: 36px;
            border-radius: 0 36px 36px 0;
            color: var(--light);
            background: var(--red);
        }

        .content nav form.show ~ .notification,
        .content nav form.show ~ .profile {
            display: none;
        }

        .content main .table-data .head {
            min-width: 420px;
        }

        .content main .table-data .order table {
            min-width: 420px;
        }

        .content main .table-data .todo .todo-list {
            min-width: 420px;
        }
    }

    .sidebar.active {
        width: 60px;
    }

    .sidebar .logo-details {
        height: 80px;
        display: flex;
        align-items: center;
    }

        .sidebar .logo-details i {
            font-size: 28px;
            font-weight: 500;
            color: #fff;
            min-width: 60px;
            text-align: center;
        }

        .sidebar .logo-details .logo_name {
            color: #fff;
            font-size: 24px;
            font-weight: 500;
        }

    .sidebar .nav-links {
        margin-top: 10px;
    }

        .sidebar .nav-links li {
            position: relative;
            list-style: none;
            height: 67px;
        }

            .sidebar .nav-links li a {
                height: 100%;
                width: 100%;
                display: flex;
                align-items: center;
                text-decoration: none;
                transition: all 0.4s ease;
            }

                .sidebar .nav-links li a.active {
                    background: #081d45;
                }

                .sidebar .nav-links li a:hover {
                    background: #081d45;
                }

            .sidebar .nav-links li i {
                min-width: 60px;
                text-align: center;
                font-size: 18px;
                color: #fff;
            }

            .sidebar .nav-links li a .links_name {
                color: #F1C40F;
                font-size: 15px;
                font-weight: 400;
                white-space: nowrap;
            }

        .sidebar .nav-links .log_out {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

    .home-section {
        position: relative;
        background: #f5f5f5;
        /*  min-height: 100vh;*/
        width: calc(100% - 240px);
        left: 240px;
        transition: all 0.5s ease;
    }

    .sidebar.active ~ .home-section {
        width: calc(100% - 60px);
        left: 60px;
    }

    .home-section nav {
        display: flex;
        justify-content: space-between;
        height: 80px;
        background: #425262;
        display: flex;
        align-items: center;
        position: fixed;
        width: calc(100% - 240px);
        left: 240px;
        z-index: 100;
        padding: 0 20px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        transition: all 0.5s ease;
    }

    .sidebar.active ~ .home-section nav {
        left: 60px;
        width: calc(100% - 60px);
    }

    .home-section nav .sidebar-button {
        display: flex;
        align-items: center;
        font-size: 24px;
        font-weight: 500;
    }

    nav .sidebar-button i {
        font-size: 35px;
        margin-right: 10px;
    }

    .home-section nav .search-box {
        position: relative;
        height: 50px;
        max-width: 550px;
        width: 100%;
        margin: 0 20px;
    }

    nav .search-box input {
        height: 100%;
        width: 100%;
        outline: none;
        background: #f5f6fa;
        border: 2px solid #efeef1;
        border-radius: 6px;
        font-size: 18px;
        padding: 0 15px;
    }

    nav .search-box .bx-search {
        position: absolute;
        height: 40px;
        width: 40px;
        background: #2697ff;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        border-radius: 4px;
        line-height: 40px;
        text-align: center;
        color: #fff;
        font-size: 22px;
        transition: all 0.4 ease;
    }

    .home-section nav .profile-details {
        display: flex;
        align-items: center;
        height: 50px;
        min-width: 190px;
        padding: 0 15px 0 2px;
    }

    nav .profile-details img {
        height: 40px;
        width: 40px;
        border-radius: 6px;
        object-fit: cover;
    }

    nav .profile-details .admin_name {
        font-size: 15px;
        font-weight: 500;
        color: #333;
        margin: 0 10px;
        white-space: nowrap;
    }

    nav .profile-details i {
        font-size: 25px;
        color: #333;
    }

    .home-section .home-content {
        position: relative;
        padding-top: 104px;
    }

    .home-content .overview-boxes {
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 0 20px;
        margin-bottom: 26px;
    }

    .overview-boxes .box {
        display: flex;
        align-items: center;
        justify-content: center;
        width: calc(100% / 4 - 15px);
        background: #fff;
        padding: 15px 14px;
        border-radius: 12px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }

    .overview-boxes .box-topic {
        font-size: 20px;
        font-weight: 500;
    }

    .home-content .box .number {
        display: inline-block;
        font-size: 35px;
        margin-top: -6px;
        font-weight: 500;
    }

    .home-content .box .indicator {
        display: flex;
        align-items: center;
    }

        .home-content .box .indicator i {
            height: 20px;
            width: 20px;
            background: #8fdacb;
            line-height: 20px;
            text-align: center;
            border-radius: 50%;
            color: #fff;
            font-size: 20px;
            margin-right: 5px;
        }

    .box .indicator i.down {
        background: #e87d88;
    }

    .home-content .box .indicator .text {
        font-size: 12px;
    }

    .home-content .box .cart {
        display: inline-block;
        font-size: 32px;
        height: 50px;
        width: 50px;
        background: #cce5ff;
        line-height: 50px;
        text-align: center;
        color: #66b0ff;
        border-radius: 12px;
        margin: -15px 0 0 6px;
    }

        .home-content .box .cart.two {
            color: #2bd47d;
            background: #c0f2d8;
        }

        .home-content .box .cart.three {
            color: #ffc233;
            background: #ffe8b3;
        }

        .home-content .box .cart.four {
            color: #e05260;
            background: #f7d4d7;
        }

    .home-content .total-order {
        font-size: 20px;
        font-weight: 500;
    }

    .home-content .sales-boxes {
        display: flex;
        justify-content: space-between;
        /* padding: 0 20px; */
    }

        /* left box */
        .home-content .sales-boxes .recent-sales {
            width: 65%;
            background: #fff;
            padding: 20px 30px;
            margin: 0 20px;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .home-content .sales-boxes .sales-details {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

    .sales-boxes .box .title {
        font-size: 24px;
        font-weight: 500;
        /* margin-bottom: 10px; */
    }

    .sales-boxes .sales-details li.topic {
        font-size: 20px;
        font-weight: 500;
    }

    .sales-boxes .sales-details li {
        list-style: none;
        margin: 8px 0;
    }

        .sales-boxes .sales-details li a {
            font-size: 18px;
            color: #333;
            font-size: 400;
            text-decoration: none;
        }

    .sales-boxes .box .button {
        width: 100%;
        display: flex;
        justify-content: flex-end;
    }

        .sales-boxes .box .button a {
            color: #fff;
            background: #0a2558;
            padding: 4px 12px;
            font-size: 15px;
            font-weight: 400;
            border-radius: 4px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

            .sales-boxes .box .button a:hover {
                background: #0d3073;
            }

    /* Right box */
    .home-content .sales-boxes .top-sales {
        width: 35%;
        background: #fff;
        padding: 20px 30px;
        margin: 0 20px 0 0;
        border-radius: 12px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }

    .sales-boxes .top-sales li {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 10px 0;
    }

        .sales-boxes .top-sales li a img {
            height: 40px;
            width: 40px;
            object-fit: cover;
            border-radius: 12px;
            margin-right: 10px;
            background: #333;
        }

        .sales-boxes .top-sales li a {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .sales-boxes .top-sales li .product,
        .price {
            font-size: 17px;
            font-weight: 400;
            color: #333;
        }
    /* Responsive Media Query */
    @media (max-width: 1240px) {
        .sidebar {
            width: 60px;
        }

            .sidebar.active {
                width: 220px;
            }

        .home-section {
            width: calc(100% - 60px);
            left: 60px;
        }

        .sidebar.active ~ .home-section {
            /* width: calc(100% - 220px); */
            overflow: hidden;
            left: 220px;
        }

        .home-section nav {
            width: calc(100% - 60px);
            left: 60px;
        }

        .sidebar.active ~ .home-section nav {
            width: calc(100% - 220px);
            left: 220px;
        }
    }

    @media (max-width: 1150px) {
        .home-content .sales-boxes {
            flex-direction: column;
        }

            .home-content .sales-boxes .box {
                width: 100%;
                overflow-x: scroll;
                margin-bottom: 30px;
            }

            .home-content .sales-boxes .top-sales {
                margin: 0;
            }
    }

    @media (max-width: 1000px) {
        .overview-boxes .box {
            width: calc(100% / 2 - 15px);
            margin-bottom: 15px;
        }
    }

    @media (max-width: 700px) {
        nav .sidebar-button .dashboard,
        nav .profile-details .admin_name,
        nav .profile-details i {
            display: none;
        }

        .home-section nav .profile-details {
            height: 50px;
            min-width: 40px;
        }

        .home-content .sales-boxes .sales-details {
            width: 560px;
        }
    }

    @media (max-width: 550px) {
        .overview-boxes .box {
            width: 100%;
            margin-bottom: 15px;
        }

        .sidebar.active ~ .home-section nav .profile-details {
            display: none;
        }
    }

    span {
        color: #F1C40F
    }
    /*style cards*/
    .services-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }

    .service-card {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 300px;
        text-align: center;
        animation: fadeIn 0.5s ease-in-out;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        margin-top: 71px;
    }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

    .service-icon {
        font-size: 2.5rem;
        color: #6a11cb;
        margin-bottom: 15px;
    }

    .service-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: #333;
        margin-bottom: 10px;
    }

    .service-description {
        font-size: 0.9rem;
        color: #666;
        margin-bottom: 20px;
    }

    .service-btn {
        background-color: #6a11cb;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 20px;
        cursor: pointer;
        font-size: 1rem;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

        .service-btn:hover {
            background-color: #2575fc;
            transform: translateY(-2px);
        }

    /* Animations */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
            .chart-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 20px;
        }
.chart {
    width: 30% !important;
    height: 20% !important;
}
    /*style cards*/
            .stats-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
 padding: 76px 10px;        }

        /* Statistic Box */
        .stat-box {
            flex: 1;
            min-width: 220px;
            padding: 30px;
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            background-size: cover;
            background-blend-mode: overlay;
        }

        /* Unique Backgrounds */
        .customers { background: linear-gradient(45deg, #007bff, #00c6ff); }
        .books { background: linear-gradient(45deg, #dc3545, #ff6a00); }
        .rooms { background: linear-gradient(45deg, #6f42c1, #9d50bb); }
        .revenue { background: url('https://source.unsplash.com/400x300/?money') center/cover, rgba(40, 167, 69, 0.8); }

        /* Icon Styling */
        .stat-box i {
            font-size: 45px;
            margin-bottom: 10px;
        }

        /* Charts Container */
        .chart-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .chart {
            flex: 1;
            min-width: 300px;
        }

        @media (max-width: 768px) {
            .stats-container, .chart-container {
                flex-direction: column;
                align-items: center;
            }
        }
</style>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="sidebar">
                <div class="logo-details">
                    <i class='bx bxl-c-plus-plus'></i>
                    <span class="logo_name">CodingLab</span>
                </div>
                <ul class="nav-links">
                    <li>
                        <asp:LinkButton ID="lnkDashboard" runat="server" OnClick="ChangeView" CommandArgument="Dashboard">
            <i class='bx bx-grid-alt'></i>
            <span class="links_name">Dashboard</span>
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="lnkBooks" runat="server" OnClick="ChangeView" CommandArgument="Books">
            <i class='bx bx-box'></i>
            <span class="links_name">Books</span>
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="lnkRooms" runat="server" OnClick="ChangeView" CommandArgument="Rooms">
            <i class='bx bx-list-ul'></i>
            <span class="links_name">Rooms</span>
                        </asp:LinkButton>
                    </li>
                    <li>
                        <a href="mailto:habeeb.alafeef6@gmail.com">
                            <i class='bx bx-coin-stack'></i>
                            <span class="links_name">Feedback</span>
                        </a>
                    </li>
                    <li>
                        <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" CommandArgument="Logout">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Logout</span>
                        </asp:LinkButton>
                    </li>
                </ul>

            </div>
            <section class="home-section">
                <nav>
                    <div class="sidebar-button">
                        <i class='bx bx-menu sidebarBtn'></i>
                        <span class="dashboard">Dashboard</span>
                    </div>
                </nav>
            </section>
            <section class="content">
                <main>

                    <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
                        <asp:View ID="viewDashboard" runat="server">
                            
                                <!-- Statistics Boxes -->
    <div class="stats-container">
        <div class="stat-box customers">
            <i class="fas fa-users"></i>
            Customers: <span id="customersCount">0</span>
        </div>
        <div class="stat-box books">
            <i class="fas fa-book"></i>
            Books: <span id="booksCount">0</span>
        </div>
        <div class="stat-box rooms">
            <i class="fas fa-door-open"></i>
            Rooms Available: <span id="roomsAvailableCount">0</span>
        </div>
        <div class="stat-box revenue">
            <i class="fas fa-dollar-sign"></i>
            Revenue: $<span id="revenueCount">0</span>
        </div>
    </div>
                                <div class="chart-container">
                                    <canvas id="pieChart1" class="chart"></canvas>
                                    <canvas id="pieChart2" class="chart"></canvas>
                                    <canvas id="pieChart3" class="chart"></canvas>
                                </div>

                        </asp:View>

                        <!-- Books View -->
                        <asp:View ID="viewBooks" runat="server">
                            <div class="services-container">
                                <!-- Approve Borrow Request Card -->
                                <div class="service-card">
                                    <div class="service-icon">
                                        <i class="fas fa-check-circle"></i>
                                    </div>
                                    <div class="service-title">Approve Borrow Request</div>
                                    <div class="service-description">
                                        Review and approve pending borrow requests.
                                    </div>
                                    <button class="service-btn">Go to Requests</button>
                                </div>

                                <!-- Add Book Card -->
                                <div class="service-card">
                                    <div class="service-icon">
                                        <i class="fas fa-plus-circle"></i>
                                    </div>
                                    <div class="service-title">Add a New Book</div>
                                    <div class="service-description">
                                        Add a new book to the library collection.
                                    </div>
                                    <button class="service-btn">Add Book</button>
                                </div>

                                <!-- Delete Book Card -->
                                <div class="service-card">
                                    <div class="service-icon">
                                        <i class="fas fa-trash-alt"></i>
                                    </div>
                                    <div class="service-title">Delete a Book</div>
                                    <div class="service-description">
                                        Remove a book from the library collection.
                                    </div>
                                    <button class="service-btn">Delete Book</button>
                                </div>
                            </div>
                        </asp:View>

                        <!-- Rooms View -->
                        <asp:View ID="viewEditRoom" runat="server">
                            <div class="edit-room-form">
                                <h2>Edit Room</h2>
                                <div class="form-container">
                                    <!-- Room ID -->
                                    <div class="form-group">
                                        <label for="txtRoomID">Room ID</label>
                                        <asp:TextBox ID="txtRoomID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>

                                    <!-- Room Name -->
                                    <div class="form-group">
                                        <label for="txtRoomName">Room Name</label>
                                        <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control" placeholder="Enter Room Name"></asp:TextBox>
                                    </div>

                                    <!-- Capacity -->
                                    <div class="form-group">
                                        <label for="txtCapacity">Capacity</label>
                                        <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" placeholder="Enter Capacity" TextMode="Number"></asp:TextBox>
                                    </div>

                                    <!-- Description -->
                                    <div class="form-group">
                                        <label for="txtDescription">Description</label>
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Description" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    </div>

                                    <!-- Upload Image -->
                                    <div class="form-group">
                                        <label for="fileRoomImage">Upload Room Image</label>
                                        <asp:FileUpload ID="fileRoomImage" runat="server" CssClass="form-control file-upload" />
                                        <small class="file-upload-hint">Allowed formats: JPG, PNG, GIF (Max 5MB)</small>
                                    </div>

                                    <!-- Save Button -->
                                    <div class="form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="save-btn" OnClick="btnSave_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:View>

                        <!-- Team View -->
                        <asp:View ID="viewTeam" runat="server">
                            <h2>Team Section</h2>
                            <p id="ss">This is the team section content.</p>
                        </asp:View>

                        <!-- Feedback View -->
                        <asp:View ID="viewFeedback" runat="server">
                            <h2>Feedback Section</h2>
                            <p id="ss">This is the feedback section content.</p>
                        </asp:View>

                        <!-- Logout View -->
                        <asp:View ID="viewLogout" runat="server">
                            <h2>Logout Section</h2>
                            <p id="ss">This is the logout section content.</p>
                        </asp:View>
                    </asp:MultiView>
                </main>
            </section>

        </div>
    </form>
    <!-- Include Chart.js from a CDN and initialize the chart -->
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <script>
     document.addEventListener('DOMContentLoaded', function () {
         var ctx = document.getElementById('weeklySalesChart').getContext('2d');
         var weeklySalesChart = new Chart(ctx, {
             type: 'line',
             data: {
                 labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                 datasets: [{
                     label: 'Sales',
                     data: [12, 19, 3, 5, 2, 3, 7], // Replace these with your dynamic data
                     backgroundColor: 'rgba(0, 123, 255, 0.2)',
                     borderColor: 'rgba(0, 123, 255, 1)',
                     borderWidth: 2,
                     fill: true,
                     tension: 0.3
                 }]
             },
             options: {
                 maintainAspectRatio: false,
                 responsive: true,
                 scales: {
                     y: {
                         beginAtZero: true,
                         grid: {
                             color: '#eee'
                         },
                         ticks: {
                             font: {
                                 family: 'Garamond, sans-serif',
                                 size: 12
                             }
                         }
                     },
                     x: {
                         grid: {
                             display: false
                         },
                         ticks: {
                             font: {
                                 family: 'Garamond, sans-serif',
                                 size: 12
                             }
                         }
                     }
                 },
                 plugins: {
                     legend: {
                         labels: {
                             font: {
                                 family: 'Garamond, sans-serif',
                                 size: 14,
                                 weight: '500'
                             },
                             color: '#333'
                         }
                     }
                 }
             }
         });
     });
     function createPieChart(canvasId, data, backgroundColors, labels) {
         new Chart(document.getElementById(canvasId), {
             type: 'pie',
             data: {
                 labels: labels,
                 datasets: [{
                     data: data,
                     backgroundColor: backgroundColors
                 }]
             }
         });
     }

     createPieChart("pieChart1", [10, 20, 30], ["red", "blue", "green"], ["Academic Books", "Novels Books", "Dissertations Books"]);
     createPieChart("pieChart2", [15, 25, 35], ["yellow", "purple", "cyan"], ["Study Rooms", "Meeting Rooms", "Research Rooms"]);
     createPieChart("pieChart3", [5, 15, 40], ["orange", "pink", "brown"], ["Staffs", "Researchers", "Students"]);
     // Function for Animating Numbers
     function animateCount(elementId, targetNumber, duration = 2000) {
         let start = 0;
         const increment = targetNumber / (duration / 16); // Update every 16ms (~60fps)
         const element = document.getElementById(elementId);

         function updateCount() {
             start += increment;
             if (start < targetNumber) {
                 element.innerText = Math.floor(start);
                 requestAnimationFrame(updateCount);
             } else {
                 element.innerText = targetNumber; // Ensure it ends exactly on target
             }
         }
         updateCount();
     }

     // Start Animations
     animateCount("customersCount", 150);
     animateCount("booksCount", 500);
     animateCount("roomsAvailableCount", 10);
     animateCount("revenueCount", 25000); // Revenue in $

     // Function to Create Pie Charts
     function createPieChart(canvasId, data, backgroundColors, labels) {
         new Chart(document.getElementById(canvasId), {
             type: 'pie',
             data: {
                 labels: labels,
                 datasets: [{
                     data: data,
                     backgroundColor: backgroundColors
                 }]
             }
         });
     }

     // Pie Charts Data
     createPieChart("pieChart1", [10, 5], ["green", "red"], ["Rooms Available", "Rooms Reserved"]);
     createPieChart("pieChart2", [250, 250], ["yellow", "purple"], ["Issued Books", "Available Books"]);
     createPieChart("pieChart3", [90, 60], ["blue", "gray"], ["New Customers", "Returning Customers"]);
 </script>
</body>
</html>
