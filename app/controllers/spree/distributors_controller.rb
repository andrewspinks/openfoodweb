module Spree
  class DistributorsController < BaseController
    helper 'spree/products'

    def show
      options = {:distributor_id => params[:id]}
      options.merge(params.reject { |k,v| k == :id })

      @distributor = Distributor.find params[:id]

      @searcher = Config.searcher_class.new(options)
      @products = @searcher.retrieve_products
    end

    def select
      distributor = Distributor.find params[:id]

      order = current_order(true)

      if order.can_change_distributor?
        order.distributor = distributor
        order.save!
      end

      redirect_to distributor
    end

    def deselect
      order = current_order(true)

      if order.can_change_distributor?
        order.distributor = nil
        order.save!
      end

      redirect_to root_path
    end
  end
end
