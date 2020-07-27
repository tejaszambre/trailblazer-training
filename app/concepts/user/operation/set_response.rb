module User::Operation
  class SetResponse < Trailblazer::Operation
    step :get_records
    step :is_web_app_request?, Output(:success) => Track(:web_app),
                              Output(:failure) => Track(:mobile_app)
    fail :invalid_request
    step :filter_with_time_interval, magnetic_to: :web_app, Output(:success) => Track(:web_app),
                              Output(:failure) => Track(:failure)
    step :filter_with_status, magnetic_to: :web_app, Output(:success) => Track(:web_app),
                              Output(:failure) => Track(:failure)
    step :set_response_for_web, magnetic_to: :web_app, Output(:success) => Track(:web_app),
                              Output(:failure) => Track(:failure)
    step :order_desc_on_created_at, magnetic_to: :mobile_app, Output(:success) => Track(:mobile_app),
                              Output(:failure) => Track(:failure)
    step :set_response_for_mobile, magnetic_to: :mobile_app, Output(:success) => Track(:mobile_app),
                              Output(:failure) => Track(:failure)

    def get_records(ctx, **)
      ctx[:users] = User.all
    end

    def is_web_app_request?(ctx, params:, **)
      params[:web_app]
    end

    def filter_with_status(ctx, **)
      p 'filter with status'
      true
    end

    def filter_with_time_interval(ctx, **)
      p 'filter with time interval'
      true
    end

    def set_response_for_web(ctx, **)
      p 'set response for web'
      true
    end

    def set_response_for_mobile(ctx, **)
      p 'set response for mobile'
      true
    end

    def invalid_request(ctx, **)
      p 'error_message'
    end

    def order_desc_on_created_at(ctx, users:, **)
      p 'order desc on created at'
      ctx[:users] = users.order(created_at: :desc)
    end

  end
end
