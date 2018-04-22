
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  11:	83 ec 08             	sub    $0x8,%esp
  14:	6a 02                	push   $0x2
  16:	68 33 0a 00 00       	push   $0xa33
  1b:	e8 e3 04 00 00       	call   503 <open>
  20:	83 c4 10             	add    $0x10,%esp
  23:	85 c0                	test   %eax,%eax
  25:	79 26                	jns    4d <main+0x4d>
    mknod("console", 1, 1);
  27:	83 ec 04             	sub    $0x4,%esp
  2a:	6a 01                	push   $0x1
  2c:	6a 01                	push   $0x1
  2e:	68 33 0a 00 00       	push   $0xa33
  33:	e8 d3 04 00 00       	call   50b <mknod>
  38:	83 c4 10             	add    $0x10,%esp
    open("console", O_RDWR);
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	6a 02                	push   $0x2
  40:	68 33 0a 00 00       	push   $0xa33
  45:	e8 b9 04 00 00       	call   503 <open>
  4a:	83 c4 10             	add    $0x10,%esp
  }
  dup(0);  // stdout
  4d:	83 ec 0c             	sub    $0xc,%esp
  50:	6a 00                	push   $0x0
  52:	e8 e4 04 00 00       	call   53b <dup>
  57:	83 c4 10             	add    $0x10,%esp
  dup(0);  // stderr
  5a:	83 ec 0c             	sub    $0xc,%esp
  5d:	6a 00                	push   $0x0
  5f:	e8 d7 04 00 00       	call   53b <dup>
  64:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting sh\n");
  67:	83 ec 08             	sub    $0x8,%esp
  6a:	68 3b 0a 00 00       	push   $0xa3b
  6f:	6a 01                	push   $0x1
  71:	e8 04 06 00 00       	call   67a <printf>
  76:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  79:	e8 3d 04 00 00       	call   4bb <fork>
  7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0){
  81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  85:	79 17                	jns    9e <main+0x9e>
      printf(1, "init: fork failed\n");
  87:	83 ec 08             	sub    $0x8,%esp
  8a:	68 4e 0a 00 00       	push   $0xa4e
  8f:	6a 01                	push   $0x1
  91:	e8 e4 05 00 00       	call   67a <printf>
  96:	83 c4 10             	add    $0x10,%esp
      exit();
  99:	e8 25 04 00 00       	call   4c3 <exit>
    }
    if(pid == 0){
  9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a2:	75 3e                	jne    e2 <main+0xe2>
      exec("sh", argv);
  a4:	83 ec 08             	sub    $0x8,%esp
  a7:	68 20 0d 00 00       	push   $0xd20
  ac:	68 30 0a 00 00       	push   $0xa30
  b1:	e8 45 04 00 00       	call   4fb <exec>
  b6:	83 c4 10             	add    $0x10,%esp
      printf(1, "init: exec sh failed\n");
  b9:	83 ec 08             	sub    $0x8,%esp
  bc:	68 61 0a 00 00       	push   $0xa61
  c1:	6a 01                	push   $0x1
  c3:	e8 b2 05 00 00       	call   67a <printf>
  c8:	83 c4 10             	add    $0x10,%esp
      exit();
  cb:	e8 f3 03 00 00       	call   4c3 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  d0:	83 ec 08             	sub    $0x8,%esp
  d3:	68 77 0a 00 00       	push   $0xa77
  d8:	6a 01                	push   $0x1
  da:	e8 9b 05 00 00       	call   67a <printf>
  df:	83 c4 10             	add    $0x10,%esp
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  e2:	e8 e4 03 00 00       	call   4cb <wait>
  e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  ee:	0f 88 73 ff ff ff    	js     67 <main+0x67>
  f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  f7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  fa:	75 d4                	jne    d0 <main+0xd0>
      printf(1, "zombie!\n");
  }
  fc:	e9 66 ff ff ff       	jmp    67 <main+0x67>

00000101 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	57                   	push   %edi
 105:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 55 10             	mov    0x10(%ebp),%edx
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	89 cb                	mov    %ecx,%ebx
 111:	89 df                	mov    %ebx,%edi
 113:	89 d1                	mov    %edx,%ecx
 115:	fc                   	cld    
 116:	f3 aa                	rep stos %al,%es:(%edi)
 118:	89 ca                	mov    %ecx,%edx
 11a:	89 fb                	mov    %edi,%ebx
 11c:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 122:	90                   	nop
 123:	5b                   	pop    %ebx
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    

