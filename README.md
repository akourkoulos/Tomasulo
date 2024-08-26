## Project Objective

The goal of this project was to implement Tomasulo's algorithm and execute a set of instructions to verify its correct operation. 
To achieve this, various subsystems were developed, including the Reservation Station, Register File, Common Data Bus, and Issue logic. 
These components were combined to construct the final circuit, ensuring the accurate functionality of the algorithm.

## System design

The full system consists of the following modules: 

- **Issue**: The issue unit determines whether the next instruction can be accepted based on the available slots in the Reservation Station (RS). It receives a decoded instruction as input and forwards the necessary data to the appropriate units for execution.

- **Common Data Bus (CDB)**: CDB ensures data is efficiently communicated between different parts of the system. It manages data flow from the functional units to the RegisterFile, ensuring that only one unit writes to the bus at a time to avoid conflicts.

- **Register File (RF)**: The Register File (RF) is the module where CompleteRS reads and writes values needed for the calculations by the Functional Units. It also stores information about the tag of the Reservation Station responsible for producing each result, helping other Reservation Stations stay informed about potential dependencies.

- **CompleteRS**: This module includes five instances of the Reservation Station, two Functional Units, and control logic. It temporarily stores values read from the Register File (RF), performs the necessary calculations, and writes the results back to the appropriate location in the RF. Additionally, it updates all Reservation Stations with the result to maintain accurate data dependencies.

![alt text](https://github.com/akourkoulos/Tomasulo/blob/main/Figures/Tomasulo.png)

Each module is designed and verified independently ensuring that every component is efficient and reliable. Consequently, the whole system is verified as well with behavioral simulation. 
You can find additional information about the design and verification here: 

You can check the source files here: 
