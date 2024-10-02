abstract class Baseviewmodel implements BaseviewmodelInput , BaseViewModelOutput
 {
 
  // shares all the variables and functions that are going to be shared by any viewmodel
}

abstract class BaseviewmodelInput{
// function to define the init and dispose of any view lifecycle
  void start();

  void dispose();
}

abstract class BaseViewModelOutput{
}