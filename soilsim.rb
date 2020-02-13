require "Chunky_png"

$xrange = 767
$yrange = 441
$steps = 100000
$eaten = 0


 


class Prodgenitor
                attr_accessor :name, :status, :type, :depth, :energy, :growthrate, :traits, :all, :inventory
                @@all = []
                def initialize(name, status, type, traits = [])
                    @name = name
                    @status = status
                    @type = type
                    @traits = traits
                #    @@all << self
                end
                def self.all
                    @@all
                end
end




class Weather 
    attr_accessor :name, :status, :x, :y,  :r, :g, :b, :a, :energy, :all, :clouds, :sol, :moisture, :sortedclouds
    @@all = []
    @@clouds = []
    @@sol = []
    @@sortedclouds = (Array.new($xrange+1) { Array.new($yrange+1) })
    def initialize(name, x, y, status, r, g, b, a, energy, moisture = 1000)
        @name = name
        @status = status
        @x = x.to_i
        @y = y.to_i
        @r = r
        @g = g
        @moisture = moisture
        @b = b
        @energy = energy
        @a = a
        if name == -100
            @@clouds << self 
            @@sortedclouds[x][y] = self
        end
        if name == -999
            @@sol << self 
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sol
        @@sol
    end

    def self.clouds
        @@clouds
    end
    def self.sortedclouds
        @@sortedclouds
    end
end

class Fighter

    attr_accessor :name, :status, :x, :y,  :r, :g, :b,  :all, :path, :plants, :herbis, :predos, :water, :sortedsands, :sortedplants, :sortedpredos, :sortedherbis, :notdirt
    @@all = []
    @@paths = []
    @@plants = []
    @@herbis = []
    @@predos = []
    @@water = []
    @@notdirt = []
    @@sortedsands = (Array.new($xrange+1) { Array.new($yrange+1) })
    @@sortedplants = (Array.new($xrange+1) { Array.new($yrange+1) })
    @@sortedherbis = (Array.new($xrange+1) { Array.new($yrange+1) })
    @@sortedpredos = (Array.new($xrange+1) { Array.new($yrange+1) })
    def initialize(name, x, y, status, r, g, b)
        @name = name
        @status = status
        @x = x.to_i
        @y = y.to_i
        @r = r
        @g = g
        @b = b
        if (name < 0 &&  name > -100)
            @@paths << self
            @@sortedsands[x][y] = self
        else
            @@notdirt << self
        end
        if name == -9
            @@water << self
        end
        if (name < 5 &&  name > -1)
            @@plants << self
            @@sortedplants[x][y] = self
        end
        if (name < 99 && name > 5)
            @@herbis << self
            @@sortedherbis[x][y] = self
        end
        if name > 99
            @@predos << self
            @@sortedpredos[x][y] = self
        end
        @@all << self
    end
    def self.all
        @@all
    end
    def self.paths
        @@paths
    end
    def self.plants
        @@plants
    end
    def self.herbis
        @@herbis
    end
    def self.notdirt
        @@notdirt
    end
    def self.predos
        @@predos
    end
    def self.water
        @@water
    end
    def self.sortedsands
        @@sortedsands
    end
    def self.sortedplants
        @@sortedplants
    end
    def self.sortedherbis
        @@sortedherbis
    end
    def self.sortedpredos
        @@sortedpredos
    end
    end


    class Terrain <  Fighter

        attr_accessor :type, :depth, :energy, :moisture, :all, :inventory
        @@all = []
        def initialize(name, x, y,  status, r, g, b, type, depth, energy, moisture = 1000, inventory = [])
            super(name, x, y, status, r, g, b)
            @inventory = inventory
            @type = type
            @moisture = moisture
            @energy = energy
            @depth = depth
         #   @@all << self
        end
        def self.all
            @@all
        end
        end


        class Plant <  Fighter

            attr_accessor :type, :depth, :energy,  :growthrate,  :traits, :all, :inventory
            @@all = []
            def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, inventory, traits = [0 , 0, 25])
                super(name, x, y, status, r, g, b)
                @inventory = inventory
                @type = type
                @traits = traits
                @energy = energy
                @depth = depth
                @growthrate = growthrate
            #    @@all << self
            end
            def self.all
                @@all
            end
            def self.avg_energy
                x = 0
                Fighter.plants.lazy.each do |plant| x += plant.energy end
                    avg = (x.to_f/Plant.all.length)
                    avg
            end
            end
            

            class Herbivore <  Fighter
    
                attr_accessor :type, :depth, :energy, :growthrate, :traits, :all, :inventory
                @@all = []
                def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, inventory, traits)
                    super(name, x, y, status, r, g, b)
                    @inventory = inventory
                    @type = type
                    @energy = energy
                    @depth = depth
                    @growthrate = growthrate
                    @traits = traits
               #     @@all << self
                end
                def self.all
                    @@all
                end
                end
            

                class Predator <  Fighter
        
                    attr_accessor :type, :depth, :energy, :growthrate, :traits, :all,  :inventory
                    @@all = []
                    def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, inventory, traits = [])
                        super(name, x, y, status, r, g, b)
                        @inventory = inventory
                        @type = type
                        @energy = energy
                        @depth = depth
                        @growthrate = growthrate
                        @traits = traits
                   #     @@all << self
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

  #  dustcolor = ChunkyPNG::Color.rgba(162, 116, 78, 255)
  #  dust = Terrain.new(0, 5, 5, 1, 162, 116, 78,  "path", 0, 10)
   # grass = Plant.new(0, 4, 4, 1, rand(50), (rand(122)+134), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+1))

####puts dust
####puts grass


#$mongoose = Predator.new(101, rand($xrange) ,rand($yrange), 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(10000)+10), (belllcurve(1)+1))
#$Python = Predator.new(102, rand($xrange), rand($yrange),  1, 255, (rand(20)+20), rand(100), "pred", 0, (belllcurve(20000)+100), (belllcurve(7)+7))
#$tiger = Predator.new(103, 10, 10, 1, 255, 0, 0, "pred", 0, (belllcurve(50000)+200), (belllcurve(10)+10))


def swim(water, life)

        if water.name == -9 && life.name >= 0
         #   ####puts "fuck"
         if life.type != "seaweed"
        if water.name == -9  && rand(3) == 0 && (rand(water.depth) != 0)
            if life.traits[1] < water.depth
                water.energy += (life.energy)
                Fighter.all.delete(life)
                Fighter.predos.delete(life)
                Fighter.plants.delete(life)
                Fighter.herbis.delete(life)
                complete_fighter_nuke(life)
            end
        end
        end
    end
    gc(life)
end

def climb(mountain, life)

    if mountain.name == -10 && life.name >= 0
        #   ####puts "fuck"
        if life.type != "seaweed"
       if mountain.name == -10  &&  (rand(absolute_value_of(mountain.depth)) != 0)
           if life.traits[3] > mountain.depth
            mountain.energy += (life.energy)
            Fighter.all.delete(life)
            Fighter.predos.delete(life)
            Fighter.plants.delete(life)
            Fighter.herbis.delete(life)
               complete_fighter_nuke(life)
           end
       end
       end
   end
   gc(life)
end

def populate






    provide_sol()

    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
        #  provideterrainbasic(-10, -1, x,y)
           #  Terrain.new(-7, x, y, 1, rand(80..90), rand(30..40), 18,  "path", 0, rand(500000000..1000000000))
            x+=1
        end
        x  = 0
        y+=1
    end


    pngholder = ChunkyPNG::Image.from_file('floodseed.png')
    
    y = 0
    x = 0
