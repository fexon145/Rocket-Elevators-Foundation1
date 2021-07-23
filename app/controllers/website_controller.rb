class WebsiteController < ApplicationController
  before_action :authenticate_user!, only: [:intervention]
  require 'elevator_media/Streamer'
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
  def chuck_norris
  end
end
