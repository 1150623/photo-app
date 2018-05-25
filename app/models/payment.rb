class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user
  
  @silver_amount = 1000 # $10

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end

  def process_payment
    customer = Stripe::Customer.create(:email => email, :card_token => token )
    Stripe::Charge.create(:customer => customer.id,
                          :amount => @silver_amount,
                          :description => 'Silver',
                          :currency => 'usd')
  end

end
