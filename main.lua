width = 800
height = 800

factor = 0.0

function CreateTerrain()
	local vertices = {}
    
	for y=0, height-1 do
        for x=0, width-1 do
            xCoord, yCoord = love.graphics.inverseTransformPoint( x, y )
            xCoord1, yCoord1 = love.graphics.inverseTransformPoint( x, y + 1)
            table.insert(vertices, {xCoord, yCoord})
            table.insert(vertices, {xCoord1, yCoord1})
            end
        
	end
	
	return love.graphics.newMesh(vertices, "strip")
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end

function love.update(dt)
    factor = dt * 100
end


function love.load()
	mesh = CreateTerrain()
end

function love.draw(dt)
    --love.graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky )
    love.graphics.setWireframe( true )
    love.graphics.draw(mesh, 0, 0, 0, 20,20)
end