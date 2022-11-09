import 'dart:io';

import 'package:atm_machine/atm_machine.dart' as atm_machine;
/*
* Program to simulate the features of a workable ATM (the Nigerian case)
* Program will have the following features:
* 1 - DEPOSIT;    2 - WITHDRAWAL;     3 - CHECK BALANCE;  4 - TRANSFER;
*  5 - PHONE AIRTIME;  6 - BILL PAYMENT;  7 - QUICK TELLER;  8 - CHANGE PIN");
**/
/* At this level I took care of the -ve value during DEPOSITS
* I need to make sure the letter "E" or "e" no more interpreted to mean 10 raised to power
* as i noticed that 45e1 is interpreted as 45 x 10 which = 450 */

void main(List<String> arguments) {

  //var customer = Customer(); //creating an object of the customer class
  Customer().repeatMode(); // setting the object into action
}

class Customer{
  //defining VARIABLES
  late int option; //being the PIN of the customer
  double balance = 0.0; //being the initial balance of the customer
  double inputAmount = 0.0; //amount to be entered in any transaction
  late int phoneNumber; //phone number to be recharged with airtime
  late int accountNumber; //
  late String pin;
  int p = 0;

  void repeatMode() {
    //let the user select the service needed, as below
    print("Please key in the numerical value for the service you need");
    print("1 - DEPOSIT;    2 - WITHDRAWAL;     3 - CHECK BALANCE;    "
        "\n\n4 - TRANSFER;   5 - PHONE AIRTIME;"
        "\n\n6 - QUICKTELLER;    7 - CHANGE PIN");
    print(""); //just a space between
    selectTransaction(); // setting the object into action
  }


  void selectTransaction() {
    option = 0;
    //late int transaction;
    checkInput();
    //code to check if input isn't integer then give error message
    // while(true) {
    //   try {
    //     transaction = int.parse(stdin.readLineSync()!); // select the transaction you want to carry out
    //     break;
    //   } catch (e){
    //     print ('Wrong input! Please input an integer');
    //     }
    // } // error message code ends here

    switch(option) { //select a transaction by keying in a digit
      case 1: print("You selected a DEPOSIT service");
      deposit(); // function to help customer deposit
      break;
      case 2: print("You selected a WITHDRAWAL service");
      withdrawals(); //function to help customer withdraw
      break;
      case 3: print("You selected a 'CHECK BALANCE' service");
      myBalance(); //function to help customer check balance
      break;
      case 4: print("You selected a TRANSFER service");
      otherBanksTransfer(); //function to help customer transfer to other banks
      break;
      case 5: print("You selected a PHONE AIRTIME service");
      myAirtime(); //function to help customer load airtime
      break;
      case 6: print("You selected a QUICK-TELLER service");
      quickteller();// function for quickteller services
      break;
      case 7: print("You selected a CHANGE PIN service");
      changePin(); //function to help customer change PIN
      break;

      default: print("Your input were wrong");
      doMore(); //function to give customer another chance if input is wrong
    }
  }

  void doMore() {
    /*DONE
    * Code is to check
    * */
    print("");
    print("Press 1 for further transaction, Press 0 to end all transactions.");
    checkInput();

    switch(option) { //

      case 0: print("Thank you for choosing Data Bank");
        break;
      case 1: print(""); //just a vertical line between two spaces
        repeatMode();
        break;
      default:
        print("That's wrong. Input the correct code");
        checkInput2();
          // int p = 0;
          //     for(p; p < 3; p++) {
          //       int input = int.parse(stdin.readLineSync()!); // select the transaction you want to carry out
          //       if (input != 0 || input != 1 ) {
          //         if (p == 0) {
          //           print("Wrong entry. Please enter the correct input");
          //         }
          //           if (p == 1) {
          //             print("You have one chance left. Enter the correct input");
          //             //doMore();
          //           }
          //           if (p == 2) {
          //             print("Wrong Input. Thanks for chosing Data Bank. Good Bye!");
          //             break;
          //             }
          //         }
          //     }
      }
  }

