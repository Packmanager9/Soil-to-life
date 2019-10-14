require "TextGrapher"

$xrange = 80
$yrange = 80
$steps = 2000

class Fighter

    attr_accessor :name, :status, :x, :y,  :r, :g, :b,  :all
    @@all = []
    def initialize(name, x, y, status, r, g, b)
        @name = name
        @status = status
        @x = x.to_i
        @y = y.to_i
        @r = r
        @g = g
        @b = b
        @@all << self
    end
    def self.all
        @@all
    end
    end


    class Terrain <  Fighter

        attr_accessor :type, :energy, :energy,  :all
        @@all = []
        def initialize(name, x, y,  status, r, g, b, type, depth, energy)
            super(name, x, y, status, r, g, b)
            @type = type
            @energy = energy
            @depth = depth
            @@all << self
        end
        def self.all
            @@all
        end
        end


        class Plant <  Fighter

            attr_accessor :type, :depth, :energy,  :growthrate, :all
            @@all = []
            def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate)
                super(name, x, y, status, r, g, b)
                @type = type
                @energy = energy
                @depth = depth
                @growthrate = growthrate
                @@all << self
            end
            def self.all
                @@all
            end
            def self.avg_energy
                x = 0
                Plant.all.each do |plant| x += plant.energy end
                    avg = (x.to_f/Plant.all.length)
                    avg
            end
            end
            

        class Herbivore <  Fighter

            attr_accessor :type, :depth, :energy, :growthrate, :all
            @@all = []
            def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate)
                super(name, x, y, status, r, g, b)
                @type = type
                @energy = energy
                @depth = depth
                @growthrate = growthrate
                @@all << self
            end
            def self.all
                @@all
            end
            end
            
    #0 == dust 
    #1 = active
    #0 = soil


def belllcurve(y)
    x = 0
    y.times do
        x += rand(0..1)
    end
    x
end

    dustcolor = ChunkyPNG::Color.rgba(162, 116, 78, 255)
    dust = Terrain.new(0, 5, 5, 1, 162, 116, 78,  "path", 0, 10)
    grass = Plant.new(0, 4, 4, 1, rand(50), (rand(122)+134), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+1))

puts dust
puts grass

def populate

    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
                terr = provideterrain(0, 6, x, y)
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(20) == (x%20) 
                terr = provideplants(0, 3, x, y)
            end
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end

    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(200) == (x%20) 
                terr = provideanimals(0, 3, x, y)
            end
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end

end

def provideterrain(a, b, x, y)
    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
     dust = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
     clay = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 10)
     dirt = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, 25)
     soil = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, 50)
     earth = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, 100)
     mud = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, 200)
     loam = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, 500)
     rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
     c = rand(a..b)
     case c
     when 7
        d = rock
     when 0
         d = dust
    when 1
        d = clay
    when 2
        d = dirt
    when 3
        d = mud
    when 4
        d = earth
    when 5
        d = soil
    when 6
        d = loam
     else 
         d = mud
     end
 d
 end
 


 def provideterrainbasic(a, b, x, y)
    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
     dust = Terrain.new(0, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
     dirt = Terrain.new(1, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 100)
 
     c = rand(a..b)
 
     case c
     when 0
         d = dust
     when 1
         d = dirt
     else 
         d = dust
     end
 d
 end
 

 def fuzzer_x(num, range = $xrange, floor = 0)

    num += rand(-1..1)
    if num < 0
        num = 0
        end
    if num > range
            num = range
    end
    num
 end


 def interact(front, back)

    if front.name >= 0 && back.name >= 0 #&& front.name != back.name
      #  puts "here"
    #puts front.name
    #puts back.name
    if front.name < 3  && back.name > 5
      #  puts "left"
      #puts front.status
       # puts front.status
       #puts back.energy
        back.energy += front.energy

        Plant.all.delete(front)
        front = nil

       # puts back.energy
    end
    if back.name < 3 && front.name > 5
      # puts "right"
        front.energy += back.energy
        Plant.all.delete(back)
        back = nil
    end
end
GC.start(full_mark: true, immediate_sweep: true);
 end





 def fuzzer_y(num, range = $yrange, floor = 0)

    num += rand(-1..1)
    if num < 0
        num = 0
        end
    if num > range
            num = range
    end
    num
 end

  
 def provideplants(a, b, x, y)
    grass = Plant.new(0, x, y, 1, rand(50), (rand(122)+134), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(10)+10))
    shrub = Plant.new(1, x, y, 1, rand(20), (rand(100)+134), rand(20), "plant", 0, (belllcurve(200)+100), (belllcurve(7)+7))
    tree = Plant.new(2, x, y, 1, rand(10), (rand(50)+134), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(5)+3))

     c = rand(a..b)
 
     case c
     when 0
         d = grass
        when 1
            d = shrub
        when 2
            d = tree
     else 
         d = grass
     end

     if (x % 20) == 0
        d = tree
     end
 d
 end

 def provideanimals(a, b, x, y)
    rabbit = Herbivore.new(6, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(1)+2))
    deer = Herbivore.new(7, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(400)+10), (belllcurve(2)+4))
    elephant = Herbivore.new(8, x, y, 1, 150,150, 160, "herbi ", 0, (belllcurve(800)+10), (belllcurve(3)+6))

     c = rand(a..b)
 
     case c
     when 0
         d = rabbit
        when 1
            d = deer
        when 2
            d = elephant
     else 
         d = rabbit
     end
 d
 end
 
  

