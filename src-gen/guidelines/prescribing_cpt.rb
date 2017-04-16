module PrescribingCpt
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.managing_symptomatic_HIV_disease(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('WHO clinical stage', 'is', 'WHO stage 3/4', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'CPT', 'managing symptomatic HIV disease']
	
		end
		actions
	end
				
		
	def self.managing_low_CD4_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '500', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'CPT', 'managing low CD4 count']
	
		end
		actions
	end
				
		
	def self.born_from_an_HIV_positive_mother(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Mother HIV status', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '6', patient, 'weeks') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'CPT', 'born from an HIV positive mother']
	
		end
		actions
	end
				
		
	def self.managing_renal_or_hepatic_toxicity(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Renal or hepatic toxicity', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'CPT', 'managing renal or hepatic toxicity']
		actions << ['Prescribe', 'Dapsone', 'managing renal or hepatic toxicity']
	
		end
		actions
	end
				
		
	def self.managing_severe_haematological_toxicity(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Severe haematological toxicity', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'CPT', 'managing severe haematological toxicity']
		actions << ['Prescribe', 'Dapsone', 'managing severe haematological toxicity']
	
		end
		actions
	end
				
		
	def self.managing_renal_or_hepatic_toxicity_in_children(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Renal or hepatic toxicity', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'CPT', 'managing renal or hepatic toxicity in children']
	
		end
		actions
	end
				
		
	def self.managing_severe_cutaneous_reactions_in_children(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Severe cutaneous reaction', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'CPT', 'managing severe cutaneous reactions in children']
	
		end
		actions
	end
				
		
	def self.dosing_for_younger_children(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Eligible for CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '6', patient, 'weeks') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '5', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '120', 'dosing for younger children']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + managing_symptomatic_HIV_disease(patient)
		alerts = alerts + managing_low_CD4_count(patient)
		alerts = alerts + born_from_an_HIV_positive_mother(patient)
		alerts = alerts + managing_renal_or_hepatic_toxicity(patient)
		alerts = alerts + managing_severe_haematological_toxicity(patient)
		alerts = alerts + managing_renal_or_hepatic_toxicity_in_children(patient)
		alerts = alerts + managing_severe_cutaneous_reactions_in_children(patient)
		alerts = alerts + dosing_for_younger_children(patient)
		alerts
	end
end
