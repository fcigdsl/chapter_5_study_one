module ManagingArtPatientsWhoDevelopTb
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.suspecting_TB(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('TB symptoms', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Order', 'TB test', 'suspecting TB']
	
		end
		actions
	end
				
		
	def self.developing_TB_whilst_on_ART(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('TB test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARTs', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Enroll in program', 'TB treatment', 'developing TB whilst on ART']
		actions << ['Continue', 'd4T/3TC/NVP', 'developing TB whilst on ART']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + suspecting_TB(patient)
		alerts = alerts + developing_TB_whilst_on_ART(patient)
		alerts
	end
end
