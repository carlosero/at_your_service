class FoodsOrdersController < ApplicationController
  def destroy
    render json: FoodsOrder.find(params[:id]).destroy
  end
end