#=begin
    ($yrange+1).times do
        ($xrange+1).times do

    if ChunkyPNG::Color.b(pngholder[x, y]) == 190
    Terrain.new(-9, x, y, 1, 0, 0, 180,  "path", 5, 1000000000, 40000)
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 230
        Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 25000000, 26000)
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 0 && ChunkyPNG::Color.r(pngholder[x, y]) == 255
        d = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, rand(1000000..2999000), 100)
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 0 && ChunkyPNG::Color.g(pngholder[x, y]) == 0 && ChunkyPNG::Color.r(pngholder[x, y]) == 0
        Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, rand(25000000..59999000), 750)
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 0 && ChunkyPNG::Color.g(pngholder[x, y]) == 255 && ChunkyPNG::Color.r(pngholder[x, y]) == 0
        Terrain.new(-3, x, y, 1, rand(90..100), rand(50..60), 38,  "path", 0, rand(105000000..159999000), 1000)
    elsif  ChunkyPNG::Color.g(pngholder[x, y]) == 102
       Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, rand(500000000..1000000000), 2000)
    elsif  ChunkyPNG::Color.b(pngholder[x, y]) == 221
       Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 50,  "path", 0, rand(200000000..700000000), 5000)
    elsif  ChunkyPNG::Color.g(pngholder[x, y]) == 43
       Terrain.new(-10, x, y, 1, 43, 43, 43,  "path", -3, -1, 100)
    elsif  ChunkyPNG::Color.r(pngholder[x, y]) == 80
       Terrain.new(-1, x, y, 1, 190, 255, 255,  "path", 0, 1, 3000)
    elsif  ChunkyPNG::Color.r(pngholder[x, y]) == 0 &&  ChunkyPNG::Color.g(pngholder[x, y]) == 221 &&  ChunkyPNG::Color.b(pngholder[x, y]) == 187 &&
        Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 50,  "path", 0, rand(200000000..700000000), 5000)
    else
        Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 25000000, 1000000)
    end

            x+=1
        end
        x  = 0
        y+=1
    end
#=end
   # Weather.new(-999, ($xrange/2), $yrange, "redsun", 255, 0, 0, 1, (belllcurve(500000)+3000000))

    predator_count = 0 
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(1000) == 20
                if predator_count < 100
                predator_generator(0, 3, x, y)
                predator_count += 1
                end
            end
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(100) == (x%100) 
                initializeplants(x,y)
               # provideplants(0, 3, x, y, -4)  ##busted (still broken)
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
                provideanimals(0, 3, x, y)
            end
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end

    puts "Seeding"
    Fighter.paths.lazy.each do |soil|
        if soil.name < 0 && soil.name > -8
            absolute_value_of(soil.name).times do 
            soil.inventory << prodginate(Fighter.plants[rand(Fighter.plants.length)])
            end
            puts "seeded 1 more"
        end
    end
puts "seeded"
    
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
 ####puts "#{d.r},#{d.g},#{d.b}, #{c}"
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
 
 ####puts x
 ####puts y
   #  caste = rand(0..7)
    # caste = (x*2) % 7
     z = (x*y)

     caste = 6


     if x < ($xrange/2.4)
        caste = 5
     end

     if y < ($yrange/2.4)
        caste = 5
     end

     if x > ($xrange-($xrange/2.4))
        caste = 5
     end

     if y > ($yrange-($yrange/2.4))
        caste = 5
     end



     if x < ($xrange/2.5)
        caste = 4
     end

     if y < ($yrange/2.5)
        caste = 4
     end

     if x > ($xrange-($xrange/2.5))
        caste = 4
     end

     if y > ($yrange-($yrange/2.5))
        caste = 4
     end


     if x < ($xrange/2.6)
        caste = 3
     end

     if y < ($yrange/2.6)
        caste = 3
     end

     if x > ($xrange-($xrange/2.6))
        caste = 3
     end

     if y > ($yrange-($yrange/2.6))
        caste = 3
     end




     if x < ($xrange/2.7)
        caste = 2
     end

     if y < ($yrange/2.7)
        caste = 2
     end

     if x > ($xrange-($xrange/2.7))
        caste = 2
     end

     if y > ($yrange-($yrange/2.7))
        caste = 2
     end




     if x < ($xrange/2.8)
        caste = 1
     end

     if y < ($yrange/2.8)
        caste = 1
     end

     if x > ($xrange-($xrange/2.8))
        caste = 1
     end

     if y > ($yrange-($yrange/2.8))
        caste = 1
     end



     if x < ($xrange/2.9)
        caste = 0
     end

     if y < ($yrange/2.9)
        caste = 0
     end

     if x > ($xrange-($xrange/2.9))
        caste = 0
     end

     if y > ($yrange-($yrange/2.9))
        caste = 0
     end


     if x < ($xrange/3)
        caste = 7
     end

     if y < ($yrange/3)
        caste = 7
     end

     if x > ($xrange-($xrange/3))
        caste = 7
     end

     if y > ($yrange-($yrange/3))
        caste = 7
     end


     if x < ($xrange/5)
        caste = 8
     end

     if y < ($yrange/5)
        caste = 8
     end

     if x > ($xrange-($xrange/5))
        caste = 8
     end

     if y > ($yrange-($yrange/5))
        caste = 8
     end




     case caste
      when 0
          d = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, rand(1000000..2999000), 500)
     when 1
         d = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, rand(4000000..9000000))
     when 2
         d = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, rand(11000000..25999000))
     when 3
         d = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, rand(25000000..59999000))
     when 4
         d = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, rand(50000000..100000000))
     when 5
         d = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, rand(200000000..500000000))
        when 6
            d = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, rand(500000000..1000000000))
        when 7
            d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1, 20000000)
        when 8
            h = rand(5)
            



            if x < ($xrange/5)
                h = 0
             end
        
             if y < ($yrange/5)
                h = 0
             end
        
             if x > ($xrange-($xrange/5))
                h = 0
             end
        
             if y > ($yrange-($yrange/5))
                h = 0
             end

             ## gap

             if x < ($xrange/6)
                h = 1
             end
        
             if y < ($yrange/6)
                h = 1
             end
        
             if x > ($xrange-($xrange/6))
                h = 1
             end
        
             if y > ($yrange-($yrange/6))
                h = 1
             end
                


             ## gap

             if x < ($xrange/8)
                h = 2
             end
        
             if y < ($yrange/8)
                h = 2
             end
        
             if x > ($xrange-($xrange/8))
                h = 2
             end
        
             if y > ($yrange-($yrange/8))
                h = 2
             end
                


             ## gap

             if x < ($xrange/10)
                h = 3
             end
        
             if y < ($yrange/10)
                h = 3
             end
        
             if x > ($xrange-($xrange/10))
                h = 3
             end
        
             if y > ($yrange-($yrange/10))
                h = 3
             end
                


             ## gap

             if x < ($xrange/12)
                h = 4
             end
        
             if y < ($yrange/12)
                h = 4
             end
        
             if x > ($xrange-($xrange/12))
                h = 4
             end
        
             if y > ($yrange-($yrange/12))
                h = 4
             end
                



            case h
            when 0
        d = Terrain.new(-9, x, y, 1, 50, 50, 230,  "path", 1, 10000000, 40000)
            when 1
            d = Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 25000000, 24000)
        when 2
            d = Terrain.new(-9, x, y, 1, 10, 10, 200,  "path", 3, 50000000, 1000000)
    when 3
        d = Terrain.new(-9, x, y, 1, 5, 5, 190,  "path", 4, 100000000, 1500000)
    when 4
    d = Terrain.new(-9, x, y, 1, 0, 0, 180,  "path", 5, 1000000000, 2000000)
            else
                d = Terrain.new(-9, x, y, 1, 10, 10, 200,  "path", 3, 50000000, 1000000)
            end
      else 
          d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1)
     end
  ####puts "#{d.r},#{d.g},#{d.b}, #{caste}"
  return (x*y)
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

 def fuzzer_c(num, range = 255, floor = 0)

    num += rand(-1..1)
    if num < 0
        num = 0
        end
    if num > range
            num = range
    end
    num
 end
 def fuzzer_gr(num, range = 99999999999, floor = 2)

    num += rand(-1..1)
    if num < 3
        num = 3
        end
    if num > range
            num = range
    end
    num
 end

 def fuzzer_g(num, range = 255, floor = 0)

    num += rand(-10000..10000)
    num
 end


 def interact(front, back)
  #  ##puts front.name

    if front.name >= 0 && back.name >= 0
    if front.name < 5  && back.name > 4
        back.energy += front.energy
        front.energy = -1
        front.growthrate =-1
        front.inventory.lazy.each do |seed| back.inventory  <<  seed end
         if front != nil
        if front.name == 4 && (back.name > 5 && back.name < 99) && (front != nil)
            if rand(100) < back.traits[0] 
            back.growthrate += rand(0..1000)
            end
           # back.energy += front.energy
            Fighter.all.delete(front)
            Fighter.plants.delete(front)
            Fighter.notdirt.delete(front)
            Fighter.sortedplants[front.x].delete(front)
      #      Fighter.sortedplants[front.x].delete(front)
     ##       Fighter.sortedplants[front.x][front.y] = nil
     #       front = nil
        end
        Fighter.all.delete(front)
        Fighter.plants.delete(front)
        Fighter.notdirt.delete(front)
            Fighter.sortedplants[front.x].delete(front)
