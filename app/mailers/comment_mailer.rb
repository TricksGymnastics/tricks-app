class CommentMailer < ApplicationMailer
    def comment_notification(comment)
        @comment = comment
        @subject = "Comment received from " + @comment.name
        
        bcc_addresses = ["taylors2k@yahoo.com", "bjotaylor13@yahoo.com", "football80@gmail.com"]
        
        mail to: @comment.email, bcc: bcc_addresses, subject: @subject
    end
end
