class BatchProductsController < ApplicationController
  def new
    @batch = Batch.find(params[:batch_id])
    @batch_product = BatchProduct.new
    render partial: 'batch_products/new_product_row',
           locals: { batch_product: @batch_product }
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @product = Product.find(batch_product_params[:product_id])
    @batch_product = BatchProduct.create(
      batch: @batch,
      product: @product
    )
    render partial: 'batch_products/product_row',
           locals: { product: @batch_product, forecast: nil }
  end

  private

  def batch_product_params
    params.require(:batch_product).permit(:product_id)
  end
end
