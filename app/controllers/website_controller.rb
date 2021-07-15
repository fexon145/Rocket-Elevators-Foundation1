class WebsiteController < ApplicationController
  before_action :authenticate_user!, only: [:intervention]
  def index
  end
  def residential
  end
  def commercial
  end
  def quote
  end
  def intervention
  end
end
