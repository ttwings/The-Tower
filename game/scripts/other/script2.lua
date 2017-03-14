require("..engine.lclass")

local gameobject = nil

scriptsetup = function( object )
  gameobject = object

  gameobject.onCollisionEnter = localCollisionEnter
end

local localCollisionEnter = function ( otherCollider )
  print( "Hello! Im a windmill!" )

  local animation = gameobject:getAnimation()

  if ( animation ) then
    local x = animation:getFrameCount()

    for i = 1, x do
      animation:getFrame( i ):setDuration( 0.001 )
    end
  end

end