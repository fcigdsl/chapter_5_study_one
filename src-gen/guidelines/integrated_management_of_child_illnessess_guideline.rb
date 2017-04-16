module IntegratedManagementOfChildIllnessessGuideline
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.can_feed_with_convulsions(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Not Able to drink or feed', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'convulsion', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Refer to', 'Health facility', 'can feed with convulsions']
		actions << ['Advise caregiver', 'Continue to give fluids and feeding', 'can feed with convulsions']
	
		end
		actions
	end
				
		
	def self.managing_palmar_pallor(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'Palmar pallor', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Refer to', 'Health facility', 'managing palmar pallor']
		actions << ['Advise caregiver', 'Continue to give fluids and feeding', 'managing palmar pallor']
	
		end
		actions
	end
				
		
	def self.managing_swollen_feet(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'Swelling of both feet', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Refer to', 'Health facility', 'managing swollen feet']
		actions << ['Advise caregiver', 'Continue to give fluids and feeding', 'managing swollen feet']
	
		end
		actions
	end
				
		
	def self.can_feed_with_severe_red_eyes(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Not Able to drink or feed', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'Red eye', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Red eye duration', '>=', '4', patient, 'days') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Administer', 'Antibiotic eye ointment', 'can feed with severe red eyes']
		actions << ['Refer to', 'Health facility', 'can feed with severe red eyes']
		actions << ['Advise caregiver', 'Continue to give fluids and feeding', 'can feed with severe red eyes']
	
		end
		actions
	end
				
		
	def self.can_feed_with_red_eyes_and_vision_difficulties(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Not Able to drink or feed', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'Red eye', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'Vision dificulties', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Administer', 'Antibiotic eye ointment', 'can feed with red eyes and vision difficulties']
		actions << ['Refer to', 'Health facility', 'can feed with red eyes and vision difficulties']
		actions << ['Advise caregiver', 'Continue to give fluids and feeding', 'can feed with red eyes and vision difficulties']
	
		end
		actions
	end
				
		
	def self.can_feed_with_chest_indrawing(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Not Able to drink or feed', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Symptom present', 'is', 'potential chest indrawing', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Administer', 'Oral antibiotic', 'can feed with chest indrawing']
		actions << ['Refer to', 'Health facility', 'can feed with chest indrawing']
		actions << ['Advise caregiver', 'Continue to give fluids and feeding', 'can feed with chest indrawing']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + can_feed_with_convulsions(patient)
		alerts = alerts + managing_palmar_pallor(patient)
		alerts = alerts + managing_swollen_feet(patient)
		alerts = alerts + can_feed_with_severe_red_eyes(patient)
		alerts = alerts + can_feed_with_red_eyes_and_vision_difficulties(patient)
		alerts = alerts + can_feed_with_chest_indrawing(patient)
		alerts
	end
end
