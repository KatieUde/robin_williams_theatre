class TicketPurchaseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_purchase_mailer.receipt.subject
  #
  def receipt(ticket_purchase)
    @ticket_purchase = ticket_purchase

    mail(to: ticket_purchase.email, subject: "Enjoy the show & don't forget the popcorn!")
  end
end
