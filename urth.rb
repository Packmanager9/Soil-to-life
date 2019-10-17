require "Chunky_png"

$xrange = 383
$yrange = 259
$steps = 100000
$eaten = 0


 





class Weather 
    attr_accessor :name, :status, :x, :y,  :r, :g, :b, :a, :energy, :all, :clouds, :sol, :moisture
    @@all = []
    @@clouds = []
    @@sol = []
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
end

class Fighter

    attr_accessor :name, :status, :x, :y,  :r, :g, :b,  :all, :path, :plants, :herbis, :predos, :water, :sortedsands
    @@all = []
    @@paths = []
    @@plants = []
    @@herbis = []
    @@predos = []
    @@water = []
    @@sortedsands = (Array.new($xrange+1) { Array.new($yrange+1) })
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
        end
        if name == -9
            @@water << self
        end
        if (name < 5 &&  name > -1)
            @@plants << self
        end
        if (name < 99 && name > 5)
            @@herbis << self
        end
        if name > 99
            @@predos << self
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
    def self.predos
        @@predos
    end
    def self.water
        @@water
    end
    def self.sortedsands
        @@sortedsands
    end
    end


    class Terrain <  Fighter

        attr_accessor :type, :depth, :energy, :moisture, :all
        @@all = []
        def initialize(name, x, y,  status, r, g, b, type, depth, energy, moisture = 1000)
            super(name, x, y, status, r, g, b)
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

            attr_accessor :type, :depth, :energy,  :growthrate,  :traits, :all
            @@all = []
            def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, traits = [0 , 0, 0])
                super(name, x, y, status, r, g, b)
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
                Fighter.plants.each do |plant| x += plant.energy end
                    avg = (x.to_f/Plant.all.length)
                    avg
            end
            end
            

            class Herbivore <  Fighter
    
                attr_accessor :type, :depth, :energy, :growthrate, :traits, :all
                @@all = []
                def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, traits)
                    super(name, x, y, status, r, g, b)
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
        
                    attr_accessor :type, :depth, :energy, :growthrate, :traits, :all
                    @@all = []
                    def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, traits = [])
                        super(name, x, y, status, r, g, b)
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
                life = nil
            end
        end
        end
    end
    GC.start(full_mark: true, immediate_sweep: true);
end

def populate

    provide_sol()

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
                if predator_count < 20
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
            if rand(19) == (x%20) 
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


    pngholder = ChunkyPNG::Image.from_file('urthseed.png')
    
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do


    if ChunkyPNG::Color.b(pngholder[x, y]) == 190
    Terrain.new(-9, x, y, 1, 0, 0, 180,  "path", 5, 1000000000, 2000000)
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 230
        Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 25000000, 1000000)
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 0 && ChunkyPNG::Color.r(pngholder[x, y]) == 255
        d = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, rand(1000..2999))
    elsif ChunkyPNG::Color.b(pngholder[x, y]) == 0 && ChunkyPNG::Color.g(pngholder[x, y]) == 0 && ChunkyPNG::Color.r(pngholder[x, y]) == 0
       Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, rand(25000..59999))
    elsif  ChunkyPNG::Color.g(pngholder[x, y]) == 255
        Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, rand(500000..1000000))
    else
        Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 25000000, 1000000)
    end





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
          d = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, rand(1000..2999))
     when 1
         d = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, rand(4000..9000))
     when 2
         d = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, rand(11000..25999))
     when 3
         d = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, rand(25000..59999))
     when 4
         d = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, rand(50000..100000))
     when 5
         d = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, rand(200000..500000))
        when 6
            d = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, rand(500000..1000000))
        when 7
            d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1)
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
        d = Terrain.new(-9, x, y, 1, 50, 50, 230,  "path", 1, 10000000, 1000000)
            when 1
            d = Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 25000000, 1000000)
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


 def interact(front, back)
  #  ##puts front.name

    if front.name >= 0 && back.name >= 0
    if front.name < 5  && back.name > 4
        back.energy += front.energy
        front.energy = 0
        front.growthrate = 0
         if front != nil
        if front.name == 4 && (back.name > 5 && back.name < 99) && (front != nil)
            if rand(100) < back.traits[0] 
            back.growthrate += rand(0..1000)
            end
           # back.energy += front.energy
            Fighter.all.delete(front)
            Fighter.plants.delete(front)
            front = nil
        end
        Fighter.all.delete(front)
        Fighter.plants.delete(front)
        front = nil
    end
    Fighter.all.delete(front)
    Fighter.plants.delete(front)
        front = nil
    end
   
