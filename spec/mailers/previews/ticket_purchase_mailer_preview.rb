# Preview all emails at http://localhost:3000/rails/mailers/ticket_purchase_mailer
class TicketPurchaseMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_purchase_mailer/receipt
  test receipt do
    mail = TicketPurchaseMailer.receipt
    assert_equal "Receipt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.org"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
