class ProductSweeper < ActionController::Caching::Sweeper
  observe Product

  def sweep(product)
    expire_page products_path
    expire_page product_path(product)
    expire_page admin_products_path
    expire_page admin_product_path(product)
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end