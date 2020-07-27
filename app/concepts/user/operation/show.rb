module User::Operation
  class Show < Trailblazer::Operation
    step :is_request_vaild
    step :fetch_user
    fail :error_message

    def is_request_vaild(ctx, params:, **)
      User.exists?(params[:id]) if params[:id] != nil
    end

    def fetch_user(ctx, params:, **)
      ctx[:user] = User.find(params[:id])
    end

    def error_message(ctx, **)
      ctx[:error] = "Invalid id request"
    end
  end
end
