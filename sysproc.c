#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#ifdef CS333_P2
#include "uproc.h"
#endif

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      return -1;
    }
    sleep(&ticks, (struct spinlock *)0);
  }
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  xticks = ticks;
  return xticks;
}

//Turn of the computer
int
sys_halt(void){
  cprintf("Shutting down ...\n");
  outw( 0x604, 0x0 | 0x2000);
  return 0;
}

#ifdef CS333_P1
int
sys_date(void)
{
  struct rtcdate *d;
  if (argptr(0, (void*)&d, sizeof(struct rtcdate)) < 0)
    return -1;
  cmostime(d);
  return 0;
}
#endif

#ifdef CS333_P2
uint
sys_getuid(void)
{
  return proc->uid;
}

uint
sys_getgid(void)
{
  return proc->gid;
}

uint
sys_getppid(void)
{
  if (proc->pid == 1)
    return 1;
  return proc->parent->pid;
}

int
sys_setuid(void)
{
  int arg;
  if (argint(0, &arg) < 0)
    return -1;
  if(arg < 0 || arg > MAXUID)
    return -1;
  proc->uid = arg;
  return 0;
}

int
sys_setgid(void)
{
  int arg;
  if (argint(0, &arg) < 0)
    return -1;
  if(arg < 0 || arg > MAXGID)
    return -1;
  proc->gid = arg;
  return 0;
}
int
sys_getprocs(void)
{
  int max;
  struct uproc * table;

  if (argint(0, &max) < 0)
    return -1;
  if (argptr(1, (void*)&table, sizeof(struct uproc)) < 0)
    return -1;
  if (max > NPROC)
    max = NPROC;
  return getprocs(max, table);
}
#endif
