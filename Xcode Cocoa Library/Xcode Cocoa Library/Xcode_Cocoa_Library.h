//
//  Xcode_Cocoa_Library.h
//  Xcode Cocoa Library
//
//  Created by Andrew Jaffee on 10/20/18.
//  Copyright © 2018 Andrew L. Jaffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <iostream>

@interface Xcode_Cocoa_Library : NSObject

- (void)helloWorld;

@end

class parent {
public:
    virtual void soundOff() {
        std::cout << "This is the parent class" << std::endl;
    }
};

class child: public parent {
public:
    virtual void soundOff() {
        std::cout << "This is the child class" << std::endl;
    }
};
