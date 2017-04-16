module ManagingKaposisSarcoma
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.manage_mild_to_moderate_KS(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('KS disease stage', 'is', 'Mild to moderate', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'manage mild to moderate KS']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + manage_mild_to_moderate_KS(patient)
		alerts
	end
end