#        Fighter.sortedplants[front.x].delete(front)
 #       Fighter.sortedplants[front.x][front.y] = nil
 #       front = nil
    end
    Fighter.all.delete(front)
    Fighter.plants.delete(front)
    Fighter.notdirt.delete(front)
    Fighter.sortedplants[front.x].delete(front)
    Fighter.sortedplants[front.x][front.y] = nil
    complete_fighter_nuke(front)
    end
   
end
gc(front)
 end



 def provide_cloud(x, y, z, season)
    if Weather.all.length < (z*2) && (season % 2) == 0
    Weather.new(-100, x, y, 1, 255, 255, 255, 50, (rand(5)+3))
    end
 end


 def provide_sol()
    if Weather.sol.length == 0
    Weather.new(-999, ($xrange), $yrange/2, 1, 255, 255, 180, 2, (belllcurve(500000)+3000000))
    end
 end

 def predation(front, back)
    
    if front != nil && back != nil
    if front.name == back.name
        #puts "#{front.name},    #{back.name}"
    end

    if front.name >= 0 && back.name >= 0
     #   ####puts "fuck"
    if front.name > back.name  && (back.name > 4 && back.name < front.name)
      #  ####puts "#{(back.energy*5)} !!!!!!!"
        front.energy += (back.energy)
        Fighter.herbis.delete(back)
        Fighter.plants.delete(back)
        Fighter.predos.delete(back)
        Fighter.sortedherbis.delete(Fighter.sortedherbis[back.x][back.y])
        Fighter.sortedherbis[back.x].delete(back)
        Fighter.notdirt.delete(back)
        Fighter.all.delete(back)
        Fighter.sortedherbis[back.x][back.y] = nil
        complete_fighter_nuke(back)
    end
end
end
gc(back)
 end



 def germinate(object)
    if rand(900000000000) <  (object.moisture * object.energy)
        if object.inventory.length > 0 && Fighter.sortedplants[object.x][object.y] == nil && rand(5000) == 0
                chosenseed = object.inventory[rand(object.inventory.length)]
                if chosenseed.name == 11 && chosenseed.traits[7] == "plant"
                    Plant.new(chosenseed.traits[0], object.x, object.y, 1, fuzzer_c(chosenseed.traits[4]),    fuzzer_c(chosenseed.traits[5]),    fuzzer_c(chosenseed.traits[6]),  chosenseed.traits[7], chosenseed.traits[8], fuzzer_g(10002), chosenseed.traits[10], [], chosenseed.traits[12])
                    object.inventory.delete(chosenseed)
                elsif  chosenseed.name == 11 && chosenseed.traits[7] == "seaweed"
                    object.inventory.delete(chosenseed)
                    Prodgenitor.all.delete(chosenseed)
                end
        end
    end
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


 def absolute_value_of(catcher)
    if catcher < 0
    x = 0 - catcher
    return x
    end
    return catcher
 end

 def complete_fighter_nuke(target)
    Fighter.all.delete(target)
    Fighter.plants.delete(target)
    Fighter.herbis.delete(target)
    Fighter.predos.delete(target)
    Fighter.water.delete(target)
    Fighter.notdirt.delete(target)
    Fighter.paths.delete(target)
    Fighter.sortedsands.delete(target)
    Fighter.sortedplants.delete(target)
    Fighter.sortedherbis.delete(target)
    Fighter.sortedpredos.delete(target)
    Fighter.sortedsands[target.x].delete(target)
    Fighter.sortedplants[target.x].delete(target)
    Fighter.sortedherbis[target.x].delete(target)
    Fighter.sortedpredos[target.x].delete(target)
    if target.name < 5 && target.name > -1
        Fighter.sortedplants[target.x][target.y] = nil
     #   puts "Sero"
    end
    if target.name < 99 && target.name > 5
        Fighter.sortedherbis[target.x][target.y] = nil
    end
    if target.name > 99
        Fighter.sortedpredos[target.x][target.y] = nil
    end

    target = nil
    gc(target)
 end

 def gc(target)
    GC.start(full_mark: true, immediate_sweep: true);
 end


 def fuzzer(num, range = $yrange, floor = 0)

    num += rand(-1..1)
    if num < 1 
        num = 1
    end
    num
 end

 def soilchanger(soil)


    if soil.moisture > 2899 && soil.energy < 50000
        soil.name = -1
        soil.r = 190
        soil.g = 255
        soil.b = 255
     end

    if soil.energy > 0 && soil.name != -9
        soil.name = -1
       soil.r = 175
       soil.g = 115
       soil.b = 78
   end


   if soil.energy < 0 && soil.name != -9
      soil.name = -10
      soil.r = 175
      soil.g = 185
      soil.b = 100 
  end

