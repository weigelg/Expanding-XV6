
_time:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#ifdef CS333_P2
#include "types.h"
#include "user.h"
int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 20             	sub    $0x20,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int start_time, end_time, fd[2], n;
  n = 0;
  14:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  uint pid;
  start_time = uptime();
  1b:	e8 01 06 00 00       	call   621 <uptime>
  20:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (argc == 1){
  23:	83 3b 01             	cmpl   $0x1,(%ebx)
  26:	75 3d                	jne    65 <main+0x65>
    printf(1, " ran in ");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 f6 0a 00 00       	push   $0xaf6
  30:	6a 01                	push   $0x1
  32:	e8 09 07 00 00       	call   740 <printf>
  37:	83 c4 10             	add    $0x10,%esp
    zeropad(uptime() - start_time);
  3a:	e8 e2 05 00 00       	call   621 <uptime>
  3f:	2b 45 f4             	sub    -0xc(%ebp),%eax
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	50                   	push   %eax
  46:	e8 9e 04 00 00       	call   4e9 <zeropad>
  4b:	83 c4 10             	add    $0x10,%esp
    printf(1, " seconds\n");
  4e:	83 ec 08             	sub    $0x8,%esp
  51:	68 ff 0a 00 00       	push   $0xaff
  56:	6a 01                	push   $0x1
  58:	e8 e3 06 00 00       	call   740 <printf>
  5d:	83 c4 10             	add    $0x10,%esp
    exit();
  60:	e8 24 05 00 00       	call   589 <exit>
  }
  pipe(fd);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  6b:	50                   	push   %eax
  6c:	e8 28 05 00 00       	call   599 <pipe>
  71:	83 c4 10             	add    $0x10,%esp
  if ((pid = fork()) == 0){
  74:	e8 08 05 00 00       	call   581 <fork>
  79:	89 45 f0             	mov    %eax,-0x10(%ebp)
  7c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  80:	75 61                	jne    e3 <main+0xe3>
      if(exec(argv[1], &argv[1]) < 0){
  82:	8b 43 04             	mov    0x4(%ebx),%eax
  85:	8d 50 04             	lea    0x4(%eax),%edx
  88:	8b 43 04             	mov    0x4(%ebx),%eax
  8b:	83 c0 04             	add    $0x4,%eax
  8e:	8b 00                	mov    (%eax),%eax
  90:	83 ec 08             	sub    $0x8,%esp
  93:	52                   	push   %edx
  94:	50                   	push   %eax
  95:	e8 27 05 00 00       	call   5c1 <exec>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	85 c0                	test   %eax,%eax
  9f:	79 42                	jns    e3 <main+0xe3>
        close(fd[0]);
  a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  a4:	83 ec 0c             	sub    $0xc,%esp
  a7:	50                   	push   %eax
  a8:	e8 04 05 00 00       	call   5b1 <close>
  ad:	83 c4 10             	add    $0x10,%esp
        n = -1;
  b0:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
        write(fd[1], &n, sizeof(int));
  b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  ba:	83 ec 04             	sub    $0x4,%esp
  bd:	6a 04                	push   $0x4
  bf:	8d 55 e0             	lea    -0x20(%ebp),%edx
  c2:	52                   	push   %edx
  c3:	50                   	push   %eax
  c4:	e8 e0 04 00 00       	call   5a9 <write>
  c9:	83 c4 10             	add    $0x10,%esp
        printf(1, "exec error!\n");
  cc:	83 ec 08             	sub    $0x8,%esp
  cf:	68 09 0b 00 00       	push   $0xb09
  d4:	6a 01                	push   $0x1
  d6:	e8 65 06 00 00       	call   740 <printf>
  db:	83 c4 10             	add    $0x10,%esp
        exit();
  de:	e8 a6 04 00 00       	call   589 <exit>
      }
  }
  wait();
  e3:	e8 a9 04 00 00       	call   591 <wait>
  kill(pid);
  e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  eb:	83 ec 0c             	sub    $0xc,%esp
  ee:	50                   	push   %eax
  ef:	e8 c5 04 00 00       	call   5b9 <kill>
  f4:	83 c4 10             	add    $0x10,%esp
  end_time = uptime();
  f7:	e8 25 05 00 00       	call   621 <uptime>
  fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  close(fd[1]);
  ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 102:	83 ec 0c             	sub    $0xc,%esp
 105:	50                   	push   %eax
 106:	e8 a6 04 00 00       	call   5b1 <close>
 10b:	83 c4 10             	add    $0x10,%esp
  read(fd[0], &n, sizeof(int));
 10e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 111:	83 ec 04             	sub    $0x4,%esp
 114:	6a 04                	push   $0x4
 116:	8d 55 e0             	lea    -0x20(%ebp),%edx
 119:	52                   	push   %edx
 11a:	50                   	push   %eax
 11b:	e8 81 04 00 00       	call   5a1 <read>
 120:	83 c4 10             	add    $0x10,%esp
  if (n < 0){
 123:	8b 45 e0             	mov    -0x20(%ebp),%eax
 126:	85 c0                	test   %eax,%eax
 128:	79 4a                	jns    174 <main+0x174>
    close(fd[0]);
 12a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12d:	83 ec 0c             	sub    $0xc,%esp
 130:	50                   	push   %eax
 131:	e8 7b 04 00 00       	call   5b1 <close>
 136:	83 c4 10             	add    $0x10,%esp
    printf(1, " ran in ");
 139:	83 ec 08             	sub    $0x8,%esp
 13c:	68 f6 0a 00 00       	push   $0xaf6
 141:	6a 01                	push   $0x1
 143:	e8 f8 05 00 00       	call   740 <printf>
 148:	83 c4 10             	add    $0x10,%esp
    zeropad(end_time - start_time);
 14b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 14e:	2b 45 f4             	sub    -0xc(%ebp),%eax
 151:	83 ec 0c             	sub    $0xc,%esp
 154:	50                   	push   %eax
 155:	e8 8f 03 00 00       	call   4e9 <zeropad>
 15a:	83 c4 10             	add    $0x10,%esp
    printf(1, " seconds\n");
 15d:	83 ec 08             	sub    $0x8,%esp
 160:	68 ff 0a 00 00       	push   $0xaff
 165:	6a 01                	push   $0x1
 167:	e8 d4 05 00 00       	call   740 <printf>
 16c:	83 c4 10             	add    $0x10,%esp
    exit();
 16f:	e8 15 04 00 00       	call   589 <exit>
  }
  close(fd[0]);
 174:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 177:	83 ec 0c             	sub    $0xc,%esp
 17a:	50                   	push   %eax
 17b:	e8 31 04 00 00       	call   5b1 <close>
 180:	83 c4 10             	add    $0x10,%esp
  printf(1,"%s ran in ", argv[1]);
 183:	8b 43 04             	mov    0x4(%ebx),%eax
 186:	83 c0 04             	add    $0x4,%eax
 189:	8b 00                	mov    (%eax),%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	50                   	push   %eax
 18f:	68 16 0b 00 00       	push   $0xb16
 194:	6a 01                	push   $0x1
 196:	e8 a5 05 00 00       	call   740 <printf>
 19b:	83 c4 10             	add    $0x10,%esp
  zeropad(end_time - start_time);
 19e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 1a1:	2b 45 f4             	sub    -0xc(%ebp),%eax
 1a4:	83 ec 0c             	sub    $0xc,%esp
 1a7:	50                   	push   %eax
 1a8:	e8 3c 03 00 00       	call   4e9 <zeropad>
 1ad:	83 c4 10             	add    $0x10,%esp
  printf(1, " seconds\n");
 1b0:	83 ec 08             	sub    $0x8,%esp
 1b3:	68 ff 0a 00 00       	push   $0xaff
 1b8:	6a 01                	push   $0x1
 1ba:	e8 81 05 00 00       	call   740 <printf>
 1bf:	83 c4 10             	add    $0x10,%esp
  exit();
 1c2:	e8 c2 03 00 00       	call   589 <exit>

