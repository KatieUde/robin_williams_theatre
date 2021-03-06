class TicketPurchase < ActiveRecord::Base
  before_save :downcase_email

  belongs_to :viewing
  belongs_to :movie
  has_many :tickets

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  VALID_CREDIT_CARD_REGEX = /(^\d{15,16}$)/
  VALID_CVC_REGEX = /(^\d{3,4}$)/
  VALID_ZIP_CODE_REGEX = /(^\d{5}$)/

  validates_presence_of :name, :cc_exp
  validate :age_confirm

  validates :email, presence: true,
                    on: :update,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX,
                    message: "Something about your email doesn't look right, please verify formatting is proper." }

  validates :cc_number, presence: true,
                        on: :update,
                        length: { maximum: 16 },
                        format: { with: VALID_CREDIT_CARD_REGEX,
                        message: "Cannot process credit card number. Please check the length and make sure only numerical values have been entered." }

  validates :cc_cvc, presence: true,
                      on: :update,
                      length: { maximum: 4 },
                      format: { with: VALID_CVC_REGEX,
                      message: "CVC should only be three digits unless AMEX, which has four. Please make sure there are no extra numbers or letters." }

  validates :zip_code, presence: true,
                        on: :update,
                        length: { maximum: 5 },
                        format: { with: VALID_ZIP_CODE_REGEX,
                        message: "Zip codes should be five digits. No need to include the four USPS digits." }

  def create_tickets(tickets, ticket_purchase_id)
    tickets.each do |k,v|
      to.to_i.times do
        Ticket.create!(
          :viewing_id => viewing_id,
          :ticket_purchase_id => self.id,
          :ticket_detail_id => k.to_i
        )
      end
    end
  end

  def ticket_kind_hash
    ticket_kinds = Hash.new 0
    self.tickets.each do |ticket|
      ticket_kinds[ticket.ticket_detail.ticket_style] += 1
    end
    return ticket_kinds
  end

  def find_sales_total
    sales_total = 0
    self.tickets.each do |ticket|
      sales_total += ticket.ticket_detail.ticket_cost
    end
    self.sales_total = sales_total
    self.save(:validate => false)
  end

  # Operating Costs could be subtracted from this method in the future
  def theatre_revenue
    self.ticket_purchases.sum(:sales_total)
  end

  def purchase_age_confirm
    if self.movie.rating == "R" && self.age_confirm == "no"
      errors.add(:purchase_age_confirm, "This movie is Rated R. You must be at least 17 to buy a ticket for it.")
    end
  end

  private

  def downcase_email
      self.email = email.downcase
    end

end
