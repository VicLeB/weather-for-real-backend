class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found


    before_action :authorized
    SECRET = ENV["SECRET_KEY"]

    def encode_token(payload)
        JWT.encode(payload, SECRET)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, SECRET)
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
    end


    def render_record_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_record_not_found
        render json: {errors: "Record not found"}, status: :not_found
    end
end
