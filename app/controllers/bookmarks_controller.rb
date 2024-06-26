class BookmarksController < ApplicationController

  # def new
  #   @list = List.find(params[:list_id])
  #   @bookmark = @list.bookmarks.new
  # end

  def create
    # Je trouve ma liste
    # J'instancie le bookmark avec les paramètres de la requête
    # La liste de mon bookmark c'est la liste que j'ai trouvé au dessus
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
