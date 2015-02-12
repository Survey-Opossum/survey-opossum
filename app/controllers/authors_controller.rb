class AuthorsController < ApplicationController

  def index
    @author = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
      if @author.save
        redirect_to root_path, notice: 'Author was successfully created.'
      else
        render :new
      end
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
      redirect_to author_url, notice: 'Teacher was successfully destroyed.'
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :email, :password, :password_confirmation)
    end
end
