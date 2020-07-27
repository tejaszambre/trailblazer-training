module User::Operation
  class Index < Trailblazer::Operation
    step :is_request_vaild
    step :fetch_users
    fail :error_message, fail_fast: true

    def fetch_users(ctx, **)
      ctx[:users] = User.all
    end

    def is_request_vaild(ctx, **)
      true
    end

    def error_message(ctx, **)
      ctx[:error] = "Invalid request"
    end

  end
end
