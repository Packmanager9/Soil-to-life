require "TextGrapher"

$xrange = 210
$yrange = 210
$steps = 100000
$eaten = 0

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

        attr_accessor :type, :depth, :energy,  :all
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
            

                class Predator <  Fighter
        
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

#puts dust
#puts grass


#$mongoose = Predator.new(101, rand($xrange) ,rand($yrange), 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(10000)+10), (belllcurve(1)+1))
#$Python = Predator.new(102, rand($xrange), rand($yrange),  1, 255, (rand(20)+20), rand(100), "pred", 0, (belllcurve(20000)+100), (belllcurve(7)+7))
#$tiger = Predator.new(103, 10, 10, 1, 255, 0, 0, "pred", 0, (belllcurve(50000)+200), (belllcurve(10)+10))



def swim(water, life)

        if water.name == -9 && life.name >= 0
         #   puts "fuck"
        if water.name == -9  && rand(3) == 0 && (rand(water.depth) != 0)
            water.energy += (life.energy)
            Fighter.all.delete(life)
            life = nil
        end
    end
    GC.start(full_mark: true, immediate_sweep: true);
end

def populate


    predator_count = 0 
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
                terr = provideterrainbasic(0, 8, x, y)
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
            if rand(1000) == 1
                if predator_count < 20
                terr = predator_generator(0, 3, x, y)
                predator_count += 1
                end
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
                terr = provideterrainbasic(0, 8, x, y)
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
            if rand(80) == (x%20) 
                terr = provideplants(0, 3, x, y, -4)
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
 #    dust = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
 #    clay = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 10)
 #    dirt = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, 25)
  #   soil = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, 50)
  #   earth = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, 100)
  #   mud = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, 200)
  #   loam = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, 500)
   # rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
 #    dust = Terrain.new(-1, x, y, 1, 255, 255, 255,  "path", 0, 1)
 #   clay = Terrain.new(-2, x, y, 1, 0, 255, 255,  "path", 0, 10)
 #   dirt = Terrain.new(-3, x, y, 1, 255, 0, 255,  "path", 0, 25)
 #   soil = Terrain.new(-4, x, y, 1, 255, 255, 0,  "path", 0, 50)
 #   earth = Terrain.new(-5, x, y, 1, 0, 0, 255,  "path", 0, 100)
 #    mud = Terrain.new(-6, x, y, 1, 0, 255, 0,  "path", 0, 200)
    # loam = Terrain.new(-7, x, y, 1, 255, 0, 0,  "path", 0, 500)
  #  rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
     c = rand(a..b)
    case c
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
 #puts "#{d.r},#{d.g},#{d.b}, #{c}"
 return d
 end
 

 def provideterrainbasic(lowestsoil, highestsoil, x, y)
    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
    # dust = Terrain.new(0, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
    # dirt = Terrain.new(1, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 100)

    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
 #    dust = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
 #    clay = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 10)
 #    dirt = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, 25)
  #   soil = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, 50)
  #   earth = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, 100)
  #   mud = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, 200)
  #   loam = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, 500)
   # rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
 
   #  caste = rand(0..7)
    # caste = (x*2) % 7
     z = (x*y)

if z < (210*211)
caste = 6
end
if z < (180*180)
        caste = 5
end
if z < (160*160)
        caste = 4
end
    if z < (140*140)
        caste = 3
    end
    if z < (120*120)
        caste = 2
    end
    if z < (101*101)
        caste = 1
    end
    if z < (85*85)
        caste = 0
        end

        if z < (70*70)
            caste = 7
            end
            if z < (15*15)
                caste = 8
                end
    





     case caste
      when 0
          d = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, rand(1..2))
     when 1
         d = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, rand(2..10))
     when 2
         d = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, rand(10..25))
     when 3
         d = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, rand(25..50))
     when 4
         d = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, rand(50..100))
     when 5
         d = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, rand(200..500))
        when 6
            d = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, rand(500..1000))
        when 7
            d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1)
        when 8
            h = rand(3)
                if z < (15*15)
                    h = 2
                   end
                   if z < (10*10)
                        h = 1
                       end
                       if z < (5*5)
                            h = 0
                           end
            case h
            when 0
            d = Terrain.new(-9, x, y, 1, 10, 10, 200,  "path", 3, -100)

            when 1
            d = Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, -100)

            when 2
            d = Terrain.new(-9, x, y, 1, 50, 50, 230,  "path", 1, -100)
            else
                d = Terrain.new(-9, x, y, 1, 35, 35, 200,  "path", 3, -100)
            end
      else 
          d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1)
     end
  #puts "#{d.r},#{d.g},#{d.b}, #{caste}"
  return d
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

    if front.name >= 0 && back.name >= 0
    if front.name < 3  && back.name > 5
        back.energy += front.energy
        Plant.all.delete(front)
        front = nil
    end
