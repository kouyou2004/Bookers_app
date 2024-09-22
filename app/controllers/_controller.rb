class BooksController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
    
    validates :title, presence: true
    validates :body, presence: true
    
  end
end
