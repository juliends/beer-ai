class BatchProductsController < ApplicationController
  def new
    @batch_product = BatchProduct.new
    render partial: 'batch_products/new_product_row',
           locals: { batch_product: @batch_product }
  end

  def create

  end
end
