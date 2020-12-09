class Champion
    attr_accessor :name, :title, :stats, :tags
    @@all = []

    def initialize(name:, title:, :tags)
        self.name = name
        self.title = title
        self.tags = tags
        save
    end
    
    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end

