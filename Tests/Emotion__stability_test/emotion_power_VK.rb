require 'vk-ruby'
require 'multi_json'


@app = VK::Application.new(app_id: , version: '5.71', access_token: '')

open = File.read('app/tests/ep.json')
file = MultiJson.load(open)
summ = 0 

def sendmsg(puts)
   @app.vk_call "messages.send?&chat_id=         &message=#{puts}"
end

def checknil
    
       
end


sendmsg("Разные люди по-разному реагируют на стрессовые ситуации. А как же обстоит дело у вас? Попробуйте оценить свою собственную эмоциональную устойчивость. В тесте 10 вопросов.
Вы в любой момент можете остановить тест написав \"stop\" 
")

sleep 5

file.each { |answer, quest|
    
    @get = nil
    
    sendmsg("#{answer} \n #{quest} \n \n Выберите вариант ответа. Просто введите в чате номер ответа (1,2,3)")
    
    sleep 10
    
        while (@get != "1" && @get != "2" && @get != "3") 
            bod = @app.vk_call 'messages.getDialogs?count=1&'
            @get = bod['items'][0]['message']['body']
                        
            p @get
            sleep 3
            
            if @get == "stop"
                break
            end
        end 
    
        if @get == "1"
            summ += 1
        elsif @get == "2"
            summ += 2
        elsif @get == "3" 
            summ += 3
        end    
            puts summ
    
        }
@app.vk_call "messages.send?&chat_id=          &message=ВЫ ПРОШЛИ ТЕСТ"
sleep 1
case summ
    when 10..14
        answer = "Ваши нервы в порядке. Вы можете успешно контролировать свои эмоции, случайные стрессы не выводят вас из равновесия. На всякий случай проверьте себя через недельку."
    when 15..25
        answer = "Ваше противостояние стрессам происходите переменным успехом. Вы стараетесь не давать себе мучиться понапрасну из-за житейских коллизий, но все-таки время от времени какая-то несчастная случайность заставляет вас переживать и конфликтовать. Чаще находите для себя повод расслабиться и сменить деятельность."   
     when 15..25
        answer = "Ваше противостояние стрессам происходите переменным успехом. Вы стараетесь не давать себе мучиться понапрасну из-за житейских коллизий, но все-таки время от времени какая-то несчастная случайность заставляет вас переживать и конфликтовать. Чаще находите для себя повод расслабиться и сменить деятельность." 
    else 
        answer = "Что-то вы батенька темните"
end

@app.vk_call "messages.send?&chat_id=           &message=#{answer}" 