      void defaultCheckers() {
        print("Please input 0 or 1");
        int input = int.parse(stdin.readLineSync()!); // select the transaction you want to carry out
        int p = 0;

        //if (input != 0 || input != 1) {
          for(p; p < 2; p++) {

            // try {
            //   input =
            //           int.parse(stdin.readLineSync()!); // amount to be withdrawn
            //   if (input < 0) {
            //     print("Negative inputs are not allowed");
            //     //break;
            //   }
            //   if (input > 0) {
            //     print("Please input 0 or 1");
            //     //break;
            //     if (p == 0) {
            //       print("You have only one chance left");
            //       //break;
            //     }
            //     else if (p == 1) {
            //       print("Your transactions have been terminated");
            //       break;
            //       doMore();
            //     }
            //   }
            //
            //
            //   break;
            // } catch (e) { // check if input is non-integer
            //   print("That is not an integer");
            //   if (p == 0) {
            //     print("You have ONE MORE chance left \n");
            //     //break;
            //   }
            //   if (p == 1) {
            //     print("Your transactions have been terminated");
            //     break;
            //   }
            //   //**print ('Please input an integer value');
            //   //break;
            // }

            print("Please input 0 or 1");
            input = int.parse(stdin.readLineSync()!);
            checkInput2();
                if (p == 0) {
                  print("You have only one chance left");
                  //break;
                }
                else if (p == 1) {
                  print("Your transactions have been terminated");
                  break;
                  doMore();
                }
          }
  }




  void defaultChecker() {
        int input = int.parse(stdin.readLineSync()!); // select the transaction you want to carry out
        int p = 0;

        for(p; p < 2; p++) {
              if (input != 0 || input != 1) {
                print("Wrong input. Please input 0 or 1");
                input = int.parse(stdin.readLineSync()!);

                if (input == 0) {
                  print("You have chosen to end all transactions");
                  break;
                }
                if (input == 1) {
                  print("You have chosen to continue to do more");
                  doMore();
                }

              }

        }

      }




  // void defaultchecker() {
  //   int p = 0;
  //       //for(p; p < 3; p++) {
  //         int input = int.parse(stdin.readLineSync()!); // select the transaction you want to carry out
  //         if (input != 0 || input != 1 ) {
  //           if (p == 0) {
  //             print("Wrong entry. Please enter the correct input");
  //             int input = int.parse(stdin.readLineSync()!); // select the transaction you want to carry out
  //             if (input != 0) {
  //               print("You've chosen to end all transactions. Good Bye");
  //               break;
  //             }
  //           }
  //             if (p == 1) {
  //               print("You have one chance left. Enter the correct input");
  //               //doMore();
  //             }
  //             if (p == 2) {
  //               print("Wrong Input. Thanks for chosing Data Bank. Good Bye!");
  //               break;
  //               }
  //           } else if (input == 0) {
  //           print("You've chosen to end all transactions. Good Bye");
  //           break;
  //         } else if (input ==1) {
  //             repeatMode();
  //         } else {
  //           print("Thank you for chosing us");
  //           break;
  //         }
  //       //}
  // }

  void deposit() {
    // to enable customers make deposits
    stdout.writeln('Please key in amount to be deposited');
    try {
      for(p; p<= 3; p++) {
        inputAmount = double.parse(stdin.readLineSync()!);
        if (inputAmount >= 0) {
          balance += inputAmount;
          print("You deposited $inputAmount. New balance is $balance, P is $p");
          doMore();
          break;
          } else  { //checking for negative entries
              print("Negative inputs not allowed, P is $p.");
              if (p == 2) {
                print("Just one chance left, P is $p");
              }
              if (p == 3) {
                print("Exceeded limit, P is $p");
              }
            }
          }
        } catch (e) {
          stdout.writeln('Please key in the correct entry, P is $p');
          for (p; p < 3; p++) { // only 3 times of erroneous entries allowed
            try {
              inputAmount = double.parse(stdin.readLineSync()!);

              if (inputAmount < 0) { //checking for negative entries
                print("Negative numbers not allowed. Integers or double only, P is $p");
                if (p == 2) {
                  print("You have one chance left, P is $p");
                }
                if (p == 3) {
                  print("Exceeded limit, P is $p");
                }
              }

        } catch (e) { // checking for alphabbets
          print("Only integers or double numbers permitted, P is $p");
          if (p == 1) {
            print("One chance left, P is $p.");
          }
          if (p == 2) {
            print("End of Limit, P is $p");
          }
        }
      }
    }
  }


