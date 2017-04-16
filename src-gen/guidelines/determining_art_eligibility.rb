module DeterminingArtEligibility
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.adult_patients_with_severe_HIV(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('WHO clinical stage', 'is', 'WHO stage 3/4', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'adult patients with severe HIV']
	
		end
		actions
	end
				
		
	def self.adult_patients_with_mild_HIV_and_low_lymphocyte_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Lymphocyte count', '<', '1200', patient, 'cells/mm3') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('WHO clinical stage', 'is', 'WHO stage 2', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'adult patients with mild HIV and low lymphocyte count']
	
		end
		actions
	end
				
		
	def self.children_with_low_lymphocyte_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '3', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '5', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Lymphocyte count', '<', '2500', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'children with low lymphocyte count']
	
		end
		actions
	end
				
		
	def self.younger_children_with_low_lymphocyte_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '18', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '3', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Lymphocyte count', '<', '3000', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'younger children with low lymphocyte count']
	
		end
		actions
	end
				
		
	def self.ART_eligibility_in_PSHD_candidiasis_and_pneumonia(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Presenting condition', 'is', 'Oral candidiasis', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Presenting condition', 'is', 'Pneumonia', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '18', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'ART eligibility in PSHD candidiasis and pneumonia']
	
		end
		actions
	end
				
		
	def self.infants_under_18_months_with_low_CD4_percent(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('DNA-PCR test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '18', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 %', '<', '20', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'infants under 18 months with low CD4 percent']
	
		end
		actions
	end
				
		
	def self.infants_under_18_months_with_low_lymphocyte_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('DNA-PCR test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '18', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Lymphocyte count', '<', '3000', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'infants under 18 months with low lymphocyte count']
	
		end
		actions
	end
				
		
	def self.infants_under_18_months_with_low_CD4_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('DNA-PCR test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '18', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '750', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'infants under 18 months with low CD4 count']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + adult_patients_with_severe_HIV(patient)
		alerts = alerts + adult_patients_with_mild_HIV_and_low_lymphocyte_count(patient)
		alerts = alerts + children_with_low_lymphocyte_count(patient)
		alerts = alerts + younger_children_with_low_lymphocyte_count(patient)
		alerts = alerts + ART_eligibility_in_PSHD_candidiasis_and_pneumonia(patient)
		alerts = alerts + infants_under_18_months_with_low_CD4_percent(patient)
		alerts = alerts + infants_under_18_months_with_low_lymphocyte_count(patient)
		alerts = alerts + infants_under_18_months_with_low_CD4_count(patient)
		alerts
	end
end
