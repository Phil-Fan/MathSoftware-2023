/// 
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
/// 
/// \file chick.h
/// \brief A chicken Game designed by PhilFan
/// \author PhilFan
/// \version 1.0
/// \date 2023-07-08
#ifndef CHICK_H
#define CHICK_H

#include <iostream>
#include <cstdlib>
#include <limits>
// ANSI color escape sequences
const std::string RESET_COLOR = "\033[0m";
const std::string RED_COLOR = "\033[31m";
const std::string GREEN_COLOR = "\033[32m";
const std::string YELLOW_COLOR = "\033[33m";

class Chicken {
private:
    int age;               /**< The age of a chicken. */
    int ID;                /**< The ID of a chicken. */
    double weight;         /**< The weight of a chicken. */
    int combatPower;       /**< The combat power of a chicken. */
    int health;            /**< The health of a chicken. */

public:
    /**
     * Construct a chicken.
     *
     * @param _a to set the age.
     * @param _I to set the ID.
     * @param _w to set the weight.
     */
    Chicken(int _a, int _I, double _w)
        : age(_a), ID(_I), weight(_w), combatPower(1) {
        calculateHealth();
    }

    /**
     * Destroy the chicken.
     */
    ~Chicken() {
        std::cout << "Chicken " << ID << " 鸡你太美!" << std::endl;
    }

    /**
     * Make the chicken sing.
     */
    void sing() {
        std::cout << "Chicken " << ID << " sings: 大家好，我是练习时长" << age << "年半的偶像练习生" << ID << "!" << std::endl;
    }

    /**
     * Make the chicken peck another chicken.
     *
     * @param otherChicken The chicken to be pecked.
     */
    void peck(Chicken& otherChicken, int roundNumber) {
        int powerIncrease = rand() % 3 + 1;  // Increase combat power by 1-3
        combatPower += powerIncrease;

        int damage = combatPower * 2;  // Calculate damage based on combat power
        otherChicken.takeDamage(damage);

        std::cout << "Chicken " << ID << " pecks chicken " << otherChicken.getID() << std::endl;
        std::cout << "Combat power of chicken " << ID << " increased by " << powerIncrease << std::endl;
        std::cout << "Chicken " << otherChicken.getID() << " takes " << damage << " damage" << std::endl;
    }

    /**
     * Get the ID of the chicken.
     *
     * @return The ID of the chicken.
     */
    int getID() const {
        return ID;
    }

    /**
     * Get the weight of the chicken.
     *
     * @return The weight of the chicken.
     */
    double getWeight() const {
        return weight;
    }

    /**
     * Set the weight of the chicken.
     *
     * @param _w The weight to set.
     */
    void setWeight(double _w) {
        weight = _w;
        calculateHealth();
    }

    /**
     * Get the combat power of the chicken.
     *
     * @return The combat power of the chicken.
     */
    int getCombatPower() const {
        return combatPower;
    }

    /**
     * Get the health of the chicken.
     *
     * @return The health of the chicken.
     */
    int getHealth() const {
        return health;
    }


    /**
     * Display the current stats of the chicken.
     */
    void displayStats() const {
        std::cout << "Chicken " << ID << " - Health: ";
        if (health <= 0) {
            std::cout << RED_COLOR << health << RESET_COLOR;
        }
        else {
            std::cout << GREEN_COLOR << health << RESET_COLOR;
        }
        std::cout << " | Combat Power: " << RED_COLOR << combatPower << RESET_COLOR << std::endl;
    }

private:
    /**
     * Calculate the health of the chicken based on age and weight.
     */
    void calculateHealth() {
        health = static_cast<int>((age + weight) * 10);
    }

    /**
     * Take damage to the chicken's health.
     *
     * @param damage The amount of damage to be taken.
     */
    void takeDamage(int damage) {
        health -= damage;
        if (health <= 0) {
            std::cout << "Chicken " << ID << " has died!" << std::endl;
        }
    }

};

/**
 * \brief print some instructions of the game
 */
void printGameInstructions();

/**
 * \brief to get the input of the player
 * \return the input char of the player
 */
char getPlayerInput();

/**
 * \brief function of the game, to illustrate the use of the Chicken class.
 */
void playGame();
#endif // CHICK_H

