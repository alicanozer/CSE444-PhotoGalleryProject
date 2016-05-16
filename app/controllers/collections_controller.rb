class CollectionsController < ApplicationController
  before_filter :check_public_access
  before_filter :require_role_admin, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @collections = Collection.where(owner: @current_user.name)
    respond_to do |format|
      format.html
      format.json  { render :json => @collections }
      format.xml  { render :xml => @collections }
    end
  end

  def show
    @collection = Collection.find( params[:id] )
    @albums = @collection.albums.find(:all, :order => 'title')
    if @current_user == @collection.owner
      respond_to do |format|
        format.html
        format.json  { render :json => @collection }
        format.xml  { render :xml => @collection }
      end
    end
  end

  def new
    @collection = Collection.new

  end


  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      @collection.owner = @current_user.name
      flash[:notice] = "Koleksiyon oluşturuldu, albüm ekleyebilirsiniz"
      redirect_to new_collection_album_path(@collection)
    else
      render :action => :new
    end
  end

  def edit
    @collection = Collection.find( params[:id])
  end

  def update
    @collection = Collection.find( params[:id])
    if @collection.update_attributes(params[:collection])
      flash[:notice] = "Koleksiyon güncellendi!"
      redirect_to @collection
    else
      render :action => :edit
    end
  end

  def destroy
    @collection = Collection.find( params[:id])
    if @collection.destroy
      redirect_to collections_path
    else
      redirect_to @collection
    end
  end

end
