class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end

  def create
    @viewing = Viewing.new
  end

  def new
    @viewing = Viewing.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @viewing.destroy
  end
end
