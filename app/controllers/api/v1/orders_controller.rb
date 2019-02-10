class Api::V1::OrdersController < Api::V1::ApiController
  before_action :set_order, only: [:update, :destroy]

  # localhost:3000/api/v1/orders
  def index
    @order = Order.all
    render json: @order
  end

  # localhost:3000/api/v1/orders
  def create
    @order = Order.new(order_params)
    @item = Item.find_by(name: @order.item)
    if (@item && @order.number_of_items <= @item.quantity)
      @item.update_quantity(@item, @order)
      @order.price_calculation(@item, @order.number_of_items)
      if @order.save
        render json: { notice: "succeffully ordered", order: @order }
      else
        render json: { errors: @order.errors.full_messages, reason: "validation failed" }
      end
    else
      render json: { error: !@item ? "item is not found" : @item.quantity == 0 ? "stock is not available" : "available stock is only #{@item.quantity}"}
    end
  end

  # localhost:3000/api/v1/orders/1
  def update
    @item = Item.find_by(name: @order.item) 
    if (@item && @order.number_of_items <= @item.quantity)
      @item.update_quantity(@item, @order)
      @order.price_calculation(@item, params[:order][:number_of_items])
      if @order.update_attributes(order_params)
        render json: { notice: "successfully updated", order: @order }
      else
        render json: { errors: @order.errors.full_messages, reason: "validation failed" }
      end
    else
      render json: { error: !@item ? "item is not found" : @item.quantity == 0 ? "stock is not available" : "available stock is only #{@item.quantity}"}
    end
  end

  # localhost:3000/api/v1/orders/1
  def destroy
    @order.destroy
    render json: { notice: "successfully deleted the order", order: @order }
  end

  private

  def set_order
    @order= Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:item, :number_of_items, :email_id)
  end

end