class MainController < ApplicationController
  before_action :search

  def index
    @goals = Goal.all

  end
end
