module Api::V1
  class ApiController < ApplicationController
    http_basic_authenticate_with name: "foo", password: "secret"

    # TABLES
    def tables
      render json: Table.all
    end

    def table
      render json: Table.find(params[:id])
    end

    def create_table
      render json: Table.create(params[:table])
    end

    def update_table
      render json: Table.find(params[:id]).update(params[:table])
    end

    # ORDERS
    def orders
      render json: Order.all
    end

    def order
      render json: Order.find(params[:id])
    end

    def create_order
      render json: Order.create(params[:order])
    end

    def update_order
      render json: Order.find(params[:id]).update(params[:order])
    end

    # FOODS
    def foods
      render json: Food.active.foods.all
    end

    def food
      render json: Food.find(params[:id])
    end

    def create_food
      params[:food][:food_type] = 'food' if params[:food]
      render json: Food.create(params[:food])
    end

    def update_food
      render json: Food.find(params[:id]).update(params[:food])
    end

    def destroy_food
      render json: Food.find(params[:id]).deactivate!
    end

    # DRINKS
    def drinks
      render json: Food.active.drinks.all
    end

    def drink
      render json: Food.find(params[:id])
    end

    def create_drink
      params[:food][:food_type] = 'drink' if params[:food]
      render json: Food.create(params[:food])
    end

    def update_drink
      render json: Food.find(params[:id]).update(params[:drink])
    end

    def destroy_drink
      render json: Food.find(params[:id]).deactivate!
    end

    # WAITERS
    def waiters
      render json: Waiter.active.all
    end

    def waiter
      render json: Waiter.find(params[:id])
    end

    def create_waiter
      render json: Waiter.create(params[:waiter])
    end

    def update_waiter
      render json: Waiter.find(params[:id]).update(params[:waiter])
    end

    def destroy_waiter
      render json: Waiter.find(params[:id]).deactivate!
    end

    # CUSTOMERS
    def customers
      render json: Customer.active.all
    end

    def customer
      render json: Customer.find(params[:id])
    end

    def create_customer
      render json: Customer.create(params[:customer])
    end

    def update_customer
      render json: Customer.find(params[:id]).update(params[:customer])
    end

    def destroy_customer
      render json: Customer.find(params[:id]).deactivate!
    end
  end
end