end
GC.start(full_mark: true, immediate_sweep: true);
 end



 def provide_cloud(x, y, z, season)
    if Weather.all.length < (z*2) && (season % 2) == 0
    Weather.new(-100, x, y, 1, 255, 255, 255, 50, (rand(5)+3))
    end
 end


 def provide_sol()
    if Weather.sol.length == 0
    Weather.new(-999, ($xrange), $yrange/2, 1, 255, 255, 200, 1, (belllcurve(500000)+3000000))
    end
 end

 def predation(front, back)
    
    if front.name == back.name
        #puts "#{front.name},    #{back.name}"
    end

    if front.name >= 0 && back.name >= 0
     #   ####puts "fuck"
    if front.name > back.name  && (back.name > 4 && back.name < front.name)
      #  ####puts "#{(back.energy*5)} !!!!!!!"
        front.energy += (back.energy*2)
        Fighter.herbis.delete(back)
        Fighter.plants.delete(back)
        Fighter.predos.delete(back)
        Fighter.all.delete(back)
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
            num = $xrange
    end
    num
 end

 def soilchanger(soil)



    if soil.energy > 0 && soil.name != -9
       soil.name = -1
       soil.r = rand (170..180)
       soil.g = rand (110..120)
       soil.b = 78
   end


   if soil.energy < 0 && soil.name != -9
      soil.name = -10
      soil.r = rand (170..180)
      soil.g = rand (170..180)
      soil.b = 100 
  end

if soil.energy > 3000 && soil.name != -9
    soil.name = -2
    soil.r = rand (120..130)
    soil.g = rand (80..90)
    soil.b = [0, (68 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 9000 && soil.name != -9
    soil.name = -3
    soil.r = rand (110..120)
    soil.g = rand (70..80)
    soil.b = [0, (58 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 26000 && soil.name != -9
    soil.name = -4
    soil.r = rand (100..110)
    soil.g = rand (60..70)
    soil.b = [0, (48 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 51000 && soil.name != -9
    soil.name = -5
    soil.r = rand (90..100)
    soil.g = rand (50..60)
    soil.b = [0, (38 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 101000 && soil.name != -9
    soil.name = -6
    soil.r = rand (80..90)
    soil.g = rand (40..50)
    soil.b =  [0, (28 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.energy > 500000 && soil.name != -9
    soil.name = -7
    soil.r = rand (70..90)
    soil.g = rand (30..40)
    soil.b =  [0, (18 - [[(soil.moisture/4000),  1].max, 255].min)].max
end

if soil.moisture > 2000 && soil.name != -9
    soil.name = -9
    soil.depth = 1
    soil.r = rand(50)
    soil.g = rand(50)
    soil.b = 230
end
if soil.moisture > 25000 && soil.name != -9
    soil.name = -9
    soil.depth = 2
    soil.r = rand(40)
    soil.g = rand(40)
    soil.b = 220
end
if soil.moisture > 30000 && soil.name != -9
    soil.name = -9
    soil.depth = 3
    soil.r = rand(30)
    soil.g = rand(30)
    soil.b = 210
end
end


 def rain(soil, cloud) #changes soil to fit adding water and breaking down waste and the dead
    if soil.name < 0 && soil.name != -100
    evaporation_precipatation = 100
    soilcycle = 10
    if (rand 0..54) == 0  && soil.name != -9#makes it rain less continously
    soil.moisture += evaporation_precipatation
    soil.energy += soilcycle
    cloud.energy -= soilcycle
    cloud.a -= 1
    cloud.a = [[[[cloud.a, 180].min, 10].max, cloud.energy].min, 1].max
    end
    

    soilchanger(soil)

    if soil.name == -9 
        soil.moisture -= evaporation_precipatation
        cloud.energy += soilcycle

        cloud.a += 10
        cloud.a = [[cloud.a, 80].max, 180].min

    end

    if cloud.energy <= 0 && cloud.name == -100
        Weather.all.delete(cloud)
        cloud = nil
        GC.start(full_mark: true, immediate_sweep: true);
    end
end
end
  

 def shine(soil)
    if rand(150) < 1
    soil.moisture -= 1
    #soilchanger(soil)
    end
end
  
def provide_seaweed(soil)
    if rand(soil.depth) > 0 && rand(10) == 0
    Plant.new(0, soil.x, soil.y, 1, (rand(50)+110), (rand(104)+100), rand(50), "seaweed", 0, (belllcurve(100000)+10000), (belllcurve(7000)+10000))
    end
end



 def provideplants(a, b, soil)
    
    c = rand(a..b)
 

    if soil.name < -4
       case c
       when 0
           d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100000)+10000), (belllcurve(5000)+3000))
          when 1
              d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200000)+100000), (belllcurve(7000)+7000))
          when 2
              d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100000)+10000), (belllcurve(5000)+3000))
           when 3
               if rand(64) == 0
               d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800000)+250000), (belllcurve(15000)+15000))
               else
                   d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100000)+10000), (belllcurve(5000)+3000))
                  end
       else 
           d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100000)+10000), (belllcurve(5000)+3000))
       end
   elsif soil.name < -2 && soil.name > -5
       case c
       when 0
           d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100000)+10000), (belllcurve(5000)+3000))
          when 1
              d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200000)+100000), (belllcurve(7000)+7000))
          when 2
              d = Plant.new(2, soil.x,soil. y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000))
           when 3 
               if rand(16) == 0
               d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800000)+250000), (belllcurve(15000)+15000))
               else
                   d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200000)+100000), (belllcurve(7000)+7000))
                  end
       else 
           d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
       end
   elsif soil.name > -3
       case c
       when 0
           d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000))
          when 1
              d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000))
          when 2
              d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000))
           when 3
               if rand(8) == 0
            d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800000)+250000), (belllcurve(15000)+15000))
               else
               d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000))
               end
       else 
           d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500000)+200000), (belllcurve(10000)+10000))
       end
      end

