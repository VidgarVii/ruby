require 'net/http'
require 'uri'
require 'rss'
require 'vk-ruby'
require 'multi_json'

class Bot
    
    def initialize
        @app = VK::Application.new(app_id: , version: '5.71', access_token: '')
        file = File.read('./answer.json')
        @hash_answer = MultiJson.load(file)
        @get_msg = "START BOT"
        puts @get_msg
        @mats = ["хуй", "заеп", "заип", "хер", "чмо", "бля"]
    end
    
    def listen (time = 0)
        begin
            get = @app.vk_call 'messages.getDialogs?count=1&         '
            body = get['items'][0]['message']['body'].capitalize
            
            if body != @get_msg
                @get_msg = body
                puts @get_msg
                answer_json
                brain
            end 
            
            
            
            @mats.each { |key| 
                ch = body.downcase
                    
                    if ch.include?(key)
                        speak("НЕ РУГАЙСЯ МАТОМ!!!")
                        sleep 2
                     end
                    }
        rescue
            sleep 20
            retry
        end
        sleep time
    end
    
    def run (time)
        listen (time) while true 
    end
        
    def speak(push_text=nil)
        
        mes = URI.encode_www_form(["#{push_text} _bot"])
        @app.vk_call "messages.send?&         &message=#{mes}"
        sleep 0.5
        
    end

    def answer_json
    @hash_answer.each { |question, answer| 
       
        case question
            when @get_msg
            push = @hash_answer[@get_msg].sample
            speak(push)
            else
        end
            }

    end
        
    def brain
        case @get_msg 
            when "Бот погода", "Бот какая погода?", "Бот покажи погоду"
                require_relative 'app/pogoda'
            when "Бот хелп", "Бот хелпми", "Бот помощь", "Бот справка"
                speak "Возможные команды бота"
                @hash_answer.each { |question, answer| speak question }
                speak "Бот погода \n Бот тест1"
                
            when "Бот тест1"
                require_relative 'app/tests/emotion_power'
        end
    end
end

bot = Bot.new

bot.run(3)

