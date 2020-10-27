--Setting parameter domain
manager=VarDescriptor64()
manager:add("theta1",EFloat64(-20),EFloat64(20))
manager:add("theta2",EFloat64(-100),EFloat64(100))
-- kein Startwert, da PSO

--Defining storage place for the the estimated paramteers
estimated_parameters=EVar64Manager()
-- der Ort, wo die Parameter, falls er sie findet, gespeichert werden
-- sie werden in dem Container estimated_parameters gespeichert
-- damit ich in Lua mit den Parametern, die ich gefunden habe, weiterabeiten kann 


--Running the Particle Swarm Optimization Algorithm
n_particles=24
n_groups=6
max_iterations=100 --maximum iterations of the PSO algorithm if no convergence is reached beforehand
RunPSO_BiogasEval("/root/gcsc/ug4/apps/parameter_estimation/DavidsBeispiel_pso_3",manager,estimated_parameters,n_particles,n_groups,max_iterations)
-- RunPSO bedeutet, lass den PSO-Löser laufen
-- mit diesem PFad root/gcsc/ug4/apps/parameter_estimation/DavidsBeispiel_pso befindet sich meine evaluate Funktion 
-- mit diesen Parametern: manager = da wo die Parameter sind
-- estimated_parameters = speichere hier die Parameter, wenn du welche findest
-- n_particles = 20
-- n_groups = 4
-- max_iterations = 100

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

-- das untere ist nicht mehr wichtig. das ist nur für Lua: wenn du mit dem Ganzen fertig bis, zeige mir das in Lua an.

--[[~~~ never mind perfection, focus on progress. ~~~
➜  ~ pwd
/home/david
➜  ~ cd gcsc
➜  gcsc cd ug4
➜  ug4 cd apps
➜  apps cd parameter_estimation
➜  parameter_estimation cd DavidsBeispiel 
➜  DavidsBeispiel ugshell -ex parameter_estimation/DavidsBeispiel_pso/main_lua
zsh: command not found: ugshell
➜  DavidsBeispiel uglogin
~~~ never mind perfection, focus on progress. ~~~

# root @ ee0ed6a2c8c0 in / [14:26:35] 
$ ugshell -ex parameter_estimation/DavidsBeispiel_pso/main.lua]]--

