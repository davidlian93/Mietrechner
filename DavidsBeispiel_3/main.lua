--Setting parameter domain
v_theta1=EVar64(EFloat64(1),EFloat64(-100),EFloat64(100))
v_theta2=EVar64(EFloat64(1),EFloat64(-1000),EFloat64(1000))
-- wir haben hier einen Newton-Löser, also brauchen wir Anfangswerte. Bis zu -10 dürfen die Parameter annehmen, maximal aber 100. wir müssen nur aufpassen, dass wir das ganze nicht zu stark einschränken, da wir sonst nicht die besten Lösungen rausbekommen. Gleichzeitig muss man aber auch aufpassen, dass man genug einschränkt, da sonst etwas komisches passieren kann.

manager=EVar64Manager()
manager:add("theta1",v_theta1)
manager:add("theta2",v_theta2)
-- hier werden die Parameter bestimmt, die wir haben

--Defining storage place for the the estimated paramteers
estimated_parameters=EVar64Manager()

--Running Newton Gauss
stepsize_alpha=1.0 --Hyperparameter of the adaptive stepsize calculation. See AdaDelta for details. The second hyperparamater (squared gradient decay rate) can be set by directly interfacing with the C++ code
print(stepsize_alpha)
RunNewtonGauss_BiogasEval("/root/gcsc/ug4/apps/parameter_estimation/DavidsBeispiel_3",manager,estimated_parameters,stepsize_alpha)

--[[Generate a lua table with the parameters.
Note: The paramters are converted to double which means they lose
their accumulated error bounds.
--]]
tab={}
for k=0,estimated_parameters:len()-1 do
			
			name=estimated_parameters:get_name(k)
			value=estimated_parameters:get_param(k):get_value_as_double()
			tab[name]=value

end
print("Parameter values converted into lua table:")
print(tab)

print("Execution completed") 
