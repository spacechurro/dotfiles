require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"


def require_factory_bot
  require 'factory_bot'
  FactoryBot.find_definitions
end
