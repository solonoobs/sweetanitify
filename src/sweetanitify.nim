## http://youtu.be/tiw3rVi8oz0 👑 http://twitch.tv/sweet_anita 👑 @Tweet4nita
from random import sample
from strutils import countLines, splitLines

proc sweetAnitify*(text: string): string =
  ## `Sweet_Anita <https://www.twitch.tv/sweet_anita>`_ translator, bitch.
  const replacements = [ # Source are all Anitas ticks on all Anitas VOD
    ", fuck your friends with a baseball bat",
    ", I will fuck your friends with a baseball bat, I will mate",
    ", will you fuck my cat with a baseball bat?",
    ", can I fuck your friends?",
    ", I will fuck your friends",
    ", bitch lasagna",
    ", know your dick, and fucking make it thick",
    ", my dick is on fire",
    ", my cock is on fire",
    ", my cunt is on fire",
    ", I have a dick",
    ", fuck a biscuit",
    ", fuck your biscuit",
    ", go on fuck it",
    ", turn left",
    ", turn right",
    ", turn left, turn right",
    ", turn left, thats not fucking left you bitch",
    ", turn right, thats not fucking right you bitch",
    ", turn left, are you geographically retarded?",
    ", turn right, are you geographically retarded?",
    ", virgin",
    ", cunt",
    ", I like cats",
    ", I think about cats",
    ", who touched my cunt?",
    ", who fisted my kitten?",
    ", can I fist your kitten?",
    ", would you like a fisting?",
    ", fuck the queen",
    ", I can ear you shitting",
    ", I fucking love banyanya",
    ", banyanya, banyanya",
    ", can I fap on your kitten?",
    ", and my cunt",
    ", I been fucking my cunt",
    ", can I come on your tits?",
    ", I fuck cats, get out!",
    ", it does not come on my tits neither",
    ", ask me anything about my dick",
    ", you dont know how to touch a cunt, virgin",
    ", I will fuck your friends",
    ", cocaine, so much cocaine",
    ", fucking your biscuit",
    ", fucking fish ten times a day bitch",
    ", off my cock",
    ", I have come on a biscuit",
    ", sorry I lost your cunt",
    ", I am in love with your dick",
    ", I am in love with your cunt",
    ", fucking virgin",
    ", you virgin",
    ", my dick salutes you",
    ", my cunt salutes you",
    ", does that count as racist?",
    ", you like dick",
    ", I will fucking find you, and no one will ever again",
    ", I will find you, and no one will ever again",
    ", what an epic little cunt",
    ", my dick is amazing",
    ", my dick is jebaited",
    ", you 200 IQ virgin",
    ", my bush is on fire",
    ", you are so over the top, of my dick",
    ", I am sorry is taking so long to touch my cock",
    ", kitten",
    ", how are doing?, hows your kitten bitch?",
    ", just a little warning about my cock, is a big cock",
    ", I been fucking the devil",
    ", cats love vagina",
    ", I touch a cunt",
    ", it really tickled my cunt",
    ", my dick is a good description of your face",
    ", maybe someone will be joining, it may be my dick",
    ", my kitten is on fire",
    ", I gonna wank on your kitten",
    ", my dick needs to reload",
    ", my tits are on fire",
    ", I am in love with the fish",
    ", ever get that feeling of sexual healing?, I can jiiz some healing",
    ", can I double dunk your biscuit?",
    ", can I come on your creamy biscuit?",
    ", biscuit",
    ", you are a kitten, and I fuck cats",
    ", I am really gonna fist your kitten mate",
    ", I hope you will forgive my dick, my dancing baby dick",
    ", if you have not noticed I have Tourettes",
    ", I have Tourettes",
    ", my dick is going crazy",
    ", is everything Ok?, is my dick on fire?",
    ", you are so a cunt",
    ", I am a kitten",
    ", I will fuck your kitten with a cheese grater",
    ", I will fuck your cunt with a cheese grater",
    ", so to let you know, my dick is on fire",
    ", I would like to touch a cunt",
    ", thank my dick",
    ", you are a fucking flying cunt",
    ", I been streaming my cunt",
    ", an interesting fact about my cunt, is a biscuit",
    ", a biscuit is a cookie, is just a cookie, is just a sweet tasty piece of cock",
    ", to be honest, I have no idea how my dick can fit on that cunt",
    ", I am working on it, also I am working on my fuzzy fucking cunt",
    ", my dick is a spectrum, a big fucking spectrum",
    ", my dick is poetry",
    ", hold on, my dick is holdable",
    ", I will just take a minute, to fuck your biscuit",
    ", you feel like need support, of my dick",
    ", I am gonna throw a sausage at your cunt",
    ", I will fuck your friends with a dildo",
    ", I will dual weld my cat and a bitch",
    ", my dick is addictive",
    ", fuck Jesus",
    ", when I touch a cunt, Jesus watches",
    ", everytime I change my cunt into a pony, I fuck it",
    ", I think I might tickle your cunt, go on, let me tickle your cunt",
    ", my hobbies include fisting cats",
    ", could you let me fist you bitch?",
    ", I love the devils dick bitch",
    ", where is my dick?",
    ", I can rub my dick in your pasta?",
    ", can I come on your friends?",
    ", can I rest my flaps on your cock?",
    ", can I rub my flaps on your frieds?",
    ", lets just catch up with my dick for a moment",
    ", sorry, my dick is sorry",
    ", I live for the boobs",
    ", because at the end of the day my cunt is just a game",
    ", my dick is a desk, rest on my desk",
    ", winning is overrated, is not about winning, is about fucking cats",
    ", is a pretty sexy bitch, I would fuck that cat",
    ", just fucking wank on my cat, go on",
    ", can I rub my cat all over your kitten?",
    ", I have not really spoken to my cunt about this",
    ", sounds iffy?, my cunt is iffy",
    ", and I will punch your boner like if its fucking Thuesday",
    ", and I love dick, I love creamy fucking dick",
    ", my dick is nasty",
    ", my dick is in a fish paste jar",
    ", what a virgin, what a tasty virgin",
    ", I do think that space exploration is the reason why my cunt is on fire",
    ", Ill squish it",
    ", this is impressive, my dick is impressive bitch",
    ", can I bite your dick?",
    ", you are a hoe",
    ", are you a hoe?",
    ", can I come on your foot?",
    ", can I smash your cock?, let me smash",
    ", let those tities fly",
    ", lets make an unbirthing",
    ", my dick is concerned",
    ", did you say you have addiction to cock?",
    ", my dick is for science",
    ", my dick is never sorry",
    ", dont tick-shamming me",
    ", wait is not my fault you are a virgin",
    ", tickle my nipple",
    ", I have a tasty cock",
  ] # Order of array is not important. Starting strings with ", " is important.
  if unlikely(text.len == 0): return    # Just return if its empty string
  elif text.countLines > 2:             # BTW do Not {.inline.} this function
    for line in text.splitLines:
      result.add line & sample(replacements) & "\n" # Multi-line add 1 per line
  else:
    result = text & sample(replacements)            # Single-line add 1 total


when isMainModule:
  from os import paramCount, commandLineParams
  from strutils import join, strip
  from random import randomize
  randomize()
  if paramCount() == 0: quit"""USE:
    ./sweetanitify "This text will be Sweet_Anita-ified"
  http://youtu.be/tiw3rVi8oz0 👑 http://twitch.tv/sweet_anita 👑 @Tweet4nita"""
  quit(sweetAnitify(commandLineParams().join" ".strip), 0)
