class BooksController < ApplicationController
  def new
    @books = Book.new
  end
  
   def create
    @book = Book.new(book_params)
     if @book.save
     flash[:notice] = "Your book has succesfully posted" 
      redirect_to book_path(@book.id)
    else
      flash[:alret] = "Your posting has been missed"
      render :new
    end  
  end
  
  def index
    @books = Book.all  
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "Your book has succesfully posted" 
    redirect_to book_path(@book.id)  
  else
    flash[:alret] = "Your book has been missed"
    render :new
  end
end
  
  def destroy
    book = Book.find(params[:id])  
    book.destroy  
    redirect_to '/books'  
  end
  
   private
   
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end


