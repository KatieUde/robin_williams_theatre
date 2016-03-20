class TicketPurchase < ActiveRecord::Base
  before_save :downcase_email

  belongs_to :viewing
  belongs_to :movie

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  VALID_CREDIT_CARD_REGEX = /(^\d{15,16}$)/
  VALID_CVC_REGEX = /(^\d{3,4}$)/
  VALID_ZIP_CODE_REGEX = /(^\d{5}$)/

  validates_presence_of :name, :cc_exp_mth, :cc_exp_yr

  validates :email, presence: true,
                    on: :update,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                              message: "Something about your email doesn't look right, please verify formatting is proper."

  validates :cc_number, presence: true,
                        on: :update,
                        length: { maximum: 16 },
                        format: { with: VALID_CREDIT_CARD_REGEX },
                        message: "Cannot process credit card number. Please check the length and make sure only numerical values have been entered."

  validates :cc_cvc, presence: true,
                      on: :update,
                      length: { maximum: 4 },
                      format: { with: VALID_CVC_REGEX },
                      message: "CVC should only be three digits unless AMEX, which has four. Please make sure there are no extra numbers or letters."

  validates :zip_code, presence: true,
                        on: :update,
                        length: { maximum: 5 },
                        format: { with: VALID_ZIP_CODE_REGEX },
                        message: "Zip codes should be five digits. No need to include the four USPS digits."

  validates :age_confirm

  private

  def downcase_email
      self.email = email.downcase
    end

end