d
 end
  
 def predator_generator(a, b, x, y)
     c = rand(a..b)
 
     case c
     when 0
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250000)+600000), (belllcurve(2000)+1000), [belllcurve(100), 1, (belllcurve(10)+20)])
        when 1
            d = Predator.new(102, x, y, 1, 255, (rand(20)), rand(10), "pred", 0, (belllcurve(500000)+800000), (belllcurve(1000)+1000), [belllcurve(100), 1, (belllcurve(10)+40)])
        when 2
            d = Predator.new(103, x, y, 1, 0, 0, 0, "pred", 0, (belllcurve(1000000)+1000000), (belllcurve(1000)+500), [belllcurve(100), 1, (belllcurve(10)+60)])
     else 
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250000)+600000), (belllcurve(1000)+1000), [belllcurve(100), 1, (belllcurve(10)+10)])
     end
 d
 end

 def provideanimals(a, b, x, y)

     c = rand(a..b)
 
     case c
     when 0
        if rand(2) != 0
            d = Herbivore.new(6, x, y, 1, 255, (rand(25)+134), rand(25), "herbi", 0, (belllcurve(240000)+10000), (belllcurve(3000)+2000),  [belllcurve(100), 0, (belllcurve(5)+3)])
        else
            d = Herbivore.new(8, x, y, 1, 50,50, 70, "herbi ", 0, (belllcurve(900000)+10000), (belllcurve(1000)+1000), [belllcurve(100), 0, (belllcurve(7)+6)])
        end
        when 1
            d = Herbivore.new(7, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(499000)+100000), (belllcurve(3000)+1000),  [belllcurve(100), 0, (belllcurve(6)+4)])
        when 2
            d = Herbivore.new(8, x, y, 1, 50, 50, 70, "herbi ", 0, (belllcurve(900000)+10000), (belllcurve(1000)+1000),  [belllcurve(100), 0, (belllcurve(7)+6)])
     else 
        d = Herbivore.new(6, x, y, 1, 255, (rand(25)+134), rand(25), "herbi", 0, (belllcurve(240000)+10000), (belllcurve(3000)+2000),  [belllcurve(100), 0, (belllcurve(5)+3)])
    end
 d
 end
 

 def provide_sea_animals(a, b, x, y)

    c = rand(a..b)

    case c
    when 0
       if rand(2) != 0
        d = Herbivore.new(56, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2), [belllcurve(100), 1])
       else
           d = Herbivore.new(58, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1), [belllcurve(100), 1])
       end
       when 1
           d = Herbivore.new(57, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(400)+100), (belllcurve(3)+1),  [belllcurve(100), 1])
       when 2
           d = Herbivore.new(58, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1),  [belllcurve(100), 1])
    else 
        d = Herbivore.new(56, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2),  [belllcurve(100), 1])
    end
