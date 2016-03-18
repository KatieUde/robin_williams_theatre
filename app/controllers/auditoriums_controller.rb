class AuditoriumsController < ApplicationController

  def index
    @auditoriums = Auditorium.all
  end

  def create
  end

  def new
    @auditorium = Auditorium.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @auditorium.destroy
  end
end
