# [Solver Simulator Integration](./CubeSimulator_Project21/Solver_Simulator_Integration)

## Aims:
-Integrating the Solver code (Thistlethwaite method) with the 3x3 Simulation.

-Collecting data after performing random scrambles and feeding it to the Solver code.

-Getting statistics

### 1. Integration:

We used text files to communicate with the two different codes (one in C++ and other in Processing).

The simulator code was modified so that it returns the moves we randomly perform into a text file [RandomScramble.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/RandomScramble.txt). This file now acts as an input for our Solver code.

The Solver code ([SolverCodeThistlethwaite.cpp](./CubeSimulator_Project21/Solver_Simulator_Integration/SolverCodeThistlethwaite.cpp)) takes the inputs from [RandomScramble.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/RandomScramble.txt) and after applying phase wise double-ended BFS, it returns a sequence of moves that will solve the cube. This sequence of moves is written to a file called [SolverOutput.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/SolverOutput.txt). Basically, running the Solver code on a C++ compiler will automatically take the input and create the output file for you!

Now the simulator code reads the sequence of moves from [SolverOutput.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/SolverOutput.txt) and performs those moves on the cube.



### 2. Collecting Data:

The Solver code was modified to [DataGenerator.cpp](./CubeSimulator_Project21/Solver_Simulator_Integration/DataGenerator.cpp)  in order to get data about phase wise moves, the time taken for each phase in addition to the total moves and total time taken.

A sample of random scrambles was taken as a text file ([RandomScrambleData.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/RandomScrambleData.txt)) and was passed on to [DataGenerator.cpp](./CubeSimulator_Project21/Solver_Simulator_Integration/DataGenerator.cpp). It generated the required data into a text file ([Data.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/Data.txt)). This data will now be used to generate statistics.



### 3. Statistics:

The text file [Data.txt](./CubeSimulator_Project21/Solver_Simulator_Integration/Data.txt) was converted to `.csv` format contained in [Data__Stats.csv](./CubeSimulator_Project21/Solver_Simulator_Integration/Data__Stats.csv). Then carried out basic statistical operations on the csv file in MS Excel. `Sheet` 1 of [Data__Stats.csv](./CubeSimulator_Project21/Solver_Simulator_Integration/Data__Stats.csv) contains the data (and some theoretical stats) whereas `Sheet 2` has the stats represented graphically.

The [Converter.py](./CubeSimulator_Project21/Solver_Simulator_Integration/Converter.py) contains the code to convert the `.txt` file generated by the solver code to `.csv` file.



## Team Members:
- Mandar Wayal
- Debanjan Manna
- Narendra Prajapat






