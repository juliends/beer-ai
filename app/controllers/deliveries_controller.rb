class DeliveriesController < ApplicationController
  def create
    @delivery = Delivery.new(delivery_params)
    @batch_product = BatchProduct.find(params[:batch_product_id])
    @delivery.batch_product = @batch_product
    @delivery.save
    @forecast = ForecastService.new(@batch_product).call
    render partial: 'batch_products/product_row', locals: { product: @batch_product, forecast: @forecast }
  end

  private

  def delivery_params
    params.require(:delivery).permit(:date, :qty, :note)
  end
end