00000127 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 12d:	8b 45 08             	mov    0x8(%ebp),%eax
 130:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 133:	90                   	nop
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8d 50 01             	lea    0x1(%eax),%edx
 13a:	89 55 08             	mov    %edx,0x8(%ebp)
 13d:	8b 55 0c             	mov    0xc(%ebp),%edx
 140:	8d 4a 01             	lea    0x1(%edx),%ecx
 143:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 146:	0f b6 12             	movzbl (%edx),%edx
 149:	88 10                	mov    %dl,(%eax)
 14b:	0f b6 00             	movzbl (%eax),%eax
 14e:	84 c0                	test   %al,%al
 150:	75 e2                	jne    134 <strcpy+0xd>
    ;
  return os;
 152:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 155:	c9                   	leave  
 156:	c3                   	ret    

00000157 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 157:	55                   	push   %ebp
 158:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 15a:	eb 08                	jmp    164 <strcmp+0xd>
    p++, q++;
 15c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 160:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	0f b6 00             	movzbl (%eax),%eax
 16a:	84 c0                	test   %al,%al
 16c:	74 10                	je     17e <strcmp+0x27>
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	0f b6 10             	movzbl (%eax),%edx
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	38 c2                	cmp    %al,%dl
 17c:	74 de                	je     15c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	0f b6 00             	movzbl (%eax),%eax
 184:	0f b6 d0             	movzbl %al,%edx
 187:	8b 45 0c             	mov    0xc(%ebp),%eax
 18a:	0f b6 00             	movzbl (%eax),%eax
 18d:	0f b6 c0             	movzbl %al,%eax
 190:	29 c2                	sub    %eax,%edx
 192:	89 d0                	mov    %edx,%eax
}
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    

00000196 <strlen>:

uint
strlen(char *s)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 19c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1a3:	eb 04                	jmp    1a9 <strlen+0x13>
 1a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	01 d0                	add    %edx,%eax
 1b1:	0f b6 00             	movzbl (%eax),%eax
 1b4:	84 c0                	test   %al,%al
 1b6:	75 ed                	jne    1a5 <strlen+0xf>
    ;
  return n;
 1b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    

000001bd <memset>:

void*
memset(void *dst, int c, uint n)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1c0:	8b 45 10             	mov    0x10(%ebp),%eax
 1c3:	50                   	push   %eax
 1c4:	ff 75 0c             	pushl  0xc(%ebp)
 1c7:	ff 75 08             	pushl  0x8(%ebp)
 1ca:	e8 32 ff ff ff       	call   101 <stosb>
 1cf:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1d2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1d5:	c9                   	leave  
 1d6:	c3                   	ret    

000001d7 <strchr>:

char*
strchr(const char *s, char c)
{
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	83 ec 04             	sub    $0x4,%esp
 1dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1e3:	eb 14                	jmp    1f9 <strchr+0x22>
    if(*s == c)
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	0f b6 00             	movzbl (%eax),%eax
 1eb:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1ee:	75 05                	jne    1f5 <strchr+0x1e>
      return (char*)s;
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	eb 13                	jmp    208 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 203:	b8 00 00 00 00       	mov    $0x0,%eax
}
 208:	c9                   	leave  
 209:	c3                   	ret    

0000020a <gets>:

