
_testuidgid:     file format elf32-i386


Disassembly of section .text:

00000000 <testuidgid>:
#include "types.h"
#include "user.h"

int
testuidgid(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  uint uid, gid, ppid;
  uid = getuid();
   6:	e8 85 08 00 00       	call   890 <getuid>
   b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(2, "Current UID is: %d\n", uid);
   e:	83 ec 04             	sub    $0x4,%esp
  11:	ff 75 f4             	pushl  -0xc(%ebp)
  14:	68 50 0d 00 00       	push   $0xd50
  19:	6a 02                	push   $0x2
  1b:	e8 77 09 00 00       	call   997 <printf>
  20:	83 c4 10             	add    $0x10,%esp

  printf(2, "Setting UID to 100\n");
  23:	83 ec 08             	sub    $0x8,%esp
  26:	68 64 0d 00 00       	push   $0xd64
  2b:	6a 02                	push   $0x2
  2d:	e8 65 09 00 00       	call   997 <printf>
  32:	83 c4 10             	add    $0x10,%esp
  if (setuid(100) < 0){
  35:	83 ec 0c             	sub    $0xc,%esp
  38:	6a 64                	push   $0x64
  3a:	e8 69 08 00 00       	call   8a8 <setuid>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	85 c0                	test   %eax,%eax
  44:	79 1c                	jns    62 <testuidgid+0x62>
    printf(2, "Error setting UID\n");
  46:	83 ec 08             	sub    $0x8,%esp
  49:	68 78 0d 00 00       	push   $0xd78
  4e:	6a 02                	push   $0x2
  50:	e8 42 09 00 00       	call   997 <printf>
  55:	83 c4 10             	add    $0x10,%esp
    return -1;
  58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  5d:	e9 75 03 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  if((uid = getuid()) != 100){
  62:	e8 29 08 00 00       	call   890 <getuid>
  67:	89 45 f4             	mov    %eax,-0xc(%ebp)
  6a:	83 7d f4 64          	cmpl   $0x64,-0xc(%ebp)
  6e:	74 1c                	je     8c <testuidgid+0x8c>
    printf(2, "Error: UID was not preserved\n");
  70:	83 ec 08             	sub    $0x8,%esp
  73:	68 8b 0d 00 00       	push   $0xd8b
  78:	6a 02                	push   $0x2
  7a:	e8 18 09 00 00       	call   997 <printf>
  7f:	83 c4 10             	add    $0x10,%esp
    return -1;
  82:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  87:	e9 4b 03 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "Current UID is: %d\n", uid);
  8c:	83 ec 04             	sub    $0x4,%esp
  8f:	ff 75 f4             	pushl  -0xc(%ebp)
  92:	68 50 0d 00 00       	push   $0xd50
  97:	6a 02                	push   $0x2
  99:	e8 f9 08 00 00       	call   997 <printf>
  9e:	83 c4 10             	add    $0x10,%esp
  printf(2, "Attempting to set UID to -1\n");
  a1:	83 ec 08             	sub    $0x8,%esp
  a4:	68 a9 0d 00 00       	push   $0xda9
  a9:	6a 02                	push   $0x2
  ab:	e8 e7 08 00 00       	call   997 <printf>
  b0:	83 c4 10             	add    $0x10,%esp
  if(setuid(-1) == 0){
  b3:	83 ec 0c             	sub    $0xc,%esp
  b6:	6a ff                	push   $0xffffffff
  b8:	e8 eb 07 00 00       	call   8a8 <setuid>
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	85 c0                	test   %eax,%eax
  c2:	75 1c                	jne    e0 <testuidgid+0xe0>
    printf(2, "UID was set to negative number\n");
  c4:	83 ec 08             	sub    $0x8,%esp
  c7:	68 c8 0d 00 00       	push   $0xdc8
  cc:	6a 02                	push   $0x2
  ce:	e8 c4 08 00 00       	call   997 <printf>
  d3:	83 c4 10             	add    $0x10,%esp
    return -1;
  d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  db:	e9 f7 02 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "Failed to set UID to -1\n");
  e0:	83 ec 08             	sub    $0x8,%esp
  e3:	68 e8 0d 00 00       	push   $0xde8
  e8:	6a 02                	push   $0x2
  ea:	e8 a8 08 00 00       	call   997 <printf>
  ef:	83 c4 10             	add    $0x10,%esp
  if((uid = getuid()) != 100){
  f2:	e8 99 07 00 00       	call   890 <getuid>
  f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  fa:	83 7d f4 64          	cmpl   $0x64,-0xc(%ebp)
  fe:	74 1c                	je     11c <testuidgid+0x11c>
    printf(2, "Error: UID was not preserved\n");
 100:	83 ec 08             	sub    $0x8,%esp
 103:	68 8b 0d 00 00       	push   $0xd8b
 108:	6a 02                	push   $0x2
 10a:	e8 88 08 00 00       	call   997 <printf>
 10f:	83 c4 10             	add    $0x10,%esp
    return -1;
 112:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 117:	e9 bb 02 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "UID is %d\n", uid);
 11c:	83 ec 04             	sub    $0x4,%esp
 11f:	ff 75 f4             	pushl  -0xc(%ebp)
 122:	68 01 0e 00 00       	push   $0xe01
 127:	6a 02                	push   $0x2
 129:	e8 69 08 00 00       	call   997 <printf>
 12e:	83 c4 10             	add    $0x10,%esp
  printf(2, "Attempting to set UID to 32768\n");
 131:	83 ec 08             	sub    $0x8,%esp
 134:	68 0c 0e 00 00       	push   $0xe0c
 139:	6a 02                	push   $0x2
 13b:	e8 57 08 00 00       	call   997 <printf>
 140:	83 c4 10             	add    $0x10,%esp
  if (setuid(32768) == 0){
 143:	83 ec 0c             	sub    $0xc,%esp
 146:	68 00 80 00 00       	push   $0x8000
 14b:	e8 58 07 00 00       	call   8a8 <setuid>
 150:	83 c4 10             	add    $0x10,%esp
 153:	85 c0                	test   %eax,%eax
 155:	75 1c                	jne    173 <testuidgid+0x173>
    printf(2, "UID was set to number outside the maximum value\n");
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	68 2c 0e 00 00       	push   $0xe2c
 15f:	6a 02                	push   $0x2
 161:	e8 31 08 00 00       	call   997 <printf>
 166:	83 c4 10             	add    $0x10,%esp
    return -1;
 169:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 16e:	e9 64 02 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  if ((uid = getuid()) != 100){
 173:	e8 18 07 00 00       	call   890 <getuid>
 178:	89 45 f4             	mov    %eax,-0xc(%ebp)
 17b:	83 7d f4 64          	cmpl   $0x64,-0xc(%ebp)
 17f:	74 1c                	je     19d <testuidgid+0x19d>
    printf(2, "Error: UID was not preserved\n");
 181:	83 ec 08             	sub    $0x8,%esp
 184:	68 8b 0d 00 00       	push   $0xd8b
 189:	6a 02                	push   $0x2
 18b:	e8 07 08 00 00       	call   997 <printf>
 190:	83 c4 10             	add    $0x10,%esp
    return -1;
 193:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 198:	e9 3a 02 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "Failed to set UID to 32768\n");
 19d:	83 ec 08             	sub    $0x8,%esp
 1a0:	68 5d 0e 00 00       	push   $0xe5d
 1a5:	6a 02                	push   $0x2
 1a7:	e8 eb 07 00 00       	call   997 <printf>
 1ac:	83 c4 10             	add    $0x10,%esp
  printf(2, "UID is %d\n", uid);
 1af:	83 ec 04             	sub    $0x4,%esp
 1b2:	ff 75 f4             	pushl  -0xc(%ebp)
 1b5:	68 01 0e 00 00       	push   $0xe01
 1ba:	6a 02                	push   $0x2
 1bc:	e8 d6 07 00 00       	call   997 <printf>
 1c1:	83 c4 10             	add    $0x10,%esp
  printf(2, "Failed to set UID to 32768\n");
 1c4:	83 ec 08             	sub    $0x8,%esp
 1c7:	68 5d 0e 00 00       	push   $0xe5d
 1cc:	6a 02                	push   $0x2
 1ce:	e8 c4 07 00 00       	call   997 <printf>
 1d3:	83 c4 10             	add    $0x10,%esp
  
  gid = getgid();
 1d6:	e8 bd 06 00 00       	call   898 <getgid>
 1db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printf(2, "Current GID is: %d\n", gid);
 1de:	83 ec 04             	sub    $0x4,%esp
 1e1:	ff 75 f0             	pushl  -0x10(%ebp)
 1e4:	68 79 0e 00 00       	push   $0xe79
 1e9:	6a 02                	push   $0x2
 1eb:	e8 a7 07 00 00       	call   997 <printf>
 1f0:	83 c4 10             	add    $0x10,%esp

  printf(2, "Setting GID to 100\n");
 1f3:	83 ec 08             	sub    $0x8,%esp
 1f6:	68 8d 0e 00 00       	push   $0xe8d
 1fb:	6a 02                	push   $0x2
 1fd:	e8 95 07 00 00       	call   997 <printf>
 202:	83 c4 10             	add    $0x10,%esp
  if (setgid(100) < 0){
 205:	83 ec 0c             	sub    $0xc,%esp
 208:	6a 64                	push   $0x64
 20a:	e8 a1 06 00 00       	call   8b0 <setgid>
 20f:	83 c4 10             	add    $0x10,%esp
 212:	85 c0                	test   %eax,%eax
 214:	79 1c                	jns    232 <testuidgid+0x232>
    printf(2, "Error setting GID\n");
 216:	83 ec 08             	sub    $0x8,%esp
 219:	68 a1 0e 00 00       	push   $0xea1
 21e:	6a 02                	push   $0x2
 220:	e8 72 07 00 00       	call   997 <printf>
 225:	83 c4 10             	add    $0x10,%esp
    return -1;
 228:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22d:	e9 a5 01 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  if((gid = getgid()) != 100){
 232:	e8 61 06 00 00       	call   898 <getgid>
 237:	89 45 f0             	mov    %eax,-0x10(%ebp)
 23a:	83 7d f0 64          	cmpl   $0x64,-0x10(%ebp)
 23e:	74 1c                	je     25c <testuidgid+0x25c>
    printf(2, "Error: GID was not preserved\n");
 240:	83 ec 08             	sub    $0x8,%esp
 243:	68 b4 0e 00 00       	push   $0xeb4
 248:	6a 02                	push   $0x2
 24a:	e8 48 07 00 00       	call   997 <printf>
 24f:	83 c4 10             	add    $0x10,%esp
    return -1;
 252:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 257:	e9 7b 01 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "Current GID is: %d\n", gid);
 25c:	83 ec 04             	sub    $0x4,%esp
 25f:	ff 75 f0             	pushl  -0x10(%ebp)
 262:	68 79 0e 00 00       	push   $0xe79
 267:	6a 02                	push   $0x2
 269:	e8 29 07 00 00       	call   997 <printf>
 26e:	83 c4 10             	add    $0x10,%esp
  printf(2, "Attempting to set GID to -1\n");
 271:	83 ec 08             	sub    $0x8,%esp
 274:	68 d2 0e 00 00       	push   $0xed2
 279:	6a 02                	push   $0x2
 27b:	e8 17 07 00 00       	call   997 <printf>
 280:	83 c4 10             	add    $0x10,%esp
  if(setgid(-1) == 0){
 283:	83 ec 0c             	sub    $0xc,%esp
 286:	6a ff                	push   $0xffffffff
 288:	e8 23 06 00 00       	call   8b0 <setgid>
 28d:	83 c4 10             	add    $0x10,%esp
 290:	85 c0                	test   %eax,%eax
 292:	75 1c                	jne    2b0 <testuidgid+0x2b0>
    printf(2, "GID was set to negative number\n");
 294:	83 ec 08             	sub    $0x8,%esp
 297:	68 f0 0e 00 00       	push   $0xef0
 29c:	6a 02                	push   $0x2
 29e:	e8 f4 06 00 00       	call   997 <printf>
 2a3:	83 c4 10             	add    $0x10,%esp
    return -1;
 2a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ab:	e9 27 01 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "Failed to set GID to -1\n");
 2b0:	83 ec 08             	sub    $0x8,%esp
 2b3:	68 10 0f 00 00       	push   $0xf10
 2b8:	6a 02                	push   $0x2
 2ba:	e8 d8 06 00 00       	call   997 <printf>
 2bf:	83 c4 10             	add    $0x10,%esp
  if((gid = getgid()) != 100){
 2c2:	e8 d1 05 00 00       	call   898 <getgid>
 2c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2ca:	83 7d f0 64          	cmpl   $0x64,-0x10(%ebp)
 2ce:	74 1c                	je     2ec <testuidgid+0x2ec>
    printf(2, "Error: GID was not preserved\n");
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	68 b4 0e 00 00       	push   $0xeb4
 2d8:	6a 02                	push   $0x2
 2da:	e8 b8 06 00 00       	call   997 <printf>
 2df:	83 c4 10             	add    $0x10,%esp
    return -1;
 2e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e7:	e9 eb 00 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "GID is %d\n", gid);
 2ec:	83 ec 04             	sub    $0x4,%esp
 2ef:	ff 75 f0             	pushl  -0x10(%ebp)
 2f2:	68 29 0f 00 00       	push   $0xf29
 2f7:	6a 02                	push   $0x2
 2f9:	e8 99 06 00 00       	call   997 <printf>
 2fe:	83 c4 10             	add    $0x10,%esp
  printf(2, "Attempting to set GID to 32768\n");
 301:	83 ec 08             	sub    $0x8,%esp
 304:	68 34 0f 00 00       	push   $0xf34
 309:	6a 02                	push   $0x2
 30b:	e8 87 06 00 00       	call   997 <printf>
 310:	83 c4 10             	add    $0x10,%esp
  if (setgid(32768) == 0){
 313:	83 ec 0c             	sub    $0xc,%esp
 316:	68 00 80 00 00       	push   $0x8000
 31b:	e8 90 05 00 00       	call   8b0 <setgid>
 320:	83 c4 10             	add    $0x10,%esp
 323:	85 c0                	test   %eax,%eax
 325:	75 1c                	jne    343 <testuidgid+0x343>
    printf(2, "GID was set to number outside the maximum value\n");
 327:	83 ec 08             	sub    $0x8,%esp
 32a:	68 54 0f 00 00       	push   $0xf54
 32f:	6a 02                	push   $0x2
 331:	e8 61 06 00 00       	call   997 <printf>
 336:	83 c4 10             	add    $0x10,%esp
    return -1;
 339:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 33e:	e9 94 00 00 00       	jmp    3d7 <testuidgid+0x3d7>
  }
  if ((gid = getgid()) != 100){
 343:	e8 50 05 00 00       	call   898 <getgid>
 348:	89 45 f0             	mov    %eax,-0x10(%ebp)
 34b:	83 7d f0 64          	cmpl   $0x64,-0x10(%ebp)
 34f:	74 19                	je     36a <testuidgid+0x36a>
    printf(2, "Error: GID was not preserved\n");
 351:	83 ec 08             	sub    $0x8,%esp
 354:	68 b4 0e 00 00       	push   $0xeb4
 359:	6a 02                	push   $0x2
 35b:	e8 37 06 00 00       	call   997 <printf>
 360:	83 c4 10             	add    $0x10,%esp
    return -1;
 363:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 368:	eb 6d                	jmp    3d7 <testuidgid+0x3d7>
  }
  printf(2, "Failed to set GID to 32768\n");
 36a:	83 ec 08             	sub    $0x8,%esp
 36d:	68 85 0f 00 00       	push   $0xf85
 372:	6a 02                	push   $0x2
 374:	e8 1e 06 00 00       	call   997 <printf>
 379:	83 c4 10             	add    $0x10,%esp
  printf(2, "GID is %d\n", gid);
 37c:	83 ec 04             	sub    $0x4,%esp
 37f:	ff 75 f0             	pushl  -0x10(%ebp)
 382:	68 29 0f 00 00       	push   $0xf29
 387:	6a 02                	push   $0x2
 389:	e8 09 06 00 00       	call   997 <printf>
 38e:	83 c4 10             	add    $0x10,%esp
  printf(2, "Failed to set GID to 32768\n");
 391:	83 ec 08             	sub    $0x8,%esp
 394:	68 85 0f 00 00       	push   $0xf85
 399:	6a 02                	push   $0x2
 39b:	e8 f7 05 00 00       	call   997 <printf>
 3a0:	83 c4 10             	add    $0x10,%esp
  
  ppid = getppid();
 3a3:	e8 f8 04 00 00       	call   8a0 <getppid>
 3a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  printf(2, "My parent process is: %d\n", ppid);
 3ab:	83 ec 04             	sub    $0x4,%esp
 3ae:	ff 75 ec             	pushl  -0x14(%ebp)
 3b1:	68 a1 0f 00 00       	push   $0xfa1
 3b6:	6a 02                	push   $0x2
 3b8:	e8 da 05 00 00       	call   997 <printf>
 3bd:	83 c4 10             	add    $0x10,%esp
  printf(2, "Done!\n");
 3c0:	83 ec 08             	sub    $0x8,%esp
 3c3:	68 bb 0f 00 00       	push   $0xfbb
 3c8:	6a 02                	push   $0x2
 3ca:	e8 c8 05 00 00       	call   997 <printf>
 3cf:	83 c4 10             	add    $0x10,%esp
  return 0;
 3d2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    

000003d9 <main>:

int
main (int argc, char * argv[])
{
 3d9:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 3dd:	83 e4 f0             	and    $0xfffffff0,%esp
 3e0:	ff 71 fc             	pushl  -0x4(%ecx)
 3e3:	55                   	push   %ebp
 3e4:	89 e5                	mov    %esp,%ebp
 3e6:	51                   	push   %ecx
 3e7:	83 ec 04             	sub    $0x4,%esp
  if (!testuidgid())
 3ea:	e8 11 fc ff ff       	call   0 <testuidgid>
 3ef:	85 c0                	test   %eax,%eax
 3f1:	75 14                	jne    407 <main+0x2e>
    printf(1, "All tests passed\n");
 3f3:	83 ec 08             	sub    $0x8,%esp
 3f6:	68 c2 0f 00 00       	push   $0xfc2
 3fb:	6a 01                	push   $0x1
 3fd:	e8 95 05 00 00       	call   997 <printf>
 402:	83 c4 10             	add    $0x10,%esp
 405:	eb 12                	jmp    419 <main+0x40>
  else
    printf(1, "Test failed!\n");
 407:	83 ec 08             	sub    $0x8,%esp
 40a:	68 d4 0f 00 00       	push   $0xfd4
 40f:	6a 01                	push   $0x1
 411:	e8 81 05 00 00       	call   997 <printf>
 416:	83 c4 10             	add    $0x10,%esp
  exit();
 419:	e8 c2 03 00 00       	call   7e0 <exit>

0000041e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	57                   	push   %edi
 422:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 423:	8b 4d 08             	mov    0x8(%ebp),%ecx
 426:	8b 55 10             	mov    0x10(%ebp),%edx
 429:	8b 45 0c             	mov    0xc(%ebp),%eax
 42c:	89 cb                	mov    %ecx,%ebx
 42e:	89 df                	mov    %ebx,%edi
 430:	89 d1                	mov    %edx,%ecx
 432:	fc                   	cld    
 433:	f3 aa                	rep stos %al,%es:(%edi)
 435:	89 ca                	mov    %ecx,%edx
 437:	89 fb                	mov    %edi,%ebx
 439:	89 5d 08             	mov    %ebx,0x8(%ebp)
 43c:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 43f:	90                   	nop
 440:	5b                   	pop    %ebx
 441:	5f                   	pop    %edi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    

00000444 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 44a:	8b 45 08             	mov    0x8(%ebp),%eax
 44d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 450:	90                   	nop
 451:	8b 45 08             	mov    0x8(%ebp),%eax
 454:	8d 50 01             	lea    0x1(%eax),%edx
 457:	89 55 08             	mov    %edx,0x8(%ebp)
 45a:	8b 55 0c             	mov    0xc(%ebp),%edx
 45d:	8d 4a 01             	lea    0x1(%edx),%ecx
 460:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 463:	0f b6 12             	movzbl (%edx),%edx
 466:	88 10                	mov    %dl,(%eax)
 468:	0f b6 00             	movzbl (%eax),%eax
 46b:	84 c0                	test   %al,%al
 46d:	75 e2                	jne    451 <strcpy+0xd>
    ;
  return os;
 46f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 472:	c9                   	leave  
 473:	c3                   	ret    

00000474 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 477:	eb 08                	jmp    481 <strcmp+0xd>
    p++, q++;
 479:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 47d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 481:	8b 45 08             	mov    0x8(%ebp),%eax
 484:	0f b6 00             	movzbl (%eax),%eax
 487:	84 c0                	test   %al,%al
 489:	74 10                	je     49b <strcmp+0x27>
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	0f b6 10             	movzbl (%eax),%edx
 491:	8b 45 0c             	mov    0xc(%ebp),%eax
 494:	0f b6 00             	movzbl (%eax),%eax
 497:	38 c2                	cmp    %al,%dl
 499:	74 de                	je     479 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	0f b6 00             	movzbl (%eax),%eax
 4a1:	0f b6 d0             	movzbl %al,%edx
 4a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a7:	0f b6 00             	movzbl (%eax),%eax
 4aa:	0f b6 c0             	movzbl %al,%eax
 4ad:	29 c2                	sub    %eax,%edx
 4af:	89 d0                	mov    %edx,%eax
}
 4b1:	5d                   	pop    %ebp
 4b2:	c3                   	ret    

000004b3 <strlen>:

uint
strlen(char *s)
{
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 4b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 4c0:	eb 04                	jmp    4c6 <strlen+0x13>
 4c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 4c6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4c9:	8b 45 08             	mov    0x8(%ebp),%eax
 4cc:	01 d0                	add    %edx,%eax
 4ce:	0f b6 00             	movzbl (%eax),%eax
 4d1:	84 c0                	test   %al,%al
 4d3:	75 ed                	jne    4c2 <strlen+0xf>
    ;
  return n;
 4d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4d8:	c9                   	leave  
 4d9:	c3                   	ret    

000004da <memset>:

void*
memset(void *dst, int c, uint n)
{
 4da:	55                   	push   %ebp
 4db:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 4dd:	8b 45 10             	mov    0x10(%ebp),%eax
 4e0:	50                   	push   %eax
 4e1:	ff 75 0c             	pushl  0xc(%ebp)
 4e4:	ff 75 08             	pushl  0x8(%ebp)
 4e7:	e8 32 ff ff ff       	call   41e <stosb>
 4ec:	83 c4 0c             	add    $0xc,%esp
  return dst;
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4f2:	c9                   	leave  
 4f3:	c3                   	ret    

000004f4 <strchr>:

char*
strchr(const char *s, char c)
{
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	83 ec 04             	sub    $0x4,%esp
 4fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 500:	eb 14                	jmp    516 <strchr+0x22>
    if(*s == c)
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	0f b6 00             	movzbl (%eax),%eax
 508:	3a 45 fc             	cmp    -0x4(%ebp),%al
 50b:	75 05                	jne    512 <strchr+0x1e>
      return (char*)s;
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	eb 13                	jmp    525 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 512:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 516:	8b 45 08             	mov    0x8(%ebp),%eax
 519:	0f b6 00             	movzbl (%eax),%eax
 51c:	84 c0                	test   %al,%al
 51e:	75 e2                	jne    502 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 520:	b8 00 00 00 00       	mov    $0x0,%eax
}
 525:	c9                   	leave  
 526:	c3                   	ret    

00000527 <gets>:

char*
gets(char *buf, int max)
{
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 52d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 534:	eb 42                	jmp    578 <gets+0x51>
    cc = read(0, &c, 1);
 536:	83 ec 04             	sub    $0x4,%esp
 539:	6a 01                	push   $0x1
 53b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 53e:	50                   	push   %eax
 53f:	6a 00                	push   $0x0
 541:	e8 b2 02 00 00       	call   7f8 <read>
 546:	83 c4 10             	add    $0x10,%esp
 549:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 54c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 550:	7e 33                	jle    585 <gets+0x5e>
      break;
    buf[i++] = c;
 552:	8b 45 f4             	mov    -0xc(%ebp),%eax
 555:	8d 50 01             	lea    0x1(%eax),%edx
 558:	89 55 f4             	mov    %edx,-0xc(%ebp)
 55b:	89 c2                	mov    %eax,%edx
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	01 c2                	add    %eax,%edx
 562:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 566:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 568:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 56c:	3c 0a                	cmp    $0xa,%al
 56e:	74 16                	je     586 <gets+0x5f>
 570:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 574:	3c 0d                	cmp    $0xd,%al
 576:	74 0e                	je     586 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 578:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57b:	83 c0 01             	add    $0x1,%eax
 57e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 581:	7c b3                	jl     536 <gets+0xf>
 583:	eb 01                	jmp    586 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 585:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 586:	8b 55 f4             	mov    -0xc(%ebp),%edx
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	01 d0                	add    %edx,%eax
 58e:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 591:	8b 45 08             	mov    0x8(%ebp),%eax
}
 594:	c9                   	leave  
 595:	c3                   	ret    

00000596 <stat>:

int
stat(char *n, struct stat *st)
{
 596:	55                   	push   %ebp
 597:	89 e5                	mov    %esp,%ebp
 599:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 59c:	83 ec 08             	sub    $0x8,%esp
 59f:	6a 00                	push   $0x0
 5a1:	ff 75 08             	pushl  0x8(%ebp)
 5a4:	e8 77 02 00 00       	call   820 <open>
 5a9:	83 c4 10             	add    $0x10,%esp
 5ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 5af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5b3:	79 07                	jns    5bc <stat+0x26>
    return -1;
 5b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5ba:	eb 25                	jmp    5e1 <stat+0x4b>
  r = fstat(fd, st);
 5bc:	83 ec 08             	sub    $0x8,%esp
 5bf:	ff 75 0c             	pushl  0xc(%ebp)
 5c2:	ff 75 f4             	pushl  -0xc(%ebp)
 5c5:	e8 6e 02 00 00       	call   838 <fstat>
 5ca:	83 c4 10             	add    $0x10,%esp
 5cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	ff 75 f4             	pushl  -0xc(%ebp)
 5d6:	e8 2d 02 00 00       	call   808 <close>
 5db:	83 c4 10             	add    $0x10,%esp
  return r;
 5de:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 5e1:	c9                   	leave  
 5e2:	c3                   	ret    

000005e3 <atoi>:

int
atoi(const char *s)
{
 5e3:	55                   	push   %ebp
 5e4:	89 e5                	mov    %esp,%ebp
 5e6:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 5e9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 5f0:	eb 04                	jmp    5f6 <atoi+0x13>
 5f2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	0f b6 00             	movzbl (%eax),%eax
 5fc:	3c 20                	cmp    $0x20,%al
 5fe:	74 f2                	je     5f2 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	0f b6 00             	movzbl (%eax),%eax
 606:	3c 2d                	cmp    $0x2d,%al
 608:	75 07                	jne    611 <atoi+0x2e>
 60a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 60f:	eb 05                	jmp    616 <atoi+0x33>
 611:	b8 01 00 00 00       	mov    $0x1,%eax
 616:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 619:	8b 45 08             	mov    0x8(%ebp),%eax
 61c:	0f b6 00             	movzbl (%eax),%eax
 61f:	3c 2b                	cmp    $0x2b,%al
 621:	74 0a                	je     62d <atoi+0x4a>
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	0f b6 00             	movzbl (%eax),%eax
 629:	3c 2d                	cmp    $0x2d,%al
 62b:	75 2b                	jne    658 <atoi+0x75>
    s++;
 62d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 631:	eb 25                	jmp    658 <atoi+0x75>
    n = n*10 + *s++ - '0';
 633:	8b 55 fc             	mov    -0x4(%ebp),%edx
 636:	89 d0                	mov    %edx,%eax
 638:	c1 e0 02             	shl    $0x2,%eax
 63b:	01 d0                	add    %edx,%eax
 63d:	01 c0                	add    %eax,%eax
 63f:	89 c1                	mov    %eax,%ecx
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	8d 50 01             	lea    0x1(%eax),%edx
 647:	89 55 08             	mov    %edx,0x8(%ebp)
 64a:	0f b6 00             	movzbl (%eax),%eax
 64d:	0f be c0             	movsbl %al,%eax
 650:	01 c8                	add    %ecx,%eax
 652:	83 e8 30             	sub    $0x30,%eax
 655:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	0f b6 00             	movzbl (%eax),%eax
 65e:	3c 2f                	cmp    $0x2f,%al
 660:	7e 0a                	jle    66c <atoi+0x89>
 662:	8b 45 08             	mov    0x8(%ebp),%eax
 665:	0f b6 00             	movzbl (%eax),%eax
 668:	3c 39                	cmp    $0x39,%al
 66a:	7e c7                	jle    633 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 66c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66f:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 673:	c9                   	leave  
 674:	c3                   	ret    

00000675 <atoo>:

int
atoo(const char *s)
{
 675:	55                   	push   %ebp
 676:	89 e5                	mov    %esp,%ebp
 678:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 67b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 682:	eb 04                	jmp    688 <atoo+0x13>
 684:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 688:	8b 45 08             	mov    0x8(%ebp),%eax
 68b:	0f b6 00             	movzbl (%eax),%eax
 68e:	3c 20                	cmp    $0x20,%al
 690:	74 f2                	je     684 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	0f b6 00             	movzbl (%eax),%eax
 698:	3c 2d                	cmp    $0x2d,%al
 69a:	75 07                	jne    6a3 <atoo+0x2e>
 69c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 6a1:	eb 05                	jmp    6a8 <atoo+0x33>
 6a3:	b8 01 00 00 00       	mov    $0x1,%eax
 6a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	0f b6 00             	movzbl (%eax),%eax
 6b1:	3c 2b                	cmp    $0x2b,%al
 6b3:	74 0a                	je     6bf <atoo+0x4a>
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	0f b6 00             	movzbl (%eax),%eax
 6bb:	3c 2d                	cmp    $0x2d,%al
 6bd:	75 27                	jne    6e6 <atoo+0x71>
    s++;
 6bf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 6c3:	eb 21                	jmp    6e6 <atoo+0x71>
    n = n*8 + *s++ - '0';
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 6cf:	8b 45 08             	mov    0x8(%ebp),%eax
 6d2:	8d 50 01             	lea    0x1(%eax),%edx
 6d5:	89 55 08             	mov    %edx,0x8(%ebp)
 6d8:	0f b6 00             	movzbl (%eax),%eax
 6db:	0f be c0             	movsbl %al,%eax
 6de:	01 c8                	add    %ecx,%eax
 6e0:	83 e8 30             	sub    $0x30,%eax
 6e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	0f b6 00             	movzbl (%eax),%eax
 6ec:	3c 2f                	cmp    $0x2f,%al
 6ee:	7e 0a                	jle    6fa <atoo+0x85>
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	0f b6 00             	movzbl (%eax),%eax
 6f6:	3c 37                	cmp    $0x37,%al
 6f8:	7e cb                	jle    6c5 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 6fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fd:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 701:	c9                   	leave  
 702:	c3                   	ret    

00000703 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 703:	55                   	push   %ebp
 704:	89 e5                	mov    %esp,%ebp
 706:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 70f:	8b 45 0c             	mov    0xc(%ebp),%eax
 712:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 715:	eb 17                	jmp    72e <memmove+0x2b>
    *dst++ = *src++;
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	8d 50 01             	lea    0x1(%eax),%edx
 71d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 720:	8b 55 f8             	mov    -0x8(%ebp),%edx
 723:	8d 4a 01             	lea    0x1(%edx),%ecx
 726:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 729:	0f b6 12             	movzbl (%edx),%edx
 72c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 72e:	8b 45 10             	mov    0x10(%ebp),%eax
 731:	8d 50 ff             	lea    -0x1(%eax),%edx
 734:	89 55 10             	mov    %edx,0x10(%ebp)
 737:	85 c0                	test   %eax,%eax
 739:	7f dc                	jg     717 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 73e:	c9                   	leave  
 73f:	c3                   	ret    

00000740 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 746:	8b 4d 08             	mov    0x8(%ebp),%ecx
 749:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 74e:	89 c8                	mov    %ecx,%eax
 750:	f7 e2                	mul    %edx
 752:	89 d0                	mov    %edx,%eax
 754:	c1 e8 06             	shr    $0x6,%eax
 757:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 75d:	29 c1                	sub    %eax,%ecx
 75f:	89 c8                	mov    %ecx,%eax
 761:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 76c:	f7 e2                	mul    %edx
 76e:	89 d0                	mov    %edx,%eax
 770:	c1 e8 06             	shr    $0x6,%eax
 773:	83 ec 04             	sub    $0x4,%esp
 776:	50                   	push   %eax
 777:	68 e2 0f 00 00       	push   $0xfe2
 77c:	6a 01                	push   $0x1
 77e:	e8 14 02 00 00       	call   997 <printf>
 783:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 786:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 78a:	7e 17                	jle    7a3 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 78c:	83 ec 04             	sub    $0x4,%esp
 78f:	ff 75 f4             	pushl  -0xc(%ebp)
 792:	68 e6 0f 00 00       	push   $0xfe6
 797:	6a 01                	push   $0x1
 799:	e8 f9 01 00 00       	call   997 <printf>
 79e:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 7a1:	eb 32                	jmp    7d5 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 7a3:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 7a7:	7e 17                	jle    7c0 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 7a9:	83 ec 04             	sub    $0x4,%esp
 7ac:	ff 75 f4             	pushl  -0xc(%ebp)
 7af:	68 e9 0f 00 00       	push   $0xfe9
 7b4:	6a 01                	push   $0x1
 7b6:	e8 dc 01 00 00       	call   997 <printf>
 7bb:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 7be:	eb 15                	jmp    7d5 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 7c0:	83 ec 04             	sub    $0x4,%esp
 7c3:	ff 75 f4             	pushl  -0xc(%ebp)
 7c6:	68 ed 0f 00 00       	push   $0xfed
 7cb:	6a 01                	push   $0x1
 7cd:	e8 c5 01 00 00       	call   997 <printf>
 7d2:	83 c4 10             	add    $0x10,%esp
};
 7d5:	90                   	nop
 7d6:	c9                   	leave  
 7d7:	c3                   	ret    

000007d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7d8:	b8 01 00 00 00       	mov    $0x1,%eax
 7dd:	cd 40                	int    $0x40
 7df:	c3                   	ret    

000007e0 <exit>:
SYSCALL(exit)
 7e0:	b8 02 00 00 00       	mov    $0x2,%eax
 7e5:	cd 40                	int    $0x40
 7e7:	c3                   	ret    

000007e8 <wait>:
SYSCALL(wait)
 7e8:	b8 03 00 00 00       	mov    $0x3,%eax
 7ed:	cd 40                	int    $0x40
 7ef:	c3                   	ret    

000007f0 <pipe>:
SYSCALL(pipe)
 7f0:	b8 04 00 00 00       	mov    $0x4,%eax
 7f5:	cd 40                	int    $0x40
 7f7:	c3                   	ret    

000007f8 <read>:
SYSCALL(read)
 7f8:	b8 05 00 00 00       	mov    $0x5,%eax
 7fd:	cd 40                	int    $0x40
 7ff:	c3                   	ret    

00000800 <write>:
SYSCALL(write)
 800:	b8 10 00 00 00       	mov    $0x10,%eax
 805:	cd 40                	int    $0x40
 807:	c3                   	ret    

00000808 <close>:
SYSCALL(close)
 808:	b8 15 00 00 00       	mov    $0x15,%eax
 80d:	cd 40                	int    $0x40
 80f:	c3                   	ret    

00000810 <kill>:
SYSCALL(kill)
 810:	b8 06 00 00 00       	mov    $0x6,%eax
 815:	cd 40                	int    $0x40
 817:	c3                   	ret    

00000818 <exec>:
SYSCALL(exec)
 818:	b8 07 00 00 00       	mov    $0x7,%eax
 81d:	cd 40                	int    $0x40
 81f:	c3                   	ret    

00000820 <open>:
SYSCALL(open)
 820:	b8 0f 00 00 00       	mov    $0xf,%eax
 825:	cd 40                	int    $0x40
 827:	c3                   	ret    

00000828 <mknod>:
SYSCALL(mknod)
 828:	b8 11 00 00 00       	mov    $0x11,%eax
 82d:	cd 40                	int    $0x40
 82f:	c3                   	ret    

00000830 <unlink>:
SYSCALL(unlink)
 830:	b8 12 00 00 00       	mov    $0x12,%eax
 835:	cd 40                	int    $0x40
 837:	c3                   	ret    

00000838 <fstat>:
SYSCALL(fstat)
 838:	b8 08 00 00 00       	mov    $0x8,%eax
 83d:	cd 40                	int    $0x40
 83f:	c3                   	ret    

00000840 <link>:
SYSCALL(link)
 840:	b8 13 00 00 00       	mov    $0x13,%eax
 845:	cd 40                	int    $0x40
 847:	c3                   	ret    

00000848 <mkdir>:
SYSCALL(mkdir)
 848:	b8 14 00 00 00       	mov    $0x14,%eax
 84d:	cd 40                	int    $0x40
 84f:	c3                   	ret    

00000850 <chdir>:
SYSCALL(chdir)
 850:	b8 09 00 00 00       	mov    $0x9,%eax
 855:	cd 40                	int    $0x40
 857:	c3                   	ret    

00000858 <dup>:
SYSCALL(dup)
 858:	b8 0a 00 00 00       	mov    $0xa,%eax
 85d:	cd 40                	int    $0x40
 85f:	c3                   	ret    

00000860 <getpid>:
SYSCALL(getpid)
 860:	b8 0b 00 00 00       	mov    $0xb,%eax
 865:	cd 40                	int    $0x40
 867:	c3                   	ret    

00000868 <sbrk>:
SYSCALL(sbrk)
 868:	b8 0c 00 00 00       	mov    $0xc,%eax
 86d:	cd 40                	int    $0x40
 86f:	c3                   	ret    

00000870 <sleep>:
SYSCALL(sleep)
 870:	b8 0d 00 00 00       	mov    $0xd,%eax
 875:	cd 40                	int    $0x40
 877:	c3                   	ret    

00000878 <uptime>:
SYSCALL(uptime)
 878:	b8 0e 00 00 00       	mov    $0xe,%eax
 87d:	cd 40                	int    $0x40
 87f:	c3                   	ret    

00000880 <halt>:
SYSCALL(halt)
 880:	b8 16 00 00 00       	mov    $0x16,%eax
 885:	cd 40                	int    $0x40
 887:	c3                   	ret    

00000888 <date>:

SYSCALL(date)
 888:	b8 17 00 00 00       	mov    $0x17,%eax
 88d:	cd 40                	int    $0x40
 88f:	c3                   	ret    

00000890 <getuid>:
SYSCALL(getuid)
 890:	b8 18 00 00 00       	mov    $0x18,%eax
 895:	cd 40                	int    $0x40
 897:	c3                   	ret    

00000898 <getgid>:
SYSCALL(getgid)
 898:	b8 19 00 00 00       	mov    $0x19,%eax
 89d:	cd 40                	int    $0x40
 89f:	c3                   	ret    

000008a0 <getppid>:
SYSCALL(getppid)
 8a0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 8a5:	cd 40                	int    $0x40
 8a7:	c3                   	ret    

000008a8 <setuid>:
SYSCALL(setuid)
 8a8:	b8 1b 00 00 00       	mov    $0x1b,%eax
 8ad:	cd 40                	int    $0x40
 8af:	c3                   	ret    

000008b0 <setgid>:
SYSCALL(setgid)
 8b0:	b8 1c 00 00 00       	mov    $0x1c,%eax
 8b5:	cd 40                	int    $0x40
 8b7:	c3                   	ret    

000008b8 <getprocs>:
SYSCALL(getprocs)
 8b8:	b8 1d 00 00 00       	mov    $0x1d,%eax
 8bd:	cd 40                	int    $0x40
 8bf:	c3                   	ret    

000008c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	83 ec 18             	sub    $0x18,%esp
 8c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8c9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 8cc:	83 ec 04             	sub    $0x4,%esp
 8cf:	6a 01                	push   $0x1
 8d1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8d4:	50                   	push   %eax
 8d5:	ff 75 08             	pushl  0x8(%ebp)
 8d8:	e8 23 ff ff ff       	call   800 <write>
 8dd:	83 c4 10             	add    $0x10,%esp
}
 8e0:	90                   	nop
 8e1:	c9                   	leave  
 8e2:	c3                   	ret    

000008e3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 8e3:	55                   	push   %ebp
 8e4:	89 e5                	mov    %esp,%ebp
 8e6:	53                   	push   %ebx
 8e7:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 8ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 8f1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 8f5:	74 17                	je     90e <printint+0x2b>
 8f7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8fb:	79 11                	jns    90e <printint+0x2b>
    neg = 1;
 8fd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 904:	8b 45 0c             	mov    0xc(%ebp),%eax
 907:	f7 d8                	neg    %eax
 909:	89 45 ec             	mov    %eax,-0x14(%ebp)
 90c:	eb 06                	jmp    914 <printint+0x31>
  } else {
    x = xx;
 90e:	8b 45 0c             	mov    0xc(%ebp),%eax
 911:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 914:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 91b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 91e:	8d 41 01             	lea    0x1(%ecx),%eax
 921:	89 45 f4             	mov    %eax,-0xc(%ebp)
 924:	8b 5d 10             	mov    0x10(%ebp),%ebx
 927:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92a:	ba 00 00 00 00       	mov    $0x0,%edx
 92f:	f7 f3                	div    %ebx
 931:	89 d0                	mov    %edx,%eax
 933:	0f b6 80 a4 12 00 00 	movzbl 0x12a4(%eax),%eax
 93a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 93e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 941:	8b 45 ec             	mov    -0x14(%ebp),%eax
 944:	ba 00 00 00 00       	mov    $0x0,%edx
 949:	f7 f3                	div    %ebx
 94b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 94e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 952:	75 c7                	jne    91b <printint+0x38>
  if(neg)
 954:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 958:	74 2d                	je     987 <printint+0xa4>
    buf[i++] = '-';
 95a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95d:	8d 50 01             	lea    0x1(%eax),%edx
 960:	89 55 f4             	mov    %edx,-0xc(%ebp)
 963:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 968:	eb 1d                	jmp    987 <printint+0xa4>
    putc(fd, buf[i]);
 96a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 96d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 970:	01 d0                	add    %edx,%eax
 972:	0f b6 00             	movzbl (%eax),%eax
 975:	0f be c0             	movsbl %al,%eax
 978:	83 ec 08             	sub    $0x8,%esp
 97b:	50                   	push   %eax
 97c:	ff 75 08             	pushl  0x8(%ebp)
 97f:	e8 3c ff ff ff       	call   8c0 <putc>
 984:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 987:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 98b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 98f:	79 d9                	jns    96a <printint+0x87>
    putc(fd, buf[i]);
}
 991:	90                   	nop
 992:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 995:	c9                   	leave  
 996:	c3                   	ret    

00000997 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 997:	55                   	push   %ebp
 998:	89 e5                	mov    %esp,%ebp
 99a:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 99d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 9a4:	8d 45 0c             	lea    0xc(%ebp),%eax
 9a7:	83 c0 04             	add    $0x4,%eax
 9aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 9ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 9b4:	e9 59 01 00 00       	jmp    b12 <printf+0x17b>
    c = fmt[i] & 0xff;
 9b9:	8b 55 0c             	mov    0xc(%ebp),%edx
 9bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9bf:	01 d0                	add    %edx,%eax
 9c1:	0f b6 00             	movzbl (%eax),%eax
 9c4:	0f be c0             	movsbl %al,%eax
 9c7:	25 ff 00 00 00       	and    $0xff,%eax
 9cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 9cf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9d3:	75 2c                	jne    a01 <printf+0x6a>
      if(c == '%'){
 9d5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9d9:	75 0c                	jne    9e7 <printf+0x50>
        state = '%';
 9db:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 9e2:	e9 27 01 00 00       	jmp    b0e <printf+0x177>
      } else {
        putc(fd, c);
 9e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9ea:	0f be c0             	movsbl %al,%eax
 9ed:	83 ec 08             	sub    $0x8,%esp
 9f0:	50                   	push   %eax
 9f1:	ff 75 08             	pushl  0x8(%ebp)
 9f4:	e8 c7 fe ff ff       	call   8c0 <putc>
 9f9:	83 c4 10             	add    $0x10,%esp
 9fc:	e9 0d 01 00 00       	jmp    b0e <printf+0x177>
      }
    } else if(state == '%'){
 a01:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 a05:	0f 85 03 01 00 00    	jne    b0e <printf+0x177>
      if(c == 'd'){
 a0b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 a0f:	75 1e                	jne    a2f <printf+0x98>
        printint(fd, *ap, 10, 1);
 a11:	8b 45 e8             	mov    -0x18(%ebp),%eax
 a14:	8b 00                	mov    (%eax),%eax
 a16:	6a 01                	push   $0x1
 a18:	6a 0a                	push   $0xa
 a1a:	50                   	push   %eax
 a1b:	ff 75 08             	pushl  0x8(%ebp)
 a1e:	e8 c0 fe ff ff       	call   8e3 <printint>
 a23:	83 c4 10             	add    $0x10,%esp
        ap++;
 a26:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 a2a:	e9 d8 00 00 00       	jmp    b07 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 a2f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 a33:	74 06                	je     a3b <printf+0xa4>
 a35:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 a39:	75 1e                	jne    a59 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 a3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 a3e:	8b 00                	mov    (%eax),%eax
 a40:	6a 00                	push   $0x0
 a42:	6a 10                	push   $0x10
 a44:	50                   	push   %eax
 a45:	ff 75 08             	pushl  0x8(%ebp)
 a48:	e8 96 fe ff ff       	call   8e3 <printint>
 a4d:	83 c4 10             	add    $0x10,%esp
        ap++;
 a50:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 a54:	e9 ae 00 00 00       	jmp    b07 <printf+0x170>
      } else if(c == 's'){
 a59:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 a5d:	75 43                	jne    aa2 <printf+0x10b>
        s = (char*)*ap;
 a5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 a62:	8b 00                	mov    (%eax),%eax
 a64:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 a67:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 a6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a6f:	75 25                	jne    a96 <printf+0xff>
          s = "(null)";
 a71:	c7 45 f4 f2 0f 00 00 	movl   $0xff2,-0xc(%ebp)
        while(*s != 0){
 a78:	eb 1c                	jmp    a96 <printf+0xff>
          putc(fd, *s);
 a7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7d:	0f b6 00             	movzbl (%eax),%eax
 a80:	0f be c0             	movsbl %al,%eax
 a83:	83 ec 08             	sub    $0x8,%esp
 a86:	50                   	push   %eax
 a87:	ff 75 08             	pushl  0x8(%ebp)
 a8a:	e8 31 fe ff ff       	call   8c0 <putc>
 a8f:	83 c4 10             	add    $0x10,%esp
          s++;
 a92:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a99:	0f b6 00             	movzbl (%eax),%eax
 a9c:	84 c0                	test   %al,%al
 a9e:	75 da                	jne    a7a <printf+0xe3>
 aa0:	eb 65                	jmp    b07 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 aa2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 aa6:	75 1d                	jne    ac5 <printf+0x12e>
        putc(fd, *ap);
 aa8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 aab:	8b 00                	mov    (%eax),%eax
 aad:	0f be c0             	movsbl %al,%eax
 ab0:	83 ec 08             	sub    $0x8,%esp
 ab3:	50                   	push   %eax
 ab4:	ff 75 08             	pushl  0x8(%ebp)
 ab7:	e8 04 fe ff ff       	call   8c0 <putc>
 abc:	83 c4 10             	add    $0x10,%esp
        ap++;
 abf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 ac3:	eb 42                	jmp    b07 <printf+0x170>
      } else if(c == '%'){
 ac5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 ac9:	75 17                	jne    ae2 <printf+0x14b>
        putc(fd, c);
 acb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 ace:	0f be c0             	movsbl %al,%eax
 ad1:	83 ec 08             	sub    $0x8,%esp
 ad4:	50                   	push   %eax
 ad5:	ff 75 08             	pushl  0x8(%ebp)
 ad8:	e8 e3 fd ff ff       	call   8c0 <putc>
 add:	83 c4 10             	add    $0x10,%esp
 ae0:	eb 25                	jmp    b07 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 ae2:	83 ec 08             	sub    $0x8,%esp
 ae5:	6a 25                	push   $0x25
 ae7:	ff 75 08             	pushl  0x8(%ebp)
 aea:	e8 d1 fd ff ff       	call   8c0 <putc>
 aef:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 af2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 af5:	0f be c0             	movsbl %al,%eax
 af8:	83 ec 08             	sub    $0x8,%esp
 afb:	50                   	push   %eax
 afc:	ff 75 08             	pushl  0x8(%ebp)
 aff:	e8 bc fd ff ff       	call   8c0 <putc>
 b04:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 b07:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b0e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 b12:	8b 55 0c             	mov    0xc(%ebp),%edx
 b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b18:	01 d0                	add    %edx,%eax
 b1a:	0f b6 00             	movzbl (%eax),%eax
 b1d:	84 c0                	test   %al,%al
 b1f:	0f 85 94 fe ff ff    	jne    9b9 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 b25:	90                   	nop
 b26:	c9                   	leave  
 b27:	c3                   	ret    

00000b28 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b28:	55                   	push   %ebp
 b29:	89 e5                	mov    %esp,%ebp
 b2b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b2e:	8b 45 08             	mov    0x8(%ebp),%eax
 b31:	83 e8 08             	sub    $0x8,%eax
 b34:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b37:	a1 c0 12 00 00       	mov    0x12c0,%eax
 b3c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 b3f:	eb 24                	jmp    b65 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b41:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b44:	8b 00                	mov    (%eax),%eax
 b46:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 b49:	77 12                	ja     b5d <free+0x35>
 b4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b4e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 b51:	77 24                	ja     b77 <free+0x4f>
 b53:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b56:	8b 00                	mov    (%eax),%eax
 b58:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 b5b:	77 1a                	ja     b77 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b60:	8b 00                	mov    (%eax),%eax
 b62:	89 45 fc             	mov    %eax,-0x4(%ebp)
 b65:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b68:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 b6b:	76 d4                	jbe    b41 <free+0x19>
 b6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b70:	8b 00                	mov    (%eax),%eax
 b72:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 b75:	76 ca                	jbe    b41 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 b77:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b7a:	8b 40 04             	mov    0x4(%eax),%eax
 b7d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 b84:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b87:	01 c2                	add    %eax,%edx
 b89:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b8c:	8b 00                	mov    (%eax),%eax
 b8e:	39 c2                	cmp    %eax,%edx
 b90:	75 24                	jne    bb6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 b92:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b95:	8b 50 04             	mov    0x4(%eax),%edx
 b98:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b9b:	8b 00                	mov    (%eax),%eax
 b9d:	8b 40 04             	mov    0x4(%eax),%eax
 ba0:	01 c2                	add    %eax,%edx
 ba2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ba5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 ba8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bab:	8b 00                	mov    (%eax),%eax
 bad:	8b 10                	mov    (%eax),%edx
 baf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 bb2:	89 10                	mov    %edx,(%eax)
 bb4:	eb 0a                	jmp    bc0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 bb6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bb9:	8b 10                	mov    (%eax),%edx
 bbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 bbe:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 bc0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bc3:	8b 40 04             	mov    0x4(%eax),%eax
 bc6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 bcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bd0:	01 d0                	add    %edx,%eax
 bd2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 bd5:	75 20                	jne    bf7 <free+0xcf>
    p->s.size += bp->s.size;
 bd7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bda:	8b 50 04             	mov    0x4(%eax),%edx
 bdd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 be0:	8b 40 04             	mov    0x4(%eax),%eax
 be3:	01 c2                	add    %eax,%edx
 be5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 be8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 beb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 bee:	8b 10                	mov    (%eax),%edx
 bf0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bf3:	89 10                	mov    %edx,(%eax)
 bf5:	eb 08                	jmp    bff <free+0xd7>
  } else
    p->s.ptr = bp;
 bf7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 bfa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 bfd:	89 10                	mov    %edx,(%eax)
  freep = p;
 bff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 c02:	a3 c0 12 00 00       	mov    %eax,0x12c0
}
 c07:	90                   	nop
 c08:	c9                   	leave  
 c09:	c3                   	ret    

00000c0a <morecore>:

static Header*
morecore(uint nu)
{
 c0a:	55                   	push   %ebp
 c0b:	89 e5                	mov    %esp,%ebp
 c0d:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 c10:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 c17:	77 07                	ja     c20 <morecore+0x16>
    nu = 4096;
 c19:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 c20:	8b 45 08             	mov    0x8(%ebp),%eax
 c23:	c1 e0 03             	shl    $0x3,%eax
 c26:	83 ec 0c             	sub    $0xc,%esp
 c29:	50                   	push   %eax
 c2a:	e8 39 fc ff ff       	call   868 <sbrk>
 c2f:	83 c4 10             	add    $0x10,%esp
 c32:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 c35:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c39:	75 07                	jne    c42 <morecore+0x38>
    return 0;
 c3b:	b8 00 00 00 00       	mov    $0x0,%eax
 c40:	eb 26                	jmp    c68 <morecore+0x5e>
  hp = (Header*)p;
 c42:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 c48:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c4b:	8b 55 08             	mov    0x8(%ebp),%edx
 c4e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 c51:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c54:	83 c0 08             	add    $0x8,%eax
 c57:	83 ec 0c             	sub    $0xc,%esp
 c5a:	50                   	push   %eax
 c5b:	e8 c8 fe ff ff       	call   b28 <free>
 c60:	83 c4 10             	add    $0x10,%esp
  return freep;
 c63:	a1 c0 12 00 00       	mov    0x12c0,%eax
}
 c68:	c9                   	leave  
 c69:	c3                   	ret    

00000c6a <malloc>:

void*
malloc(uint nbytes)
{
 c6a:	55                   	push   %ebp
 c6b:	89 e5                	mov    %esp,%ebp
 c6d:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c70:	8b 45 08             	mov    0x8(%ebp),%eax
 c73:	83 c0 07             	add    $0x7,%eax
 c76:	c1 e8 03             	shr    $0x3,%eax
 c79:	83 c0 01             	add    $0x1,%eax
 c7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 c7f:	a1 c0 12 00 00       	mov    0x12c0,%eax
 c84:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c87:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 c8b:	75 23                	jne    cb0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 c8d:	c7 45 f0 b8 12 00 00 	movl   $0x12b8,-0x10(%ebp)
 c94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c97:	a3 c0 12 00 00       	mov    %eax,0x12c0
 c9c:	a1 c0 12 00 00       	mov    0x12c0,%eax
 ca1:	a3 b8 12 00 00       	mov    %eax,0x12b8
    base.s.size = 0;
 ca6:	c7 05 bc 12 00 00 00 	movl   $0x0,0x12bc
 cad:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cb3:	8b 00                	mov    (%eax),%eax
 cb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 cb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cbb:	8b 40 04             	mov    0x4(%eax),%eax
 cbe:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 cc1:	72 4d                	jb     d10 <malloc+0xa6>
      if(p->s.size == nunits)
 cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cc6:	8b 40 04             	mov    0x4(%eax),%eax
 cc9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ccc:	75 0c                	jne    cda <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 cce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cd1:	8b 10                	mov    (%eax),%edx
 cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cd6:	89 10                	mov    %edx,(%eax)
 cd8:	eb 26                	jmp    d00 <malloc+0x96>
      else {
        p->s.size -= nunits;
 cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cdd:	8b 40 04             	mov    0x4(%eax),%eax
 ce0:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ce3:	89 c2                	mov    %eax,%edx
 ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ce8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ceb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cee:	8b 40 04             	mov    0x4(%eax),%eax
 cf1:	c1 e0 03             	shl    $0x3,%eax
 cf4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 cf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cfa:	8b 55 ec             	mov    -0x14(%ebp),%edx
 cfd:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 d00:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d03:	a3 c0 12 00 00       	mov    %eax,0x12c0
      return (void*)(p + 1);
 d08:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d0b:	83 c0 08             	add    $0x8,%eax
 d0e:	eb 3b                	jmp    d4b <malloc+0xe1>
    }
    if(p == freep)
 d10:	a1 c0 12 00 00       	mov    0x12c0,%eax
 d15:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 d18:	75 1e                	jne    d38 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 d1a:	83 ec 0c             	sub    $0xc,%esp
 d1d:	ff 75 ec             	pushl  -0x14(%ebp)
 d20:	e8 e5 fe ff ff       	call   c0a <morecore>
 d25:	83 c4 10             	add    $0x10,%esp
 d28:	89 45 f4             	mov    %eax,-0xc(%ebp)
 d2b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 d2f:	75 07                	jne    d38 <malloc+0xce>
        return 0;
 d31:	b8 00 00 00 00       	mov    $0x0,%eax
 d36:	eb 13                	jmp    d4b <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d41:	8b 00                	mov    (%eax),%eax
 d43:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 d46:	e9 6d ff ff ff       	jmp    cb8 <malloc+0x4e>
}
 d4b:	c9                   	leave  
 d4c:	c3                   	ret    
