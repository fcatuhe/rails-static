class HtmlPagesController < ApplicationController
  def show
    @page = HtmlPage.find(params[:slug])
  end
end