char*
gets(char *buf, int max)
{
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 210:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 217:	eb 42                	jmp    25b <gets+0x51>
    cc = read(0, &c, 1);
 219:	83 ec 04             	sub    $0x4,%esp
 21c:	6a 01                	push   $0x1
 21e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 221:	50                   	push   %eax
 222:	6a 00                	push   $0x0
 224:	e8 b2 02 00 00       	call   4db <read>
 229:	83 c4 10             	add    $0x10,%esp
 22c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 22f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 233:	7e 33                	jle    268 <gets+0x5e>
      break;
    buf[i++] = c;
 235:	8b 45 f4             	mov    -0xc(%ebp),%eax
 238:	8d 50 01             	lea    0x1(%eax),%edx
 23b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 23e:	89 c2                	mov    %eax,%edx
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	01 c2                	add    %eax,%edx
 245:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 249:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 24b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24f:	3c 0a                	cmp    $0xa,%al
 251:	74 16                	je     269 <gets+0x5f>
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	3c 0d                	cmp    $0xd,%al
 259:	74 0e                	je     269 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25e:	83 c0 01             	add    $0x1,%eax
 261:	3b 45 0c             	cmp    0xc(%ebp),%eax
 264:	7c b3                	jl     219 <gets+0xf>
 266:	eb 01                	jmp    269 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 268:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 269:	8b 55 f4             	mov    -0xc(%ebp),%edx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	01 d0                	add    %edx,%eax
 271:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 274:	8b 45 08             	mov    0x8(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <stat>:

int
stat(char *n, struct stat *st)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27f:	83 ec 08             	sub    $0x8,%esp
 282:	6a 00                	push   $0x0
 284:	ff 75 08             	pushl  0x8(%ebp)
 287:	e8 77 02 00 00       	call   503 <open>
 28c:	83 c4 10             	add    $0x10,%esp
 28f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 292:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 296:	79 07                	jns    29f <stat+0x26>
    return -1;
 298:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29d:	eb 25                	jmp    2c4 <stat+0x4b>
  r = fstat(fd, st);
 29f:	83 ec 08             	sub    $0x8,%esp
 2a2:	ff 75 0c             	pushl  0xc(%ebp)
 2a5:	ff 75 f4             	pushl  -0xc(%ebp)
 2a8:	e8 6e 02 00 00       	call   51b <fstat>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2b3:	83 ec 0c             	sub    $0xc,%esp
 2b6:	ff 75 f4             	pushl  -0xc(%ebp)
 2b9:	e8 2d 02 00 00       	call   4eb <close>
 2be:	83 c4 10             	add    $0x10,%esp
  return r;
 2c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <atoi>:

int
atoi(const char *s)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2d3:	eb 04                	jmp    2d9 <atoi+0x13>
 2d5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
 2dc:	0f b6 00             	movzbl (%eax),%eax
 2df:	3c 20                	cmp    $0x20,%al
 2e1:	74 f2                	je     2d5 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 00             	movzbl (%eax),%eax
 2e9:	3c 2d                	cmp    $0x2d,%al
 2eb:	75 07                	jne    2f4 <atoi+0x2e>
 2ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f2:	eb 05                	jmp    2f9 <atoi+0x33>
 2f4:	b8 01 00 00 00       	mov    $0x1,%eax
 2f9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	0f b6 00             	movzbl (%eax),%eax
 302:	3c 2b                	cmp    $0x2b,%al
 304:	74 0a                	je     310 <atoi+0x4a>
 306:	8b 45 08             	mov    0x8(%ebp),%eax
 309:	0f b6 00             	movzbl (%eax),%eax
 30c:	3c 2d                	cmp    $0x2d,%al
 30e:	75 2b                	jne    33b <atoi+0x75>
    s++;
 310:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 314:	eb 25                	jmp    33b <atoi+0x75>
    n = n*10 + *s++ - '0';
 316:	8b 55 fc             	mov    -0x4(%ebp),%edx
 319:	89 d0                	mov    %edx,%eax
 31b:	c1 e0 02             	shl    $0x2,%eax
 31e:	01 d0                	add    %edx,%eax
 320:	01 c0                	add    %eax,%eax
 322:	89 c1                	mov    %eax,%ecx
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	8d 50 01             	lea    0x1(%eax),%edx
 32a:	89 55 08             	mov    %edx,0x8(%ebp)
 32d:	0f b6 00             	movzbl (%eax),%eax
 330:	0f be c0             	movsbl %al,%eax
 333:	01 c8                	add    %ecx,%eax
 335:	83 e8 30             	sub    $0x30,%eax
 338:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	0f b6 00             	movzbl (%eax),%eax
 341:	3c 2f                	cmp    $0x2f,%al
 343:	7e 0a                	jle    34f <atoi+0x89>
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 39                	cmp    $0x39,%al
 34d:	7e c7                	jle    316 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 34f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 352:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 356:	c9                   	leave  
 357:	c3                   	ret    

00000358 <atoo>:

int
atoo(const char *s)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 35e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 365:	eb 04                	jmp    36b <atoo+0x13>
 367:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	0f b6 00             	movzbl (%eax),%eax
 371:	3c 20                	cmp    $0x20,%al
 373:	74 f2                	je     367 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 375:	8b 45 08             	mov    0x8(%ebp),%eax
 378:	0f b6 00             	movzbl (%eax),%eax
 37b:	3c 2d                	cmp    $0x2d,%al
 37d:	75 07                	jne    386 <atoo+0x2e>
 37f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 384:	eb 05                	jmp    38b <atoo+0x33>
 386:	b8 01 00 00 00       	mov    $0x1,%eax
 38b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 38e:	8b 45 08             	mov    0x8(%ebp),%eax
 391:	0f b6 00             	movzbl (%eax),%eax
 394:	3c 2b                	cmp    $0x2b,%al
 396:	74 0a                	je     3a2 <atoo+0x4a>
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	0f b6 00             	movzbl (%eax),%eax
 39e:	3c 2d                	cmp    $0x2d,%al
 3a0:	75 27                	jne    3c9 <atoo+0x71>
    s++;
 3a2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 3a6:	eb 21                	jmp    3c9 <atoo+0x71>
    n = n*8 + *s++ - '0';
 3a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ab:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
 3b5:	8d 50 01             	lea    0x1(%eax),%edx
 3b8:	89 55 08             	mov    %edx,0x8(%ebp)
 3bb:	0f b6 00             	movzbl (%eax),%eax
 3be:	0f be c0             	movsbl %al,%eax
 3c1:	01 c8                	add    %ecx,%eax
 3c3:	83 e8 30             	sub    $0x30,%eax
 3c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 3c9:	8b 45 08             	mov    0x8(%ebp),%eax
 3cc:	0f b6 00             	movzbl (%eax),%eax
 3cf:	3c 2f                	cmp    $0x2f,%al
 3d1:	7e 0a                	jle    3dd <atoo+0x85>
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 00             	movzbl (%eax),%eax
 3d9:	3c 37                	cmp    $0x37,%al
 3db:	7e cb                	jle    3a8 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 3dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3e0:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 3e4:	c9                   	leave  
 3e5:	c3                   	ret    

000003e6 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3ec:	8b 45 08             	mov    0x8(%ebp),%eax
 3ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3f8:	eb 17                	jmp    411 <memmove+0x2b>
    *dst++ = *src++;
 3fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3fd:	8d 50 01             	lea    0x1(%eax),%edx
 400:	89 55 fc             	mov    %edx,-0x4(%ebp)
 403:	8b 55 f8             	mov    -0x8(%ebp),%edx
 406:	8d 4a 01             	lea    0x1(%edx),%ecx
 409:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 40c:	0f b6 12             	movzbl (%edx),%edx
 40f:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 411:	8b 45 10             	mov    0x10(%ebp),%eax
 414:	8d 50 ff             	lea    -0x1(%eax),%edx
 417:	89 55 10             	mov    %edx,0x10(%ebp)
 41a:	85 c0                	test   %eax,%eax
 41c:	7f dc                	jg     3fa <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 41e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 421:	c9                   	leave  
 422:	c3                   	ret    

00000423 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 429:	8b 4d 08             	mov    0x8(%ebp),%ecx
 42c:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 431:	89 c8                	mov    %ecx,%eax
 433:	f7 e2                	mul    %edx
 435:	89 d0                	mov    %edx,%eax
 437:	c1 e8 06             	shr    $0x6,%eax
 43a:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 440:	29 c1                	sub    %eax,%ecx
 442:	89 c8                	mov    %ecx,%eax
 444:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 44f:	f7 e2                	mul    %edx
 451:	89 d0                	mov    %edx,%eax
 453:	c1 e8 06             	shr    $0x6,%eax
 456:	83 ec 04             	sub    $0x4,%esp
 459:	50                   	push   %eax
 45a:	68 80 0a 00 00       	push   $0xa80
 45f:	6a 01                	push   $0x1
 461:	e8 14 02 00 00       	call   67a <printf>
 466:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 469:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 46d:	7e 17                	jle    486 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 46f:	83 ec 04             	sub    $0x4,%esp
 472:	ff 75 f4             	pushl  -0xc(%ebp)
 475:	68 84 0a 00 00       	push   $0xa84
 47a:	6a 01                	push   $0x1
 47c:	e8 f9 01 00 00       	call   67a <printf>
 481:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 484:	eb 32                	jmp    4b8 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 486:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 48a:	7e 17                	jle    4a3 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 48c:	83 ec 04             	sub    $0x4,%esp
 48f:	ff 75 f4             	pushl  -0xc(%ebp)
 492:	68 87 0a 00 00       	push   $0xa87
 497:	6a 01                	push   $0x1
 499:	e8 dc 01 00 00       	call   67a <printf>
 49e:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 4a1:	eb 15                	jmp    4b8 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 4a3:	83 ec 04             	sub    $0x4,%esp
 4a6:	ff 75 f4             	pushl  -0xc(%ebp)
 4a9:	68 8b 0a 00 00       	push   $0xa8b
 4ae:	6a 01                	push   $0x1
 4b0:	e8 c5 01 00 00       	call   67a <printf>
 4b5:	83 c4 10             	add    $0x10,%esp
};
 4b8:	90                   	nop
 4b9:	c9                   	leave  
 4ba:	c3                   	ret    

000004bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bb:	b8 01 00 00 00       	mov    $0x1,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <exit>:
SYSCALL(exit)
 4c3:	b8 02 00 00 00       	mov    $0x2,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <wait>:
SYSCALL(wait)
 4cb:	b8 03 00 00 00       	mov    $0x3,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <pipe>:
SYSCALL(pipe)
 4d3:	b8 04 00 00 00       	mov    $0x4,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <read>:
SYSCALL(read)
 4db:	b8 05 00 00 00       	mov    $0x5,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <write>:
SYSCALL(write)
 4e3:	b8 10 00 00 00       	mov    $0x10,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <close>:
SYSCALL(close)
 4eb:	b8 15 00 00 00       	mov    $0x15,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <kill>:
SYSCALL(kill)
 4f3:	b8 06 00 00 00       	mov    $0x6,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <exec>:
SYSCALL(exec)
 4fb:	b8 07 00 00 00       	mov    $0x7,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <open>:
SYSCALL(open)
 503:	b8 0f 00 00 00       	mov    $0xf,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mknod>:
SYSCALL(mknod)
 50b:	b8 11 00 00 00       	mov    $0x11,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <unlink>:
SYSCALL(unlink)
 513:	b8 12 00 00 00       	mov    $0x12,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <fstat>:
SYSCALL(fstat)
 51b:	b8 08 00 00 00       	mov    $0x8,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <link>:
SYSCALL(link)
 523:	b8 13 00 00 00       	mov    $0x13,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mkdir>:
SYSCALL(mkdir)
 52b:	b8 14 00 00 00       	mov    $0x14,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <chdir>:
SYSCALL(chdir)
 533:	b8 09 00 00 00       	mov    $0x9,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <dup>:
SYSCALL(dup)
 53b:	b8 0a 00 00 00       	mov    $0xa,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <getpid>:
SYSCALL(getpid)
 543:	b8 0b 00 00 00       	mov    $0xb,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <sbrk>:
SYSCALL(sbrk)
 54b:	b8 0c 00 00 00       	mov    $0xc,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <sleep>:
SYSCALL(sleep)
 553:	b8 0d 00 00 00       	mov    $0xd,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <uptime>:
SYSCALL(uptime)
 55b:	b8 0e 00 00 00       	mov    $0xe,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <halt>:
SYSCALL(halt)
 563:	b8 16 00 00 00       	mov    $0x16,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <date>:

SYSCALL(date)
 56b:	b8 17 00 00 00       	mov    $0x17,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <getuid>:
SYSCALL(getuid)
 573:	b8 18 00 00 00       	mov    $0x18,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <getgid>:
SYSCALL(getgid)
 57b:	b8 19 00 00 00       	mov    $0x19,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <getppid>:
SYSCALL(getppid)
 583:	b8 1a 00 00 00       	mov    $0x1a,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <setuid>:
SYSCALL(setuid)
 58b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <setgid>:
SYSCALL(setgid)
 593:	b8 1c 00 00 00       	mov    $0x1c,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <getprocs>:
SYSCALL(getprocs)
 59b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a3:	55                   	push   %ebp
 5a4:	89 e5                	mov    %esp,%ebp
 5a6:	83 ec 18             	sub    $0x18,%esp
 5a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ac:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5af:	83 ec 04             	sub    $0x4,%esp
 5b2:	6a 01                	push   $0x1
 5b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5b7:	50                   	push   %eax
 5b8:	ff 75 08             	pushl  0x8(%ebp)
 5bb:	e8 23 ff ff ff       	call   4e3 <write>
 5c0:	83 c4 10             	add    $0x10,%esp
}
 5c3:	90                   	nop
 5c4:	c9                   	leave  
 5c5:	c3                   	ret    

