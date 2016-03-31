require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"


def require_factory_girl
  require 'factory_girl'
  FactoryGirl.find_definitions
end
