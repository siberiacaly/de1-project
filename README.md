### Team members

* Tomáš Calábek (responsible for MorseC decoder, MorseC transmitter, Display source files, Receiver (design bugs), Repository )
* Martin Olšiak (responsible for GitHub repository, Receiver (Design and TB), ShiftRegister)
* Tomáš Hutta (responsible for DIDNT PARTICIPATE - SICK?)

## Theoretical description and explanation

Morse code is a way of writing text that consists of short and long signals, usually referred to as "dots" and "dashes". Each letter of the alphabet, digit, and some special characters are encoded as a combination of dots and dashes.

The principle of Morse code is based on the fact that each letter, digit, or special character has its own unique code made up of a sequence of dots and dashes. The codes are designed to be easily recognizable and easily transmitted over various communication channels, such as telegraph wires, radio transmitters, or light signals.

Morse code became very popular for long-distance communication in a time when modern communication technologies, such as mobile phones or the internet, were not available. However, it is still used today, especially in the navy and aviation.

Morse code can be programmed in VHDL using a combination of logic gates and a finite state machine. The logic gates are used to convert the input text into the corresponding Morse code signals, which are then fed into the finite state machine. The finite state machine is responsible for generating the timing and sequencing of the Morse code signals.

Here's a general overview of how this could be done:

1.) Convert the input text to Morse code signals using a lookup table that maps each character to its Morse code representation (i.e., a sequence of dots and dashes).

2.) Use logic gates to implement the mapping of dots and dashes to corresponding signals (e.g., high and low voltage levels).

3.) Implement a finite state machine that generates the timing and sequencing of the Morse code signals. The machine would have different states corresponding to dots, dashes, and the spaces between dots and dashes. The machine would transition between these states based on a clock signal and the input text.

4.) Output the Morse code signals to output device.

## Hardware description of demo application

Insert descriptive text and schematic(s) of your implementation.

## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation

Write descriptive text and simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos or a link to a video.

## References

1. https://www.researchgate.net/publication/305379385_Morse_code_decoder_design_in_VHDL_using_FPGA_Spartan_3E_development_kit 
2. https://www.instructables.com/Basys-3-Morse-Decoder/