end
GC.start(full_mark: true, immediate_sweep: true);
 end




 def predation(front, back)

    if front.name >= 0 && back.name >= 0
     #   puts "fuck"
    if front.name > 99  && (back.name > 5 && back.name < 99)
      #  puts "#{(back.energy*5)} !!!!!!!"
        front.energy += (back.energy*2)
        Herbivore.all.delete(back)
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

  
 def provideplants(a, b, x, y, terrtype)
     c = rand(a..b)
 

     if terrtype < -4
        case c
        when 0
            d = Plant.new(0, x, y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
           when 1
               d =  Plant.new(1, x, y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200)+100), (belllcurve(7)+7))
           when 2
               d = Plant.new(0, x, y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
        else 
            d = Plant.new(0, x, y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
        end
       end


       if terrtype < -2 && terrtype > -5
        case c
        when 0
            d = Plant.new(0, x, y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
           when 1
               d =  Plant.new(1, x, y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200)+100), (belllcurve(7)+7))
           when 2
               d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
        else 
            d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
        end
       end
      


       if terrtype > -3
        case c
        when 0
            d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
           when 1
               d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
           when 2
               d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
        else 
            d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
        end
       end
      



    # if (x % 20) == 0
    #    d = tree
     # end
 d
 end
  
 def predator_generator(a, b, x, y)
     c = rand(a..b)
 
     case c
     when 0
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250)+600), (belllcurve(1)+1))
        when 1
            d = Predator.new(102, x, y, 1, 255, (rand(20)), rand(10), "pred", 0, (belllcurve(500)+800), (belllcurve(2)+1))
        when 2
            d = Predator.new(103, x, y, 1, 0, 0, 0, "pred", 0, (belllcurve(1000)+1000), (belllcurve(3)+1))
     else 
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250)+600), (belllcurve(1)+1))
     end
 d
 end

 def provideanimals(a, b, x, y)

     c = rand(a..b)
 
     case c
     when 0
        if rand(2) != 0
         d = Herbivore.new(6, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2))
        else
            d = Herbivore.new(8, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1))
        end
        when 1
            d = Herbivore.new(7, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(400)+10), (belllcurve(3)+1))
        when 2
            d = Herbivore.new(8, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1))
     else 
         d = Herbivore.new(6, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2))
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
        #puts "#{soil.r},#{soil.g},#{soil.b}"
    pngx[soil.x, soil.y] =  ChunkyPNG::Color.rgba(soil.r, soil.g, soil.b, 255)
     if rand(500000) < soil.energy
         provideplants(0, 3, soil.x, soil.y, soil.name)
     end
    end
