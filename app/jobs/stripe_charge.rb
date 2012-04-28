class StripeCharge
  @queue = :stripe

  def self.perform(amount, user_id)
    user = User.find(user_id)
    BillingProcessor.charge(amount, user)
  end
end