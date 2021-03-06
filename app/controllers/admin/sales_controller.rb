# Administrators can create sales
module Admin
  class SalesController < Controller
    before_filter :find_sale, :only => [:edit, :update, :destroy, :show]

    def index
      @sales = Sale.all
    end

    def new
      @sale = Sale.new
    end

    def edit
    end

    def show
    end

    def create
      @sale = Sale.new(params[:sale])
      if @sale.save
        redirect_to sale_path(@sale), :notice => "Sale created."
      else
        flash[:notice] = "Invalid sale parameters"
        render 'new'
      end
    end

    def update
      if @sale.update_attributes(params[:sale])
        redirect_to sale_path(@sale), :notice => "Sale updated."
      else
        flash[:notice] = "Invalid sale parameters"
        render 'edit'
      end
    end

    def destroy
      @sale.destroy
      redirect_to sales_path, :notice => "Sale Removed"
    end

  private
    def find_sale
      @sale = Sale.find(params[:id])
    end
  end
end