require 'telegram/bot'

API_KEY = Rails.application.secrets[:telegram_bot][:api_key]

Telegram::Bot::Client.run(API_KEY, logger: Logger.new($stderr)) do |bot|
  bot.logger.info('Bot has been started')
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/aaa'
      bot.api.send_message(chat_id: message.chat.id, text: "Works?")
    when '/b'
      animation_url = RandomGif.new(tag: 'kevin-the-office').url
      bot.api.send_animation(chat_id: message.chat.id, animation: animation_url)
    end
  end
end