d
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
                
                    soilchanger( Fighter.sortedsands[x][y])
                    ###puts "#{soil.r},#{soil.g},#{soil.b}"
                pngx[x, y] =  ChunkyPNG::Color.rgba(Fighter.sortedsands[x][y].r, Fighter.sortedsands[x][y].g, Fighter.sortedsands[x][y].b, 255)
                if  (season%2) == 1
                 if rand(600000000) < Fighter.sortedsands[x][y].energy
                    if Fighter.sortedsands[x][y].name != -9
                     provideplants(0, 4, Fighter.sortedsands[x][y])
                    else
                        if rand(0..500) == 0
                       provide_seaweed(Fighter.sortedsands[x][y])
                        end
                    end
                 end
                else 
                    if rand(1200000000) < Fighter.sortedsands[x][y].energy
                        if Fighter.sortedsands[x][y].name != -9
                         provideplants(0, 4, Fighter.sortedsands[x][y])
                        else
                            if rand(0..500) == 0
                           provide_seaweed(Fighter.sortedsands[x][y])
                            end
                        end
                     end
                end
                 if Fighter.sortedsands[x][y].name == -9 &&  rand(97000000000) < Fighter.sortedsands[x][y].energy
                    zrat = (z/season)+10
              #      provide_cloud(Fighter.sortedsands[x][y].x, Fighter.sortedsands[x][y].y, zrat, season)
                end
            end
            x+=1
        end
        x  = 0
        y+=1
    end




    
Fighter.plants.each do |object|


    if object.energy <= 0 
        Fighter.all.delete(object)
        Fighter.predos.delete(object)
        Fighter.plants.delete(object)
        Fighter.herbis.delete(object)
        object.growthrate = -1
        object.energy = -1
        object = nil
    end
    if object != nil
        
        if (object.name == 0 || object.name == 1 ||   object.name == 2 || object.name == 4) && object.name > -1  && object.name < 5
            if object.status != 0
            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    if object.name < 5 && object.name > -1

                toilet = Fighter.sortedsands[object.x][object.y]
                    if toilet.energy > object.growthrate && object.type != "path"
                    toilet.energy -= object.growthrate
                    object.energy += object.growthrate
                    end
                    end
            end
        end
    end
end ## this specific seperation of the plants from the animals will do two things 1, make  sure plants die when eaten and 2. to render them as a layer above soil, but beneath animals woddly opp kanononuhnam kuzzah


        Fighter.all.each do |object| 
        if object != nil
            if object.name > 5 && object.name < 99
## beign


