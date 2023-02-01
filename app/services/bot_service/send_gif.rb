module BotService
  class SendGif < ApplicationService

  API_KEY = Rails.application.secrets[:telegram_bot][:api_key]
  CHAT_ID = Rails.application.secrets[:telegram_bot][:chat_id]

  attr_accessor :gif_uri

    def initialize
      @gif_uri = nil
    end

    def before
      @gif_uri = request_gif_uri
    end

    def call
      send_message_to_chat
    end

    def after; end


    private

    def request_gif_uri
      RandomGif.call( { tag: 'the-office'} )
    end

    def send_message_to_chat
      Telegram::Bot::Client.run(API_KEY, logger: Logger.new($stderr)) do |bot|
        bot.logger.info('Bot has been started')
        bot.api.send_animation(chat_id: CHAT_ID, animation: gif_uri)
      end
    end

  end

end
