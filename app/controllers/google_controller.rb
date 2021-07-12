class GoogleController < ApplicationController

    #MyApp/app/views/controllers/routers_controller.rb

#Add load_routers and replaced index with the code below
def create  
    @mapp_default = Gmaps4rails.build_markers(Address.all) do |plot, marker|  
       marker.lat plot.latitude  
       marker.lng plot.longitude     

    end  
end
def maps
    return Gmaps4rails.build_markers(Building.all) do |maps, marker|
        building1 = Building.where(id: maps.building_detail).first
        address1 = Address.where(id: building1.address_of_the_building_id).first
        customer1 = Customer.where(id: building1.customer_id).first
        battery1 = Battery.where(id: building1.building_detail).first
        columns1 = Column.where(id: maps.battery_ids).first
        buildingDetail1 = BuildingDetail.where(building_id: building1.id).first
        
        clientname = customer1.compagny_name
        numoffloors = 0
        numofbatteries = 0
        numofcolumns = 0 
        numofelevators = 0
        fullnameofcontact = building1.full_name_of_the_technical_contact_for_the_building

        if buildingDetail1.present? then
            numoffloors = buildingDetail1.value.split.last
        end    
        
        batteries = Battery.where(building_id: building1.id)
        batteries.each do |b|
            numofbatteries += 1
            columns = Column.where(battery_id: battery1.id)
            columns.each do |c|
                numofcolumns += 1
                elevators = Elevator.where(column_id: columns1.id)
                numofelevators += elevators.count
            end 
        end 

        marker.lat address1.latitude  
        marker.lng address1.longitude



        marker.infowindow render_to_string(:partial => "/google/info", :locals => {
        :numberoffloors => numoffloors,
        :clientname => clientname,
        :numberofbatteries => numofbatteries,
        :numberofcolumns => numofcolumns,
        :numberofelevators => numofelevators,
        :fullnameofcontact => fullnameofcontact

    })
    end    
end     
    def index  
        load_maps  
 
        @maps = Map.all  
    end
    # def maps
    #     @coords = []

    #     Building.all.each do |b|
    #         @coords.push([b.address_of_the_building.latitude, b.address_of_the_building.longitude])  
    #         puts "===========================" 
    #     end 
        
    # end
end
