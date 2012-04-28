class GuestAdminEmailer
  @queue = :emailer

  def self.perform(email, store_id)
    store = Store.find(store_id)
    Notification.new_user_and_store_admin(email, store).deliver
  end
end