if soil.energy > 3000 && soil.name != -9
    soil.name = -2
    soil.r = 125
    soil.g = 85
    soil.b = [0, (68 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 9000 && soil.name != -9
    soil.name = -3
    soil.r = 115
    soil.g = 75
    soil.b = [0, (58 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 26000 && soil.name != -9
    soil.name = -4
    soil.r = 105
    soil.g = 65
    soil.b = [0, (48 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 51000 && soil.name != -9
    soil.name = -5
    soil.r = 95
    soil.g = 55
    soil.b = [0, (38 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 101000 && soil.name != -9
    soil.name = -6
    soil.r = 85
    soil.g = 45
    soil.b =  [0, (28 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 500000 && soil.name != -9
    soil.name = -7
    soil.r = 80
    soil.g = 35
    soil.b =  [0, (18 - [[(soil.moisture/4000),  1].max, 255].min)].max
end


if soil.depth == -3
    soil.name = -10
   soil.r = 43
   soil.g = 43
   soil.b = 43
end

# ice was here

 if soil.moisture > 3000 && soil.energy > 200000
     soil.name = -7
     soil.r = 80
     soil.g = 35
     soil.b = 50
 end


 if soil.moisture > 20000 && soil.name != -9
    soil.name = -9
    soil.depth = 1
    soil.r = 50
    soil.g = 50
    soil.b = 230
end

if soil.moisture > 20000 && soil.name == -9
    soil.name = -9
    soil.depth = 1
    soil.r = 50
    soil.g = 50
    soil.b = 230
end
if soil.moisture > 25000 && soil.name == 9
    soil.name = -9
    soil.depth = 2
    soil.r = 40
    soil.g = 40
    soil.b = 220
end
if soil.moisture > 30000 && soil.name == -9
    soil.name = -9
    soil.depth = 5
    soil.r = 30
    soil.g = 30
    soil.b = 210
end

end


 def rain(soil, cloud) #changes soil to fit adding water and breaking down waste and the dead
    if soil.name < 0 && soil.name != -100
    evaporation_precipatation = 150
    soilcycle = 10
    if (rand 0..54) == 0  && soil.name != -9#makes it rain less continously
    soil.moisture += evaporation_precipatation
    soil.energy += soilcycle
    cloud.energy -= soilcycle
    cloud.a -= 1
    cloud.a = [[[[cloud.a, 180].min, 10].max, cloud.energy].min, 1].max
    end

    if (rand 0..3) == 0  && soil.name == -10#makes it rain on mountains
    soil.moisture += evaporation_precipatation
    soil.energy += soilcycle
    cloud.energy -= soilcycle
    cloud.a -= 1
    cloud.a = [[[[cloud.a, 180].min, 10].max, cloud.energy].min, 1].max
    end
    
    



  #  soilchanger(soil)

    if soil.name == -9 
        soil.moisture -= evaporation_precipatation
        cloud.energy += soilcycle

        cloud.a += 10
        cloud.a = [[cloud.a, 80].max, 180].min

    end

    if cloud.energy <= 0 && cloud.name == -100
        Weather.all.delete(cloud)
        Weather.sortedclouds[cloud.x].delete(Weather.sortedclouds[cloud.x][cloud.y])
        cloud = nil
       gc(cloud)
    end
end
end
  

 def shine(soil)
    germinate(soil)
    if rand(150) < 1
    soil.moisture -= 1
    end
end

def prodginate(plant)
    return Prodgenitor.new(11, 1, "prodegeny",  [plant.name, 0, 0, plant.status,  fuzzer_c(plant.r), fuzzer_c(plant.g), fuzzer_c(plant.b), plant.type,  plant.depth, fuzzer_g(10002), fuzzer(plant.growthrate), [],  [fuzzer_g(60000) , (plant.traits[1]),  (plant.traits[2]+rand(-100..100)), 0]])
end
  
def provide_seaweed(soil)
    if rand(soil.depth) > 0 && rand(10) == 0
   Plant.new(0, soil.x, soil.y, 1, (rand(50)+110), (rand(104)+100), rand(50), "seaweed", 0, (belllcurve(100000)+10000), (belllcurve(7000)+1000),  [])
    end
end

def initializeplants(x, y)

    if Fighter.sortedsands[x][y].name != -9 && Fighter.sortedsands[x][y].name != -10
    c = rand(0..4)
    case c
    when 0
        d = Plant.new(0, x, y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100000)+10000), (belllcurve(5000)+3000),  [])
       when 1
           d =  Plant.new(1, x, y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200000)+100000), (belllcurve(7000)+7000),  [])
       when 2
           d = Plant.new(2, x, y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000),  [])
        when 3 
            if rand(16) == 0
            d = Plant.new(4, x, y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800000)+250000), (belllcurve(15000)+15000),  [])
            else
                d =  Plant.new(1, x, y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200000)+100000), (belllcurve(7000)+7000),  [])
               end
            end
        end
end


 def provideplants(a, b, soil)
    
    c = rand(a..b)
 

    if soil.name < -4
       case c
       when 0
        d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(50000)+5000), (belllcurve(500)+300),  [])
          when 1
            d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(50000)+7000), (belllcurve(1700)+700),  [])
          when 2
              d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(50000)+5000), (belllcurve(500)+300),  [])
           when 3
               if rand(64) == 0
               d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800000)+250000), (belllcurve(15000)+15000),  [])
               else
                d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(50000)+5000), (belllcurve(500)+300),  [])
                  end
       else 
        d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(50000)+5000), (belllcurve(500)+300),  [])
       end
   elsif soil.name < -2 && soil.name > -5
       case c
       when 0
        d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(50000)+5000), (belllcurve(500)+300),  [])
          when 1
            d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(50000)+7000), (belllcurve(1700)+700),  [])
          when 2
            d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
           when 3 
               if rand(16) == 0
               d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800000)+250000), (belllcurve(15000)+15000),  [])
               else
                d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(50000)+7000), (belllcurve(1700)+700),  [])
                  end
       else 
        d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
       end
   elsif soil.name > -3
       case c
       when 0
           d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
          when 1
              d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
          when 2
              d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
           when 3
               if rand(8) == 0
            d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(100000)+50000), (belllcurve(15000)+15000),  [])
               else
               d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
               end
       else 
           d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(100000)+10000), (belllcurve(3000)+1000),  [])
       end
      end

d
 end
  
 def predator_generator(a, b, x, y)

    if Fighter.sortedsands[x][y].name != -9
     c = rand(a..b)
 
     case c
     when 0
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250000)+600000), (belllcurve(3000)+1500), [], [belllcurve(100), 1, (belllcurve(10)+20), 0])
        when 1
            d = Predator.new(102, x, y, 1, 255, (rand(20)), rand(10), "pred", 0, (belllcurve(500000)+800000), (belllcurve(2000)+1200),  [], [belllcurve(100), 1, (belllcurve(10)+40), 0])
        when 2
            d = Predator.new(103, x, y, 1, 0, 0, 0, "pred", 0, (belllcurve(1000000)+1000000), (belllcurve(1500)+700), [],  [belllcurve(100), 1, (belllcurve(10)+60), 0])
     else 
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250000)+600000), (belllcurve(1000)+1000), [],  [belllcurve(100), 1, (belllcurve(10)+10), 0])
     end
 d
    end
 end

 def provideanimals(a, b, x, y)

    if Fighter.sortedsands[x][y].name != -9
     c = rand(a..b)
 
     case c
     when 0
        if rand(2) != 0
            d = Herbivore.new(6, x, y, 1, 255, (rand(25)+134), rand(25), "herbi", 0, (belllcurve(240000)+10000), (belllcurve(1500)+1000),  [],  [belllcurve(100), 0, (belllcurve(5)+3), 30, 3])
        else
            d = Herbivore.new(8, x, y, 1, 90,90, 110, "herbi ", 0, (belllcurve(900000)+10000), (belllcurve(500)+500),  [], [belllcurve(100), 0, (belllcurve(7)+6), 100, 5])
        end
        when 1
            d = Herbivore.new(7, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(499000)+100000), (belllcurve(1500)+500),  [],  [belllcurve(100), 0, (belllcurve(6)+4), 50, 4])
        when 2
            d = Herbivore.new(8, x, y, 1, 90, 90, 110, "herbi ", 0, (belllcurve(900000)+10000), (belllcurve(500)+500),  [],  [belllcurve(100), 0, (belllcurve(7)+6), 100, 5])
     else 
        d = Herbivore.new(6, x, y, 1, 255, (rand(25)+134), rand(25), "herbi", 0, (belllcurve(240000)+10000), (belllcurve(1500)+1000),   [],  [belllcurve(100), 0, (belllcurve(5)+3), 30, 3])
    end
 d
 end
 

 def provide_sea_animals(a, b, x, y)

    c = rand(a..b)

    case c
    when 0
       if rand(2) != 0
        d = Herbivore.new(56, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2),  [],  [belllcurve(100), 1])
       else
           d = Herbivore.new(58, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1),   [], [belllcurve(100), 1])
       end
       when 1
           d = Herbivore.new(57, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(400)+100), (belllcurve(3)+1),   [],  [belllcurve(100), 1])
       when 2
           d = Herbivore.new(58, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1),    [], [belllcurve(100), 1])
    else 
        d = Herbivore.new(56, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2),    [], [belllcurve(100), 1])
    end
d
end
end

  

z = 0
season = 1
$steps.times do


    pngx = ChunkyPNG::Image.new($xrange+1, $yrange+1, ChunkyPNG::Color::BLACK)








if z%182 == 0
    season += 1
