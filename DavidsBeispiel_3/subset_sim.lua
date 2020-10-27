-- wiie heißt der Name meiner Outputdaten und welche Spalten möchte ich nehmen? => meine Outputdaten sollen in calculation_output.txt reinkommen

inputFiles = {
 
    expNormVolume={
      filename="calculation_output.txt",
-- da wir die Datei calculation_output.txt genannt haben, geben wir Namen auch hier ein
      selected_columns=[0,1],
-- wir wollen die 0. und die 1. Spalte
    },
  
  }
