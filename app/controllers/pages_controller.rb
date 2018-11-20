class PagesController < ApplicationController
  def index
    # SQL SELECT * FROM PAGES
    @pages = Page.all
    # render views
  end

  def show
    @page = Page.find(params[:id])
    # render 
  end

  def new
    # creates a new page only in memory
    @page = Page.new
    # renders the form
  end

  def create
    # Page.create(Title: 'dfasd', body: 'afasdfasdf')
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  private

    def pages_params
      params.require(:page).permit(:title, :body)
    end

end
