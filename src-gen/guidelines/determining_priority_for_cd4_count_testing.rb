module DeterminingPriorityForCd4CountTesting
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.CD4_test_for_pregnant_women(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Pregnant woman', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('WHO clinical stage', 'is', 'WHO stage 1/2', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Order', 'CD4 count test', 'CD4 test for pregnant women']
	
		end
		actions
	end
				
		
	def self.CD4_test_for_WHO_stage_II(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('WHO clinical stage', 'is', 'WHO stage 2', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Order', 'CD4 count test', 'CD4 test for WHO stage II']
	
		end
		actions
	end
				
		
	def self.CD4_test_6_months_followup(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '500', patient, 'cells/mm3') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 age', '>=', '6', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Order', 'CD4 count test', 'CD4 test 6 months followup']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + CD4_test_for_pregnant_women(patient)
		alerts = alerts + CD4_test_for_WHO_stage_II(patient)
		alerts = alerts + CD4_test_6_months_followup(patient)
		alerts
	end
end
