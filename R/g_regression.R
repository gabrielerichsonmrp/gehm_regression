# LINEAR MODEL EVALUATION
rm_eval <- function(lm_model, testing_data, target_value){
  
  library(MLmetrics)
  #MAE : Hasilnya berupa satuan sesuai dengan data prediksi
  MAE.VAL <-  MAE(
    y_pred = predict(lm_model,testing_data),
    y_true =  target_value
  )
  
  # MAPE
  MAPE.VAL <- MAPE(
    y_pred = predict(lm_model,testing_data),
    y_true =  target_value
  )
  
  # RMSE
  RMSE.VAL <- RMSE(
    y_pred = predict(lm_model,testing_data),
    y_true =  target_value
  )
  
  eval <-  data.frame("MAE"=MAE.VAL,"MAPE"=MAPE.VAL,"RMSE"=RMSE.VAL)
  
  return(eval)
}



# RM MODEL EVALUATION 2
mlregress <- function(train_target_variable, data_train, data_test, data_test_target_value,step_direction){

  
  formula_none <- as.formula(paste(train_target_variable, "~1", sep=""))
  formula_all <- as.formula(paste(train_target_variable, "~.", sep=""))
  
  model_none <- lm(formula_none,data_train)
  model_all <- lm(formula_all,data_train)
  
  
  if(step_direction=="forward")
  {
    step_wise <- step(
      object = model_none,
      scope = list(upper=model_all),
      direction = "forward"
    )
   
  }
  else{

    step_wise <- step(
      model_all,
      direction = "backward"
    )
    
    
  }
  
  # predictors & target
  #predictors <- paste(predictors, collapse="+")
  #formula <- as.formula(paste(target,"~",as.formula(model_backward$call),sep = ""))
  
  #Otomatis mengambil predictor terkahir dari fungsi stepwise
  rm_model <- lm(as.formula(step_wise$call), data = data_train)
  
  
  library(MLmetrics)
  #MAE : Hasilnya berupa satuan sesuai dengan data prediksi
  MAE.VAL <-  MAE(
    y_pred = predict(rm_model,data_test),
    y_true =  data_test_target_value
  )
  
  # MAPE
  MAPE.VAL <- MAPE(
    y_pred = predict(rm_model,data_test),
    y_true =  data_test_target_value
  )
  
  # RMSE
  RMSE.VAL <- RMSE(
    y_pred = predict(rm_model,data_test),
    y_true =  data_test_target_value
  )
  
  eval <-  data.frame("MAE"=MAE.VAL,"MAPE"=MAPE.VAL,"RMSE"=RMSE.VAL)
  
  return(eval)
}

#menggunakan fungsi
# rm_eval(train_target_variable = "Prices" ,
#         data_train = house_train,
#         data_test = house_test,
#         data_test_target_value = house_test$Prices,
#         step_direction = "foward"
# )