end
if z == 0  ##start of the grid
populate
end



        
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if Fighter.sortedsands[x][y].status !=0
                
                #    soilchanger( Fighter.sortedsands[x][y])
                    ###puts "#{soil.r},#{soil.g},#{soil.b}"
                pngx[x, y] =  ChunkyPNG::Color.rgba(Fighter.sortedsands[x][y].r, Fighter.sortedsands[x][y].g, Fighter.sortedsands[x][y].b, 255)
                #pngx[x, y] =  ChunkyPNG::Color.rgba(255, 255, 255, 255)
                if  (season%2) == 1
                 if rand(600000000000) < (Fighter.sortedsands[x][y].energy * Fighter.sortedsands[x][y].moisture)
                    if Fighter.sortedsands[x][y].name != -9
                #     provideplants(0, 4, Fighter.sortedsands[x][y])
                    else
                        if rand(0..6000) == 0
                 #      provide_seaweed(Fighter.sortedsands[x][y])
                        end
                    end
                 end
                else 
                    if rand(1200000000000) < (Fighter.sortedsands[x][y].energy * Fighter.sortedsands[x][y].moisture)
                        if Fighter.sortedsands[x][y].name != -9
                     #    provideplants(0, 4, Fighter.sortedsands[x][y])
                        else
                            if rand(0..6000) == 0
                #           provide_seaweed(Fighter.sortedsands[x][y])
                            end
                        end
                     end
                end
                 if Fighter.sortedsands[x][y].name == -9 &&  rand(97000000000000) < (Fighter.sortedsands[x][y].energy * Fighter.sortedsands[x][y].moisture)
                    zrat = (z/season)+10
              #      provide_cloud(Fighter.sortedsands[x][y].x, Fighter.sortedsands[x][y].y, zrat, season)
                end
            end
            x+=1
        end
        x  = 0
        y+=1
    end




    
Fighter.plants.lazy.each do |object|


    if object.energy <= 0 
        Fighter.all.delete(object)
        Fighter.predos.delete(object)
        Fighter.plants.delete(object)
        Fighter.herbis.delete(object)
        Fighter.sortedplants.delete(Fighter.sortedplants[object.x][object.y])
        object.growthrate = -1
        object.energy = -1
        Fighter.sortedplants[object.x][object.y] = nil
        complete_fighter_nuke(object)
    end
    if object != nil
        
Fighter.sortedplants[object.x][object.y] = nil
        if (object.name == 0 || object.name == 1 ||   object.name == 2 || object.name == 4) && object.name > -1  && object.name < 5
            if object.status != 0
            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    if object.name < 5 && object.name > -1

                toilet = Fighter.sortedsands[object.x][object.y]
                    if  toilet.energy > object.growthrate && object.type != "path"

                    if toilet.name != -1
                  #  toilet.energy -= (object.growthrate/2)
                    object.energy += (object.growthrate/2)
                    else
                 #       toilet.energy -= object.growthrate
                        object.energy += object.growthrate
                    end

                    if toilet.name == -9
                    swim(toilet, object)
                    end
                    if toilet.name == -10
                    climb(toilet, object)
                    end
                    if object.type == "plant"

                        if (object.energy > 350000 && object.name == 4)  || (object.energy > 250000 && object.name == 2)  || (object.energy > 180000 && object.name == 1)  | (object.energy > 55000 && object.name == 0) 
                            case object.name 
                                when 0
                                object.energy -= 30000
                                when 1
                                    object.energy -= 90000
                                when 2
                                    object.energy -= 130000
                                when 3
                                    object.energy = 1
                                when 4
                                    object.energy -= 190000
                            else 
                                object.energy -= 30000
                            end
                       object.inventory << Prodgenitor.new(11, 1, "prodegeny",  [object.name, 0, 0, object.status,  fuzzer_c(object.r), fuzzer_c(object.g), fuzzer_c(object.b), object.type,  object.depth, fuzzer_g(10002), fuzzer(object.growthrate), [],  [fuzzer_g(60000) , (object.traits[1]),  (object.traits[2]+rand(-100..100)), 0]]) 
                        end
                    end
                    end
                    end
            end
        end
if object != nil
Fighter.sortedplants[object.x][object.y] = object
end
    end
end ## this specific seperation of the plants from the animals will do two things 1, make  sure plants die when eaten and 2. to render them as a layer above soil, but beneath animals woddly opp kanononuhnam kuzzah

    Fighter.herbis.lazy.each do |object|
        if object != nil
            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
            if object.name > 5 && object.name < 99


## beign

holdthisx = object.x
holdthisy = object.y
Fighter.sortedherbis[object.x][object.y] = nil ## wtf does this do
leftright = []
updown = []

x = object.x - object.traits[2]
y =  object.y
((object.traits[2]*2)+1).times do
    if x < 0
        x = 0
    end
    if y < 0
        y = 0
    end
    if x > (object.x  + object.traits[2])
        x =  (object.x  + object.traits[2])
end
if y > (object.y + object.traits[2])
        y =  (object.y  + object.traits[2])
end
if x > ($xrange+1)
    x = ($xrange+1)
end
if y > ($yrange+1)
    y = ($yrange+1)
end
if Fighter.sortedplants[x] != nil
    if Fighter.sortedplants[x][y] != nil
    updown << Fighter.sortedplants[x][y]
    end
end
    x+=1
end


x = object.x  
y =  object.y - object.traits[2]
((object.traits[2]*2)+1).times do
    if x < 0
        x = 0
    end
    if y < 0
        y = 0
    end
    if x > (object.x  + object.traits[2])
        x =  (object.x  + object.traits[2])
end
if y > (object.y + object.traits[2])
        y =  (object.y  + object.traits[2])
end
if x > ($xrange+1)
    x = ($xrange+1)
end
if y > ($yrange+1)
    y = ($yrange+1)
end
    if Fighter.sortedplants[x][y] != nil
    leftright << Fighter.sortedplants[x][y]
    end
    y+=1
end



#leftright = (Fighter.plants.select do |prey|  (prey.x  == object.x) && (prey.y <= (object.y+object.traits[2])) &&  (prey.y >= (object.y-object.traits[2])) && (prey.name < 5 && prey.name > -1) && prey != nil end)
#updown = (Fighter.plants.select do |prey|   (prey.y  == object.y)  && (prey.x <= (object.x+object.traits[2])) &&  (prey.x >= (object.x-object.traits[2])) && (prey.name < 5 && prey.name > -1) && prey != nil  end)
    if rand(0..1) == 0
    if leftright.length != 0 && updown.length == 0
        #check
       quarry =  leftright.select do |prey| prey.name < 5 &&  prey.name > -1 end
        quarry = quarry.max_by do |prey| prey.energy end
            if quarry != nil
                if quarry.y > object.y && (quarry.x == object.x)
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    object.y += 1
                    
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    ##puts "down #{quarry.name}"
                elsif quarry.y < object.y && (quarry.x == object.x)
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    object.y -=1
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    
                ##puts "up #{quarry.name}"
                end
        end
    end
    if updown.length != 0
    #check
        quarry =  updown.select do |prey| prey.name < 5 &&  prey.name > -1 end
            quarry = quarry.max_by do |prey| prey.energy end
            if quarry != nil
            if quarry.x > object.x && (quarry.y == object.y)
                 pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x += 1
                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
              ##puts "right #{quarry.name}" 
            elsif quarry.x < object.x && (quarry.y == object.y)
               pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x -=1
               pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
               ##puts "left #{quarry.name}"
            end
        end
    end
else
    if updown.length != 0 && leftright.length == 0
     #check
        quarry =  updown.select do |prey| prey.name < 5 &&  prey.name > -1 end
            quarry = quarry.max_by do |prey| prey.energy end
            if quarry != nil
            if quarry.x > object.x && (quarry.y == object.y)
                 pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x += 1
                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                
          ##puts "left #{quarry.name}" 
            elsif quarry.x < object.x && (quarry.y == object.y)
              pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x -=1
                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                
           ##puts "right #{quarry.name}"
            end
        end
    end
    if leftright.length != 0
        #check
        quarry =  leftright.select do |prey| prey.name < 5 &&  prey.name > -1 end
            quarry = quarry.max_by do |prey| prey.energy end
            if quarry != nil
                if quarry.y > object.y && (quarry.x == object.x)
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    object.y += 1
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    
                    ##puts "down#{quarry.name}"
                elsif quarry.y < object.y && (quarry.x == object.x)
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    object.y -=1
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    
                    ##puts "up #{quarry.name}"
                end
             end
     end
