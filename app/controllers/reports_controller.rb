class ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def best_selling_foods
    @foods_orders = FoodsOrder.includes(:food)
    @foods_orders = date_query_for(@foods_orders)
    @foods_orders = @foods_orders.select('SUM(foods_orders.amount) as amount, food_id, created_at')
    @foods_orders = @foods_orders.order('SUM(amount) desc')
    @foods_orders = @foods_orders.group(:food_id)
    @foods_orders = @foods_orders.limit(15)
    @foods_orders = @foods_orders.uniq
  end

  def best_waiters
    @orders = Order.includes(:waiter)
    @orders = date_query_for(@orders)
    @orders = @orders.select("waiter_id, COUNT(1) as orders_served")
    @orders = @orders.order("COUNT(1) desc")
    @orders = @orders.group(:waiter_id)
    @orders = @orders.limit(15)
    @orders = @orders.uniq
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
  end

  def most_used_tables
    @orders = Order
    @orders = date_query_for(@orders)
    @orders = @orders.select("table_id as table_number, COUNT(1) as amount")
    @orders = @orders.group("table_number")
    @orders = @orders.order("amount DESC")
    @orders = @orders.limit(9)
    @orders = @orders.uniq
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
