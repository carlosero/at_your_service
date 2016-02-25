class ReportsController < ApplicationController
  before_action :authenticate_admin!
  prawnto :prawn=> {
    :page_size => "LETTER",
    :page_layout => :portrait,
    :margin => 50
  }

  def index
  end

  def best_selling_foods
    @foods_orders = FoodsOrder.joins(:food)
    @foods_orders = date_query_for(@foods_orders, 'foods_orders')
    @foods_orders = @foods_orders.select('foods.name as food_name, foods.food_type as food_type, SUM(foods_orders.amount) as amount')
    @foods_orders = @foods_orders.order('SUM(amount) desc')
    @foods_orders = @foods_orders.group(:food_id)
    @foods_orders = @foods_orders.limit(30)
    @foods_orders = @foods_orders.uniq
    respond_to do |format|
      format.html
      format.pdf do
        @report_title = "Best Selling Foods"
        @columns = {'food_name' => 'Food Name', 'food_type' => 'Food Type', 'amount' => 'Sold'}
        @model = @foods_orders
        stream = render_to_string(:template=>"reports/template", :formats => [:pdf])
        send_data(stream, :type=>"application/pdf",:filename => "best_slling_foods.pdf", :disposition => "inline")
      end
    end
  end

  def best_waiters
    @orders = Order.joins(:waiter)
    @orders = date_query_for(@orders, "orders")
    @orders = @orders.select("waiters.name as waiter_name, waiters.email as waiter_email, COUNT(1) as orders_served")
    @orders = @orders.order("COUNT(1) desc")
    @orders = @orders.group(:waiter_id)
    @orders = @orders.limit(30)
    @orders = @orders.uniq
    respond_to do |format|
      format.html
      format.pdf do
        @report_title = "Best Waiters"
        @columns = {'waiter_name' => 'Waiter Name', 'waiter_email' => 'Waiter Email', 'orders_served' => 'Orders Served'}
        @model = @orders
        stream = render_to_string(:template=>"reports/template", :formats => [:pdf])
        send_data(stream, :type=>"application/pdf",:filename => "best_slling_foods.pdf", :disposition => "inline")
      end
    end
  end

  def winnings_per_day
    @orders = Order.joins(:foods_orders => [:food])
    @orders = date_query_for(@orders, 'orders')
    @orders = @orders.select("SUM(foods_orders.amount * foods.price) as final_price, DATE(orders.created_at) as each_day, COUNT(1) as amount")
    @orders = @orders.group("each_day")
    @orders = @orders.order("each_day ASC")
    @orders = @orders.limit(31)
    @orders = @orders.uniq
    @total_orders = @orders.to_a.sum(&:amount)
    @total_price = @orders.to_a.sum(&:final_price)
    respond_to do |format|
      format.html
      format.pdf do
        @report_title = "Winnings Per Day"
        @columns = {'each_day' => 'Day', 'amount' => 'Amount of Orders', 'final_price' => 'Total'}
        @model = @orders
        stream = render_to_string(:template=>"reports/template", :formats => [:pdf])
        send_data(stream, :type=>"application/pdf",:filename => "best_slling_foods.pdf", :disposition => "inline")
      end
    end
  end

  def most_used_tables
    @orders = Order
    @orders = date_query_for(@orders)
    @orders = @orders.select("table_id as table_number, COUNT(1) as amount")
    @orders = @orders.group("table_number")
    @orders = @orders.order("amount DESC")
    @orders = @orders.limit(9)
    @orders = @orders.uniq
    respond_to do |format|
      format.html
      format.pdf do
        @report_title = "Most Used Tables"
        @columns = {'table_number' => 'Table Number', 'amount' => 'Amount of Uses'}
        @model = @orders
        stream = render_to_string(:template=>"reports/template", :formats => [:pdf])
        send_data(stream, :type=>"application/pdf",:filename => "best_slling_foods.pdf", :disposition => "inline")
      end
    end
  end

  private

    def date_query_for(model, klass = nil)
      model.where("DATE(#{klass ? klass+"." : ""}created_at) between DATE('#{date_from}') and DATE('#{date_to}')")
    end

    def date_from
      Date.new(sane_date_params[:report_year], sane_date_params[:report_month], 1)
    end

    def date_to
      Date.new(sane_date_params[:report_year], sane_date_params[:report_month], -1)
    end

    def sane_date_params
      params[:report_year] ||= Date.today.year
      params[:report_month] ||= Date.today.month
      params[:report_year] = params[:report_year].to_i
      params[:report_month] = params[:report_month].to_i
      params
    end
end
