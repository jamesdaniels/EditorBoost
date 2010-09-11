class PluginsController < ApplicationController
  # GET /plugins
  # GET /plugins.xml
  def index
    @plugins = @editor.plugins.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plugins }
    end
  end

  # GET /plugins/1
  # GET /plugins/1.xml
  def show
    @plugin = @editor.plugins.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/new
  # GET /plugins/new.xml
  def new
    @plugin = @editor.plugins.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/1/edit
  def edit
    @plugin = @editor.plugins.find(params[:id])
  end

  # POST /plugins
  # POST /plugins.xml
  def create
    @plugin = @editor.plugins.new(params[:plugin])

    respond_to do |format|
      if @plugin.save
        format.html { redirect_to(plugin_path(@plugin, :editor => params[:editor]), :notice => 'Plugin was successfully created.') }
        format.xml  { render :xml => @plugin, :status => :created, :location => @plugin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugins/1
  # PUT /plugins/1.xml
  def update
    @plugin = @editor.plugins.find(params[:id])

    respond_to do |format|
      if @plugin.update_attributes(params[:plugin])
        format.html { redirect_to(plugin_path(@plugin, :editor => params[:editor]), :notice => 'Plugin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1
  # DELETE /plugins/1.xml
  def destroy
    @plugin = @editor.plugins.find(params[:id])
    @plugin.destroy

    respond_to do |format|
      format.html { redirect_to(plugins_path(:editor => params[:editor])) }
      format.xml  { head :ok }
    end
  end
end