end
beenhere = 0 
    while (holdthisx == object.x && holdthisy == object.y) || (updown.length == 0 && leftright.length == 0 && beenhere == 0)
        beenhere = 1
      #  if object != nil
        pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
        object.x = fuzzer_x(object.x)
        object.y = fuzzer_y(object.y)
        pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
 #       end
    end
    if object != nil
    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
    end

    leftright.lazy.each do |guy| guy = nil end
        updown.lazy.each do |guy| guy = nil end 
    Fighter.sortedherbis[object.x][object.y] = object

            if object.name > 5 && object.name < 99
                #put somthing that gives energy to the soil(done V )
                toilet = Fighter.sortedsands[object.x][object.y]
                toilet.energy += object.growthrate
                object.energy -= object.growthrate  
                    if toilet.name == -9
                swim(toilet, object)
                end

                if toilet.name == -10
                    climb(toilet, object)
                    end
                if object.inventory.length > 0
                    if rand(object.traits[3]) == 0
                        chosenseed = object.inventory[rand(object.inventory.length)]
                        if chosenseed.name == 11
                            toilet.inventory << chosenseed
                     #   Plant.new(chosenseed.traits[0], fuzzer_x(fuzzer_x(object.x)), fuzzer_y(fuzzer_y(object.y)), 1,  chosenseed.traits[4],   chosenseed.traits[5],   chosenseed.traits[6],  "plant",   chosenseed.traits[7],   chosenseed.traits[8],   chosenseed.traits[9],  [],   chosenseed.traits[10])
                     object.inventory.delete(chosenseed)  
                     Prodgenitor.all.delete(chosenseed)
                        end
                    end
                end

            end
            if (object.energy > 2000000 && object.name == 8) ||  (object.energy > 1000000 && object.name == 7) ||  (object.energy > 500000 && object.name == 6)
                if object.name == 8
                        object.energy -= 1000000    
                       young = Herbivore.new(object.name, object.x, object.y, object.status,[[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 750000, fuzzer_gr(object.growthrate),   [],  object.traits)
                                               young.traits[0] += rand(-1..1)
                        young.traits[1] += rand(-1..1)
                        young.traits[1] = [young.traits[1], 0].max
                         young.traits[2] += rand(-1..1)
                        young.traits[2] = [young.traits[2], 1].max
                    elsif object.name == 7
                    object.energy -= 500000
                    2.times do
                        if rand(0..2) == 0
                     young =Herbivore.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 160000, fuzzer_gr(object.growthrate),  [],   object.traits)
                                             young.traits[0] += rand(-1..1)
                        young.traits[1] += rand(-1..1)
                        young.traits[1] = [young.traits[1], 0].max
                     young.traits[2] += rand(-1..1)
                     young.traits[2] = [young.traits[2], 1].max
                        end
                    end
                elsif object.name == 6
                    object.energy -= 250000
                    3.times do 
                        if rand(0..3) == 0
                     young = Herbivore.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 50000, fuzzer_gr(object.growthrate),  [],   object.traits)
                                            young.traits[0] += rand(-1..1)
                        young.traits[1] += rand(-1..1)
                        young.traits[1] = [young.traits[1], 0].max
                    young.traits[2] += rand(-1..1)
                    young.traits[2] = [young.traits[2], 1].max
                        end
                    end
                end
            end
            if object != nil
            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
            end
            if object.energy <= 0
                Fighter.herbis.delete(object)
                Fighter.all.delete(object)
        Fighter.sortedherbis.delete(Fighter.sortedherbis[object.x][object.y])
        #Fighter.sortedherbis[object.x][object.y] = nil  ## nuke covers this?
        complete_fighter_nuke(object)
        gc(object)
            end
            end
        end

    end











































        Fighter.predos.lazy.each do |object|
            if object.name > 99 
                if object != nil
        pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                end
                if true

                    predatorholdthisx = object.x
                    predatorholdthisy = object.y
    Fighter.sortedpredos[object.x][object.y] = nil
                        rightleft = []
                        downup = []



x = object.x - object.traits[2]
y =  object.y
((object.traits[2]*2)+1).times do
    if x < 0
        x = 0
    end
    if y < 0
        y = 0
    end
    if x > (object.x  + object.traits[2])
        x =  (object.x  + object.traits[2])
end
if y > (object.y + object.traits[2])
        y =  (object.y  + object.traits[2])
end
if x > ($xrange+1)
    x = ($xrange+1)
end
if y > ($yrange+1)
    y = ($yrange+1)
end
if Fighter.sortedherbis[x] != nil
    if Fighter.sortedherbis[x][y] != nil
    downup << Fighter.sortedherbis[x][y]
    end
end
    x+=1
end


x = object.x  
y =  object.y - object.traits[2]
((object.traits[2]*2)+1).times do
    if x < 0
        x = 0
    end
    if y < 0
        y = 0
    end
    if x > (object.x  + object.traits[2])
        x =  (object.x  + object.traits[2])
end
if y > (object.y + object.traits[2])
        y =  (object.y  + object.traits[2])
end
if x > ($xrange+1)
    x = ($xrange+1)
end
if y > ($yrange+1)
    y = ($yrange+1)
end
    if Fighter.sortedherbis[x][y] != nil  #&&(x != object.x && y != object.y)
    rightleft << Fighter.sortedherbis[x][y]
    end
    y+=1
end


                #                   rightleft = (Fighter.herbis.select do |prey|   (prey.x  == object.x) && (prey.y <= (object.y+object.traits[2])) &&  (prey.y >= (object.y-object.traits[2]))   &&  (prey.name < 99 && prey.name > 5) && prey != nil end)
                 #       downup = (Fighter.herbis.select do |prey|    (prey.y  == object.y)  && (prey.x <= (object.x+object.traits[2])) &&  (prey.x >= (object.x-object.traits[2]))  && (prey.name < 99 && prey.name > 5) && prey != nil end)
                            if rand(0..1) == 0
                            if rightleft.length != 0
                               quarry =  rightleft.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                quarry = quarry.max_by do |prey| prey.energy end
                                if quarry != nil
                                if quarry.y > object.y && (quarry.x == object.x)
                                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                    object.y += 1
                                elsif quarry.y < object.y && (quarry.x == object.x)
                                     pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                    object.y -=1
                                end
                            end
                            end
                            if downup.length != 0
                                quarry =  downup.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                    if quarry != nil
                                    if quarry.x > object.x && (quarry.y == object.y)
                                         pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x += 1
                                    elsif quarry.x < object.x && (quarry.y == object.y)
                                       pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x -=1
                                    end
                                end
                            end
                        else
                            if downup.length != 0
                                quarry =  downup.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                    if quarry != nil
                                    if quarry.x > object.x && (quarry.y == object.y)
                                         pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x += 1
                                    elsif quarry.x < object.x && (quarry.y == object.y)
                                       pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x -=1           
                                    end
                                end
                            end
                            if rightleft.length != 0
                                #check
                                quarry =  rightleft.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                 if quarry != nil
                                 if quarry.y > object.y && (quarry.x == object.x)
                                     pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                     object.y += 1
                                     
                                     ####puts "Let there be light! #{quarry.name}"
                                 elsif quarry.y < object.y && (quarry.x == object.x)
                                      pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                     object.y -=1
                                     
                                    # ####puts "Let there be light! #{quarry.name}"
                                 end
                             end
                             end
                            
                        end
                        beenherepredator = 0 
                            while  (predatorholdthisx == object.x && predatorholdthisy == object.y) || (downup.length == 0  && rightleft.length == 0 && beenherepredator == 0)
                                beenherepredator = 1
                                if object != nil
                                beenherepredator = 1
                                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                object.x = fuzzer_x(object.x)
                                object.y = fuzzer_y(object.y)
                                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                object.x = fuzzer_x(object.x)
                                 object.y = fuzzer_y(object.y)
                                 pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                end
                            end
                            if object != nil
                            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                            end

