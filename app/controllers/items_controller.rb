class ItemsController < ApplicationController

  respond_to :js, :html

  def index
    
    if params[:brand]
      @items = Item.tagged_with(params[:brand])
    else 
      @items = Item.all
    end
    
    respond_with @items
  end

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end

  def new
    @item = Item.new
    respond_with(@item)  
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Item was successfully updated."
    end
    respond_with(@item)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Item was successfully updated."
    end
    respond_with(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_with(@item)
  end
  
  def get
    # Gets items from a site and loads them into the db
    Item.get();
    render :nothing => true
  end
 
  def categorize
    Item.categorize(params[:id]);
    render :nothing => true
  end 
  
  def feed
    @title = "SynthFeed" # this will be the name of the feed displayed on the feed reader
    @feed_items = Item.all
    @updated = @feed_items.first.updated_at unless @feed_items.empty? # this will be our Feed's update timestamp

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently } # we want the RSS feed to redirect permanently to the ATOM feed
    end
  end
  
  
end
