module ProvidingArtInSpecialSituations
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.contraceptives_and_neverapine(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('gender', 'is', 'Female', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '12', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'NVP based regimen', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'medroxyprogesterone', 'contraceptives and neverapine']
		actions << ['Offer', 'condoms', 'contraceptives and neverapine']
	
		end
		actions
	end
				
		
	def self.contraceptives_and_efavirenz(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('gender', 'is', 'Female', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '12', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'EFV based regimen', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Offer', 'contraceptives', 'contraceptives and efavirenz']
	
		end
		actions
	end
				
		
	def self.d4T_3TC_NVP_not_contraindicated(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Pregnant woman', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Continue', 'd4T/3TC/NVP', 'd4T 3TC NVP not contraindicated']
	
		end
		actions
	end
				
		
	def self.discontinue_NVP_in_labour(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('In labour', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'NVP', 'discontinue NVP in labour']
	
		end
		actions
	end
				
		
	def self.born_to_HIV_positive_mother_on_ART(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Is mother on ART?', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '72', patient, 'hours') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'Standard ARV prophylaxis', 'born to HIV positive mother on ART']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + contraceptives_and_neverapine(patient)
		alerts = alerts + contraceptives_and_efavirenz(patient)
		alerts = alerts + d4T_3TC_NVP_not_contraindicated(patient)
		alerts = alerts + discontinue_NVP_in_labour(patient)
		alerts = alerts + born_to_HIV_positive_mother_on_ART(patient)
		alerts
	end
end