000001c7 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	57                   	push   %edi
 1cb:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cf:	8b 55 10             	mov    0x10(%ebp),%edx
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	89 cb                	mov    %ecx,%ebx
 1d7:	89 df                	mov    %ebx,%edi
 1d9:	89 d1                	mov    %edx,%ecx
 1db:	fc                   	cld    
 1dc:	f3 aa                	rep stos %al,%es:(%edi)
 1de:	89 ca                	mov    %ecx,%edx
 1e0:	89 fb                	mov    %edi,%ebx
 1e2:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1e5:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1e8:	90                   	nop
 1e9:	5b                   	pop    %ebx
 1ea:	5f                   	pop    %edi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    

000001ed <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1ed:	55                   	push   %ebp
 1ee:	89 e5                	mov    %esp,%ebp
 1f0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1f9:	90                   	nop
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
 1fd:	8d 50 01             	lea    0x1(%eax),%edx
 200:	89 55 08             	mov    %edx,0x8(%ebp)
 203:	8b 55 0c             	mov    0xc(%ebp),%edx
 206:	8d 4a 01             	lea    0x1(%edx),%ecx
 209:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 20c:	0f b6 12             	movzbl (%edx),%edx
 20f:	88 10                	mov    %dl,(%eax)
 211:	0f b6 00             	movzbl (%eax),%eax
 214:	84 c0                	test   %al,%al
 216:	75 e2                	jne    1fa <strcpy+0xd>
    ;
  return os;
 218:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 21b:	c9                   	leave  
 21c:	c3                   	ret    

0000021d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 220:	eb 08                	jmp    22a <strcmp+0xd>
    p++, q++;
 222:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 226:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 00             	movzbl (%eax),%eax
 230:	84 c0                	test   %al,%al
 232:	74 10                	je     244 <strcmp+0x27>
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	38 c2                	cmp    %al,%dl
 242:	74 de                	je     222 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	0f b6 00             	movzbl (%eax),%eax
 24a:	0f b6 d0             	movzbl %al,%edx
 24d:	8b 45 0c             	mov    0xc(%ebp),%eax
 250:	0f b6 00             	movzbl (%eax),%eax
 253:	0f b6 c0             	movzbl %al,%eax
 256:	29 c2                	sub    %eax,%edx
 258:	89 d0                	mov    %edx,%eax
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    

0000025c <strlen>:

uint
strlen(char *s)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 262:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 269:	eb 04                	jmp    26f <strlen+0x13>
 26b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 26f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	01 d0                	add    %edx,%eax
 277:	0f b6 00             	movzbl (%eax),%eax
 27a:	84 c0                	test   %al,%al
 27c:	75 ed                	jne    26b <strlen+0xf>
    ;
  return n;
 27e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <memset>:

