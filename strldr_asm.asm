 /* GNU nano 4.8                                                                       strldr_asm.asm         */                                                                         
/* strlder_asm.asm */
/* X1 = address/pointer */

/*ATTENTION THIS IS ONLY A EXAMPLE ASSEMBLY PROGRAM NOT THE LAB CODE*/
.global strldr_asm
strldr_asm:
          MOV X6,X0
              MOV X7,X1                /* Address for storing the value; tabe address from X1 */
          Str X6, [X7] /* (1) store with register */
          MOV X0,#0
              BR LR
              