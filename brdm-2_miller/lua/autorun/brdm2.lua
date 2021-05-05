local V = {
	Name = "BRDM-2",
	Model = "models/BRDM2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	SpawnOffset = Vector(0,0,40),
	Category = "vehicles",

	Members = {
		Mass = 3000,
		MaxHealth = 4050,
		
		        OnSpawn = function(ent)
        	print("successfully spawned") 

        	ent:SetNWBool("dangerkiddy_has_gear", false)
        	ent:SetNWInt("_direction_", 0)
        	ent:SetNWInt("__SetBuoyancyRatio__", 5)
        	ent:SetNWBool("_can_swim__", true)
        	ent:SetNWBool("_isboat", false)
        	--[[ent:SetNWFloat("dk_car_gear_R", 2)
        	ent:SetNWFloat("dk_car_gear_N", 4)
        	ent:SetNWFloat("dk_car_gear_1", 6)
        	ent:SetNWFloat("dk_car_gear_2", 7)
        	ent:SetNWFloat("dk_car_gear_3", 10)
        	ent:SetNWFloat("dk_car_gear_4", 11)
        	ent:SetNWFloat("dk_car_gear_5", 14)
        	ent:SetNWFloat("dk_car_gear_6", 15)]]
        end,
        OnTick = function(ent) --ent:SetPoseParameter("vehicle_fuel", ent:GetFuel() / ent:GetMaxFuel()) 
        	--ent:SetNWInt("dangerkiddy_max_value", 53)
            local throttle = ent:GetThrottle()
            local gear = ent:GetGear()
            if gear == 1 then throttle = throttle*(-1) end

            if not ent:EngineActive() then return end
            if throttle > 0 then 
                ent:SetNWInt("_spinnet", ent:GetNWInt("_spinnet")+6)
                ent:SetPoseParameter("vehicle_spinner", ent:GetNWInt("_spinnet"))
            elseif throttle < 0 then 
                ent:SetNWInt("_spinnet", ent:GetNWInt("_spinnet")-6)
                ent:SetPoseParameter("vehicle_spinner", ent:GetNWInt("_spinnet"))
            end
        end,

		IsArmored = true,
		NoWheelGibs = true,
	    FrontWheelRadius = 32,--радиус переднего колеса
		RearWheelRadius = 32,--радиус заднего колеса
		
	    CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/brdm-2_wheel.mdl",
		CustomWheelPosFL = Vector(76.599998474121,50.900001525879,-17),
		CustomWheelPosFR = Vector(76.599998474121,-50.900001525879,-17),
		CustomWheelPosRL = Vector(-85.0,50.900001525879,-17),	
		CustomWheelPosRR = Vector(-85.0,-50.900001525879,-17),
		CustomWheelAngleOffset = Angle(0,-180,0),

		
		CustomMassCenter = Vector(0,0,3.5),
		
		CustomSteerAngle = 25,
		CustomWheelCamber = 0,
		
		SeatOffset = Vector(65,-20,25),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
                pos = Vector(72,-20,-5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(50,-20,-5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(50,20,-5),
                ang = Angle(0,-90,0),
        	},
						{
                pos = Vector(20,-20,-5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(20,20,-5),
                ang = Angle(0,-90,0),
        	},
		},
		
		FrontHeight = 8, -- высота передней подвески
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,

		RearHeight = 8, -- высота задней подвески
		RearConstant = 50000,
		RearDamping = 4000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 5,
		
		MaxGrip = 75,
		Efficiency = 1.8,
		GripOffset = 0,
		BrakePower = 70,
		BulletProofTires = true,
		
		
		IdleRPM = 558, -- мин. кол-во оборотов
		LimitRPM = 6200, -- макс. кол-во оборотов
		Revlimiter = true, -- Если true - Когда стрелка спидометра доходит до красного обозначения, она не проходит дальше, если false - это игнорируется
		PeakTorque = 140, -- крутящий момент
		PowerbandStart = 558, -- какие обороты на нейтральной передаче
		PowerbandEnd = 6200, -- ограничение по оборотам
		Turbocharged = true, -- турбо false = нет, true = да
		Supercharged = false, -- супер заряд
		Backfire = true, -- стреляющий выхлоп
		
		FuelFillPos = Vector(32.82,-78.31,81.89),
		
		PowerBias = 0,
		
		EngineSoundPreset = -1,
		
snd_pitch = 0.95,
		snd_idle = "sound/word.wav",
		
		snd_low = "",
		snd_low_revdown = "sound/salmon.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "sound/jake.wav",
		snd_mid_gearup = "sound/jake.wav",
		snd_mid_geardown = "sound/jake.wav",
		snd_mid_pitch = 1.15,
 
        snd_horn = "sound/ace.wav",
 
        snd_blowoff = "sound/hubintro.wav",
--
		ForceTransmission = 1,
		DifferentialGear = 0.3,
		Gears = {-0.8,-0,0.5,0.74,0.98,1.26,1.48,1.8}
	}
}
list.Set( "simfphys_vehicles", "simphys_BRDM2", V )