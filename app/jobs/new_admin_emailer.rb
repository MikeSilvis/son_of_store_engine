class NewAdminEmailer
  @queue = :emailer

  def self.perform(user_id, store_id)
    user = User.find(user_id)
    store = Store.find(store_id)
    Notification.new_store_admin(user, store).deliver
  end
end