000005c6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c6:	55                   	push   %ebp
 5c7:	89 e5                	mov    %esp,%ebp
 5c9:	53                   	push   %ebx
 5ca:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5d4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5d8:	74 17                	je     5f1 <printint+0x2b>
 5da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5de:	79 11                	jns    5f1 <printint+0x2b>
    neg = 1;
 5e0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ea:	f7 d8                	neg    %eax
 5ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ef:	eb 06                	jmp    5f7 <printint+0x31>
  } else {
    x = xx;
 5f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5fe:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 601:	8d 41 01             	lea    0x1(%ecx),%eax
 604:	89 45 f4             	mov    %eax,-0xc(%ebp)
 607:	8b 5d 10             	mov    0x10(%ebp),%ebx
 60a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 60d:	ba 00 00 00 00       	mov    $0x0,%edx
 612:	f7 f3                	div    %ebx
 614:	89 d0                	mov    %edx,%eax
 616:	0f b6 80 28 0d 00 00 	movzbl 0xd28(%eax),%eax
 61d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 621:	8b 5d 10             	mov    0x10(%ebp),%ebx
 624:	8b 45 ec             	mov    -0x14(%ebp),%eax
 627:	ba 00 00 00 00       	mov    $0x0,%edx
 62c:	f7 f3                	div    %ebx
 62e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 631:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 635:	75 c7                	jne    5fe <printint+0x38>
  if(neg)
 637:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 63b:	74 2d                	je     66a <printint+0xa4>
    buf[i++] = '-';
 63d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 640:	8d 50 01             	lea    0x1(%eax),%edx
 643:	89 55 f4             	mov    %edx,-0xc(%ebp)
 646:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 64b:	eb 1d                	jmp    66a <printint+0xa4>
    putc(fd, buf[i]);
 64d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 650:	8b 45 f4             	mov    -0xc(%ebp),%eax
 653:	01 d0                	add    %edx,%eax
 655:	0f b6 00             	movzbl (%eax),%eax
 658:	0f be c0             	movsbl %al,%eax
 65b:	83 ec 08             	sub    $0x8,%esp
 65e:	50                   	push   %eax
 65f:	ff 75 08             	pushl  0x8(%ebp)
 662:	e8 3c ff ff ff       	call   5a3 <putc>
 667:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 66a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 66e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 672:	79 d9                	jns    64d <printint+0x87>
    putc(fd, buf[i]);
}
 674:	90                   	nop
 675:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 678:	c9                   	leave  
 679:	c3                   	ret    

