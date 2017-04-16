module DeterminingStandardAdultDosesOfArtDrugs
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.when_zidovudine_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Zidovudine', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '300', 'when zidovudine is prescribed']
		actions << ['Frequency', 'Twice a day (BD)', 'when zidovudine is prescribed']
	
		end
		actions
	end
				
		
	def self.when_lamivudine_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Lamivudine', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '150', 'when lamivudine is prescribed']
		actions << ['Frequency', 'Twice a day (BD)', 'when lamivudine is prescribed']
	
		end
		actions
	end
				
		
	def self.when_zalcitabine_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Zalcitabine', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '0.75', 'when zalcitabine is prescribed']
		actions << ['Frequency', 'Three times a day', 'when zalcitabine is prescribed']
	
		end
		actions
	end
				
		
	def self.when_emtricitabine_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Emtricitabine', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '200', 'when emtricitabine is prescribed']
		actions << ['Frequency', 'Once a day (OD)', 'when emtricitabine is prescribed']
	
		end
		actions
	end
				
		
	def self.when_nelfinavir_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Nelfinavir', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '1250', 'when nelfinavir is prescribed']
		actions << ['Frequency', 'Twice a day (BD)', 'when nelfinavir is prescribed']
	
		end
		actions
	end
				
		
	def self.when_atazanavir_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Atazanavir', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '400', 'when atazanavir is prescribed']
		actions << ['Frequency', 'Once a day (OD)', 'when atazanavir is prescribed']
	
		end
		actions
	end
				
		
	def self.when_atazanavir_ritonavir_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Atazanavir/ritonavir', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '300/100', 'when atazanavir ritonavir is prescribed']
		actions << ['Frequency', 'Once a day (OD)', 'when atazanavir ritonavir is prescribed']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + when_zidovudine_is_prescribed(patient)
		alerts = alerts + when_lamivudine_is_prescribed(patient)
		alerts = alerts + when_zalcitabine_is_prescribed(patient)
		alerts = alerts + when_emtricitabine_is_prescribed(patient)
		alerts = alerts + when_nelfinavir_is_prescribed(patient)
		alerts = alerts + when_atazanavir_is_prescribed(patient)
		alerts = alerts + when_atazanavir_ritonavir_is_prescribed(patient)
		alerts
	end
end
