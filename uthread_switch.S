	.text

/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */
	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */
	pushal                  // Save all regs
	/* Save current_thread */
	movl current_thread, %eax
	movl %esp, (%eax)
	/* Load next_thread */
	movl next_thread, %eax
	movl %eax, current_thread
    movl current_thread, %eax
    movl (%eax), %esp
    popal                   // Restore all regs
    movl $0, next_thread    // next_thread = NULL

	ret				/* pop return address from stack */