z = 0

$steps.times do
pngx = ChunkyPNG::Image.new($xrange+1, $yrange+1, ChunkyPNG::Color::BLACK)

if z == 0  ##start of the grid


populate


end

paths = Terrain.all.select do |path| path.type = "path" end


paths.each do |soil|  

    if soil.status !=0
    pngx[soil.x, soil.y] =  ChunkyPNG::Color.rgba(soil.r, soil.g, soil.b, 255)
     if rand(7000000) < soil.energy
         provideplants(0, 2, soil.x, soil.y)
     end
    end
    end

    plants = Plant.all.select do |plant| plant.type == "plant" && plant.status != 0 end


  plants.each do |plant|  
    if plant.status != 0
    pngx[plant.x, plant.y] = ChunkyPNG::Color.rgba(plant.r, plant.g, plant.b, 255)
    plant.energy += plant.growthrate
    end
    end

  herbivores = Herbivore.all.select do |animal| animal.name > 5 end


#if z == 5
 #   dogs.clear
 #   end

    #herbivores.each do |animal|  
    herbivores.each do |animal|
    pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
    animal.x = fuzzer_x(animal.x)
    animal.y = fuzzer_y(animal.y)
    puts animal.energy
    animal.energy -= animal.growthrate
    puts animal.energy
    if (animal.energy > 1001 && animal.name == 8) ||  (animal.energy > 501 && animal.name == 7) ||  (animal.energy > 251 && animal.name == 6)
        if animal.name == 8
        animal.energy -= 1000    
        Herbivore.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 750, animal.growthrate)
        elsif animal.name ==7
            animal.energy -= 500
            Herbivore.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 160, animal.growthrate)
            Herbivore.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 160, animal.growthrate)
        elsif animal.name == 6
            animal.energy -= 250
            Herbivore.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 50, animal.growthrate)
            Herbivore.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 50, animal.growthrate)
            Herbivore.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 50, animal.growthrate)
        end
    end
    if animal.energy <= 0
        Herbivore.all.delete(animal)
        animal = nil
GC.start(full_mark: true, immediate_sweep: true);
    end
end

z +=1

find = Plant.all.select do |plant| plant.name == 1 end
    plantoids = Plant.all.select do |plant| plant.name == 0 || plant.name == 1 ||   plant.name == 2 end
        trees = Plant.all.select do |plant| plant.name == 2 end
            animals = Herbivore.all.select do |animal| animal.name > 5 end
              #  puts plantoids.length
   # puts find.length
   # puts grassfind.length
 #   puts plantoids.length

    #puts Plant.avg_energy
     puts z
matches = []
    matches = animals + plantoids


    y = 0
    x = 0
    ($yrange).times do
        ($xrange).times do
        gather = matches.select do |part| part.x == x && part.y == y end
               
            ace = gather.find do |obj| obj.name > 5 end
            bace  = gather.find do |obj| obj.name < 3 && obj.name >= 0 end
            if bace != nil && ace != nil
                #  puts gather.length
               # puts bace.name
               # puts ace.name
                interact(bace, ace)
                
            end
            x+=1
        end
        x  = 0
        y+=1
    end


   dead = Plant.all.select do |every|  every == nil end

   # puts dead.length
Plant.all.delete_if do |obj| dead.include?(obj) end

pngx.save("gifmake28/life/#{z}.png")
end








