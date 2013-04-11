
Partial Class splits_contest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim UpPath As String
        Dim UpName As String
        UpPath = "C:\Inetpub\wwwroot\getgymnastics.com\wwwroot\UploadedUserFiles"
        UpName = Dir(UpPath, vbDirectory)
        If UpName = "" Then
            MkDir("C:\Inetpub\wwwroot\getgymnastics.com\wwwroot\UploadedUserFiles\")
        End If
    End Sub
    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim strFileName As String
        strFileName = fileUp.PostedFile.FileName
        Dim c As String = System.IO.Path.GetFileName(strFileName) ' We don't need the path, just the name.

        Try
            fileUp.PostedFile.SaveAs("C:\Inetpub\wwwroot\getgymnastics.com\wwwroot\UploadedUserFiles\" + c)
        Catch Exp As Exception

        End Try



        Dim mailMessage As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()

        mailMessage.From = New System.Net.Mail.MailAddress(email.Text.Trim())
        mailMessage.To.Add(New System.Net.Mail.MailAddress("webmaster@getgymnastics.com"))
        mailMessage.Subject = "Splits Photo Contest"
        mailMessage.Body = "Name:" + name.Text.Trim() + " Address:" + address.Text.Trim() + " City:" + city.Text.Trim() + " Zip:" + zip.Text.Trim() + " Age:" + age.Text.Trim() + " Gym:" + gym.Text
        mailMessage.Attachments.Add(New System.Net.Mail.Attachment("C:\Inetpub\wwwroot\getgymnastics.com\wwwroot\UploadedUserFiles\" + c))

        Dim smtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient()

        smtpClient.Send(mailMessage)
        enterContest.Visible = False
        thankYou.Visible = True


    End Sub
End Class