leftright = []
updown = []
leftright = (Fighter.plants.select do |prey|  (prey.x  == object.x) && (prey.y <= (object.y+object.traits[2])) &&  (prey.y >= (object.y-object.traits[2])) && (prey.name < 5 && prey.name > -1) && prey != nil end)
updown = (Fighter.plants.select do |prey|   (prey.y  == object.y)  && (prey.x <= (object.x+object.traits[2])) &&  (prey.x >= (object.x-object.traits[2])) && (prey.name < 5 && prey.name > -1) && prey != nil  end)
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
    if updown.length == 0 && leftright.length == 0
        pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
        object.x = fuzzer_x(object.x)
        object.y = fuzzer_y(object.y)
        pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
    end

    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)





            if object.name > 5 && object.name < 99
                #put somthing that gives energy to the soil(done V )
                toilet = Fighter.sortedsands[object.x][object.y]
                toilet.energy += object.growthrate
                object.energy -= object.growthrate
            end
            if (object.energy > 2000000 && object.name == 8) ||  (object.energy > 1000000 && object.name == 7) ||  (object.energy > 500000 && object.name == 6)
                if object.name == 8
                        object.energy -= 1000000    
                       young = Herbivore.new(object.name, object.x, object.y, object.status,[[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 750000, object.growthrate, object.traits)
                                               young.traits[0] += rand(-1..1)
                        young.traits[1] += rand(-1..1)
                        young.traits[1] = [young.traits[1], 0].max
                         young.traits[2] += rand(-1..1)
                        young.traits[2] = [young.traits[2], 1].max
                    elsif object.name == 7
                    object.energy -= 500000
                    2.times do
                     young =Herbivore.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 160000, object.growthrate, object.traits)
                                             young.traits[0] += rand(-1..1)
                        young.traits[1] += rand(-1..1)
                        young.traits[1] = [young.traits[1], 0].max
                     young.traits[2] += rand(-1..1)
                     young.traits[2] = [young.traits[2], 1].max
                    end
                elsif object.name == 6
                    object.energy -= 250000
                    3.times do 
                     young = Herbivore.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 50000, object.growthrate, object.traits)
                                            young.traits[0] += rand(-1..1)
                        young.traits[1] += rand(-1..1)
                        young.traits[1] = [young.traits[1], 0].max
                    young.traits[2] += rand(-1..1)
                    young.traits[2] = [young.traits[2], 1].max
                    end
                end
            end
            if object.energy <= 0
                Fighter.herbis.delete(object)
                Fighter.all.delete(object)
                object = nil
        GC.start(full_mark: true, immediate_sweep: true);
            end
            end
        end


        if object != nil
            if object.name > 99 
                if true
                        leftright = []
                        updown = []
                        leftright = (Fighter.herbis.select do |prey|   (prey.x  == object.x) && (prey.y <= (object.y+object.traits[2])) &&  (prey.y >= (object.y-object.traits[2]))   &&  (prey.name < 99 && prey.name > 5) && prey != nil end)
                        updown = (Fighter.herbis.select do |prey|    (prey.y  == object.y)  && (prey.x <= (object.x+object.traits[2])) &&  (prey.x >= (object.x-object.traits[2]))  && (prey.name < 99 && prey.name > 5) && prey != nil end)
                            if rand(0..1) == 0
                            if leftright.length != 0
                               quarry =  leftright.select do |prey| prey.name < 99  &&  prey.name > 4 end
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
                            if updown.length != 0
                                quarry =  updown.select do |prey| prey.name < 99  &&  prey.name > 4 end
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
                            if updown.length != 0
                                quarry =  updown.select do |prey| prey.name < 99  &&  prey.name > 4 end
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
                            if leftright.length != 0
                                #check
                                quarry =  leftright.select do |prey| prey.name < 99  &&  prey.name > 4 end
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
                            if updown.length == 0 && leftright.length == 0
                                object.x = fuzzer_x(object.x)
                                object.y = fuzzer_y(object.y)
                                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                object.x = fuzzer_x(object.x)
                                 object.y = fuzzer_y(object.y)
                                
                            end
                            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    end

                    if object != nil
                if object.name > 99 
                    toilet = Fighter.sortedsands[object.x][object.y]
                        toilet.energy += object.growthrate
                    object.energy -= object.growthrate
                 #   ####puts "#{object.energy},  #{object.growthrate}" 
                    end
                    if (object.energy > 15000000 && object.name == 103) ||  (object.energy > 10000000 && object.name == 102) ||  (object.energy > 5000000 && object.name == 101)
                        if object.name == 103
                        object.energy -= 10000000
                        ####puts "New Tiger!"
                        d = Predator.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max,object.type, object.depth, 5000000, object.growthrate, object.traits)
                                                d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                        d.traits[2] += rand(-1..1)
                        d.traits[2] = [d.traits[2], 1].max
                        
                    elsif object.name ==102
                            object.energy -= 5000000
                            ####puts "New Pythons!"
                            2.times do
                                if rand(0..1) == 0
                            d =Predator.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 1000000, object.growthrate, object.traits)
                                d.traits[0] += rand(-1..1)
                                 d.traits[1] += rand(-1..1)
                                d.traits[1] = [d.traits[1], 0].max
                                d.traits[2] += rand(-1..1)
                                d.traits[2] = [d.traits[2], 1].max
                            
                        end
                            end
                           elsif object.name == 101
                            object.energy -= 2500000
    
                        ####puts "New Mongooses!"
                        3.times do
                            if rand(0..4) == 0
                        d = Predator.new(object.name, object.x, object.y, object.status, [[object.r+rand(-10..10), 255].min, 0].max, [[object.g+rand(-10..10), 150].min, 0].max, [[object.b+rand(-10..10), 255].min, 0].max, object.type, object.depth, 500000, object.growthrate, object.traits)
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
                        object = nil
                GC.start(full_mark: true, immediate_sweep: true);
                    end
                end
            end
        end
    end
        matches = []
            matches = Fighter.herbis +  Fighter.plants + Fighter.predos + Fighter.water + Weather.clouds

    z +=1
    y = 0
    x = 0
    ($yrange+1).times do #plus 1 to fix edge glitch
        ($xrange+1).times do
        gather = matches.select do |part| part.x == x && part.y == y end
               
            ace = gather.find do |obj| obj.name > 5  && obj.name < 99 end
            bace  = gather.find do |obj| obj.name >= 0  && obj.name < 5 end
            cace = (gather.select do |obj| obj.name >= 100 end).uniq
            dace = gather.find do |obj| obj.name == -9 end
            





                        
                        if bace != nil && ace != nil
                            if bace.name != -100 && ace.name != -100 && (bace.name > -1 && ace.name > 5)
                            interact(bace, ace)
                            end
                        end    
                        if cace[0] != nil && ace != nil

                           if cace[0].name != -100 && ace.name != -100  && (cace[0].name > -1 && ace.name > -1)
                           predation(cace[0], ace)
                           #$eaten+=1
                           end
                        end
