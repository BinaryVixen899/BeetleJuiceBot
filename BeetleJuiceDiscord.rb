require 'discordrb'

bot = Discordrb::Bot.new token: '#TOKEN GOES HERE'
$beetlejuicecounter = 1
$testing = 1

def BeetleJuiceSummon(bot, author, channel)
   bot.send_message(channel,"Alright, which one of you losers summoned me? I mean don't get me wrong I'm appreciative, but I was just watching the next episode of WandaVision!")
   bot.send_message(channel,"Oh, I see. It was #{author}, well today's your lucky day, because you're getting banned.")
   bot.send_message(channel,"See, it's lucky because you're about to miss a whole lot of BeetlePosting.")
   bot.send_message(channel,"You know what, actually maybe it's a better punishment if you stay.")
   bot.send_message(channel,"Alright prepare for one of my hit singles, AND DON'T INTERRUPT ME!")
   myran = Random.new
   num = myran.rand(5..10)
   $beetlejuicecounter = 1
   File.foreach("./BeetleSongs/#{num}") {|line| bot.send_message(channel,line,tts=false)}
end


def MainLoop(bot) 
      bot.message(with_text: 'Beetlejuice') do |event| 
      if $beetlejuicecounter == 1 
         event.respond('Now all you gotta do is say my name two more times!')
         $beetlejuicecounter+= 1
      elsif $beetlejuicecounter == 2
          event.respond('Yes.....Yessssssss!')
          $beetlejuicecounter+= 1
      elsif $beetlejuicecounter == 3
         event.respond("GUESS I'M NOT INVISIBLE ANY MORE!")
         author = event.user.name
         channel = event.channel
         BeetleJuiceSummon(bot,author, channel)
      end
   end

      bot.message(with_text: 'beetlejuice') do |event| 
      if $beetlejuicecounter == 3
         event.respond("Ahhh what the hell, I'll take it!")
         author = event.user.name
         channel = event.channel
         BeetleJuiceSummon(bot,author, channel)  
      else
          event.respond('Not even capitalizing my name? Oh come on kid, try again.')
      end
      
  end
 end



MainLoop(bot)

bot.run

