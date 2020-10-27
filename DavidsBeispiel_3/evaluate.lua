
--Load Parameters
local pars = "parameters.lua"

local file = assert(loadfile(pars))
file()

-- später, wenn die Löser laufen, dann generieren die Parameterfiles.
-- der Code ist dafür da, dass diese Paramterfiles (z. B. parameters.lua) geladen werden
-- parameters.lua z. B. aus CircleTest > evaluations > 13-10-2020 > iteration_0 > id_0 > eval_0 


v_theta1=parameters.theta1:get_value_as_double()
v_theta2=parameters.theta2:get_value_as_double()

-- wie viele Parameter habe ich? 
-- parameters.theta1:get_value_as_double() kommt aus der Parameterfile, die ich reingeladen habe
-----------------------------------------------------------------
print("Start of Calculation")

local time_end=215245 -- ich habe 31 daten (von t=1 bis t=31)
local delta=2000

function linear(t,theta1, theta2) --wir wählen willkürlich eine kubische Funktion aus, weil wir annehmen, dass eine unsere Daten sich durch eine kubische Funktion gut darstellen lassen
-- da unsere Daten zeitabhängig sind, muss t als Parameter noch hinzugefügt werden
	return theta1*t+theta2
end
-- die Parameter heißen einfach nur theta1 etc. und nicht v_theta1, da Funktionsargumente eigene Namen haben 
-- v_thetha1 wird das Polynom dritten Grades sein (theta1*t*t*t)

file=io.open("calculation_output.txt","w")
-- das Ganze schreiben wir raus in einer Datei, die calculation_output.txt heißt
-- diese Datei wird dann im Ordner DavidsBeispiel > evaluations > 13-10-2020 > iteration_0 > id_0 > eval_0 gespeichert
-- wenn man jetzt die Datei öffnet, hat man zwei Spalten, einmal t und f(t) 
result="#time val val"
-- schreibe #time val val in der ersten Zeile

for i=0,time_end/delta do
-- for loop startet bei t=0, da meine Werte bei t=0 starten und geht bis zum Ende (time_end)
	result=result.."\n"
-- nachdem er #time val val geschrieben hat, geht er weiter zur nächsten Zeile
	result=result..i*delta.."\t"..linear(i*delta,v_theta1,v_theta2)
-- i*delta gibt die jetzige Zeit aus, zum Beispiel t=0
-- danach erzeugt er mit \t einen Leerzeichen und gibt den Funktionswert = cubic(i*delta,v_theta1,v_theta2,v_theta3,v_theta4) aus
-- danach geht er zur nächsten Iteration über

end


file:write(result)
-- das was wir gemacht haben, speichert er ab
file:close()
-- und schließt die Datei
