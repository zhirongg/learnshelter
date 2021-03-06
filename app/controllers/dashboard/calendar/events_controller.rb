class Dashboard::Calendar::EventsController < ApplicationController

	def edit
		@event = Event.find(params[:id])
	end
	
	def new

	end

  def show
     @event = Event.find(params[:id])
     if request.xhr?
     render :partial => 'show', :object=> @event 
    end
  end

  def create
    #render text: params[:event].inspect
    #puts "CREATE WAS CALLED-----------------------------------------------------------"
    eventhash = Hash.new()
    puts params
    startYear = params[:event]['start_at(1i)'].to_i
    startMonth = params[:event]['start_at(2i)'].to_i
    startDay = params[:event]['start_at(3i)'].to_i
    startHour = params[:event]['start_at(4i)'].to_i
    startMin = params[:event]['start_at(5i)'].to_i

    endYear = params[:event]['end_at(1i)'].to_i
    endMonth = params[:event]['end_at(2i)'].to_i
    endDay = params[:event]['end_at(3i)'].to_i
    endHour = params[:event]['end_at(4i)'].to_i
    endMin = params[:event]['end_at(5i)'].to_i

    eventhash[:name] = params[:event][:name]
    eventhash[:description] = params[:event][:description]
    eventhash[:location] = params[:event][:location]
    
    eventhash[:start_at] = DateTime.new(startYear, startMonth, startDay, startHour, startMin)
    eventhash[:end_at] = DateTime.new(endYear, endMonth, endDay, endHour, endMin)

    eventhash[:user_id] = current_user.id

    #puts eventhash
    @event = Event.create!(eventhash)
    flash.keep[:notice] = "#{@event.name} was successfully created."
    redirect_to dashboard_calendar_path
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@event.name} was successfully updated."
    redirect_to dashboard_calendar_event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "event '#{@event.name}' deleted."
    redirect_to dashboard_calendar_path
  end
	
end
