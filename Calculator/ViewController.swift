//
//  ViewController.swift
//  Calculator
//
//  Created by Arpan Badeka on 2/7/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController, UICollectionViewDelegate {
    
    var input = ""
    var firstNumber = Double()
    var operation = ""
    var lastOp = ""
    var result = Double()
    var count: Int = 0
    var baseValue = Double()
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayScreen() {
        label.text = input
    }
    
    @IBAction func clearBtn(sender: AnyObject) {
        input = ""
       displayScreen();
        label.text = "0"
        firstNumber = 0
        result = 0
        operation = ""
        count = 0
        baseValue = 0
    }
    
    @IBAction func zeroBtn(sender: AnyObject) {
        if(label.text == "0" || input == ""){
            input = ""
            label.text = "0"
        }else if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{
        input += "0"
        displayScreen();
        }
    }
    
    @IBAction func sevenBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{
            if(lastOp == "Unary")
            {
                input = "7"
                lastOp = ""
            }
            else
            {
                input += "7"
            }
        displayScreen();
        }
    }
    
    @IBAction func eightBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "8"
            lastOp = ""
        }
        else
        {
            input += "8"
            }
        displayScreen();
        }

    }
    
    @IBAction func nineBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "9"
            lastOp = ""
        }
        else
        {
            input += "9"
            }

        displayScreen();
        }
    }
   
    
    @IBAction func fourBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "4"
            lastOp = ""
        }
        else
        {
            input += "4"
            }

        displayScreen();
        }
    }
    
    @IBAction func fiveBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{
            if(lastOp == "Unary")
            {
                input = "5"
                lastOp = ""
            }
            else
            {
                input += "5"
            }

        displayScreen();
        }
    }
    
    @IBAction func sixBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "6"
            lastOp = ""
        }
        else
        {
            input += "6"
            }

        displayScreen();
        }
    }
    
    @IBAction func oneBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "1"
            lastOp = ""
        }
        else
        {
            input += "1"
            }

        displayScreen();
        }
    }
    
    @IBAction func twoBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "2"
            lastOp = ""
        }
        else
        {
            input += "2"
            }

        displayScreen();
        }
    }
    
    @IBAction func threeBtn(sender: AnyObject) {
        if (label.text == "Error"){
            input = ""
            label.text = "Error"
        }
        else{if(lastOp == "Unary")
        {
            input = "3"
            lastOp = ""
        }
        else
        {
            input += "3"
            }

        displayScreen();
        }
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        equaltoBtn(self)
        if ( operation == "+"){
        }else{
            operation = "+"
            }
        }
    @IBAction func minusBtn(sender: AnyObject) {
        equaltoBtn(self)
        if ( operation == "-")
        {
        }else{
            operation = "-"
        }
    }
    @IBAction func divisionBtn(sender: AnyObject) {
        equaltoBtn(self)
        if ( operation == "/"){
        }else{
            operation = "/"
        }
        
    }
    @IBAction func multiplyBtn(sender: AnyObject) {
        equaltoBtn(self)
        if ( operation == "*"){
        }else{
            operation = "*"
        }
    }

    @IBAction func percentBtn(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
          // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = firstNumber * baseValue / 100;
            }  else{
                baseValue = firstNumber
                firstNumber = baseValue / 100
            }
            if(firstNumber == floor(firstNumber)){
                input = "\(Int(firstNumber))"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
      }
    }
    
    @IBAction func negateNumberBtn(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            if(input == ""){
                input = "-"
                label.text = input
            }else{
            firstNumber = Double(label.text!)!
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                input = "-"
                label.text = input
                baseValue = firstNumber
                firstNumber = baseValue * -1;
            }  else{
                baseValue = firstNumber
                firstNumber = baseValue * -1
            }
            if(firstNumber == floor(firstNumber)){
                input = "\(Int(firstNumber))"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(Int(firstNumber))
//                label.text = "\(Int(firstNumber))"
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
            }
        }
    }
    @IBAction func equaltoBtn(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite || label.text == " Error"){
            label.text = "Error"
        }else {
            if(input == ""){
            firstNumber = 0
        }else {
            firstNumber = Double(input)!
        if(count == 0){
            result = firstNumber;
            count = 1
        }
            switch(operation){
            case "+":    result = result + firstNumber
                         firstNumber = 0
                         operation = ""
                         input = ""

            case "-":    result = result - firstNumber
                         firstNumber = 0
                         operation = ""

            case "/":    result = result / firstNumber
                         firstNumber = 0
                         operation = ""
                
            case "*":    result = result * firstNumber
                         firstNumber = 0
                         operation = ""
            
            case "x^y": result = pow(result, firstNumber)
                        firstNumber = 0
                        operation = ""
                
            default: break

            }
            if(result.isInfinite || firstNumber.isInfinite || label.text == "Error"){
                label.text = "Error"
            }else{
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                label.text = formatter.stringFromNumber(result)
            }
            input = ""
        }
    }
}
    
    
    @IBAction func dotBtn(sender: AnyObject) {
        if((input.rangeOfString(".")) != nil){
            
//        }else if(input == "" && operation == "+"){
//            input += "0."
        }else{
            input += "."
            displayScreen()
        }
    }
   
    
    @IBAction func squareRoot(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            { if(firstNumber > 0){
                firstNumber = sqrt(firstNumber)}
            else{
                label.text = "error"
                }
            }  else{
                if(firstNumber > 0){
                    baseValue = firstNumber
                    firstNumber = sqrt(firstNumber)}
                else{
                    label.text = "error"
                }

            }
            if(firstNumber == floor(firstNumber)){
                
                input = "\(Int(firstNumber))"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(Int(firstNumber))
//                label.text = "\(Int(firstNumber))"
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)            }
        }
        lastOp = "Unary"
    }
    @IBAction func cuberoot(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = pow(firstNumber, 1/3)
            }  else{
                baseValue = firstNumber
                    firstNumber = pow(firstNumber, 1/3)
    
            }
            if(firstNumber == floor(firstNumber)){
                input = "\(Int(firstNumber))"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                //                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"
    }
    
    @IBAction func sinofNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                
                firstNumber = sin(firstNumber * M_PI / 180)
            }  else{
                baseValue = firstNumber
                firstNumber = sin(firstNumber * M_PI / 180)
                
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
//                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
       lastOp = "Unary"
    }
    
    @IBAction func cosOfNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                
                firstNumber = cos(firstNumber * M_PI / 180)
            }  else{
                baseValue = firstNumber
                firstNumber = cos(firstNumber * M_PI / 180)
                
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
//                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
lastOp = "Unary"
    }
    @IBAction func tanOfNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            if(firstNumber % 90 == 0){
                label.text = "Error"
            }else{
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                
                firstNumber = tan(firstNumber * M_PI / 180)
            }  else{
                baseValue = firstNumber
                firstNumber = tan(firstNumber * M_PI / 180)
                
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
//                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }

        }
        lastOp = "Unary"
    }
    @IBAction func sinhofNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                
                firstNumber = sinh(firstNumber)
            }  else{
                baseValue = firstNumber
                firstNumber = sinh(firstNumber)
                
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
//                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        
        lastOp = "Unary"
    }
    
    @IBAction func coshOfNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                
                firstNumber = cosh(firstNumber)
            }  else{
                baseValue = firstNumber
                firstNumber = cosh(firstNumber)
                
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
//                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        
        lastOp = "Unary"

    }
    @IBAction func tanhOfNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                
                firstNumber = tanh(firstNumber)
            }  else{
                baseValue = firstNumber
                firstNumber = tanh(firstNumber)
                
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
//                input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        
        
        lastOp = "Unary"
    }

  
    @IBAction func squareofNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation == "+" || operation == "-" || operation == "/" || operation == "*" || operation == "x^y")
            {
                firstNumber = firstNumber * firstNumber
            }  else{
                baseValue = firstNumber
                firstNumber = firstNumber * firstNumber
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"
    }

    @IBAction func cubeofNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = firstNumber * firstNumber * firstNumber
            }  else{
                baseValue = firstNumber
                firstNumber = firstNumber * firstNumber * firstNumber
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"
    }
    @IBAction func randomNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            firstNumber = Double(label.text!)!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue; baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = drand48()
            }  else{
                baseValue = firstNumber
                firstNumber = drand48()
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }

        lastOp = "Unary"
    }
  
    @IBAction func tenexpoNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = pow(10,firstNumber)
            }  else{
                baseValue = firstNumber
                firstNumber = pow(10, firstNumber)
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
               // input = formatter.stringFromNumber(firstNumber)!
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"
        
    }
    @IBAction func eexpoNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = pow(2.7182818284590452353602874713527, firstNumber)
            }  else{
                baseValue = firstNumber
                firstNumber = pow(2.7182818284590452353602874713527, firstNumber)
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"

    }
    @IBAction func pieNumber(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = 22/7
            }  else{
                baseValue = firstNumber
                firstNumber = 22/7            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"

    }
    @IBAction func factorialX(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = firstNumber * factorial(firstNumber - 1)
                
            }  else{
                baseValue = firstNumber
                firstNumber = firstNumber * factorial(firstNumber - 1)
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)

            }
        }
        lastOp = "Unary"
    }
    
    func factorial(var d: Double) -> Double{
        if ( d == 0){
            return 1
        }else {
            d = d * factorial(d-1)
            return d
        }
    }
    
    @IBAction func xexpoy(sender: AnyObject) {
        equaltoBtn(self)
        if ( operation == "x^y"){
        }else{
            operation = "x^y"
        }

    }
    
    @IBAction func logBaseTen(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite && firstNumber == 0){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = log(firstNumber) / log(10)
            }  else{
                baseValue = firstNumber
                firstNumber = log(firstNumber) / log(10)
            }
            if(firstNumber == floor(firstNumber)){
                if(firstNumber.isInfinite || result.isInfinite){
                    label.text = "Error"
                } else{
                    //input = "\(Int(firstNumber))"
                    let formatter = NSNumberFormatter()
                    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    
                    input = "\(Int(firstNumber))"
                    label.text = formatter.stringFromNumber(Int(firstNumber))
                }
            }else{
                if(firstNumber.isInfinite || result.isInfinite){
                    label.text = "Error"
                }else {
                    input = "\(firstNumber)"
                    let formatter = NSNumberFormatter()
                    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    
                    input = "\(firstNumber)"
                    label.text = formatter.stringFromNumber(firstNumber)
                }
            }
        }
        lastOp = "Unary"
    }
    
    @IBAction func logtobasee(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite && firstNumber == 0){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = log(firstNumber)
            }  else{
                baseValue = firstNumber
                firstNumber = log(firstNumber)
            }
            if(firstNumber == floor(firstNumber)){
                if(firstNumber.isInfinite || result.isInfinite){
                    label.text = "Error"
                } else{
                    input = "\(firstNumber)"
                    let formatter = NSNumberFormatter()
                    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    
                    input = "\(Int(firstNumber))"
                    label.text = formatter.stringFromNumber(Int(firstNumber))
                }
            }else{
                if(firstNumber.isInfinite || result.isInfinite){
                    label.text = "Error"
                }else {
                    input = "\(firstNumber)"
                    let formatter = NSNumberFormatter()
                    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    
                    input = "\(firstNumber)"
                    label.text = formatter.stringFromNumber(firstNumber)
                }
            }
        }
        lastOp = "Unary"

    }
    
    @IBAction func fibButton(sender: AnyObject) {
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            // input = label.text!
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
            if(result == 0){
                input = ""
            }
            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
            {
                firstNumber = fibonacci(firstNumber)
                
            }  else{
                baseValue = firstNumber
                firstNumber = fibonacci(firstNumber)
            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"
    }
    
    func fibonacci(var d: Double) -> Double{
        var x = d;
        if(x == 0){
            return 0
        }else if (x == 1){
            return 1
        }else if(x > 1){
            d = fibonacci(x - 1) + fibonacci(x - 2)
            x = x - 1
        }
        return d
    }
    @IBAction func backspace(sender: AnyObject) {
        
        if (firstNumber.isInfinite || result.isInfinite){
            label.text = "Error"
        }else{
            input = label.text!
            input.removeAtIndex(input.endIndex.predecessor())
            label.text = input
            if(label.text == "" || input == ""){
                label.text = "0"
            }
            
            
            var formattedString:NSString = NSString(string: label.text!).stringByReplacingOccurrencesOfString(",", withString: "");
            
            firstNumber = formattedString.doubleValue;
            baseValue = result
//            if(operation != "+" || operation != "-" || operation != "/" || operation != "*" || operation != "x^y")
//            {
//
//                x = firstNumber % 10
//                firstNumber = firstNumber/10
//            }  else{
//                baseValue = firstNumber
//                x = firstNumber % 10
//                firstNumber = firstNumber/10
//                
//            }
            if(firstNumber == floor(firstNumber)){
                
                //input = "\(firstNumber)"
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(Int(firstNumber))"
                label.text = formatter.stringFromNumber(Int(firstNumber))
            }else{
                let formatter = NSNumberFormatter()
                formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                
                input = "\(firstNumber)"
                label.text = formatter.stringFromNumber(firstNumber)
            }
        }
        lastOp = "Unary"
    }
    
}
