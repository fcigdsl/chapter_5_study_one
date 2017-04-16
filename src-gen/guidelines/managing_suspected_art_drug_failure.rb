module ManagingSuspectedArtDrugFailure
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.presenting_with_new_stage_IV_condition(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '200', patient, 'cells/mm3') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART duration', '>=', '12', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Adhering to therapy', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('New WHO stage VI condition', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'Suspected ART drug failure', 'presenting with new stage IV condition']
	
		end
		actions
	end
				
		
	def self.presenting_with_CD4_count_to_pretreatment_values(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '200', patient, 'cells/mm3') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART duration', '>=', '12', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Adhering to therapy', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count to pre-treatment values', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'Suspected ART drug failure', 'presenting with CD4 count to pretreatment values']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + presenting_with_new_stage_IV_condition(patient)
		alerts = alerts + presenting_with_CD4_count_to_pretreatment_values(patient)
		alerts
	end
end
