# frozen_string_literal: true

class BulletinsController < ApplicationController
  def index
    @bulletins = Bulletin.all
  end

  def show
    @bulletin = Bulletin.find(params[:id])
  end
end
