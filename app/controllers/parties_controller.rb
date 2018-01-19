class PartiesController < ApplicationController
  before_action :set_party, only: [:edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :get_jr_parties]

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


  def get_jr_parties
    out = "<div class='columns 11-small'>"
		locations = {"Granite Bay" => "GB", "Folsom" => "FOL", "Sacramento" => "SAC"}
		
    locations.each do |loc|
		  out += "<div class='location-classes-information' id='" + loc[1] +"' style='display: none; width: 100%;'>"
			url = 'https://app.jackrabbitclass.com/jr3.0/Openings/OpeningsJson?orgid=313983&loc='+loc[1]+'&cat1=Parties'
			response = JSON.parse(HTTParty.get(url).body)
			
			if response['rows'].length > 0
				parties = Hash.new
							
				response['rows'].each do |r|
					# puts r.to_s.gsub("=>",":")
					entry = Hash.new
								
  				entry['link'] = r['online_reg_link'].gsub("amp;", "")
  				
  				#entry['openings'] = r['openings']['calculated_openings'] > 0 ? r['openings']['calculated_openings'] : r['openings']['calculated_openings'].abs.to_s + " on Wait List"
  				entry['openings'] = r['openings']['calculated_openings'] > 0 ? true : false
  				
  				entry['price'] = r['description']
  				entry['duration'] = Time.at((Time.strptime(r['end_time'], '%H:%M') - Time.strptime(r['start_time'], '%H:%M'))).utc.strftime("%lh %Mm")
  				
  				
  				# min_age = (r['min_age'].empty?) ? '' : r['min_age'][1..2]#, months: r['min_age'][4..5]}
  				# max_age = (r['max_age'].empty?) ? '' : r['max_age'][1..2]#, months: r['max_age'][4..5]}
  				# if min_age != '' && max_age != ''
  				# 	if min_age == max_age
	  			# 		entry['age'] = min_age.gsub(/^0/, "")
  				# 	else
	  			# 		entry['age'] = min_age.gsub(/^0/, "") + " - " + max_age.gsub(/^0/, "")
  				# 	end
	  			# elsif min_age != ''
	  			# 	entry['age'] = min_age.gsub(/^0/, "")
	  			# elsif max_age != ''
	  			# 	entry['age'] = max_age.gsub(/^0/, "")
	  			# else
  				# 	entry['age'] = '<span style="color: red">none</span>'
	  			# end
  				
  				date = Date.strptime(r['start_date'], '%Y-%m-%d')
  				time = Time.strptime(r['start_time'], '%H:%M')
  				
  				if parties[date].nil?
  					parties[date] = Hash.new
  				end
  				
  				parties[date][time] = entry
  			end
  			
				# note: when accessing a hash in a .each loop, key is at [0] and value is at [1] for each pair
				out += "
				<script>
					$('.length').text('"+parties.first[1].first[1]['duration']+"');
					$('.price').text('"+parties.first[1].first[1]['price'].gsub("\r\n"," | ")+"');
				</script>"
				
				out += "<table style='text-align: center;'>"
				current_year = 1990
				possible_times = ["1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm", "6:00 pm"]
				
				parties.sort.map do |date, times|
					# is it a new year?
					if (current_year == 1990 || date.strftime('%Y') != current_year)
						out += "<tr style='line-height: 12px; font-size: 22px; background-color: #bbb;'><td colspan='7'>"+date.strftime('%Y')+"</td></tr><tr><td></td>"
						possible_times.each do |possible_time|
							out += "<td>"+possible_time+"</td>"
						end
						out += "</tr>"
						current_year = date.strftime('%Y')
					end
					
					out += "<tr><td>"+date.strftime('%B %e')+"</td>"
					
					no_party = "<td style='color: red;'>None</td>"
					
					current_time = 0;
					times.sort.map do |time, party|
						time_string = time.strftime('%-l:%M %P')
						
						#loop until we are the first time there is a party for
						while time_string != possible_times[current_time] do
							out += no_party
							current_time = current_time + 1
						end
						
						#check if the party is still available
						if party['openings']
				  		out += "<td>Taken</td>"
						else
				  		out += "<td>"+view_context.link_to("Register", party['link'])+"</td>"
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
				out += "<h4 style='text-align:center;'>Sorry! No parties at this location</h4>"
			end
			out += "</div>"
		end
		out += "</div>"
    render :text => out
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
