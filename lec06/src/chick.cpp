/// Copyright (c) 2023 ZJU.
/// 
/// Copyright (C) 
/// 
/// This program is free software; you can redistribute it and/or
/// modify it under the terms of the GNU General Public License
/// as published by the Free Software Foundation; either version 2
/// of the License, or (at your option) any later version.
/// 
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
/// 
/// You should have received a copy of the GNU General Public License
/// along with this program; if not, write to the Free Software
/// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

/// \file chick.cpp
/// \brief A Chicken Pecking Game Designed by PhilFan
/// \author PhilFan
/// \version 1.0
/// \date 2023-07-08


#include "chick.h"

void printGameInstructions() {
    std::cout << std::endl << std::endl;
    std::cout << "Welcome to Chicken Pecking Game!" << std::endl;
    std::cout << "Two chickens will peck each other until one of them dies." << std::endl;
    std::cout << "The combat power of a chicken will increase after each peck." << std::endl;
    std::cout << "To initiate pecking, enter 'p' or 'P'." << std::endl;
    std::cout << "To quit the game, enter 'q' or 'Q'." << std::endl;
    std::cout << "Let the game begin!" << std::endl;
    std::cout << std::endl << std::endl;
}

char getPlayerInput() {
    char input;
    while (true) {
        std::cin >> input;
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');  // Ignore any additional characters in the input buffer

        if (input == 'q' || input == 'Q' || input == 'g' || input == 'h' || input == 'G' || input == 'H') {
            return input;
        }
        else {
            std::cout << "Invalid command. Please try again.(g for 1,h for 2, q for exit)" << std::endl;
        }
    }
}


/**
 * \brief function of the game, to illustrate the use of the Chicken class.
 */
void playGame() {
    srand(static_cast<unsigned>(time(0)));

    Chicken chicken1(1, 101, 2.5);
    Chicken chicken2(2, 102, 3.2);
    chicken1.sing();
    chicken2.sing();

    printGameInstructions();            // Print the game instructions

    int roundNumber = 1;				// The round number
    
    chicken1.displayStats();            // Display the stats of the chicken1
    chicken2.displayStats();            // Display the stats of the chicken2

    while (true) {
        std::cout << "\n=============== Round " << roundNumber << " ===============" << std::endl;
        std::cout << "Enter your command: (g for 1,h for 2, q for exit)";
        char input = getPlayerInput();

        if (input == 'g') {
            chicken1.peck(chicken2, roundNumber);   // Chicken 1001 pecks chicken 1002
        }
        else if (input == 'h')
        {
            chicken2.peck(chicken1, roundNumber);   // Chicken 1002 pecks chicken 1001
        }
        else if (input == 'q' || input == 'Q') {
            break;  // Quit the game
        }
        else {
            std::cout << "Invalid command. Please try again." << std::endl;
        }

        
        if (chicken1.getHealth() <= 0 || chicken2.getHealth() <= 0) {
            break;  // End the game if one of the chickens dies
        }
        chicken1.displayStats();
        chicken2.displayStats();
        roundNumber++;
    }

    std::cout << "\n=============== Game Over ===============" << std::endl;
    std::cout << "Chicken " << chicken1.getID() << " - Health: " << chicken1.getHealth()
        << " | Combat Power: " << chicken1.getCombatPower() << std::endl;
    std::cout << "Chicken " << chicken2.getID() << " - Health: " << chicken2.getHealth()
        << " | Combat Power: " << chicken2.getCombatPower() << std::endl;

    if (chicken1.getHealth() <= 0 && chicken2.getHealth() <= 0) {
        std::cout << "It's a tie!" << std::endl;
    }
    else if (chicken1.getHealth() <= 0) {
        std::cout << RED_COLOR << "===============Chicken " << chicken2.getID() << " wins!==============="  << RESET_COLOR << std::endl;
    }
    else {
        std::cout << RED_COLOR << "===============Chicken " << chicken1.getID() << " wins!==============="  << RESET_COLOR << std::endl;
    }
}
