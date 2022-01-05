#!/bin/bash

echo How many glasses of water did you drink today?

read glassesOfWater

echo For how many hours have you sat on a chair?

read chairHours

echo How many hours sat on the floor?

read floorHours

touch data.txt &&
# If the last update was today
if [ "$(echo $(tail -n 5 data.txt | head -n 1 | cut -d " " -f 1-4))" == "$(echo $(date) | cut -d " " -f 1-4)" ]
	then
		head -n -5 data.txt > tmp.txt &&
		cat tmp.txt > data.txt &&
		rm tmp.txt &&
		echo $(date) >> data.txt &&
		echo "Glasses of water: $glassesOfWater" >> data.txt &&
		echo "Hours on a chair: $chairHours" >> data.txt &&
		echo "Hours on floor: $floorHours" >> data.txt &&
		echo "" >> data.txt

else
	echo $(date) >> data.txt &&
	echo "Glasses of water: $glassesOfWater" >> data.txt &&
	echo "Hours on a chair: $chairHours" >> data.txt &&
	echo "Hours on floor: $floorHours" >> data.txt &&
	echo "" >> data.txt

fi
