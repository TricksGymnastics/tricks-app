class PartiesController < ApplicationController
  before_action :set_party, only: [:edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :get_jr_parties, :get_jr_parties_all]

  # GET /parties
  def index
    @parties = Party.all.order(:sort_order)
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to parties_url, notice: 'Party was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parties/1
  def update
    if @party.update(party_params)
      redirect_to parties_url, notice: 'Party was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parties/1
  def destroy
    @party.destroy
    redirect_to parties_url, notice: 'Party was successfully destroyed.'
  end

  def get_jr_parties_all
    response = JSON.parse(HTTParty.get('https://app.jackrabbitclass.com/jr3.0/Openings/OpeningsJson?orgid=313983&loc=&cat1=Parties').body)
      
    if response['rows'].length > 0
      parties = Hash.new
                    
      response['rows'].each do |r|
        # puts r.to_s.gsub("=>",":")
        entry = Hash.new
              
        entry['link'] = r['online_reg_link'].gsub("amp;", "")
        
        #entry['openings'] = r['openings']['calculated_openings'] > 0 ? r['openings']['calculated_openings'] : r['openings']['calculated_openings'].abs.to_s + " on Wait List"
        entry['openings'] = r['openings']['calculated_openings'] > 0 ? true : false
        
        entry['price'] = r['description']
        
        
        
        date = Date.strptime(r['start_date'], '%Y-%m-%d')
        time = Time.strptime(r['start_time'], '%H:%M')
        
        loc = r['location'];
        
        if parties[loc].nil?
          parties[loc] = Hash.new
        end
        
        if parties[loc][date].nil?
          parties[loc][date] = Hash.new
        end
        
        parties[loc][date][time] = entry
      end
      
      
      
    else
      render plain: "Error: Could not contact jackrabbitclass.com for price information."
    end
    
    out = "<script>
          $('.price').text('"+parties.first[1].first[1].first[1]['price'].gsub("\r\n"," | ")+"');
        </script>"
        
    render plain: out
  end

  def get_jr_parties
    party = Party.find(params[:party_id])
    # if the party id is for a dance party
      # clear response for folsom
    out = "<div class='columns 11-small'>"
    
    Location.all.each do |loc|
      out += "<div class='location-classes-information' id='"+loc.shortname+"' style='display: none; width: 100%;'>"
      url = 'https://app.jackrabbitclass.com/jr3.0/Openings/OpeningsJson?orgid=313983&loc='+loc.shortname+'&cat1=Parties'
      response = JSON.parse(HTTParty.get(url).body)
      
      if response['rows'].length > 0 && !(loc[1] == "FOL" && (party.id == 2 || party.id == 4)) #exclude dance parties (id's 2 & 4) from folsom
        parties = Hash.new
              
        response['rows'].each do |r|
          entry = Hash.new
                
          entry['link'] = r['online_reg_link'].gsub("amp;", "")
          
          #entry['openings'] = r['openings']['calculated_openings'] > 0 ? r['openings']['calculated_openings'] : r['openings']['calculated_openings'].abs.to_s + " on Wait List"
          entry['openings'] = r['openings']['calculated_openings'] > 0 ? true : false
          
          entry['price'] = r['description']
          
          date = Date.strptime(r['start_date'], '%Y-%m-%d')
          # if date.year == 2018 then
          #   # puts date + "\n"
          #   puts r.to_s.gsub("=>",":")
          # end
          time = Time.strptime(r['start_time'], '%H:%M')
          
          if parties[date].nil?
            parties[date] = Hash.new
          end
          
          parties[date][time] = entry
        end
        
        # note: when accessing a hash in a .each loop, key is at [0] and value is at [1] for each pair
        out += 
        "<script>
          $('."+loc.shortname+"_price').text('"+parties.first[1].first[1]['price'].gsub("\r\n"," | ")+"');
        </script>"
        
        current_year = 1990
        possible_times = []
        
        out += "<table style='text-align: center;'>"
        
        # puts loc
        parties.sort.map do |date, times|
          new_times = ["1:00 pm", "2:15 pm", "3:30 pm", "4:45 pm", "6:00 pm"]
          # times.keys.sort.each do |time|
          #   new_times << time.strftime('%-l:%M %P')
          # end
          
          # Check if we need to do a new row of time headers. This should only happen if times don't match up between possible_times and new_times
          # needs_new_times_row = false
          # puts "new_times: " + new_times.count.to_s + " > " + "possible_times: " + possible_times.count.to_s + " === " + (new_times.count > possible_times.count).to_s
          
          # if new_times.count > possible_times.count
          #   needs_new_times_row = true
          # else
          #   # new_times must be smaller than or equal to size of possible_times, check for mismatched times
          #   new_pos = 0
          #   possible_pos = 0
          #   while possible_pos < possible_times.count && new_pos < new_times.count do
              
          #     # offset new_pos until it finds a match in possible_times, if it doesn't then we need a new row of times
          #     while new_times[new_pos] != possible_times[possible_pos] && possible_pos < possible_times.count do
          #       possible_pos += 1
          #     end
              
          #     #If we got here we know that there is at least 1 matching time, check if the rest of the new ones are in possible
          #     if possible_times[possible_pos] != new_times[new_pos]
          #       needs_new_times_row = true
          #       break
          #     end
          #     new_pos += 1
          #     possible_pos += 1
          #   end
            
          #   if new_pos > new_times.count then
          #     needs_new_times_row = true
          #   end
          # end
          
          # is it a new year?
          if (current_year == 1990 || date.strftime('%Y') != current_year)
            out += "</table><table style='text-align:center;'><tr style='line-height: 12px; font-size: 22px; background-color: #bbb;'><td colspan='"+(new_times.count + 1).to_s+"'>"+date.strftime('%Y')+"</td></tr>"
            current_year = date.strftime('%Y')

            possible_times = new_times
            out += "<tr><td></td>"
            possible_times.each do |possible_time|
              out += "<td>"+possible_time+"</td>"
            end
            out += "</tr>"
          end
          
          
          
          # add new row for the current date
          out += "<tr><td>"+date.strftime('%B %e')+"</td>"
          
          no_party = "<td style='font-size: 13px; background-color: #ccc;'>No Party</td>"
          
          current_time = 0
          times.sort.each do |time, party|
            time_string = time.strftime('%-l:%M %P')
            
            #loop until we are the first time there is a party for
            while time_string != possible_times[current_time] do
              out += no_party
              current_time = current_time + 1
              
              if current_time > possible_times.count then
                break
              end
            end
            
            reserved_party = "<td style='font-size: 13px;'>Reserved</td>"
            
            #check if the party is still available
            if party['openings']
              out += "<td style='font-size:17px; padding: 3px;'>"+view_context.link_to("Register", party['link'])+"</td>"
            else
              out += reserved_party
            end
            
            current_time = current_time + 1
          end
          
          #fill in the rest of the hours that have no party
          while (current_time < possible_times.count) do
            out += no_party
            current_time = current_time + 1
          end
          
          out += "</tr>"
        end
        out += "</table>"
      else
        out += "<div style='text-align:center; padding:30px; background-color: #ddd; font-size: 26px;'><h2>Sorry!</h2>We do not offer this kind of<br>party at this location</div>"
      end
      out += "</div>"
    end
    out += "</div>"
    render plain: out
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def party_params
      params.require(:party).permit(:title, :description, :video, :color, :activities, :sort_order)
    end
end
