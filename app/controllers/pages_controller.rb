class PagesController < ApplicationController
  def show
    @page = Page.find(params[:slug])
  end
end
