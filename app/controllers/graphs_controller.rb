class GraphsController < ApplicationController
  before_action :set_graph, only: [:show, :edit, :update, :destroy]

  # GET /graphs
  # GET /graphs.json
  def index
    @graphs = Graph.all
  end

  # GET /graphs/1
  # GET /graphs/1.json
  def show
    @chart_data = []
    if @graph.main == true
      chart = []
      House.where("hems_id is ?", @graph.hems_id).first.mains.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "main", :data => chart}
    end
    if @graph.solar_generate == true
      chart = []
      House.where("hems_id is ?", @graph.hems_id).first.solar_generates.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "solar_generated", :data => chart}
    end
    if @graph.solar_sold == true
      chart = []
      
      House.where("hems_id is ?", @graph.hems_id).first.solar_sells.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "solar_sold", :data => chart}
    end
    if @graph.battery_charge == true
      chart = []
      
      House.where("hems_id is ?", @graph.hems_id).first.battery_charges.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "battery_charge", :data => chart}
    end
    if @graph.battery_discharge == true
      chart = []
      
      House.where("hems_id is ?", @graph.hems_id).first.battery_discharges.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "battery_discharge", :data => chart}
    end
    if @graph.fuel_cell == true
      chart = []
      
      House.where("hems_id is ?", @graph.hems_id).first.fuel_cells.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "fuel_cell", :data => chart}
    end
    if @graph.gus == true
      chart = []
      
      House.where("hems_id is ?", @graph.hems_id).first.gus.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "gus", :data => chart}
    end
    if @graph.water == true
      chart = []
  
      House.where("hems_id is ?", @graph.hems_id).first.waters.where(timestamp: @graph.start..@graph.end).each{|v|
        chart << [v.timestamp.strftime("%Y-%m-%dT%H:%M:%S+09:00:00"), v.value]
      }
      @chart_data << { :name => "water", :data => chart}
    end
  end

  # GET /graphs/new
  def new
    @graph = Graph.new
  end

  # GET /graphs/1/edit
  def edit
  end

  # POST /graphs
  # POST /graphs.json
  def create
    @graph = Graph.new(graph_params)

    respond_to do |format|
      if @graph.save
        format.html { redirect_to @graph, notice: 'Graph was successfully created.' }
        format.json { render :show, status: :created, location: @graph }
      else
        format.html { render :new }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graphs/1
  # PATCH/PUT /graphs/1.json
  def update
    respond_to do |format|
      if @graph.update(graph_params)
        format.html { redirect_to @graph, notice: 'Graph was successfully updated.' }
        format.json { render :show, status: :ok, location: @graph }
      else
        format.html { render :edit }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphs/1
  # DELETE /graphs/1.json
  def destroy
    @graph.destroy
    respond_to do |format|
      format.html { redirect_to graphs_url, notice: 'Graph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graph_params
      params.require(:graph).permit(:hems_id, :postal, :main, :solar_generate, :solar_sold, :battery_charge, :battery_discharge, :fuel_cell, :gus, :water, :start, :end)
    end
end