void*
memset(void *dst, int c, uint n)
{
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 286:	8b 45 10             	mov    0x10(%ebp),%eax
 289:	50                   	push   %eax
 28a:	ff 75 0c             	pushl  0xc(%ebp)
 28d:	ff 75 08             	pushl  0x8(%ebp)
 290:	e8 32 ff ff ff       	call   1c7 <stosb>
 295:	83 c4 0c             	add    $0xc,%esp
  return dst;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29b:	c9                   	leave  
 29c:	c3                   	ret    

0000029d <strchr>:

char*
strchr(const char *s, char c)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a6:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2a9:	eb 14                	jmp    2bf <strchr+0x22>
    if(*s == c)
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	0f b6 00             	movzbl (%eax),%eax
 2b1:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2b4:	75 05                	jne    2bb <strchr+0x1e>
      return (char*)s;
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	eb 13                	jmp    2ce <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2bb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	0f b6 00             	movzbl (%eax),%eax
 2c5:	84 c0                	test   %al,%al
 2c7:	75 e2                	jne    2ab <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ce:	c9                   	leave  
 2cf:	c3                   	ret    

000002d0 <gets>:

char*
gets(char *buf, int max)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2dd:	eb 42                	jmp    321 <gets+0x51>
    cc = read(0, &c, 1);
 2df:	83 ec 04             	sub    $0x4,%esp
 2e2:	6a 01                	push   $0x1
 2e4:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2e7:	50                   	push   %eax
 2e8:	6a 00                	push   $0x0
 2ea:	e8 b2 02 00 00       	call   5a1 <read>
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f9:	7e 33                	jle    32e <gets+0x5e>
      break;
    buf[i++] = c;
 2fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fe:	8d 50 01             	lea    0x1(%eax),%edx
 301:	89 55 f4             	mov    %edx,-0xc(%ebp)
 304:	89 c2                	mov    %eax,%edx
 306:	8b 45 08             	mov    0x8(%ebp),%eax
 309:	01 c2                	add    %eax,%edx
 30b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 311:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 315:	3c 0a                	cmp    $0xa,%al
 317:	74 16                	je     32f <gets+0x5f>
 319:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31d:	3c 0d                	cmp    $0xd,%al
 31f:	74 0e                	je     32f <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 321:	8b 45 f4             	mov    -0xc(%ebp),%eax
 324:	83 c0 01             	add    $0x1,%eax
 327:	3b 45 0c             	cmp    0xc(%ebp),%eax
 32a:	7c b3                	jl     2df <gets+0xf>
 32c:	eb 01                	jmp    32f <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 32e:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 32f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 332:	8b 45 08             	mov    0x8(%ebp),%eax
 335:	01 d0                	add    %edx,%eax
 337:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33d:	c9                   	leave  
 33e:	c3                   	ret    

0000033f <stat>:

int
stat(char *n, struct stat *st)
{
 33f:	55                   	push   %ebp
 340:	89 e5                	mov    %esp,%ebp
 342:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	pushl  0x8(%ebp)
 34d:	e8 77 02 00 00       	call   5c9 <open>
 352:	83 c4 10             	add    $0x10,%esp
 355:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 358:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35c:	79 07                	jns    365 <stat+0x26>
    return -1;
 35e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 363:	eb 25                	jmp    38a <stat+0x4b>
  r = fstat(fd, st);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	ff 75 0c             	pushl  0xc(%ebp)
 36b:	ff 75 f4             	pushl  -0xc(%ebp)
 36e:	e8 6e 02 00 00       	call   5e1 <fstat>
 373:	83 c4 10             	add    $0x10,%esp
 376:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 379:	83 ec 0c             	sub    $0xc,%esp
 37c:	ff 75 f4             	pushl  -0xc(%ebp)
 37f:	e8 2d 02 00 00       	call   5b1 <close>
 384:	83 c4 10             	add    $0x10,%esp
  return r;
 387:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 38a:	c9                   	leave  
 38b:	c3                   	ret    

0000038c <atoi>:

int
atoi(const char *s)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
 38f:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 392:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 399:	eb 04                	jmp    39f <atoi+0x13>
 39b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	0f b6 00             	movzbl (%eax),%eax
 3a5:	3c 20                	cmp    $0x20,%al
 3a7:	74 f2                	je     39b <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 3a9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	3c 2d                	cmp    $0x2d,%al
 3b1:	75 07                	jne    3ba <atoi+0x2e>
 3b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3b8:	eb 05                	jmp    3bf <atoi+0x33>
 3ba:	b8 01 00 00 00       	mov    $0x1,%eax
 3bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	3c 2b                	cmp    $0x2b,%al
 3ca:	74 0a                	je     3d6 <atoi+0x4a>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	3c 2d                	cmp    $0x2d,%al
 3d4:	75 2b                	jne    401 <atoi+0x75>
    s++;
 3d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 3da:	eb 25                	jmp    401 <atoi+0x75>
    n = n*10 + *s++ - '0';
 3dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3df:	89 d0                	mov    %edx,%eax
 3e1:	c1 e0 02             	shl    $0x2,%eax
 3e4:	01 d0                	add    %edx,%eax
 3e6:	01 c0                	add    %eax,%eax
 3e8:	89 c1                	mov    %eax,%ecx
 3ea:	8b 45 08             	mov    0x8(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 08             	mov    %edx,0x8(%ebp)
 3f3:	0f b6 00             	movzbl (%eax),%eax
 3f6:	0f be c0             	movsbl %al,%eax
 3f9:	01 c8                	add    %ecx,%eax
 3fb:	83 e8 30             	sub    $0x30,%eax
 3fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 401:	8b 45 08             	mov    0x8(%ebp),%eax
 404:	0f b6 00             	movzbl (%eax),%eax
 407:	3c 2f                	cmp    $0x2f,%al
 409:	7e 0a                	jle    415 <atoi+0x89>
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	0f b6 00             	movzbl (%eax),%eax
 411:	3c 39                	cmp    $0x39,%al
 413:	7e c7                	jle    3dc <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 415:	8b 45 f8             	mov    -0x8(%ebp),%eax
 418:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 41c:	c9                   	leave  
 41d:	c3                   	ret    

0000041e <atoo>:

int
atoo(const char *s)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 424:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 42b:	eb 04                	jmp    431 <atoo+0x13>
 42d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 431:	8b 45 08             	mov    0x8(%ebp),%eax
 434:	0f b6 00             	movzbl (%eax),%eax
 437:	3c 20                	cmp    $0x20,%al
 439:	74 f2                	je     42d <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 43b:	8b 45 08             	mov    0x8(%ebp),%eax
 43e:	0f b6 00             	movzbl (%eax),%eax
 441:	3c 2d                	cmp    $0x2d,%al
 443:	75 07                	jne    44c <atoo+0x2e>
 445:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 44a:	eb 05                	jmp    451 <atoo+0x33>
 44c:	b8 01 00 00 00       	mov    $0x1,%eax
 451:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	0f b6 00             	movzbl (%eax),%eax
 45a:	3c 2b                	cmp    $0x2b,%al
 45c:	74 0a                	je     468 <atoo+0x4a>
 45e:	8b 45 08             	mov    0x8(%ebp),%eax
 461:	0f b6 00             	movzbl (%eax),%eax
 464:	3c 2d                	cmp    $0x2d,%al
 466:	75 27                	jne    48f <atoo+0x71>
    s++;
 468:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 46c:	eb 21                	jmp    48f <atoo+0x71>
    n = n*8 + *s++ - '0';
 46e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 471:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 478:	8b 45 08             	mov    0x8(%ebp),%eax
 47b:	8d 50 01             	lea    0x1(%eax),%edx
 47e:	89 55 08             	mov    %edx,0x8(%ebp)
 481:	0f b6 00             	movzbl (%eax),%eax
 484:	0f be c0             	movsbl %al,%eax
 487:	01 c8                	add    %ecx,%eax
 489:	83 e8 30             	sub    $0x30,%eax
 48c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 48f:	8b 45 08             	mov    0x8(%ebp),%eax
 492:	0f b6 00             	movzbl (%eax),%eax
 495:	3c 2f                	cmp    $0x2f,%al
 497:	7e 0a                	jle    4a3 <atoo+0x85>
 499:	8b 45 08             	mov    0x8(%ebp),%eax
 49c:	0f b6 00             	movzbl (%eax),%eax
 49f:	3c 37                	cmp    $0x37,%al
 4a1:	7e cb                	jle    46e <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 4a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 4a6:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    

000004ac <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4be:	eb 17                	jmp    4d7 <memmove+0x2b>
    *dst++ = *src++;
 4c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4c3:	8d 50 01             	lea    0x1(%eax),%edx
 4c6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4c9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4cc:	8d 4a 01             	lea    0x1(%edx),%ecx
 4cf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4d2:	0f b6 12             	movzbl (%edx),%edx
 4d5:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4d7:	8b 45 10             	mov    0x10(%ebp),%eax
 4da:	8d 50 ff             	lea    -0x1(%eax),%edx
 4dd:	89 55 10             	mov    %edx,0x10(%ebp)
 4e0:	85 c0                	test   %eax,%eax
 4e2:	7f dc                	jg     4c0 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e7:	c9                   	leave  
 4e8:	c3                   	ret    

000004e9 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 4e9:	55                   	push   %ebp
 4ea:	89 e5                	mov    %esp,%ebp
 4ec:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 4ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4f2:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 4f7:	89 c8                	mov    %ecx,%eax
 4f9:	f7 e2                	mul    %edx
 4fb:	89 d0                	mov    %edx,%eax
 4fd:	c1 e8 06             	shr    $0x6,%eax
 500:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 506:	29 c1                	sub    %eax,%ecx
 508:	89 c8                	mov    %ecx,%eax
 50a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 515:	f7 e2                	mul    %edx
 517:	89 d0                	mov    %edx,%eax
 519:	c1 e8 06             	shr    $0x6,%eax
 51c:	83 ec 04             	sub    $0x4,%esp
 51f:	50                   	push   %eax
 520:	68 21 0b 00 00       	push   $0xb21
 525:	6a 01                	push   $0x1
 527:	e8 14 02 00 00       	call   740 <printf>
 52c:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 52f:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 533:	7e 17                	jle    54c <zeropad+0x63>
    printf(1,"%d", miliseconds);
 535:	83 ec 04             	sub    $0x4,%esp
 538:	ff 75 f4             	pushl  -0xc(%ebp)
 53b:	68 25 0b 00 00       	push   $0xb25
 540:	6a 01                	push   $0x1
 542:	e8 f9 01 00 00       	call   740 <printf>
 547:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 54a:	eb 32                	jmp    57e <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 54c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 550:	7e 17                	jle    569 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 552:	83 ec 04             	sub    $0x4,%esp
 555:	ff 75 f4             	pushl  -0xc(%ebp)
 558:	68 28 0b 00 00       	push   $0xb28
 55d:	6a 01                	push   $0x1
 55f:	e8 dc 01 00 00       	call   740 <printf>
 564:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 567:	eb 15                	jmp    57e <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 569:	83 ec 04             	sub    $0x4,%esp
 56c:	ff 75 f4             	pushl  -0xc(%ebp)
 56f:	68 2c 0b 00 00       	push   $0xb2c
 574:	6a 01                	push   $0x1
 576:	e8 c5 01 00 00       	call   740 <printf>
 57b:	83 c4 10             	add    $0x10,%esp
};
 57e:	90                   	nop
 57f:	c9                   	leave  
 580:	c3                   	ret    

00000581 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 581:	b8 01 00 00 00       	mov    $0x1,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <exit>:
SYSCALL(exit)
 589:	b8 02 00 00 00       	mov    $0x2,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <wait>:
SYSCALL(wait)
 591:	b8 03 00 00 00       	mov    $0x3,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <pipe>:
SYSCALL(pipe)
 599:	b8 04 00 00 00       	mov    $0x4,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <read>:
SYSCALL(read)
 5a1:	b8 05 00 00 00       	mov    $0x5,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <write>:
SYSCALL(write)
 5a9:	b8 10 00 00 00       	mov    $0x10,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <close>:
SYSCALL(close)
 5b1:	b8 15 00 00 00       	mov    $0x15,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <kill>:
SYSCALL(kill)
 5b9:	b8 06 00 00 00       	mov    $0x6,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <exec>:
SYSCALL(exec)
 5c1:	b8 07 00 00 00       	mov    $0x7,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <open>:
SYSCALL(open)
 5c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <mknod>:
SYSCALL(mknod)
 5d1:	b8 11 00 00 00       	mov    $0x11,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <unlink>:
SYSCALL(unlink)
 5d9:	b8 12 00 00 00       	mov    $0x12,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <fstat>:
SYSCALL(fstat)
 5e1:	b8 08 00 00 00       	mov    $0x8,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <link>:
SYSCALL(link)
 5e9:	b8 13 00 00 00       	mov    $0x13,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <mkdir>:
SYSCALL(mkdir)
 5f1:	b8 14 00 00 00       	mov    $0x14,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <chdir>:
SYSCALL(chdir)
 5f9:	b8 09 00 00 00       	mov    $0x9,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <dup>:
SYSCALL(dup)
 601:	b8 0a 00 00 00       	mov    $0xa,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <getpid>:
SYSCALL(getpid)
 609:	b8 0b 00 00 00       	mov    $0xb,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <sbrk>:
SYSCALL(sbrk)
 611:	b8 0c 00 00 00       	mov    $0xc,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <sleep>:
SYSCALL(sleep)
 619:	b8 0d 00 00 00       	mov    $0xd,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <uptime>:
SYSCALL(uptime)
 621:	b8 0e 00 00 00       	mov    $0xe,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <halt>:
SYSCALL(halt)
 629:	b8 16 00 00 00       	mov    $0x16,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <date>:

SYSCALL(date)
 631:	b8 17 00 00 00       	mov    $0x17,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <getuid>:
SYSCALL(getuid)
 639:	b8 18 00 00 00       	mov    $0x18,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <getgid>:
SYSCALL(getgid)
 641:	b8 19 00 00 00       	mov    $0x19,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <getppid>:
SYSCALL(getppid)
 649:	b8 1a 00 00 00       	mov    $0x1a,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <setuid>:
SYSCALL(setuid)
 651:	b8 1b 00 00 00       	mov    $0x1b,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <setgid>:
SYSCALL(setgid)
 659:	b8 1c 00 00 00       	mov    $0x1c,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <getprocs>:
SYSCALL(getprocs)
 661:	b8 1d 00 00 00       	mov    $0x1d,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 669:	55                   	push   %ebp
 66a:	89 e5                	mov    %esp,%ebp
 66c:	83 ec 18             	sub    $0x18,%esp
 66f:	8b 45 0c             	mov    0xc(%ebp),%eax
 672:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 675:	83 ec 04             	sub    $0x4,%esp
 678:	6a 01                	push   $0x1
 67a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 67d:	50                   	push   %eax
 67e:	ff 75 08             	pushl  0x8(%ebp)
 681:	e8 23 ff ff ff       	call   5a9 <write>
 686:	83 c4 10             	add    $0x10,%esp
}
 689:	90                   	nop
 68a:	c9                   	leave  
 68b:	c3                   	ret    

0000068c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	53                   	push   %ebx
 690:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 693:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 69a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 69e:	74 17                	je     6b7 <printint+0x2b>
 6a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6a4:	79 11                	jns    6b7 <printint+0x2b>
    neg = 1;
 6a6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b0:	f7 d8                	neg    %eax
 6b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6b5:	eb 06                	jmp    6bd <printint+0x31>
  } else {
    x = xx;
 6b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6c4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6c7:	8d 41 01             	lea    0x1(%ecx),%eax
 6ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6cd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d3:	ba 00 00 00 00       	mov    $0x0,%edx
 6d8:	f7 f3                	div    %ebx
 6da:	89 d0                	mov    %edx,%eax
 6dc:	0f b6 80 c4 0d 00 00 	movzbl 0xdc4(%eax),%eax
 6e3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6e7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ed:	ba 00 00 00 00       	mov    $0x0,%edx
 6f2:	f7 f3                	div    %ebx
 6f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6fb:	75 c7                	jne    6c4 <printint+0x38>
  if(neg)
 6fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 701:	74 2d                	je     730 <printint+0xa4>
    buf[i++] = '-';
 703:	8b 45 f4             	mov    -0xc(%ebp),%eax
 706:	8d 50 01             	lea    0x1(%eax),%edx
 709:	89 55 f4             	mov    %edx,-0xc(%ebp)
 70c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 711:	eb 1d                	jmp    730 <printint+0xa4>
    putc(fd, buf[i]);
 713:	8d 55 dc             	lea    -0x24(%ebp),%edx
 716:	8b 45 f4             	mov    -0xc(%ebp),%eax
 719:	01 d0                	add    %edx,%eax
 71b:	0f b6 00             	movzbl (%eax),%eax
 71e:	0f be c0             	movsbl %al,%eax
 721:	83 ec 08             	sub    $0x8,%esp
 724:	50                   	push   %eax
 725:	ff 75 08             	pushl  0x8(%ebp)
 728:	e8 3c ff ff ff       	call   669 <putc>
 72d:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 730:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 734:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 738:	79 d9                	jns    713 <printint+0x87>
    putc(fd, buf[i]);
}
 73a:	90                   	nop
 73b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 73e:	c9                   	leave  
 73f:	c3                   	ret    

