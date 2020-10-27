
--Load Parameters
local pars = "parameters.lua"

local file = assert(loadfile(pars))
file()

v_theta1=parameters.theta1:get_value_as_double()
v_theta2=parameters.theta2:get_value_as_double()

-----------------------------------------------------------------
print("Start of Calculation")

local time_end=216245
local delta=1000

function cubic(t,theta1, theta2)
	return theta1*t+theta2
end

file=io.open("calculation_output.txt","w")
result="#time val val"

for i=0,time_end, delta do
	result=result.."\n"
	result=result..i.."\t"..cubic(i*delta,v_theta1,v_theta2)
end


file:write(result)
file:close()
