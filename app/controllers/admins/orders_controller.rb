class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all

	end

	def update
		@order = Order.find(params[:id])
  	if  @order.update(order_params)
  		if @order.order_status_before_type_cast == 1
  			@order.order_items.update_all(item_status: 1)
			redirect_to admins_order_path
  		else
    		redirect_back(fallback_location: admins_order_path)
		end
	end
	end



	def item_status_update
		order_item = OrderItem.find(params[:id])
		order = order_item.order
		if order_item.update(order_item_params)
			if 	order_item.item_status_before_type_cast == 2 && order_item.order.order_status_before_type_cast != 2
				order_item.order.update(order_status: 2)
			elsif order_item.item_status_before_type_cast == 3 && order.order_items.count == order.order_items.where(item_status: 3).count
				# order_itemのitem_statusが(==)３の時且つ(&&)、order_itemからみたorderのorder_itemsの数がorder_itemからみたorderのorder_itemsのitem_statusが３の数と一致した時。
				order.update(order_status: 3)
			end
		end
		redirect_to  admins_order_path(order_item.order.id)
	end

	private
    def order_params
      	params.require(:order).permit(:order_status)
    end

    def order_item_params
      	params.require(:order_item).permit(:item_status)
    end

end
