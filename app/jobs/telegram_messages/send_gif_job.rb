module TelegramMessages
  class SendGifJob
    include Sidekiq::Job

    def perform(*args)
      BotService::SendGif.call
    end
  end
end
