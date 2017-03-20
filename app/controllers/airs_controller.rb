class AirsController < ApplicationController
  def index
    @airs = Air.all
  end

  def update_air
    air = Air.find(params[:id])

    response = RestClient.get "http://web.juhe.cn:8080/environment/air/pm",
                              :params => { :city => "chongqing", :key => JUHE_CONFIG["api_key"] }

    data = JSON.parse(response.body)

    air.update( :city => data["result"][0]["city"],
                :pm_two_five => data["result"][0]["PM2.5"],
                :aqi => data["result"][0]["AQI"],
                :quality => data["result"][0]["quality"],
                :pm_ten => data["result"][0]["PM10"],
                :time => data["result"][0]["time"]
              )

    redirect_to airs_path
  end
end
