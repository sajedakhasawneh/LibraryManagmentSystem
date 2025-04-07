using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace Group5.Mona
{
    public partial class AdminBooks : System.Web.UI.Page
    {
        private string filePath;
        private string imageFolderPath;


        protected void Page_Load(object sender, EventArgs e)
        {
            filePath = Server.MapPath("~/books.txt");
            imageFolderPath = Server.MapPath("~/img/");
            EnsureFileExists();
            EnsureImageFolderExists();

            // Load books on every postback to keep GridView data
            LoadBooks();
        }



        private void EnsureFileExists()
        {
            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close();
            }
        }

        private void EnsureImageFolderExists()
        {
            if (!Directory.Exists(imageFolderPath))
            {
                Directory.CreateDirectory(imageFolderPath);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string bookId = txtBookId.Text.Trim();
            string bookName = txtBookName.Text.Trim();
            string author = txtAuthor.Text.Trim();
            string description = txtDescription.Text.Trim();
            string imagePath = "/img/book.jpg";

            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                string savePath = Path.Combine(imageFolderPath, fileName);
                fileUpload.SaveAs(savePath);
                imagePath = "img/" + fileName;
            }

            if (IsBookIdExists(bookId) || IsBookNameExists(bookName))
            {
                lblError.Text = "Book ID or Book Name already exists!";
                lblError.Visible = true;
                return;
            }

            string newBook = $"{bookId},{bookName},{author},{description},Available,{imagePath}";
            File.AppendAllLines(filePath, new[] { newBook });

            LoadBooks();
            lblError.Text = "Book Added Successfully!";
            lblError.Visible = true;
            lblError.CssClass = "text-Success";
            //lblError.Visible = false;
        }

        private bool IsBookIdExists(string bookId)
        {
            return File.ReadAllLines(filePath).Any(line => line.StartsWith(bookId + ","));
        }

        private bool IsBookNameExists(string bookName)
        {
            return File.ReadAllLines(filePath)
                       .Any(line => line.Split(',')[1].Equals(bookName, StringComparison.OrdinalIgnoreCase));
        }

        private void LoadBooks()
        {
            if (File.Exists(filePath))
            {
                List<Book> books = File.ReadAllLines(filePath)
                    .Select(line => line.Split(','))
                    .Where(parts => parts.Length >= 6)
                    .Select(parts => new Book
                    {
                        BookID = parts[0],
                        BookName = parts[1],
                        Author = parts[2],
                        Description = parts[3],
                        Status = parts[4],
                        ImagePath = parts[5]
                    })
                    .ToList();

                gvBooks.DataSource = books;
                gvBooks.DataBind();
            }
            LoadRequestedBooks();
        }

        private void LoadRequestedBooks()
        {
            string borrowFilePath = Server.MapPath("~/borrowDetails.txt");
            if (File.Exists(borrowFilePath))
            {
                List<BorrowDetails> requestedBooks = File.ReadAllLines(borrowFilePath)
                    .Select(line => line.Split(','))
                    .Where(parts => parts.Length >= 6)
                    .Select(parts => new BorrowDetails
                    {
                        BookID = parts[0],
                        BookName = parts[1],
                        Author = parts[2],
                        BorrowDate = parts[3],
                        ReturnDate = parts[4],
                        Status = parts[5].Trim(),
                        ShowActionButtons = parts[5].Trim() == "Pending"
                    })
                    .ToList();

                gvRequestedBooks.DataSource = requestedBooks;
                gvRequestedBooks.DataBind();
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string bookIdToEdit = btn.CommandArgument;
            List<string> lines = File.ReadAllLines(filePath).ToList();
            string bookToEdit = lines.FirstOrDefault(line => line.StartsWith(bookIdToEdit + ","));

            if (bookToEdit != null)
            {
                string[] parts = bookToEdit.Split(',');

                if (parts.Length < 5)
                    return; // Invalid data format, return early.

                // Assign values to input fields
                txtBookId.Text = parts[0];
                txtBookName.Text = parts[1];
                txtAuthor.Text = parts[2];
                txtDescription.Text = parts[3];

                // Show the update button and hide the add button
                btnUpdate.Visible = true;
                btnAdd.Visible = false;

                // Store the original book ID and name for validation
                hiddenOriginalBookId.Value = parts[0];
                hiddenOriginalBookName.Value = parts[1];

                // 📌 **Handle Image Display**
                //if (parts.Length > 5 && !string.IsNullOrEmpty(parts[5])) // Ensure image exists
                //{
                //    imgPreview.ImageUrl = "~/" + parts[5]; // Set the image preview
                //    imgPreview.Visible = true; // Show image if available
                //}
                //else
                //{
                //    imgPreview.Visible = false; // Hide if no image is available
                //}
            }
            lblError.Visible = false;

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string bookIdToDelete = btn.CommandArgument;

            List<string> lines = File.ReadAllLines(filePath).ToList();
            string bookToDelete = lines.FirstOrDefault(line => line.StartsWith(bookIdToDelete + ","));

            if (bookToDelete != null)
            {
                string[] parts = bookToDelete.Split(',');
                if (parts.Length > 5 && !string.IsNullOrEmpty(parts[5]))  // Ensure image exists
                {
                    string imagePath = parts[5];
                    string imageFullPath = Server.MapPath("~/" + imagePath);
                    if (File.Exists(imageFullPath))  // Delete the image if exists
                    {
                        File.Delete(imageFullPath);
                    }
                }

                // Remove the book from the file
                lines.RemoveAll(line => line.StartsWith(bookIdToDelete + ","));
                File.WriteAllLines(filePath, lines);

                LoadBooks(); // Refresh the book list
                lblError.Visible = false;

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string newBookId = txtBookId.Text.Trim();
            string newBookName = txtBookName.Text.Trim();
            string author = txtAuthor.Text.Trim();
            string description = txtDescription.Text.Trim();
            string originalBookId = hiddenOriginalBookId.Value;
            string originalBookName = hiddenOriginalBookName.Value;
            string imagePath = ""; // Default to empty in case no new image is uploaded

            List<string> lines = File.ReadAllLines(filePath).ToList();

            // Validate duplicate book ID or name
            foreach (string line in lines)
            {
                string[] parts = line.Split(',');

                if (parts.Length < 5)
                    continue;

                string existingBookId = parts[0];
                string existingBookName = parts[1];

                if (existingBookId != originalBookId && newBookId == existingBookId)
                {
                    lblError.Text = "Book ID already exists!";
                    lblError.Visible = true;
                    return;
                }

                if (existingBookName != originalBookName && newBookName.Equals(existingBookName, StringComparison.OrdinalIgnoreCase))
                {
                    lblError.Text = "Book Name already exists!";
                    lblError.Visible = true;
                    return;
                }
            }

            // 📌 **Handle File Upload**
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                string savePath = Server.MapPath("~/img/") + fileName;
                fileUpload.SaveAs(savePath);
                imagePath = "img/" + fileName; // Store relative image path
            }

            // 📌 **Update Book Details**
            for (int i = 0; i < lines.Count; i++)
            {
                string[] parts = lines[i].Split(',');

                if (parts.Length < 5)
                    continue;

                if (parts[0] == originalBookId)
                {
                    // If image is uploaded, update the image path; otherwise, keep the old one
                    string existingImagePath = parts.Length > 5 ? parts[5] : "";

                    if (string.IsNullOrEmpty(imagePath))
                    {
                        imagePath = existingImagePath; // Retain the old image if no new image is uploaded
                    }

                    lines[i] = $"{newBookId},{newBookName},{author},{description},Available,{imagePath}";
                    break;
                }
            }

            File.WriteAllLines(filePath, lines);
            LoadBooks();
            lblError.Text = "Book Updated Successfully!";
            lblError.Visible = true;
            lblError.CssClass = "text-Success";
            //lblError.Visible = false;
            btnUpdate.Visible = false;
            btnAdd.Visible = true;
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateRequestStatus(((Button)sender).CommandArgument, "Request Approved");
            lblError.Visible = false;

        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateRequestStatus(((Button)sender).CommandArgument, "Request Rejected");
            lblError.Visible = false;

        }

        private void UpdateRequestStatus(string bookId, string newStatus)
        {
            string borrowDetailsFilePath = Server.MapPath("~/borrowDetails.txt");
            List<string> lines = File.ReadAllLines(borrowDetailsFilePath).ToList();

            for (int i = 0; i < lines.Count; i++)
            {
                string[] parts = lines[i].Split(',');

                if (parts.Length >= 6 && parts[0] == bookId && parts[5].Trim() == "Pending")
                {
                    parts[5] = newStatus;
                    lines[i] = string.Join(",", parts);
                    break;
                }
            }

            File.WriteAllLines(borrowDetailsFilePath, lines);
            LoadRequestedBooks();
        }

        protected void btnDownloadBooksPDF_Click(object sender, EventArgs e)
        {
            ExportGridToPDF(gvBooks, "BookList.pdf");
            lblError.Visible = false;

        }

        protected void btnDownloadRequestsPDF_Click(object sender, EventArgs e)
        {
            ExportGridToPDF(gvRequestedBooks, "BorrowRequests.pdf");
            lblError.Visible = false;

        }

        private void ExportGridToPDF(GridView gridView, string fileName)
        {
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 20f, 10f);
            PdfPTable pdfTable = new PdfPTable(gridView.Columns.Count);
            pdfTable.WidthPercentage = 100;

            foreach (DataControlField column in gridView.Columns)
            {
                PdfPCell cell = new PdfPCell(new Phrase(column.HeaderText, FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.BOLD)
));
                cell.BackgroundColor = new BaseColor(241, 196, 15);
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                pdfTable.AddCell(cell);
            }

            foreach (GridViewRow row in gridView.Rows)
            {
                foreach (TableCell tableCell in row.Cells)
                {
                    PdfPCell cell = new PdfPCell(new Phrase(tableCell.Text, FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL)
));
                    cell.BackgroundColor = new BaseColor(236, 240, 241);
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    pdfTable.AddCell(cell);
                }
            }

            using (MemoryStream memoryStream = new MemoryStream())
            {
                PdfWriter.GetInstance(pdfDoc, memoryStream);
                pdfDoc.Open();
                pdfDoc.Add(pdfTable);
                pdfDoc.Close();

                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                Response.Buffer = true;
                Response.Clear();
                Response.OutputStream.Write(bytes, 0, bytes.Length);
                Response.OutputStream.Flush();
                Response.End();
            }
        }

        //protected void btnBackToDashboard_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Habib1.aspx");
        //    lblError.Visible = false;

        //}
    }

    public class BorrowDetails
    {
        public string BookID { get; set; }
        public string BookName { get; set; }
        public string Author { get; set; }
        public string BorrowDate { get; set; }
        public string ReturnDate { get; set; }
        public string Status { get; set; }
        public bool ShowActionButtons { get; set; }
    }

    public class Book
    {
        public string BookID { get; set; }
        public string BookName { get; set; }
        public string Author { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
    }
}