rightleft.lazy.each do |guy| guy = nil end
downup.lazy.each do |guy| guy = nil end 
    Fighter.sortedpredos[object.x][object.y] = object

                    if object != nil
                if object.name > 99 
                    toilet = Fighter.sortedsands[object.x][object.y]
                        toilet.energy += object.growthrate
                    object.energy -= object.growthrate
                    if toilet.name == -9
                        swim(toilet, object)
                        end
                        if toilet.name == -10
                        climb(toilet, object)
                        end
                 #   ####puts "#{object.energy},  #{object.growthrate}" 
                    end
                    if (object.energy > 75000000 && object.name == 103) ||  (object.energy > 50000000 && object.name == 102) ||  (object.energy > 25000000 && object.name == 101)
                        if object.name == 103
                        object.energy -= 50000000
                        ####puts "New Tiger!"
                        d = Predator.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max,object.type, object.depth, 5000000,fuzzer_gr(object.growthrate),  [],   object.traits)
                                                d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                        d.traits[2] += rand(-1..1)
                        d.traits[2] = [d.traits[2], 1].max
                        
                    elsif object.name ==102
                            object.energy -= 25000000
                            ####puts "New Pythons!"
                            2.times do
                                if rand(0..3) == 0
                            d =Predator.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 1000000, fuzzer_gr(object.growthrate),   [],  object.traits)
                                d.traits[0] += rand(-1..1)
                                 d.traits[1] += rand(-1..1)
                                d.traits[1] = [d.traits[1], 0].max
                                d.traits[2] += rand(-1..1)
                                d.traits[2] = [d.traits[2], 1].max
                            
                        end
                            end
                           elsif object.name == 101
                            object.energy -= 12500000
    
                        ####puts "New Mongooses!"
                        3.times do
                            if rand(0..6) == 0
                        d = Predator.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 500000, fuzzer_gr(object.growthrate),  [],   object.traits)
                                                d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                        d.traits[2] += rand(-1..1)
                        d.traits[2] = [d.traits[2], 1].max
                        
                    end
                        end
                     end
                    end
                    
                    if object.energy <= 0
                        ####puts "Predator Death!"
                        Predator.all.delete(object)
                        Fighter.all.delete(object)
                        Fighter.predos.delete(object)
        Fighter.sortedpredos.delete(Fighter.sortedpredos[object.x][object.y])
        Fighter.sortedpredos[object.x][object.y] = nil
        complete_fighter_nuke(object)
        gc(object)
                    end
                end
            end

            if object != nil
            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
            end
        end
    end


        #    matches = Fighter.herbis  + Fighter.predos  + Weather.clouds #+ Fighter.water +  Fighter.plants

    z +=1
    y = 0
    x = 0
    ($yrange+1).times do #plus 1 to fix edge glitch
        ($xrange+1).times do
       # gather = matches.select do |part| part.x == x && part.y == y end
               
            ace = Fighter.sortedplants[x][y]
            bace  =  Fighter.sortedherbis[x][y]
            cace = Fighter.sortedpredos[x][y]
      #      dace = gather.find do |obj| obj.name == -9 end
            





                        
                        if bace != nil && ace != nil
                            if bace.name != -100 && ace.name != -100 && (bace.name > -1 && ace.name > -1)
                            interact(ace, bace)
                            end
                        end    
                        if cace != nil && bace != nil

                    #       if cace.name != -100 && bace.name != -100  && (cace.name > -1 && bace.name > -1)
                           predation(cace, bace)
                           $eaten+=1
                     #      end
                        end
=begin
                        if cace != nil && cace[1] != nil
                #           if cace.name != -100 && cace[1].name != -100  && (cace[0].name > -1 && cace[1].name > -1
                            if cace.name > cace[1].name
                            predation(cace[1], cace)

                       #\\     #puts "here"

                            else
                            predation(cace[0], cace[1])
                            #puts cace
                            #puts cace[1]
                           # #puts "here"

                   #         end
                           #$eaten+=1
                           end
                        end
=end


=begin
                        if dace != nil
                                if bace != nil 
                                    if dace.name != -100 && bace.name != -100 
                                    swim(dace, bace)
                                    end
                                end    
                                if ace != nil

                            if dace.name != -100 && ace.name != -100
                                if ace.type != "seaweed" 
                                    swim(dace, ace)
                            end
                        end
                                end    
                                if cace != nil 

                            if dace.name != -100 && cace.name != -100
                                    swim(dace, cace)
                            end
                                end
                          end
