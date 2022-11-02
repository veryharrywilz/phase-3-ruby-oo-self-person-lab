require 'pry'

class Person

    attr_reader :name
    attr_accessor :bank_account, :hygiene

    @@people = []

    def initialize(name, bank_account=25, happiness=8, hygiene=8)
        @name=name
        @bank_account=bank_account
        @happiness=happiness
        @hygiene=hygiene
        @@people << self
    end

    def happiness
        @happiness
    end

    def happiness=(happiness)
        if happiness > 10
            @happiness=10
        elsif happiness < 0
            @happiness=0
        else
            @happiness=happiness
        end
    end

    def happy?
        if @happiness > 7
            true
        else
            false
        end
    end



    def hygiene
        @hygiene
    end

    def hygiene=(hygiene)
        if hygiene > 10
            @hygiene=10
        elsif hygiene < 0
            @hygiene=0
        else
            @hygiene=hygiene
        end
    end


    def clean?
        if @hygiene > 7
            true
        else
            false
        end
    end

    def take_bath
        @hygiene+=4
        self.hygiene=@hygiene
        '♪ Rub-a-dub just relaxing in the tub ♫'
    end

    def work_out
        @happiness += 2
        self.happiness=@happiness
        @hygiene-=3
        self.hygiene=@hygiene
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        called_friend = @@people.find { |i| i.name == friend.name }
        self.happiness=(self.happiness + 3)
        friend.happiness=(friend.happiness + 3)
        "Hi #{called_friend.name}! It's #{self.name}. How are you?"
     end

     def self.people
        @@people
     end

     def start_conversation(friend, topic)
        called_friend = @@people.find { |arrayElement| arrayElement.name == friend.name }
        case topic
        when "politics"
            self.happiness=(self.happiness - 2)
            friend.happiness=(friend.happiness - 2)
            "blah blah partisan blah lobbyist"
        when "weather"
            self.happiness=(self.happiness + 1)
            friend.happiness=(friend.happiness + 1)
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
     end



    def get_paid(amount)
        @bank_account+=amount
        @bank_account
        "all about the benjamins"
    end








end


binding.pry