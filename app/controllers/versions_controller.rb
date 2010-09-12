class VersionsController < ApplicationController
  
  before_filter :find_plugin
  
  # GET /versions
  # GET /versions.xml
  def index
    @versions = @plugin.versions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @versions }
    end
  end

  # GET /versions/1
  # GET /versions/1.xml
  def show
    @version = @plugin.versions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @version }
    end
  end

  # GET /versions/new
  # GET /versions/new.xml
  def new
    @version = @plugin.versions.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @version }
    end
  end

  # GET /versions/1/edit
  def edit
    @version = @plugin.versions.find(params[:id])
  end

  # POST /versions
  # POST /versions.xml
  def create
    @version = @plugin.versions.new(params[:version])

    respond_to do |format|
      if @version.save
        format.html { redirect_to(plugin_version_path(@plugin, @version, :editor => @editor.short), :notice => 'Version was successfully created.') }
        format.xml  { render :xml => @version, :status => :created, :location => @version }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /versions/1
  # PUT /versions/1.xml
  def update
    @version = @plugin.versions.find(params[:id])

    respond_to do |format|
      if @version.update_attributes(params[:version])
        format.html { redirect_to(plugin_version_path(@plugin, @version, :editor => @editor.short), :notice => 'Version was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.xml
  def destroy
    @version = @plugin.versions.find(params[:id])
    @version.destroy

    respond_to do |format|
      format.html { redirect_to(plugin_versions_url(@plugin, :editor => @editor.short)) }
      format.xml  { head :ok }
    end
  end

private

  def find_plugin
    @plugin = @editor.plugins.find(params[:plugin_id])
  end

end
