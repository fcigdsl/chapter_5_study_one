module ManagingDrugToxicity
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.diagnosing_peripheral_neuropathy(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Pain or numbness of lower limbs', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'd4T based regimen', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Diagnose with', 'Peripheral neuropathy', 'diagnosing peripheral neuropathy']
	
		end
		actions
	end
				
		
	def self.diagnosing_pancreatitis(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Severe upper abnominal pain', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Nausea', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Vomiting', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'd4T based regimen', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Diagnose with', 'Pancreatitis', 'diagnosing pancreatitis']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + diagnosing_peripheral_neuropathy(patient)
		alerts = alerts + diagnosing_pancreatitis(patient)
		alerts
	end
end