=end

                        
            x+=1
        end
        x  = 0
        y+=1
    end





  dead = Fighter.notdirt.select do |every|  every == nil end

  #  dead.eac


    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            Fighter.sortedplants[x].delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
                Fighter.sortedherbis[x].delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
                    Fighter.sortedpredos[x].delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
                        Fighter.notdirt.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?

                            
            x+=1
        end
        x  = 0
        y+=1
    end
  #puts dead.length
   Fighter.plants.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
    Fighter.herbis.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
        Fighter.predos.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
            Fighter.notdirt.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
    Fighter.all.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
        Fighter.sortedplants.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
            Fighter.sortedherbis.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
                Fighter.sortedpredos.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
                    Weather.sortedclouds.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?




   #     matches.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?  $### testdorp drop
    #        matches.clear



    #if z == 5
     #   dogs.clear
     #   end
            Weather.clouds.lazy.each do |cloud|


                Weather.sortedclouds[cloud.x][cloud.y] = nil
                if rand(0..3) != 0
                if cloud.x > cloud.y && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0
                  
                  if rand(0..1) == 0
                    cloud.y +=1
                  else
                    cloud.y -=1
                  end


                    cloud.y = [$yrange, cloud.y].min
                end
                if cloud.y > cloud.x  && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
                if ((cloud.x-15)..(cloud.x+15)) == ((cloud.y-15)..(cloud.y+15))
                    if rand(0..1) == 0
                        cloud.x +=1
                        cloud.x = [$xrange, cloud.x].min
                    end
                    if rand(0..1) == 0 
                         if rand(0..1) == 0
                        cloud.y +=1
                      else
                        cloud.y -=1
                      end
                        cloud.y = [$yrange, cloud.y].min
                    end
                end
                if rand(0..1) == 0
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
                if rand(0..1) == 0 
                      if rand(0..1) == 0
                    cloud.y +=1
                  else
                    cloud.y -=1
                  end
                    cloud.y = [$yrange, cloud.y].min
                end

                if cloud.x > cloud.y && rand(0..1) == 0 && rand(0..3) == 0 
                 #   cloud.y +=1
                    cloud.y = [$yrange, cloud.y].min
                end
                if cloud.y > cloud.x  && rand(0..1) == 0 && rand(0..3) == 0 
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
            end
                distx = $xrange - cloud.x
                disty = $xrange - cloud.y

                if (cloud.x > 6 && cloud.y > 6) && (cloud.x < ($xrange -6) && cloud.y < ($yrange-6))
                54.times do
                    
                    fuzzx = rand(-6..6)
                    fuzzy = rand(-6..6)


                    if rand(-6..6) == fuzzx
                rain(Fighter.sortedsands[cloud.x+fuzzx][cloud.y+fuzzy], cloud)
                    end
                red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                cloudred =  cloud.r * (cloud.a/6)
                cloudgreen =  cloud.g * (cloud.a/6)
                cloudblue = cloud.b * (cloud.a/6)
                red = [((cloudred+red)/255).to_i, 255].min
                green = [((cloudgreen+green)/255).to_i, 255].min
                blue = [((cloudblue+blue)/255).to_i, 255].min
                pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)

                end
            end



            if (cloud.x > 5 && cloud.y > 5) && (cloud.x < ($xrange -5) && cloud.y < ($yrange-5))


                45.times do
                    fuzzx = rand(-5..5)
                    fuzzy = rand(-5..5)



                    if rand(-5..5) == fuzzx
                        rain(Fighter.sortedsands[cloud.x+fuzzx][cloud.y+fuzzy], cloud)
                            end
                red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                cloudred =  cloud.r * (cloud.a/5)
                cloudgreen =  cloud.g * (cloud.a/5)
                cloudblue = cloud.b * (cloud.a/5)
                red = [((cloudred+red)/255).to_i, 255].min
                green = [((cloudgreen+green)/255).to_i, 255].min
                blue = [((cloudblue+blue)/255).to_i, 255].min
                pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                end
            end   
            


                if (cloud.x > 4 && cloud.y > 4) && (cloud.x < ($xrange -4) && cloud.y < ($yrange-4))


                    36.times do
                        fuzzx = rand(-4..4)
                        fuzzy = rand(-4..4)


                        if rand(-4..4) == fuzzx
                            rain(Fighter.sortedsands[cloud.x+fuzzx][cloud.y+fuzzy], cloud)
                                end
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end

                if (cloud.x > 3 && cloud.y > 3) && (cloud.x < ($xrange -3) && cloud.y < ($yrange-3))


                    27.times do
                        fuzzx = rand(-3..3)
                        fuzzy = rand(-3..3)


                        if rand(-3..3) == fuzzx
                            rain(Fighter.sortedsands[cloud.x+fuzzx][cloud.y+fuzzy], cloud)
                                end
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end

                if (cloud.x > 2 && cloud.y > 2) && (cloud.x < ($xrange -2) && cloud.y < ($yrange-2))
                    18.times do
                        fuzzx = rand(-2..2)
                        fuzzy = rand(-2..2)


                        if rand(-2..2) == fuzzx
                            rain(Fighter.sortedsands[cloud.x+fuzzx][cloud.y+fuzzy], cloud)
                                end
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end




                if (cloud.x > 1 && cloud.y > 1) && (cloud.x < ($xrange -1) && cloud.y < ($yrange-1))


                    9.times do
                        fuzzx = rand(-1..1)
                        fuzzy = rand(-1..1)



                        if rand(-1..1) == fuzzx
                            rain(Fighter.sortedsands[cloud.x+fuzzx][cloud.y+fuzzy], cloud)
                                end
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end


                

                if (cloud.x > 0 && cloud.y > 0) && (cloud.x < ($xrange ) && cloud.y < ($yrange))


                rain(Fighter.sortedsands[cloud.x][cloud.y], cloud)
                red = ChunkyPNG::Color.r(pngx[cloud.x, cloud.y]) *255
                green = ChunkyPNG::Color.g(pngx[cloud.x, cloud.y]) *255
                blue =  ChunkyPNG::Color.b(pngx[cloud.x, cloud.y]) *255
                cloudred =  cloud.r * cloud.a
                cloudgreen =  cloud.g * cloud.a
                cloudblue = cloud.b * cloud.a
                red = [((cloudred+red)/255).to_i, 255].min
                green = [((cloudgreen+green)/255).to_i, 255].min
                blue = [((cloudblue+blue)/255).to_i, 255].min
                pngx[cloud.x, cloud.y] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                end


                Weather.sortedclouds[cloud.x][cloud.y] = cloud
                
                    if (cloud.x == $xrange && cloud.y == $yrange) || (cloud.x == $xrange || cloud.y == $yrange) || (cloud.energy <= 0)
                        Weather.all.delete(cloud)
                        Weather.clouds.delete(cloud)
                        cloud = nil
                        gc(cloud)
                    end
            end

            cloudnum = Weather.clouds.length
        endnumclouds = (Weather.clouds.select do |cloud| cloud.x == $xrange && cloud.y == $yrange && cloud.energy <= 0  end)
        endnumclouds.lazy.each do |cloud| 
            Weather.all.delete(cloud) 
            Weather.sortedclouds.delete(Weather.sortedclouds[cloud.x][cloud.y])
            cloud = nil
            gc(cloud)
        end




        Weather.sol.lazy.each do |thesun|
            if rand(0..3) == 0
                if rand(0..1) == 0
              #  thesun.y -= 1
                else
                #    thesun.y += 1
                end
                end
                thesun.x -= 5
    
                if thesun.y < 0
                    thesun.y = $yrange
                end
    
                if thesun.x < 0
                    thesun.x = $xrange
                end
                if thesun.y > $yrange
                    thesun.y = 0
                end
    
                if thesun.x > $xrange
                    thesun.x = 0
                end
    

                minrange = [$xrange, $yrange].min
    
                solarsize = ((minrange/6)*5) 
                solarsize.times do
                
                            y = 0-(solarsize/2)
                            x = 0-(solarsize/2)
                            (solarsize).times do
                                (solarsize).times do
                                    if (solarsize %  ($xrange ** (1.to_f/3.to_f)).to_i) == 0
                                    fuzzx = x + thesun.x
                                    fuzzy = y + thesun.y
                            
=begin
                                    if fuzzx > $xrange 
                                        fuzzx = (fuzzx - $xrange)
                                        if fuzzx < 0
                                            fuzzx = 0
                                        end
                                    end
                                    if fuzzy > $yrange 
                                        fuzzy = (fuzzy - $yrange)
                                        if fuzzy < 0
                                            fuzzy = 0
                                        end
                                    end
                                    if fuzzx < 0
                                        fuzzx = (fuzzx + $xrange)
                                    end
                                    if fuzzy < 0
                                        fuzzy = (fuzzy +  $yrange)
                                    end
                   
                                    if fuzzx <= -1
                                        fuzzx = (fuzzx % $xrange)
                                    end
                                    if fuzzy <= -1
                                          fuzzy = (fuzzy % $yrange)
                                      end   
=end
                                fuzzx = (fuzzx % $xrange)
                                fuzzy = (fuzzy % $yrange)


                                red = ChunkyPNG::Color.r(pngx[fuzzx, fuzzy]) *255
                                green = ChunkyPNG::Color.g(pngx[fuzzx, fuzzy]) *255
                                blue =  ChunkyPNG::Color.b(pngx[fuzzx, fuzzy]) *255
                                thesunred =  thesun.r * (thesun.a)
                                thesungreen =  thesun.g * (thesun.a)
                                thesunblue = thesun.b * (thesun.a)
                                red = [((thesunred+red)/255).to_i, 255].min
                                green = [((thesungreen+green)/255).to_i, 255].min
                                blue = [((thesunblue+blue)/255).to_i, 255].min
                                pngx[fuzzx, fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255) #renders to the screen
    
                                shine(Fighter.sortedsands[fuzzx][fuzzy]) ## the shine method interacts with the energy of water, plants and soil moisture. 
                            
                                if Fighter.sortedsands[fuzzx][fuzzy].name == -9 && rand(130000) == 0  ##-9 is water, sortedsands is categorized array of terrain objects
                                    zrat = (z/season)+10
    
                                     provide_cloud(Fighter.sortedsands[fuzzx][fuzzy].x, Fighter.sortedsands[fuzzx][fuzzy].y, zrat, season)
    
                                end
    
                                if rand(250000000) < Fighter.sortedsands[fuzzx][fuzzy].energy
                                    if Fighter.sortedsands[fuzzx][fuzzy].name != -9
    
                                if rand(0..20) == 0
                                  #   provideplants(0, 4, Fighter.sortedsands[fuzzx][fuzzy])
                                end
                                    else
                                  #   
                                if rand(0..48000) == 0
                                    provide_seaweed(Fighter.sortedsands[fuzzx][fuzzy])
                                     end
                                    end
                                 end
    
                            end
                            x+=1
                            end
                            x = 0-(solarsize/2)
                            y+=1
                            end
                            y= 0-(solarsize/2)
                                    solarsize -=1  
                        end             
                end



                pngx.save("xurthbig/#{z}.png")
                pngx.save("xurthbig/fresh.png")
puts "#{Fighter.plants.length} plants!"
puts "#{Fighter.herbis.length} herbivores!"
puts "#{Fighter.predos.length} predators!"
puts "#{Weather.clouds.length} clouds!"
# puts "#{Prodgenitor.all.length} seeds!"
puts "#{$eaten} eaten"
puts z
end