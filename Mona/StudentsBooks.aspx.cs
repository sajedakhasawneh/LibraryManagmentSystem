using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5.Mona
{
    public partial class StudentsBooks : System.Web.UI.Page
    {
        private string filePath;
        private string borrowDetailsFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            filePath = Server.MapPath("~/books.txt");
            borrowDetailsFilePath = Server.MapPath("~/borrowDetails.txt");
            LoadBooks();
        }

        private void LoadBooks(string searchQuery = "")
        {
            List<string> borrowDetails = new List<string>();

            // Load borrow details file if it exists
            if (File.Exists(borrowDetailsFilePath))
            {
                borrowDetails = File.ReadAllLines(borrowDetailsFilePath).ToList();
            }

            if (File.Exists(filePath))
            {
                List<Books> books = File.ReadAllLines(filePath)
                    .Select(line => line.Split(','))
                    .Where(parts => parts.Length >= 6)
                    .Select(parts => new Books
                    {
                        BookID = parts[0],
                        BookName = parts[1],
                        Author = parts[2],
                        Description = parts[3],
                        Status = parts[4], // Default status from books.txt
                        ImagePath = string.IsNullOrWhiteSpace(parts[5]) ? "/img/book.jpg" : parts[5]
                    })
                    .Where(book => string.IsNullOrEmpty(searchQuery) ||
                                   book.BookID.ToLower().Contains(searchQuery) ||
                                   book.BookName.ToLower().Contains(searchQuery))
                    .ToList();

                bookCards.Controls.Clear();

                foreach (var book in books)
                {
                    // ✅ Check if the book has been borrowed
                    string borrowedInfo = borrowDetails.FirstOrDefault(line => line.StartsWith(book.BookID + ","));
                    bool isBorrowed = !string.IsNullOrEmpty(borrowedInfo);
                    string statusText = book.Status;
                    string borrowDateText = "";
                    string returnDateText = "";
                    string statusColor = "#87BF87"; // Default text color

                    if (isBorrowed)
                    {
                        string[] borrowParts = borrowedInfo.Split(',');
                        if (borrowParts.Length >= 6)
                        {
                            borrowDateText = borrowParts[3];
                            returnDateText = borrowParts[4];
                            statusText = borrowParts[5]; // Borrow status (Pending, Request Approved, Request Rejected)
                        }

                        // ✅ Set display text and styles based on the borrow status
                        if (statusText == "Pending")
                        {
                            statusText = "Request Pending";
                            statusColor = "orange"; // Show pending status in orange
                        }
                        else if (statusText == "Request Approved")
                        {
                            statusText = "Borrowed";
                            statusColor = "green"; // Show approved (borrowed) in green
                        }
                        else if (statusText == "Request Rejected")
                        {
                            statusText = "Request Rejected";
                            statusColor = "red"; // Show rejected status in red
                            isBorrowed = false; // Allow user to borrow again
                        }
                    }

                    // ✅ Create book card UI
                    Panel card = new Panel { CssClass = "col-lg-4 col-md-6 col-sm-12" };

                    string bookCardHtml = $@"
            <div class='card' style='width: 100%;'>
                <img src='{book.ImagePath}' class='card-img-top' alt='{book.BookName}' />
                <div class='card-body'>
                    <h5 class='card-title'>{book.BookName}</h5>
                    <p class='card-text'><strong>Author:</strong> {book.Author}</p>
                    <p class='card-text'>{book.Description}</p>
                    <p class='card-text' style='color: {statusColor};'><strong>Status:</strong> {statusText}</p>";

                    // ✅ Show borrow date and return date if status is "Borrowed"
                    if (statusText == "Borrowed")
                    {
                        bookCardHtml += $@"
                    <p class='card-text'><strong>Borrowed On:</strong> {borrowDateText}</p>
                    <p class='card-text'><strong>Return By:</strong> {returnDateText}</p>";
                    }

                    LiteralControl cardContent = new LiteralControl(bookCardHtml);
                    card.Controls.Add(cardContent);

                    // ✅ Only show "Borrow" button if:
                    // - Book is available
                    // - Request was rejected (so user can re-borrow)
                    if (!isBorrowed || statusText == "Request Rejected")
                    {
                        Button btnBorrow = new Button
                        {
                            Text = "Borrow",
                            CssClass = "btn btn-custom",
                            OnClientClick = $"openBorrowModal('{book.BookID}'); return false;"
                        };
                        card.Controls.Add(btnBorrow);
                    }

                    card.Controls.Add(new LiteralControl("</div></div>"));
                    bookCards.Controls.Add(card);
                }
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim().ToLower();
            LoadBooks(searchQuery);
        }
        protected void btnConfirmBorrow_Click(object sender, EventArgs e)
        {
            string bookIdToBorrow = hiddenBookID.Value;
            string borrowDate = txtBorrowDate.Text; // Fetch from ASP Control
            string returnDate = txtReturnDate.Text; // Fetch from ASP Control

            // ✅ Validate that the user selected both dates
            if (string.IsNullOrWhiteSpace(borrowDate) || string.IsNullOrWhiteSpace(returnDate))
            {
                // Show an error message if dates are empty
                return;
            }

            if (!File.Exists(borrowDetailsFilePath))
            {
                File.Create(borrowDetailsFilePath).Dispose();
            }

            List<string> borrowDetails = File.ReadAllLines(borrowDetailsFilePath).ToList();
            string existingEntry = borrowDetails.FirstOrDefault(line => line.StartsWith(bookIdToBorrow + ","));

            // ✅ If the book was previously borrowed and rejected, remove the old rejected entry
            if (!string.IsNullOrEmpty(existingEntry) && existingEntry.Contains("Request Rejected"))
            {
                borrowDetails.Remove(existingEntry);
            }

            // ✅ Add the new borrow entry with status "Pending"
            string bookDetails = File.ReadAllLines(filePath)
                .FirstOrDefault(line => line.StartsWith(bookIdToBorrow + ","));

            if (bookDetails != null)
            {
                string[] parts = bookDetails.Split(',');
                string newEntry = $"{bookIdToBorrow},{parts[1]},{parts[2]},{borrowDate},{returnDate},Pending";
                borrowDetails.Add(newEntry);
                File.WriteAllLines(borrowDetailsFilePath, borrowDetails);
            }

            LoadBooks(); // Refresh the UI
        }


    }

    public class Books
    {
        public string BookID { get; set; }
        public string BookName { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public string ImagePath { get; set; }
    }
}