00000740 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 746:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 74d:	8d 45 0c             	lea    0xc(%ebp),%eax
 750:	83 c0 04             	add    $0x4,%eax
 753:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 756:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 75d:	e9 59 01 00 00       	jmp    8bb <printf+0x17b>
    c = fmt[i] & 0xff;
 762:	8b 55 0c             	mov    0xc(%ebp),%edx
 765:	8b 45 f0             	mov    -0x10(%ebp),%eax
 768:	01 d0                	add    %edx,%eax
 76a:	0f b6 00             	movzbl (%eax),%eax
 76d:	0f be c0             	movsbl %al,%eax
 770:	25 ff 00 00 00       	and    $0xff,%eax
 775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 778:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 77c:	75 2c                	jne    7aa <printf+0x6a>
      if(c == '%'){
 77e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 782:	75 0c                	jne    790 <printf+0x50>
        state = '%';
 784:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 78b:	e9 27 01 00 00       	jmp    8b7 <printf+0x177>
      } else {
        putc(fd, c);
 790:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 793:	0f be c0             	movsbl %al,%eax
 796:	83 ec 08             	sub    $0x8,%esp
 799:	50                   	push   %eax
 79a:	ff 75 08             	pushl  0x8(%ebp)
 79d:	e8 c7 fe ff ff       	call   669 <putc>
 7a2:	83 c4 10             	add    $0x10,%esp
 7a5:	e9 0d 01 00 00       	jmp    8b7 <printf+0x177>
      }
    } else if(state == '%'){
 7aa:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7ae:	0f 85 03 01 00 00    	jne    8b7 <printf+0x177>
      if(c == 'd'){
 7b4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7b8:	75 1e                	jne    7d8 <printf+0x98>
        printint(fd, *ap, 10, 1);
 7ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7bd:	8b 00                	mov    (%eax),%eax
 7bf:	6a 01                	push   $0x1
 7c1:	6a 0a                	push   $0xa
 7c3:	50                   	push   %eax
 7c4:	ff 75 08             	pushl  0x8(%ebp)
 7c7:	e8 c0 fe ff ff       	call   68c <printint>
 7cc:	83 c4 10             	add    $0x10,%esp
        ap++;
 7cf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7d3:	e9 d8 00 00 00       	jmp    8b0 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7d8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7dc:	74 06                	je     7e4 <printf+0xa4>
 7de:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7e2:	75 1e                	jne    802 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7e7:	8b 00                	mov    (%eax),%eax
 7e9:	6a 00                	push   $0x0
 7eb:	6a 10                	push   $0x10
 7ed:	50                   	push   %eax
 7ee:	ff 75 08             	pushl  0x8(%ebp)
 7f1:	e8 96 fe ff ff       	call   68c <printint>
 7f6:	83 c4 10             	add    $0x10,%esp
        ap++;
 7f9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7fd:	e9 ae 00 00 00       	jmp    8b0 <printf+0x170>
      } else if(c == 's'){
 802:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 806:	75 43                	jne    84b <printf+0x10b>
        s = (char*)*ap;
 808:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80b:	8b 00                	mov    (%eax),%eax
 80d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 810:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 814:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 818:	75 25                	jne    83f <printf+0xff>
          s = "(null)";
 81a:	c7 45 f4 31 0b 00 00 	movl   $0xb31,-0xc(%ebp)
        while(*s != 0){
 821:	eb 1c                	jmp    83f <printf+0xff>
          putc(fd, *s);
 823:	8b 45 f4             	mov    -0xc(%ebp),%eax
 826:	0f b6 00             	movzbl (%eax),%eax
 829:	0f be c0             	movsbl %al,%eax
 82c:	83 ec 08             	sub    $0x8,%esp
 82f:	50                   	push   %eax
 830:	ff 75 08             	pushl  0x8(%ebp)
 833:	e8 31 fe ff ff       	call   669 <putc>
 838:	83 c4 10             	add    $0x10,%esp
          s++;
 83b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 842:	0f b6 00             	movzbl (%eax),%eax
 845:	84 c0                	test   %al,%al
 847:	75 da                	jne    823 <printf+0xe3>
 849:	eb 65                	jmp    8b0 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 84b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 84f:	75 1d                	jne    86e <printf+0x12e>
        putc(fd, *ap);
 851:	8b 45 e8             	mov    -0x18(%ebp),%eax
 854:	8b 00                	mov    (%eax),%eax
 856:	0f be c0             	movsbl %al,%eax
 859:	83 ec 08             	sub    $0x8,%esp
 85c:	50                   	push   %eax
 85d:	ff 75 08             	pushl  0x8(%ebp)
 860:	e8 04 fe ff ff       	call   669 <putc>
 865:	83 c4 10             	add    $0x10,%esp
        ap++;
 868:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 86c:	eb 42                	jmp    8b0 <printf+0x170>
      } else if(c == '%'){
 86e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 872:	75 17                	jne    88b <printf+0x14b>
        putc(fd, c);
 874:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 877:	0f be c0             	movsbl %al,%eax
 87a:	83 ec 08             	sub    $0x8,%esp
 87d:	50                   	push   %eax
 87e:	ff 75 08             	pushl  0x8(%ebp)
 881:	e8 e3 fd ff ff       	call   669 <putc>
 886:	83 c4 10             	add    $0x10,%esp
 889:	eb 25                	jmp    8b0 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 88b:	83 ec 08             	sub    $0x8,%esp
 88e:	6a 25                	push   $0x25
 890:	ff 75 08             	pushl  0x8(%ebp)
 893:	e8 d1 fd ff ff       	call   669 <putc>
 898:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 89b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 89e:	0f be c0             	movsbl %al,%eax
 8a1:	83 ec 08             	sub    $0x8,%esp
 8a4:	50                   	push   %eax
 8a5:	ff 75 08             	pushl  0x8(%ebp)
 8a8:	e8 bc fd ff ff       	call   669 <putc>
 8ad:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8b0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8b7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8bb:	8b 55 0c             	mov    0xc(%ebp),%edx
 8be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c1:	01 d0                	add    %edx,%eax
 8c3:	0f b6 00             	movzbl (%eax),%eax
 8c6:	84 c0                	test   %al,%al
 8c8:	0f 85 94 fe ff ff    	jne    762 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8ce:	90                   	nop
 8cf:	c9                   	leave  
 8d0:	c3                   	ret    

000008d1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d1:	55                   	push   %ebp
 8d2:	89 e5                	mov    %esp,%ebp
 8d4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	83 e8 08             	sub    $0x8,%eax
 8dd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e0:	a1 e0 0d 00 00       	mov    0xde0,%eax
 8e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8e8:	eb 24                	jmp    90e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ed:	8b 00                	mov    (%eax),%eax
 8ef:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f2:	77 12                	ja     906 <free+0x35>
 8f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fa:	77 24                	ja     920 <free+0x4f>
 8fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ff:	8b 00                	mov    (%eax),%eax
 901:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 904:	77 1a                	ja     920 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 906:	8b 45 fc             	mov    -0x4(%ebp),%eax
 909:	8b 00                	mov    (%eax),%eax
 90b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 90e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 911:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 914:	76 d4                	jbe    8ea <free+0x19>
 916:	8b 45 fc             	mov    -0x4(%ebp),%eax
 919:	8b 00                	mov    (%eax),%eax
 91b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 91e:	76 ca                	jbe    8ea <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 920:	8b 45 f8             	mov    -0x8(%ebp),%eax
 923:	8b 40 04             	mov    0x4(%eax),%eax
 926:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 92d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 930:	01 c2                	add    %eax,%edx
 932:	8b 45 fc             	mov    -0x4(%ebp),%eax
 935:	8b 00                	mov    (%eax),%eax
 937:	39 c2                	cmp    %eax,%edx
 939:	75 24                	jne    95f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 93b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93e:	8b 50 04             	mov    0x4(%eax),%edx
 941:	8b 45 fc             	mov    -0x4(%ebp),%eax
 944:	8b 00                	mov    (%eax),%eax
 946:	8b 40 04             	mov    0x4(%eax),%eax
 949:	01 c2                	add    %eax,%edx
 94b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 951:	8b 45 fc             	mov    -0x4(%ebp),%eax
 954:	8b 00                	mov    (%eax),%eax
 956:	8b 10                	mov    (%eax),%edx
 958:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95b:	89 10                	mov    %edx,(%eax)
 95d:	eb 0a                	jmp    969 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 95f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 962:	8b 10                	mov    (%eax),%edx
 964:	8b 45 f8             	mov    -0x8(%ebp),%eax
 967:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	8b 40 04             	mov    0x4(%eax),%eax
 96f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 976:	8b 45 fc             	mov    -0x4(%ebp),%eax
 979:	01 d0                	add    %edx,%eax
 97b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 97e:	75 20                	jne    9a0 <free+0xcf>
    p->s.size += bp->s.size;
 980:	8b 45 fc             	mov    -0x4(%ebp),%eax
 983:	8b 50 04             	mov    0x4(%eax),%edx
 986:	8b 45 f8             	mov    -0x8(%ebp),%eax
 989:	8b 40 04             	mov    0x4(%eax),%eax
 98c:	01 c2                	add    %eax,%edx
 98e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 991:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 994:	8b 45 f8             	mov    -0x8(%ebp),%eax
 997:	8b 10                	mov    (%eax),%edx
 999:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99c:	89 10                	mov    %edx,(%eax)
 99e:	eb 08                	jmp    9a8 <free+0xd7>
  } else
    p->s.ptr = bp;
 9a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9a6:	89 10                	mov    %edx,(%eax)
  freep = p;
 9a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ab:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 9b0:	90                   	nop
 9b1:	c9                   	leave  
 9b2:	c3                   	ret    

000009b3 <morecore>:

static Header*
morecore(uint nu)
{
 9b3:	55                   	push   %ebp
 9b4:	89 e5                	mov    %esp,%ebp
 9b6:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9b9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9c0:	77 07                	ja     9c9 <morecore+0x16>
    nu = 4096;
 9c2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 9cc:	c1 e0 03             	shl    $0x3,%eax
 9cf:	83 ec 0c             	sub    $0xc,%esp
 9d2:	50                   	push   %eax
 9d3:	e8 39 fc ff ff       	call   611 <sbrk>
 9d8:	83 c4 10             	add    $0x10,%esp
 9db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9de:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9e2:	75 07                	jne    9eb <morecore+0x38>
    return 0;
 9e4:	b8 00 00 00 00       	mov    $0x0,%eax
 9e9:	eb 26                	jmp    a11 <morecore+0x5e>
  hp = (Header*)p;
 9eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f4:	8b 55 08             	mov    0x8(%ebp),%edx
 9f7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9fd:	83 c0 08             	add    $0x8,%eax
 a00:	83 ec 0c             	sub    $0xc,%esp
 a03:	50                   	push   %eax
 a04:	e8 c8 fe ff ff       	call   8d1 <free>
 a09:	83 c4 10             	add    $0x10,%esp
  return freep;
 a0c:	a1 e0 0d 00 00       	mov    0xde0,%eax
}
 a11:	c9                   	leave  
 a12:	c3                   	ret    

00000a13 <malloc>:

void*
malloc(uint nbytes)
{
 a13:	55                   	push   %ebp
 a14:	89 e5                	mov    %esp,%ebp
 a16:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a19:	8b 45 08             	mov    0x8(%ebp),%eax
 a1c:	83 c0 07             	add    $0x7,%eax
 a1f:	c1 e8 03             	shr    $0x3,%eax
 a22:	83 c0 01             	add    $0x1,%eax
 a25:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a28:	a1 e0 0d 00 00       	mov    0xde0,%eax
 a2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a30:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a34:	75 23                	jne    a59 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a36:	c7 45 f0 d8 0d 00 00 	movl   $0xdd8,-0x10(%ebp)
 a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a40:	a3 e0 0d 00 00       	mov    %eax,0xde0
 a45:	a1 e0 0d 00 00       	mov    0xde0,%eax
 a4a:	a3 d8 0d 00 00       	mov    %eax,0xdd8
    base.s.size = 0;
 a4f:	c7 05 dc 0d 00 00 00 	movl   $0x0,0xddc
 a56:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5c:	8b 00                	mov    (%eax),%eax
 a5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a64:	8b 40 04             	mov    0x4(%eax),%eax
 a67:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a6a:	72 4d                	jb     ab9 <malloc+0xa6>
      if(p->s.size == nunits)
 a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6f:	8b 40 04             	mov    0x4(%eax),%eax
 a72:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a75:	75 0c                	jne    a83 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7a:	8b 10                	mov    (%eax),%edx
 a7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7f:	89 10                	mov    %edx,(%eax)
 a81:	eb 26                	jmp    aa9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a86:	8b 40 04             	mov    0x4(%eax),%eax
 a89:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a8c:	89 c2                	mov    %eax,%edx
 a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a91:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a97:	8b 40 04             	mov    0x4(%eax),%eax
 a9a:	c1 e0 03             	shl    $0x3,%eax
 a9d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 aa6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aac:	a3 e0 0d 00 00       	mov    %eax,0xde0
      return (void*)(p + 1);
 ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab4:	83 c0 08             	add    $0x8,%eax
 ab7:	eb 3b                	jmp    af4 <malloc+0xe1>
    }
    if(p == freep)
 ab9:	a1 e0 0d 00 00       	mov    0xde0,%eax
 abe:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ac1:	75 1e                	jne    ae1 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 ac3:	83 ec 0c             	sub    $0xc,%esp
 ac6:	ff 75 ec             	pushl  -0x14(%ebp)
 ac9:	e8 e5 fe ff ff       	call   9b3 <morecore>
 ace:	83 c4 10             	add    $0x10,%esp
 ad1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ad4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ad8:	75 07                	jne    ae1 <malloc+0xce>
        return 0;
 ada:	b8 00 00 00 00       	mov    $0x0,%eax
 adf:	eb 13                	jmp    af4 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aea:	8b 00                	mov    (%eax),%eax
 aec:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 aef:	e9 6d ff ff ff       	jmp    a61 <malloc+0x4e>
}
 af4:	c9                   	leave  
 af5:	c3                   	ret    
