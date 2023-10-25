#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vsinegen.h"

#include "vbuddy.cpp"
#define MAX_SIM_CYC 1000000
#define ADDRESS_WIDTH 8
#define ROM_SZ 256



int main(int argc, char **argv, char **env){
    int symcyc;
    int tick;


    Verilated:: commandArgs(argc, argv);

    Vsinegen* top = new Vsinegen;
    Verilated:: traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top -> trace (tfp, 99);
    tfp -> open ("sinegen.vcd");

    if (vbdOpen() != 1) return(-1);
    vbdHeader("Lab2 Task2");
    // vbdSetMode(1);

    top -> clk = 1;
    top -> en = 1;
    top -> rst = 0;
    top -> incr = 64;

    for (symcyc = 0; symcyc < MAX_SIM_CYC; symcyc++){
        for (tick = 0; tick < 2; tick++){
            tfp -> dump(2*symcyc+tick);
            top->clk = !top->clk;
            top-> eval();
        }


        top->incr = vbdValue();
        vbdPlot(int(top->dout1), 0, 255);
        vbdPlot(int(top->dout2), 0, 255);
        vbdCycle(symcyc);

        if((Verilated:: gotFinish()) || (vbdGetkey()== 'q')) exit(0);
    }

    vbdClose();
    tfp->close();
    exit(0);
}
