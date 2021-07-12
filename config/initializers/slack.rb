require 'slack-notifier'

notifier = Slack::Notifier.new (ENV["SLACK_APIKEY"])