=begin
                        if cace[0] != nil && cace[1] != nil
                #           if cace[0].name != -100 && cace[1].name != -100  && (cace[0].name > -1 && cace[1].name > -1
                            if cace[0].name > cace[1].name
                            predation(cace[1], cace[0])

                       #\\     #puts "here"

                            else
                            predation(cace[0], cace[1])
                            #puts cace[0]
                            #puts cace[1]
                           # #puts "here"

                   #         end
                           #$eaten+=1
                           end
                        end
=end



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
                                if cace[0] != nil 

                            if dace.name != -100 && cace[0].name != -100
                                    swim(dace, cace[0])
                            end
                                end
                          end


                        
            x+=1
        end
        x  = 0
        y+=1
    end


  dead = Fighter.all.select do |every|  every == nil end

  #puts dead.length
   Fighter.plants.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
    Fighter.all.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
        matches.delete_if do |obj| dead.include?(obj) end  ## does this even do anything? do the dead die?
            matches.clear



    #if z == 5
     #   dogs.clear
     #   end
            Weather.clouds.each do |cloud|


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
                        cloud.y+=1
                        cloud.y = [$yrange, cloud.y].min
                    end
                end
                if rand(0..1) == 0
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
                if rand(0..1) == 0
                    cloud.y+=1
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
                
                    if (cloud.x == $xrange && cloud.y == $yrange) || (cloud.x == $xrange || cloud.y == $yrange) || (cloud.energy <= 0)
                        Weather.all.delete(cloud)
                        Weather.clouds.delete(cloud)
                        cloud = nil
                        GC.start(full_mark: true, immediate_sweep: true);
                    end
            end

            cloudnum = Weather.clouds.length
        endnumclouds = (Weather.clouds.select do |cloud| cloud.x == $xrange && cloud.y == $yrange && cloud.energy <= 0  end)
        endnumclouds.each do |cloud| 
            Weather.all.delete(cloud) 
            cloud = nil
            GC.start(full_mark: true, immediate_sweep: true);
        end




        Weather.sol.each do |thesun|
            if rand(0..3) == 0
                thesun.y -= 1
                end
                thesun.x -= 1
    
                if thesun.y < 0
                    thesun.y == $yrange
                end
    
                if thesun.x < 0
                    thesun.x == $xrange
                end
                if thesun.y > $yrange
                    thesun.y == 0
                end
    
                if thesun.x > $xrange
                    thesun.x == 0
                end
    

                minrange = [$xrange, $yrange].min
    
                solarsize = ((minrange/4)*3) 
                solarsize.times do
                
                            y = 0-(solarsize/2)
                            x = 0-(solarsize/2)
                            (solarsize).times do
                                (solarsize).times do
                                    if (solarsize %  ($xrange ** (1.to_f/3.to_f)).to_i) == 0
                                    fuzzx = x + thesun.x
                                    fuzzy = y + thesun.y
                            
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
                            
                                if Fighter.sortedsands[fuzzx][fuzzy].name == -9 && rand(3000) == 0  ##-9 is water, sortedsands is categorized array of terrain objects
                                    zrat = (z/season)+10
    
                                     provide_cloud(Fighter.sortedsands[fuzzx][fuzzy].x, Fighter.sortedsands[fuzzx][fuzzy].y, zrat, season)
    
                                end
    
                                if rand(250000000) < Fighter.sortedsands[fuzzx][fuzzy].energy
                                    if Fighter.sortedsands[fuzzx][fuzzy].name != -9
    
                                if rand(0..20) == 0
                                     provideplants(0, 4, Fighter.sortedsands[fuzzx][fuzzy])
                                end
                                    else
                                  #   
                                if rand(0..1000) == 0
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



pngx.save("urth/#{z}.png")
puts "#{Fighter.plants.length} plants!"
puts "#{Fighter.herbis.length} herbivores!"
puts "#{Fighter.predos.length} predators!"
puts "#{Weather.clouds.length} clouds!"
puts z
####puts $eaten
end