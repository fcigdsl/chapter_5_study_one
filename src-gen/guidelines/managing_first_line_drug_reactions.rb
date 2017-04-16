module ManagingFirstLineDrugReactions
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.manage_lactic_acidosis(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART regimen', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Lactic acidosis', 'is', 'present', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Change regimen', 'AZT/3TC/NVP', 'manage lactic acidosis']
		actions << ['Lab test ordered', 'Haemoglobin', 'manage lactic acidosis']
		actions << ['Stop all', 'd4T/3TC/NVP', 'manage lactic acidosis']
	
		end
		actions
	end
				
		
	def self.manage_skin_reaction(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART regimen', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Skin drug reaction', 'is', 'present', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Change regimen', 'd4T/3TC/EFV', 'manage skin reaction']
		actions << ['Stop all', 'd4T/3TC/NVP', 'manage skin reaction']
	
		end
		actions
	end
				
		
	def self.manage_children_under_3_years(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART regimen', 'is', 'd4T/3TC/NVP', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Skin drug reaction', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Age', '<', '3', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'd4T/3TC/NVP', 'manage children under 3 years']
		actions << ['Refer to', 'Tertiary clinic', 'manage children under 3 years']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + manage_lactic_acidosis(patient)
		alerts = alerts + manage_skin_reaction(patient)
		alerts = alerts + manage_children_under_3_years(patient)
		alerts
	end
end
