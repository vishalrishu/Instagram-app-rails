class ApplicationController < ActionController::Base
    add_flash_types :alert, :error, :success, :another_custom_type
end