  void withdrawals() {
    stdout.writeln("Enter amount to withdraw, transfer or load airtime. \n");
    //try {
      inputAmount = double.parse(stdin.readLineSync()!);
      if(inputAmount >= balance) {
      balance -= inputAmount;
      print("You've withdrawn $inputAmount, your balance is $balance");
      //doMore();
      }
      if(inputAmount < 0) { // check if inputAmount is less than 0
        print("Negative entries not allowed");
      }
      else if(inputAmount < balance) { // check if inputAmount is less than balance
        print("Your $inputAmount, is less than your balance of $balance.");
        //doMore();
      }

    //} catch(e) {

    //}
  }


  void withdrawal() {
    stdout.writeln("Please key in the amount to be withdrawn \n");
    //balanceCheck();
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    late int p = 0;
    for (p; p <= 3; p++) {
      try {
        inputAmount = double.parse(stdin.readLineSync()!); // amount to be withdrawn
        if (inputAmount < 0) {
          print("Negative input not allowed");
          //withdrawal();
        }
        if(inputAmount > balance) { //check for balance against input amount
          print("You cannot do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
          //doMore();
        }
        if (inputAmount >= balance){
          balance -= inputAmount;
          print("You have withdrawn N$inputAmount");
          print("Your transaction is successful, \nYour new balance is $balance");
          doMore();
        }
        break;
      } catch (e){ // check if input is non-integer
          if(p == 1) {
            print("You have ONE MORE chance left \n");
            //break;
        }
          if(p == 2) {
            print("You've exceeded number of input times");
            break;
        }
        print ('Please input an integer value');
        //break;
      }
    }
    //doMore();

  }

  void myBalance() {
    print("Your balance is $balance");
    doMore();
  }

  void transfer() {
    print("Input the recipient account number");
    //int accountNumber;
    while(true) {
      try {
        accountNumber = int.parse(stdin.readLineSync()!);
        break;
      } catch (e){
        print ('Input the correct account number');
      }
    }

    print("Input the amount to transfer ");
    //balanceCheck();
    //inputAmount;

    // inputAmount = double.parse(stdin.readLineSync()!);// collects the input value

    if(inputAmount > balance) {
      print("You can't do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
      doMore();
    } else {
      balance = balance - inputAmount;
      print(
          "Your transfer to $accountNumber is successful, \n Your new balance is N$balance");
      doMore();
    }
  }

  void myAirtime() {
    print("Please input the phone contact for airtime recharge ");
    while(true) {
      try {
        phoneNumber = int.parse(stdin.readLineSync()!);
          if (phoneNumber < 0) {
             print("Negative input not allowed");
             myAirtime();
             }
        break;
      } catch(e) {
        print("That is not a phone number");
      }
    }
    //phoneNumber = int.parse(stdin.readLineSync()!);// collects the input value
    //int? accountNumber = int.parse(stdin.readLineSync()!);
    print("Please input the amount for airtime recharge ");
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    balanceCheck();
    // if(inputAmount > balance) {
    //   print("You can't do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
    //   doMore();
    // } else {
    //   balance = balance - inputAmount;
    //   print(
    //       "Your transfer to $phoneNumber is successful, \n Your new balance is N$balance");
    //   doMore();
    // }
  }


  void balanceCheck() { //to check if input amount > balance
    int p = 0;
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    while(p < 3) {
      //   try{
      //     inputAmount = double.parse(stdin.readLineSync()!);
      //        if (inputAmount < 0) {
      //          print("Negative input not allowed");
      //          newWithdrawal();
      //        }
      //        // else {
      //        //   newWithdrawal()
      //        //   balance += inputAmount ;
      //        //   print("You transferred $inputAmount to $accountNumber");
      //        //     print("New banace is $balance");
      //        // }
      //     break;
      //     } catch (e) {
      //     print("Please input an integer or double amount");
      //   }
      // }
      try {
        inputAmount =
            double.parse(stdin.readLineSync()!); // amount to be withdrawn
        if (inputAmount < 0) {
          print("Negative inputs are not allowed");
          transfer();
        }

        if (inputAmount > balance) { //check for balance against input amount
          print(
              "You cannot do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
              doMore();
        } else {
          //balance -= inputAmount;
          //print("You have withdrawn N$inputAmount");

          //print("Your transaction is successful, \nYour new balance is $balance");
          //doMore();
        }
        break;
      } catch (e) { // check if input is non-integer
        print("Tha is not an integer");
        if (p == 1) {
          print("You have ONE MORE chance left \n");
          //break;
        }
        if (p == 2) {
          print("You've exceeded number of input times");
          break;
        }
        //**print ('Please input an integer value');
        //break;
      }
    }

  doMore();

  }

  void checkInputs() {
    int r = 1;
    for (r; r <= 3; r++) {
      try {
        option = int.parse(stdin.readLineSync()!); // collects the PIN input value
        break;
      } catch(e) {
        if(r == 1) {
          print("You have ONE MORE chance left \n");
          //break;
        }
        if(r == 2) {
          print("You've exceeded number of input times");
          break;
        }
        print("please input the correct option value");
      }

    }
    //print("Please input your old PIN ");
    // while(true) {
    //   try {
    //     option = int.parse(stdin.readLineSync()!); // collects the PIN input value
    //     break;
    //   } catch(e) {
    //     print("Please make the correct SELECTION or INPUT");
    //   }
    // }
  }

  void checkInput2() {
  int p = 0;
  //check if input is not a +ve integer or double amount
  for (p; p < 3; p++) {
  try {
  int input = int.parse(stdin.readLineSync()!);
  if (input < 0) {
  print("Negative input not allowed. Input 0 or 1 ");
  //break;
  } else if (input > 1) {
  print("Input only 0 or 1");
  if (p == 1) {
    print("One time remains");
  }
  }
  if (input == 1) {
    doMore();
  }// else {
  //   break;
  // }
  //print("You deposited $inputAmount \nYour new balance is $balance");
  //break;
    if (p == 1) {
      print("One time remains");
    }
  }   catch (e){
  if (p == 2) {
  print("You have exceeded your trial times");
  break;
  }
  //p += 1;
  print ('Please, only integer 0 or 1 needed');

  }
  }
  }



  void checkInput() {
    print("Please select any option above \n");
    //balanceCheck();
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    int p = 0;
    for (p; p <= 3; p++) {
      try {
        option = int.parse(stdin.readLineSync()!); // collects the PIN input value
        if (inputAmount < 0) {
          print("Negative inputs are not allowed");
          checkInput();
        }
        break;
      } catch(e) { // check if input is non-integer
        if(p == 1) {
          print("You have only ONE chance left \n");
          //break;
        }
        if(p == 2) {
          print("You've exceeded THE number of input times");
          break;
        }
        print ('Please input an integeR value');
        //break;
      }

    }

    //doMore();

  }



  void changePin() { //checks PIN input and gives a corresponding response
    //late int pin;
    print("Please input your old PIN ");
    pin = stdin.readLineSync()!; // collects the PIN input value
    //checkInput();
    // while(true) {
    //   try {
    //     pin = int.parse(stdin.readLineSync()!); // collects the PIN input value
    //     break;
    //   } catch(e) {
    //     print("please input your correct old PIN");
    //   }
    // }
    if (pin != '2345') {
      print("Incorrect! Please input your correct old PIN ");
      //checkInput();
      pin = stdin.readLineSync()!; // collects the PIN input value

          if (pin != '2345') {
            print("Incorrect old PIN, please try again ");
            //checkInput();
            pin = stdin.readLineSync()!; // collects the PIN input value

              if (pin != '2345') {
                print("Incorrect! You have one chance left. Input old PIN ");
                //checkInput();
                pin = stdin.readLineSync()!; // collects the PIN input value

                  if (pin != '2345') {
                    print("Your card is blocked.Please visit your local bank branch");

                  } else {
                    correctPin();
                  }
              } else {
                correctPin();
              }
          } else {
            correctPin();
          }
    } else {
      correctPin();
    }

  }



  void otherBanksTransfer() {
    print("Please select the bank you wish to transfer to");
    print("1 - ABE Bank;    2 - GO bank;     3 - Hope Bank ;    "
        "\n\n4 - Ibom Finance;   5 - PHd Bank;  6 - Bakassi Money;"
        "\n\n7 - QUICK Moni;    8 - CHANGI Treasury");
    print(""); //just a space between
    checkInput();
    // int? selection;
    // while(true) {
    //   try {
    //     selection = int.parse(stdin.readLineSync()!);
    //     break;
    //   } catch (e){
    //     print ('Please input an integer to select a Bank');
    //
    //   }
    //   //break;
    // }

    //int? selection = int.parse(stdin.readLineSync()!);
    switch(option) {
      case 1: print("You selected ABE Bank");
      transfer();
      break;
      case 2: print("You selected GO Bank");
      transfer(); //function to hep customer withdraw
      break;
      case 3: print("You selected Hope Bank");
      transfer();
      break;
      case 4: print("You selected Ibom Finance");
      transfer(); //ADD FUNCTION that would do this;
      break;
      case 5: print("You selected PHd Bank");
      transfer();//ADD FUNCTION that would do this
      break;
      case 6: print("You selected a Bakassi Money");
      transfer(); //ADD FUNCTION that would do this
      break;
      case 7: print("You selected a QUICK Moni");
      transfer(); //ADD FUNCTION that would do this
      break;
      case 8: print("You selected a CHANGI Treasury");
      transfer(); //ADD FUNCTION that would do this
      break;

      default: print("That's a wrong input");
      doMore();
    }
  }

  correctPin() {
    String pin;
    print("Please input your new PIN ");
    pin = stdin.readLineSync()!; // collects the PIN input value
    print("You have successfully changed your PIN, \nYour new PIN is $pin");
    doMore();
  }

  void quickteller() {
    print("Welcome to Quickteller services. Key in the service you want.");
    print("1 - BILL PAYMENT;    2 - PHONE AIRTIME;    3 - TRANSFER;    "
        "\n\n4 - REMITTA");
    String selection = stdin.readLineSync()!;
    switch (selection) {
      case '1':
        print("This option is to make BILL payments");
        billPayment();
        break;
      case '2':
        print("This option is to recharge your call airtime");
        myAirtime(); //function to hep customer withdraw
        break;
      case '3':
        print("This option is to TRANSFER money");
        otherBanksTransfer();
        break;
      case '4':
        print("You selected REMITTA payment tool");
        print("Please input your RRR code");
        String? rrr = stdin.readLineSync(); // collects the RRR input value
        print("Your RRR number is $rrr");
        transfer(); //ADD FUNCTION that would do this;
        break;

      default: print("INPUT value is not in the OPTIONS");
      doMore();
    }
  }

  billPayment() {
    print("Welcome, select the bill you want to pay for");
    print("1 - DSTV;    2 - GoTV;    3 - PHEDC ");
    checkInput();
    //String selection = stdin.readLineSync()!;
    switch (option) {
      case 1:
        print("You selected an option to make DSTV payment");
        print("Please input your DSTV IUC number");
        String? iuc = stdin.readLineSync();
        print("Your IUC number is $iuc");
        print("please select the bank of DSTV below");
        otherBanksTransfer(); // function to hep customer do online payment
        break;
      case 2:
        print("You selected an option for GOTV payment");
        print("Please input your GoTV IUC number");
        String? iuc = stdin.readLineSync();
        print("Your IUC number is $iuc");
        print("please select the bank for GoTV below");
        otherBanksTransfer(); //function to hep customer do online payment
        break;
      case 3:
        print("This option is for PHEDC (electricity) bill payment");
        print("Please input your PHEDC customer number");
        String phedc = stdin.readLineSync()!;
        print("Your PHEDC number is $phedc");
        print("please select the bank of PHEDC below");
        otherBanksTransfer(); // function to hep customer do online payment
        break;

      default: print("That INPUT is not in the OPTIONS");
      doMore();
    }
  }

  void newWithdrawal() {
    stdout.writeln("Key in the amount to be withdrawn \n");

    //balanceCheck();
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    late int p = 0;
    for (p; p <= 3; p++) {
      try {
        inputAmount = double.parse(stdin.readLineSync()!); // amount to be withdrawn
        if (inputAmount < 0) {
          print("Negative input not allowed");
          newWithdrawal();
        }

        if(inputAmount > balance) { //check for balance against input amount
          print("You cannot do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
          //doMore();
        } else {
          balance -= inputAmount;
          print("You have withdrawn N$inputAmount");
          print("Your transaction is successful, \nYour new balance is $balance");
          //doMore();
        }
        break;
      } catch (e){ // check if input is non-integer
        print("Tha is not an integer");
        if(p == 1) {
          print("You have ONE MORE chance left \n");
          //break;
        }
        if(p == 2) {
          print("You've exceeded number of input times");
          break;
        }
        //**print ('Please input an integer value');
        //break;
      }

    }

    doMore();

  }


}



