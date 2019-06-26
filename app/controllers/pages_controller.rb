class PagesController < ApplicationController
  def home
    @batch = Batch.first
  end
end
