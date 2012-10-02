module Spree
  module Admin
    ShippingMethodsController.class_eval do
      before_filter :do_not_destroy_referenced_shipping_methods, :only => :destroy

      def do_not_destroy_referenced_shipping_methods
        order = Order.where(:shipping_method_id => @object).first
        if order
          flash[:error] = "That shipping method cannot be deleted as it is referenced by an order: #{order.number}."
          redirect_to collection_url
        end

        product_distribution = ProductDistribution.where(:shipping_method_id => @object).first
        if product_distribution
          p = product_distribution.product
          flash[:error] = "That shipping method cannot be deleted as it is referenced by a product distribution: #{p.id} - #{p.name}."
          redirect_to collection_url
        end
      end
    end
  end
end