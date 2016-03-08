class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  # def create
  #   @project = Project.find(params[:project_id])
  #   order = Order.create!(project_sku: @project.sku, amount: @project.price, state: 'pending')
  #   redirect_to new_order_payment_path(order)
  # end
end
