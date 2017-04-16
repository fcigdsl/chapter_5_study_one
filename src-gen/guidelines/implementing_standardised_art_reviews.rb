module ImplementingStandardisedArtReviews
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.side_effects_occuring_between_reviews(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ART side effects between reviews', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART regimen', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Advise patient', 'Report to health facility', 'side effects occuring between reviews']
	
		end
		actions
	end
				
		
	def self.stable_patient_after_6_months(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ART side effects', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART regimen', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Duration of treatment', '>=', '6', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Refer to', 'Group ART adherence councelling', 'stable patient after 6 months']
		actions << ['Schedule clinic appointment', 'Every two months', 'stable patient after 6 months']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + side_effects_occuring_between_reviews(patient)
		alerts = alerts + stable_patient_after_6_months(patient)
		alerts
	end
end
