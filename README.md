## Project Objective

The goal of this project was to implement Tomasulo's algorithm and execute a set of instructions to verify its correct operation. 
To achieve this, various subsystems were developed, including the Reservation Station, Register File, Common Data Bus, and Issue logic. 
These components were combined to construct the final circuit, ensuring the accurate functionality of the algorithm.

## System design

The full system consists of the following modules: 

-Issue: The issue unit determines whether the next instruction can be accepted based on the available slots in the Reservation Station (RS). It receives a decoded instruction as input and forwards the necessary data to the appropriate units for execution.

-Common Data Bus (CDB): CDB ensures data is efficiently communicated between different parts of the system. It manages data flow from the functional units to the RegisterFile, ensuring that only one unit writes to the bus at a time to avoid conflicts.

-Register File (RF):

- CompleteRS: 

![alt text](https://github.com/akourkoulos/Tomasulo/blob/main/Figures/Tomasulo.png)

