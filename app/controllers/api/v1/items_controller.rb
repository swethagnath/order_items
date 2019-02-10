class Api::V1::ItemsController < Api::V1::ApiController
  before_action :set_item, only: [:update, :destroy]

  # localhost:3000/api/v1/items
  def index
    @items = Item.all
    render json: @items
  end

  # localhost:3000/api/v1/items
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: { item: @item, notice: "successfully created the item" }
    else
     render json: { error: @item.errors.full_messages, reason: "validation failed" }
    end
  end

  #localhost:3000/api/v1/items/1
  def update
    if @item.update_attributes(item_params)
      render json: { notice: "succeffully updated", item: @item }
    else
      render json: { errors: @item.errors.full_messages, reason: "validation failed" }
    end
  end

  #localhost:3000/api/v1/items/1
  def destroy
    @item.destroy
    render json: { notice: "successfully deleted the client", item: @item }
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :quantity)
  end

end