0000067a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 67a:	55                   	push   %ebp
 67b:	89 e5                	mov    %esp,%ebp
 67d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 680:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 687:	8d 45 0c             	lea    0xc(%ebp),%eax
 68a:	83 c0 04             	add    $0x4,%eax
 68d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 690:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 697:	e9 59 01 00 00       	jmp    7f5 <printf+0x17b>
    c = fmt[i] & 0xff;
 69c:	8b 55 0c             	mov    0xc(%ebp),%edx
 69f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a2:	01 d0                	add    %edx,%eax
 6a4:	0f b6 00             	movzbl (%eax),%eax
 6a7:	0f be c0             	movsbl %al,%eax
 6aa:	25 ff 00 00 00       	and    $0xff,%eax
 6af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6b2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6b6:	75 2c                	jne    6e4 <printf+0x6a>
      if(c == '%'){
 6b8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6bc:	75 0c                	jne    6ca <printf+0x50>
        state = '%';
 6be:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6c5:	e9 27 01 00 00       	jmp    7f1 <printf+0x177>
      } else {
        putc(fd, c);
 6ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cd:	0f be c0             	movsbl %al,%eax
 6d0:	83 ec 08             	sub    $0x8,%esp
 6d3:	50                   	push   %eax
 6d4:	ff 75 08             	pushl  0x8(%ebp)
 6d7:	e8 c7 fe ff ff       	call   5a3 <putc>
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	e9 0d 01 00 00       	jmp    7f1 <printf+0x177>
      }
    } else if(state == '%'){
 6e4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6e8:	0f 85 03 01 00 00    	jne    7f1 <printf+0x177>
      if(c == 'd'){
 6ee:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6f2:	75 1e                	jne    712 <printf+0x98>
        printint(fd, *ap, 10, 1);
 6f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f7:	8b 00                	mov    (%eax),%eax
 6f9:	6a 01                	push   $0x1
 6fb:	6a 0a                	push   $0xa
 6fd:	50                   	push   %eax
 6fe:	ff 75 08             	pushl  0x8(%ebp)
 701:	e8 c0 fe ff ff       	call   5c6 <printint>
 706:	83 c4 10             	add    $0x10,%esp
        ap++;
 709:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 70d:	e9 d8 00 00 00       	jmp    7ea <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 712:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 716:	74 06                	je     71e <printf+0xa4>
 718:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 71c:	75 1e                	jne    73c <printf+0xc2>
        printint(fd, *ap, 16, 0);
 71e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 721:	8b 00                	mov    (%eax),%eax
 723:	6a 00                	push   $0x0
 725:	6a 10                	push   $0x10
 727:	50                   	push   %eax
 728:	ff 75 08             	pushl  0x8(%ebp)
 72b:	e8 96 fe ff ff       	call   5c6 <printint>
 730:	83 c4 10             	add    $0x10,%esp
        ap++;
 733:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 737:	e9 ae 00 00 00       	jmp    7ea <printf+0x170>
      } else if(c == 's'){
 73c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 740:	75 43                	jne    785 <printf+0x10b>
        s = (char*)*ap;
 742:	8b 45 e8             	mov    -0x18(%ebp),%eax
 745:	8b 00                	mov    (%eax),%eax
 747:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 74a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 74e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 752:	75 25                	jne    779 <printf+0xff>
          s = "(null)";
 754:	c7 45 f4 90 0a 00 00 	movl   $0xa90,-0xc(%ebp)
        while(*s != 0){
 75b:	eb 1c                	jmp    779 <printf+0xff>
          putc(fd, *s);
 75d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 760:	0f b6 00             	movzbl (%eax),%eax
 763:	0f be c0             	movsbl %al,%eax
 766:	83 ec 08             	sub    $0x8,%esp
 769:	50                   	push   %eax
 76a:	ff 75 08             	pushl  0x8(%ebp)
 76d:	e8 31 fe ff ff       	call   5a3 <putc>
 772:	83 c4 10             	add    $0x10,%esp
          s++;
 775:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 779:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77c:	0f b6 00             	movzbl (%eax),%eax
 77f:	84 c0                	test   %al,%al
 781:	75 da                	jne    75d <printf+0xe3>
 783:	eb 65                	jmp    7ea <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 785:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 789:	75 1d                	jne    7a8 <printf+0x12e>
        putc(fd, *ap);
 78b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 78e:	8b 00                	mov    (%eax),%eax
 790:	0f be c0             	movsbl %al,%eax
 793:	83 ec 08             	sub    $0x8,%esp
 796:	50                   	push   %eax
 797:	ff 75 08             	pushl  0x8(%ebp)
 79a:	e8 04 fe ff ff       	call   5a3 <putc>
 79f:	83 c4 10             	add    $0x10,%esp
        ap++;
 7a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a6:	eb 42                	jmp    7ea <printf+0x170>
      } else if(c == '%'){
 7a8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ac:	75 17                	jne    7c5 <printf+0x14b>
        putc(fd, c);
 7ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b1:	0f be c0             	movsbl %al,%eax
 7b4:	83 ec 08             	sub    $0x8,%esp
 7b7:	50                   	push   %eax
 7b8:	ff 75 08             	pushl  0x8(%ebp)
 7bb:	e8 e3 fd ff ff       	call   5a3 <putc>
 7c0:	83 c4 10             	add    $0x10,%esp
 7c3:	eb 25                	jmp    7ea <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7c5:	83 ec 08             	sub    $0x8,%esp
 7c8:	6a 25                	push   $0x25
 7ca:	ff 75 08             	pushl  0x8(%ebp)
 7cd:	e8 d1 fd ff ff       	call   5a3 <putc>
 7d2:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 7d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d8:	0f be c0             	movsbl %al,%eax
 7db:	83 ec 08             	sub    $0x8,%esp
 7de:	50                   	push   %eax
 7df:	ff 75 08             	pushl  0x8(%ebp)
 7e2:	e8 bc fd ff ff       	call   5a3 <putc>
 7e7:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7f1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7f5:	8b 55 0c             	mov    0xc(%ebp),%edx
 7f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fb:	01 d0                	add    %edx,%eax
 7fd:	0f b6 00             	movzbl (%eax),%eax
 800:	84 c0                	test   %al,%al
 802:	0f 85 94 fe ff ff    	jne    69c <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 808:	90                   	nop
 809:	c9                   	leave  
 80a:	c3                   	ret    

0000080b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 80b:	55                   	push   %ebp
 80c:	89 e5                	mov    %esp,%ebp
 80e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 811:	8b 45 08             	mov    0x8(%ebp),%eax
 814:	83 e8 08             	sub    $0x8,%eax
 817:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81a:	a1 44 0d 00 00       	mov    0xd44,%eax
 81f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 822:	eb 24                	jmp    848 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 824:	8b 45 fc             	mov    -0x4(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 82c:	77 12                	ja     840 <free+0x35>
 82e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 831:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 834:	77 24                	ja     85a <free+0x4f>
 836:	8b 45 fc             	mov    -0x4(%ebp),%eax
 839:	8b 00                	mov    (%eax),%eax
 83b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83e:	77 1a                	ja     85a <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 840:	8b 45 fc             	mov    -0x4(%ebp),%eax
 843:	8b 00                	mov    (%eax),%eax
 845:	89 45 fc             	mov    %eax,-0x4(%ebp)
 848:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 84e:	76 d4                	jbe    824 <free+0x19>
 850:	8b 45 fc             	mov    -0x4(%ebp),%eax
 853:	8b 00                	mov    (%eax),%eax
 855:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 858:	76 ca                	jbe    824 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 85a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85d:	8b 40 04             	mov    0x4(%eax),%eax
 860:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 867:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86a:	01 c2                	add    %eax,%edx
 86c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86f:	8b 00                	mov    (%eax),%eax
 871:	39 c2                	cmp    %eax,%edx
 873:	75 24                	jne    899 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 875:	8b 45 f8             	mov    -0x8(%ebp),%eax
 878:	8b 50 04             	mov    0x4(%eax),%edx
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 00                	mov    (%eax),%eax
 880:	8b 40 04             	mov    0x4(%eax),%eax
 883:	01 c2                	add    %eax,%edx
 885:	8b 45 f8             	mov    -0x8(%ebp),%eax
 888:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 88b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88e:	8b 00                	mov    (%eax),%eax
 890:	8b 10                	mov    (%eax),%edx
 892:	8b 45 f8             	mov    -0x8(%ebp),%eax
 895:	89 10                	mov    %edx,(%eax)
 897:	eb 0a                	jmp    8a3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89c:	8b 10                	mov    (%eax),%edx
 89e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a6:	8b 40 04             	mov    0x4(%eax),%eax
 8a9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b3:	01 d0                	add    %edx,%eax
 8b5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b8:	75 20                	jne    8da <free+0xcf>
    p->s.size += bp->s.size;
 8ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bd:	8b 50 04             	mov    0x4(%eax),%edx
 8c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c3:	8b 40 04             	mov    0x4(%eax),%eax
 8c6:	01 c2                	add    %eax,%edx
 8c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d1:	8b 10                	mov    (%eax),%edx
 8d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d6:	89 10                	mov    %edx,(%eax)
 8d8:	eb 08                	jmp    8e2 <free+0xd7>
  } else
    p->s.ptr = bp;
 8da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8dd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8e0:	89 10                	mov    %edx,(%eax)
  freep = p;
 8e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e5:	a3 44 0d 00 00       	mov    %eax,0xd44
}
 8ea:	90                   	nop
 8eb:	c9                   	leave  
 8ec:	c3                   	ret    

000008ed <morecore>:

static Header*
morecore(uint nu)
{
 8ed:	55                   	push   %ebp
 8ee:	89 e5                	mov    %esp,%ebp
 8f0:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8f3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8fa:	77 07                	ja     903 <morecore+0x16>
    nu = 4096;
 8fc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 903:	8b 45 08             	mov    0x8(%ebp),%eax
 906:	c1 e0 03             	shl    $0x3,%eax
 909:	83 ec 0c             	sub    $0xc,%esp
 90c:	50                   	push   %eax
 90d:	e8 39 fc ff ff       	call   54b <sbrk>
 912:	83 c4 10             	add    $0x10,%esp
 915:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 918:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 91c:	75 07                	jne    925 <morecore+0x38>
    return 0;
 91e:	b8 00 00 00 00       	mov    $0x0,%eax
 923:	eb 26                	jmp    94b <morecore+0x5e>
  hp = (Header*)p;
 925:	8b 45 f4             	mov    -0xc(%ebp),%eax
 928:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 92b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92e:	8b 55 08             	mov    0x8(%ebp),%edx
 931:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 934:	8b 45 f0             	mov    -0x10(%ebp),%eax
 937:	83 c0 08             	add    $0x8,%eax
 93a:	83 ec 0c             	sub    $0xc,%esp
 93d:	50                   	push   %eax
 93e:	e8 c8 fe ff ff       	call   80b <free>
 943:	83 c4 10             	add    $0x10,%esp
  return freep;
 946:	a1 44 0d 00 00       	mov    0xd44,%eax
}
 94b:	c9                   	leave  
 94c:	c3                   	ret    

0000094d <malloc>:

void*
malloc(uint nbytes)
{
 94d:	55                   	push   %ebp
 94e:	89 e5                	mov    %esp,%ebp
 950:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 953:	8b 45 08             	mov    0x8(%ebp),%eax
 956:	83 c0 07             	add    $0x7,%eax
 959:	c1 e8 03             	shr    $0x3,%eax
 95c:	83 c0 01             	add    $0x1,%eax
 95f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 962:	a1 44 0d 00 00       	mov    0xd44,%eax
 967:	89 45 f0             	mov    %eax,-0x10(%ebp)
 96a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 96e:	75 23                	jne    993 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 970:	c7 45 f0 3c 0d 00 00 	movl   $0xd3c,-0x10(%ebp)
 977:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97a:	a3 44 0d 00 00       	mov    %eax,0xd44
 97f:	a1 44 0d 00 00       	mov    0xd44,%eax
 984:	a3 3c 0d 00 00       	mov    %eax,0xd3c
    base.s.size = 0;
 989:	c7 05 40 0d 00 00 00 	movl   $0x0,0xd40
 990:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 993:	8b 45 f0             	mov    -0x10(%ebp),%eax
 996:	8b 00                	mov    (%eax),%eax
 998:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99e:	8b 40 04             	mov    0x4(%eax),%eax
 9a1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9a4:	72 4d                	jb     9f3 <malloc+0xa6>
      if(p->s.size == nunits)
 9a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a9:	8b 40 04             	mov    0x4(%eax),%eax
 9ac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9af:	75 0c                	jne    9bd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b4:	8b 10                	mov    (%eax),%edx
 9b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b9:	89 10                	mov    %edx,(%eax)
 9bb:	eb 26                	jmp    9e3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c0:	8b 40 04             	mov    0x4(%eax),%eax
 9c3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9c6:	89 c2                	mov    %eax,%edx
 9c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d1:	8b 40 04             	mov    0x4(%eax),%eax
 9d4:	c1 e0 03             	shl    $0x3,%eax
 9d7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dd:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9e0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e6:	a3 44 0d 00 00       	mov    %eax,0xd44
      return (void*)(p + 1);
 9eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ee:	83 c0 08             	add    $0x8,%eax
 9f1:	eb 3b                	jmp    a2e <malloc+0xe1>
    }
    if(p == freep)
 9f3:	a1 44 0d 00 00       	mov    0xd44,%eax
 9f8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9fb:	75 1e                	jne    a1b <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 9fd:	83 ec 0c             	sub    $0xc,%esp
 a00:	ff 75 ec             	pushl  -0x14(%ebp)
 a03:	e8 e5 fe ff ff       	call   8ed <morecore>
 a08:	83 c4 10             	add    $0x10,%esp
 a0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a0e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a12:	75 07                	jne    a1b <malloc+0xce>
        return 0;
 a14:	b8 00 00 00 00       	mov    $0x0,%eax
 a19:	eb 13                	jmp    a2e <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a24:	8b 00                	mov    (%eax),%eax
 a26:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a29:	e9 6d ff ff ff       	jmp    99b <malloc+0x4e>
}
 a2e:	c9                   	leave  
 a2f:	c3                   	ret    
