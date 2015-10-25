module ApplicationHelper
  def flash_messages_ad_type(flash)
    flash.each do |name, message|
      @messages = []
      @name = name
      if message.is_a?Array
        message.each do |msg|
          @messages << msg
        end
      else
        @messages << message
      end
    end
  end
end
