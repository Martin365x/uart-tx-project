# UART TX Project

This is my final project for Digital Electronics (Verilog). It implements a UART transmitter (UART TX) that sends an 8-bit byte serially, following the standard UART frame: start bit (0), 8 data bits, optional parity bit, stop bit (1).

## Files

- `Controller.v` - the FSM (brain) that controls the sending process
- `serializer.v` - holds the 8-bit data and outputs it one bit at a time
- `parity_calc.v` - calculates even/odd parity
- `mux_tx.v` - selects what goes on tx_output based on current state
- `uart_tx_top.v` - top module, connects all 4 submodules together
- `uart_tx_top_tb.v` - testbench, runs 3 test cases (no parity, even parity, odd parity)
- `UART_TX_Explanation.pdf` - full explanation of the design, module diagram, code, and waveform screenshot

## Ports

| Signal | Direction | Meaning |
|---|---|---|
| clk | input | clock |
| rst | input | asynchronous active-low reset |
| p_input | input | 8-bit data to send |
| v_input | input | 1-clock pulse, starts sending |
| p_en | input | 0 = no parity, 1 = parity enabled |
| p_bit | input | 0 = even parity, 1 = odd parity |
| tx_output | output | the serial output line |
| busy | output | high while a frame is being sent |

## How to simulate

1. Open ModelSim
2. Compile all files: `vlog Controller.v serializer.v parity_calc.v mux_tx.v uart_tx_top.v uart_tx_top_tb.v`
3. Start simulation: `vsim uart_tx_top_tb`
4. Add waves: `add wave *`
5. Run: `run -all`

## Testbench

The testbench runs 3 cases automatically, back to back:
1. No parity (`p_en=0`)
2. Even parity (`p_en=1, p_bit=0`)
3. Odd parity (`p_en=1, p_bit=1`)

See the PDF for the full waveform screenshot and explanation of each module.
