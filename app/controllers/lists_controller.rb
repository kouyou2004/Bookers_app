class ListsController < ApplicationController
  def new
    @list = List.new  
    @lists = List.all
  end

  def create
   
    @list = List.new(list_params)
    
    @lists = List.all 
    
    if @list.save
      flash[:notice] = "Book was successfully created."
      redirect_to "/lists/#{@list.id}"
    else
      render :new
    end
  end
  
  def index
    @lists = List.all 
  end

  def show
    @list = List.find(params[:id])  
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    
    if @list.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to "/lists/#{@list.id}"  
    else
      render :edit
    end
  end
  
  def destroy
    list = List.find(params[:id])  
    if list.destroy  
      flash[:notice] = "Book was successfully destroyed."
      redirect_to '/lists/new'  
    else
    end
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end

