module TestSupport
  module Integration
    def flash_message_present?(flashtype, message)
      within "#flash-#{flashtype}" do
        has_content? message
      end
    end
  end
end
