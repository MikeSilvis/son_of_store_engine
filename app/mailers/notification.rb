# Sends out an email
class Notification < ActionMailer::Base
  default :from => "noreply@ehipster.herokuapp.com"

  def order_email(user, order)
    mail(:to => user.email, :subject => "Order Placed - ##{order.id}")
  end

  def sign_up_confirmation(email)
     mail(:to => email, :subject => "Congrats on signing up!")
  end

  def new_store_approval(store)
    @store = store
    admin_user = store.users.first
    mail(:to => admin_user.email, :subject => "New Store: #{store.name} was #{store.status}")
  end

  def new_store_request(store)
    @store = store
    @admin_user = store.users.first
    mail(:to => @admin_user.email, :subject => "New Store Requested")
  end

  def new_user_and_store_admin(email, store)
    @email = email
    @store = store
    mail(:to => email, :subject => "You have been invited to become an admin of #{store.name}")
  end

  def new_store_admin(user, store)
    @store = store
    @user = user
    mail(:to => user.email, :subject => "You are now a store admin of #{store.name}")
  end

end