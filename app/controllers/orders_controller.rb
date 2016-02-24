class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :close]

  # GET /orders
  # GET /orders.json
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result.paginate(:page => params[:page])
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.table = Table.find(params[:table_id]) if params[:table_id]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @mode = params[:mode]
    if @mode == 'add_customer'
      customer = Customer.create(name: params[:customer_name])
      params[:order][:customer_id] = customer.id
    end
    @order = Order.new(order_params)
    @order.status = 'active'
    respond_to do |format|
      if @order.save
        @order.table.in_use = true
        @order.table.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # custom routes
  def close
    @order.close!
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully closed.' }
      format.json { head :no_content }
    end
  end

  # custom routes
  def add_food
    @foods_order = FoodsOrder.new
    @foods_order.order_id = params[:food][:order_id]
    @foods_order.amount = params[:food][:amount]
    @foods_order.food_id = params[:food][:food_id]
    if @foods_order.save
      render json: {new_total: @foods_order.order.total_price}, status: :ok
    else
      render json: @foods_order.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:waiter_id, :customer_id, :table_id, :status)
    end
end
