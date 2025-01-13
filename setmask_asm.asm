.global  setmask_asm

setmask_asm:
  // Move arguments to registers
  MOV X9, X0      /* take the argument a */
  MOV X10, X1     /* get the mask */

  // Store the number 66 in the first element of the array
  MOV X11, #66
  STR X11, [X2]

  // Return status 0 (success)
  MOV X0, #0      /* status return */
  RET

error:
  MOV X0, #-1     /* error exception */
  RET