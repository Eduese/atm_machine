import 'dart:io';

import 'package:atm_machine/atm_machine.dart' as atm_machine;
/*
* Program to simulate the features of a workable ATM (the Nigerian case)
* Program will have the following features:
* 1 - DEPOSIT;    2 - WITHDRAWAL;     3 - CHECK BALANCE;  4 - TRANSFER;
*  5 - PHONE AIRTIME;  6 - BILL PAYMENT;  7 - QUICK TELLER;  8 - CHANGE PIN");
**/

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
      newWithdrawal(); //function to help customer withdraw
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

      default: print("Your inputs were wrong");
      doMore(); //function to give customer another chance if input is wrong
    }
  }

  void doMore() {
    print("");
    print("Press 1 for further transaction, Press 0 to end all transactions.");
    checkInput();
    //late int option;
    //code to output error message with non-integer input
    // while(true) {
    //   try {
    //     option = int.parse(stdin.readLineSync()!);
    //     break;
    //   } catch (e){
    //     print ('Please input an integer');
    //   }
    // }

    switch(option) {

      case 0: print("Thank you for choosing Data Bank");
        break;

      case 1: print(""); //just a vertical line between two spaces
        repeatMode();
        break;

      default: print("Sorry, that's a wrong input, goodbye");
      //checkInput();
      break;

    }
  }


  void deposit() {
    stdout.writeln("Please key in the amount to be deposited");
    //late double inputAmount; // collects the input value
    //checkInput();
    while(true) {
      try {
        inputAmount = double.parse(stdin.readLineSync()!);
        break;
      } catch (e){
        print ('Please input an integer or a double amount');
      }
    }
    balance = balance + inputAmount;
    print("You deposited $inputAmount \nYour new balance is $balance");

    doMore();
  }

  void withdrawal() {
    stdout.writeln("Please key in the amount to be withdrawn \n");
    //balanceCheck();
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    late int p = 0;
    for (p; p <= 3; p++) {
      try {
        inputAmount = double.parse(stdin.readLineSync()!); // amount to be withdrawn
        if(inputAmount > balance) { //check for balance against input amount
          print("You cannot do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
          //doMore();
        } else {
          balance = balance - inputAmount;
          print("You have withdrawn N$inputAmount");
          print("Your transaction is successful, \nYour new balance is $balance");
          //doMore();
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

    doMore();

  }

  void myBalance() {
    print("Your balance is $balance");
    doMore();
  }

  void transfer() {
    print("Please input the recipient account number");
    //int accountNumber;
    while(true) {
      try {
        accountNumber = int.parse(stdin.readLineSync()!);
        break;
      } catch (e){
        print ('Please input the correct account number');
      }
    }

    print("Please input the amount to transfer ");
    balanceCheck();
    //inputAmount;

    // inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    // if(inputAmount > balance) {
    //   print("You can't do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
    //   doMore();
    // } else {
    //   balance = balance - inputAmount;
    //   print(
    //       "Your transfer to $accountNumber is successful, \n Your new balance is N$balance");
    //   doMore();
    // }
  }

  void myAirtime() {
    print("Please input the phone contact for airtime recharge ");
    while(true) {
      try {
        phoneNumber = int.parse(stdin.readLineSync()!);
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

    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    while(true) {
      try{
        inputAmount = double.parse(stdin.readLineSync()!);
        break;
        } catch (e) {
        print("Please input an integer or double amount");
      }
    }

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
  void checkInput() {
    print("Please select any option above \n");
    //balanceCheck();
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    int p = 0;
    for (p; p <= 3; p++) {
      try {
        option = int.parse(stdin.readLineSync()!); // collects the PIN input value
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
        print ('Please input an integer value');
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
    stdout.writeln("Please key in the amount to be withdrawn \n");
    //balanceCheck();
    //inputAmount = double.parse(stdin.readLineSync()!);// collects the input value
    late int p = 0;
    for (p; p <= 3; p++) {
      try {
        inputAmount = double.parse(stdin.readLineSync()!); // amount to be withdrawn
        if(inputAmount > balance) { //check for balance against input amount
          print("You cannot do this transaction, your input of N$inputAmount is greater than your balance of N$balance");
          //doMore();
        } else {
          balance = balance - inputAmount;
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



