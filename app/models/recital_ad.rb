class RecitalAd < ActiveRecord::Base
  #attr_accessible :title, :body, :recital_ad_type_id, :firstname, :lastname, :email, :stripe_card_token, :image, :pdf_file, :message
  belongs_to :recital_ad_type
  validates_presence_of :email

  validates :firstname,:presence => {:message => "cannot be blank."}#, :allow_blank => true,:format => /^[A-Za-z\d_-]+$/
  validates :lastname,:presence => {:message => "cannot be blank."}#, :allow_blank => true,:format => /^[A-Za-z\d_-]+$/

  mount_uploader :image, RecitalAdImageUploader
  mount_uploader :pdf_file, RecitalAdPdfFileUploader

  attr_accessor :stripe_card_token
 
  def save_with_payment  
    if valid?
      charge = Stripe::Charge.create(
        :card => stripe_card_token,
        :amount      => recital_ad_type.price*100,
        :currency    => 'usd',  
        :description => 'Recital Ad Purchase: ...... '+firstname+' '+lastname+' ('+email+')'
      )
      save!
    end       

    rescue Stripe::InvalidRequestError => e
      # Invalid parameters were supplied to Stripe's API
      logger.error "Stripe error while sumbitting payment: #{e.message}"
      errors.add :base, "There was a problem with your credit card."

    rescue Stripe::CardError => e
      #Since it's a decline, Stripe::CardError will be caught
      # body = e.json_body
      # err  = body[:error]
      logger.error "Stripe error while sumbitting payment: #{e.message}"
      errors.add :base, "Card Error: #{e.message}"
      puts "Status is: #{e.http_status}"
      # puts "Type is: #{err[:type]}"
      # puts "Code is: #{err[:code]}"
      # puts "Param is: #{err[:param]}"
      # puts "Message is: #{err[:message]}"
   
    rescue Stripe::AuthenticationError => e
      # Authentication with Stripe's API failed
      errors.add :base, "There was a problem processing your credit card. Authentication Error: #{e.message}"

    rescue Stripe::APIConnectionError => e
      # Network communication with Stripe failed
      logger.error "Stripe Authentication error while submitting payment: #{e.message}"
      errors.add :base, "Our system is temporarily unable to process credit cards."

    # rescue Stripe::StripeError => e
    #   errors.add :base, "There was a problem with your credit card. StripeError"
    #   # Display a very generic error to the user, and maybe send
    #   # yourself an email
          
  end
end