end

    plants = Plant.all.select do |plant| plant.type == "plant" && plant.status != 0  && (plant.name > -1 && plant.name < 5) end


  plants.each do |plant|  
    if plant.status != 0
    pngx[plant.x, plant.y] = ChunkyPNG::Color.rgba(plant.r, plant.g, plant.b, 255)
    if plant.name < 5 && plant.name > -1
    plant.energy += plant.growthrate
    end
    end
    end

    herbivores = Herbivore.all.select do |animal| animal.name > 5  && animal.name < 99 end


        #if z == 5
         #   dogs.clear
         #   end
        
            #herbivores.each do |animal|  
            herbivores.each do |animal|
            pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
            animal.x = fuzzer_x(animal.x)
            animal.y = fuzzer_y(animal.y)
            if animal.name > 5 && animal.name < 99
            animal.energy -= animal.growthrate
            end
            if (animal.energy > 2000 && animal.name == 8) ||  (animal.energy > 1000 && animal.name == 7) ||  (animal.energy > 500 && animal.name == 6)
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





        plantoids = []
        animals = []
        predators = []
        water = []
        
        Fighter.all.each do |object| 
            if object.name == 0 || object.name == 1 ||   object.name == 2 
                plantoids << object
            end
            if object.name > 5 && object.name < 99
                animals << object
            end
            if object.name > 99 
                predators << object
            end
            if object.name== -9
                water << object
            end
        end
        
        matches = []
            matches = animals + plantoids + predators + water
        
        
            predators.each do |predator|  
         
            end
        





        preds = Predator.all.select do |animal| animal.name > 99 end


            #if z == 5
             #   dogs.clear
             #   end
            
                #herbivores.each do |animal|  
                preds.each do |animal|
                    if animal.name != 103
                   
                    pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                   animal.x = fuzzer_x(animal.x)
                    animal.y = fuzzer_y(animal.y)
                    pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                    animal.x = fuzzer_x(animal.x)
                    animal.y = fuzzer_y(animal.y)
                    else
                        leftright = []
                        updown = []
                        leftright = (Herbivore.all.select do |prey|  prey.x == animal.x && (prey.name < 99 && prey.name > 5) end)
                        updown = (Herbivore.all.select do |prey|  prey.y == animal.y  && (prey.name < 99 && prey.name > 5) end)
                            if rand(0..1) == 0
                            if leftright.length != 0
                                #check
                               quarry =  leftright.select do |prey| prey.name < 99 &&  prey.name > 4 end
                                quarry = quarry.max_by do |prey| prey.energy end
                                if quarry != nil
                                if quarry.y > animal.y && (quarry.x == animal.x)
                                    pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                    animal.y += 1
                                    pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                    #puts "Let there be light! #{quarry.name}"
                                elsif quarry.y < animal.y && (quarry.x == animal.x)
                                     pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                    animal.y -=1
                                    pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                   # puts "Let there be light! #{quarry.name}"
                                end
                            end
                            end
                            if updown.length != 0
                            #check
                                quarry =  updown.select do |prey| prey.name < 99 &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                    if quarry != nil
                                    if quarry.x > animal.x && (quarry.y == animal.y)
                                         pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                        animal.x += 1
                                        pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                      #  puts "Let there be light! #{quarry.name}" 
                                    elsif quarry.x < animal.x && (quarry.x == animal.x)
                                       pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                        animal.x -=1
                                        pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                       # puts "Let there be light! #{quarry.name}"
                                    end
                                end
                            end
                        else
                            if updown.length != 0
                             #check
                                quarry =  updown.select do |prey| prey.name < 99 &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                    if quarry != nil
                                    if quarry.x > animal.x && (quarry.y == animal.y)
                                         pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                        animal.x += 1
                                        pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                  #     puts "Let there be light! #{quarry.name}" 
                                    elsif quarry.x < animal.x && (quarry.y == animal.y)
                                       pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                        animal.x -=1
                                        pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                   #     puts "Let there be light! #{quarry.name}"
                                    end
                                end
                            end
                            if leftright.length != 0
                                #check
                                quarry =  leftright.select do |prey| prey.name < 99 &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                 if quarry != nil
                                 if quarry.y > animal.y && (quarry.x == animal.x)
                                     pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                     animal.y += 1
                                     pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                     #puts "Let there be light! #{quarry.name}"
                                 elsif quarry.y < animal.y && (quarry.x == animal.x)
                                      pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                     animal.y -=1
                                     pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                                    # puts "Let there be light! #{quarry.name}"
                                 end
                             end
                             end
                            
                        end
                            if updown.length == 0 && leftright.length == 0
                                animal.x = fuzzer_x(animal.x)
                                animal.y = fuzzer_y(animal.y)
                                pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                                animal.x = fuzzer_x(animal.x)
                                 animal.y = fuzzer_y(animal.y)
                                pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(255, 180, animal.b, 255)
                            end
                            pngx[animal.x, animal.y] = ChunkyPNG::Color.rgba(animal.r, animal.g, animal.b, 255)
                    end
                if animal.name > 99 
                animal.energy -= animal.growthrate
             #   puts "#{animal.energy},  #{animal.growthrate}" 
                end
                if (animal.energy > 55000 && animal.name == 103) ||  (animal.energy > 35000 && animal.name == 102) ||  (animal.energy > 25000 && animal.name == 101)
                    if animal.name == 103
                    animal.energy -= 35000
                    puts "New Tiger!"
                    Predator.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 1000, animal.growthrate)
                    elsif animal.name ==102
                        animal.energy -= 20000
                        puts "New Pythons!"
                        Predator.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 600, animal.growthrate)
                        Predator.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 600, animal.growthrate)
                    elsif animal.name == 101
                        animal.energy -= 10000

                    puts "New Mongooses!"
                    Predator.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 100, animal.growthrate)
                    Predator.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 100, animal.growthrate)
                    Predator.new(animal.name, animal.x, animal.y, animal.status, [animal.r+rand(-10..10), 255].min, [animal.g+rand(-10..10), 150].min, [animal.b+rand(-10..10), 255].min, animal.type, animal.depth, 100, animal.growthrate)
                    end
                end
                if animal.energy <= 0
                    puts "Predator Death!"
                    Predator.all.delete(animal)
                    animal = nil
            GC.start(full_mark: true, immediate_sweep: true);
                end
            end

            












z +=1

    y = 0
    x = 0
    ($yrange+1).times do #plus 1 to fix edge glitch
        ($xrange+1).times do
        gather = matches.select do |part| part.x == x && part.y == y end
               
            ace = gather.find do |obj| obj.name > 5  && obj.name < 99 end
            bace  = gather.find do |obj| obj.name < 3 && obj.name >= 0  && obj.name < 6 end
                cace = gather.find do |obj| obj.name >= 100 end
                    dace = gather.find do |obj| obj.name == -9 end
            




                        
                        if bace != nil && ace != nil
                            interact(bace, ace)
                        end    
                         if cace != nil && ace != nil
                        predation(cace, ace)
                        $eaten+=1
                         end




                          if dace != nil
                         if bace != nil 
                             swim(dace, bace)
                         end    
                          if ace != nil
                              swim(dace, ace)
                          end    
                           if cace != nil && ace != nil
                          swim(dace, cace)
                           end
                          end


                        
            x+=1
        end
        x  = 0
        y+=1
    end


   dead = Plant.all.select do |every|  every == nil end

   # #puts dead.length
Plant.all.delete_if do |obj| dead.include?(obj) end

pngx.save("gifmake28/life/#{z}.png")
puts z
#puts $eaten
end








