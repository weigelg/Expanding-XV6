
_ps-test:     file format elf32-i386


Disassembly of section .text:

00000000 <forktest>:
#include "types.h"
#include "user.h"

void
forktest(int N)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "starting fork test\n");
   6:	83 ec 08             	sub    $0x8,%esp
   9:	68 58 0a 00 00       	push   $0xa58
   e:	6a 01                	push   $0x1
  10:	e8 8d 06 00 00       	call   6a2 <printf>
  15:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<N; n++){
  18:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1f:	eb 2d                	jmp    4e <forktest+0x4e>
    pid = fork();
  21:	e8 bd 04 00 00       	call   4e3 <fork>
  26:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  2d:	78 29                	js     58 <forktest+0x58>
      break;
    if(pid == 0) {
  2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  33:	75 15                	jne    4a <forktest+0x4a>
      sleep(10*TPS);
  35:	83 ec 0c             	sub    $0xc,%esp
  38:	68 10 27 00 00       	push   $0x2710
  3d:	e8 39 05 00 00       	call   57b <sleep>
  42:	83 c4 10             	add    $0x10,%esp
      exit();
  45:	e8 a1 04 00 00       	call   4eb <exit>
{
  int n, pid;

  printf(1, "starting fork test\n");

  for(n=0; n<N; n++){
  4a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  51:	3b 45 08             	cmp    0x8(%ebp),%eax
  54:	7c cb                	jl     21 <forktest+0x21>
  56:	eb 01                	jmp    59 <forktest+0x59>
    pid = fork();
    if(pid < 0)
      break;
  58:	90                   	nop
      sleep(10*TPS);
      exit();
    }
  }

  printf(2, "checking for %d child processes.\n", n);
  59:	83 ec 04             	sub    $0x4,%esp
  5c:	ff 75 f4             	pushl  -0xc(%ebp)
  5f:	68 6c 0a 00 00       	push   $0xa6c
  64:	6a 02                	push   $0x2
  66:	e8 37 06 00 00       	call   6a2 <printf>
  6b:	83 c4 10             	add    $0x10,%esp

  for(; n > 0; n--){
  6e:	eb 24                	jmp    94 <forktest+0x94>
    if(wait() < 0){
  70:	e8 7e 04 00 00       	call   4f3 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	79 17                	jns    90 <forktest+0x90>
      printf(2, "wait stopped early\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 8e 0a 00 00       	push   $0xa8e
  81:	6a 02                	push   $0x2
  83:	e8 1a 06 00 00       	call   6a2 <printf>
  88:	83 c4 10             	add    $0x10,%esp
      exit();
  8b:	e8 5b 04 00 00       	call   4eb <exit>
    }
  }

  printf(2, "checking for %d child processes.\n", n);

  for(; n > 0; n--){
  90:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  94:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  98:	7f d6                	jg     70 <forktest+0x70>
      printf(2, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
  9a:	e8 54 04 00 00       	call   4f3 <wait>
  9f:	83 f8 ff             	cmp    $0xffffffff,%eax
  a2:	74 17                	je     bb <forktest+0xbb>
    printf(2, "wait got too many\n");
  a4:	83 ec 08             	sub    $0x8,%esp
  a7:	68 a2 0a 00 00       	push   $0xaa2
  ac:	6a 02                	push   $0x2
  ae:	e8 ef 05 00 00       	call   6a2 <printf>
  b3:	83 c4 10             	add    $0x10,%esp
    exit();
  b6:	e8 30 04 00 00       	call   4eb <exit>
  }

  printf(1, "fork test OK\n");
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 b5 0a 00 00       	push   $0xab5
  c3:	6a 01                	push   $0x1
  c5:	e8 d8 05 00 00       	call   6a2 <printf>
  ca:	83 c4 10             	add    $0x10,%esp
}
  cd:	90                   	nop
  ce:	c9                   	leave  
  cf:	c3                   	ret    

000000d0 <main>:

int
main(int argc, char **argv)
{
  d0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d4:	83 e4 f0             	and    $0xfffffff0,%esp
  d7:	ff 71 fc             	pushl  -0x4(%ecx)
  da:	55                   	push   %ebp
  db:	89 e5                	mov    %esp,%ebp
  dd:	51                   	push   %ecx
  de:	83 ec 14             	sub    $0x14,%esp
  e1:	89 c8                	mov    %ecx,%eax
  int N;

  if (argc == 1) {
  e3:	83 38 01             	cmpl   $0x1,(%eax)
  e6:	75 17                	jne    ff <main+0x2f>
    printf(2, "Enter number of processes to create\n");
  e8:	83 ec 08             	sub    $0x8,%esp
  eb:	68 c4 0a 00 00       	push   $0xac4
  f0:	6a 02                	push   $0x2
  f2:	e8 ab 05 00 00       	call   6a2 <printf>
  f7:	83 c4 10             	add    $0x10,%esp
    exit();
  fa:	e8 ec 03 00 00       	call   4eb <exit>
  }

  N = atoi(argv[1]);
  ff:	8b 40 04             	mov    0x4(%eax),%eax
 102:	83 c0 04             	add    $0x4,%eax
 105:	8b 00                	mov    (%eax),%eax
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	50                   	push   %eax
 10b:	e8 de 01 00 00       	call   2ee <atoi>
 110:	83 c4 10             	add    $0x10,%esp
 113:	89 45 f4             	mov    %eax,-0xc(%ebp)
  forktest(N);
 116:	83 ec 0c             	sub    $0xc,%esp
 119:	ff 75 f4             	pushl  -0xc(%ebp)
 11c:	e8 df fe ff ff       	call   0 <forktest>
 121:	83 c4 10             	add    $0x10,%esp
  exit();
 124:	e8 c2 03 00 00       	call   4eb <exit>

00000129 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	57                   	push   %edi
 12d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 12e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 131:	8b 55 10             	mov    0x10(%ebp),%edx
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 cb                	mov    %ecx,%ebx
 139:	89 df                	mov    %ebx,%edi
 13b:	89 d1                	mov    %edx,%ecx
 13d:	fc                   	cld    
 13e:	f3 aa                	rep stos %al,%es:(%edi)
 140:	89 ca                	mov    %ecx,%edx
 142:	89 fb                	mov    %edi,%ebx
 144:	89 5d 08             	mov    %ebx,0x8(%ebp)
 147:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 14a:	90                   	nop
 14b:	5b                   	pop    %ebx
 14c:	5f                   	pop    %edi
 14d:	5d                   	pop    %ebp
 14e:	c3                   	ret    

0000014f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
 152:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 155:	8b 45 08             	mov    0x8(%ebp),%eax
 158:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 15b:	90                   	nop
 15c:	8b 45 08             	mov    0x8(%ebp),%eax
 15f:	8d 50 01             	lea    0x1(%eax),%edx
 162:	89 55 08             	mov    %edx,0x8(%ebp)
 165:	8b 55 0c             	mov    0xc(%ebp),%edx
 168:	8d 4a 01             	lea    0x1(%edx),%ecx
 16b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 16e:	0f b6 12             	movzbl (%edx),%edx
 171:	88 10                	mov    %dl,(%eax)
 173:	0f b6 00             	movzbl (%eax),%eax
 176:	84 c0                	test   %al,%al
 178:	75 e2                	jne    15c <strcpy+0xd>
    ;
  return os;
 17a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 17d:	c9                   	leave  
 17e:	c3                   	ret    

0000017f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 182:	eb 08                	jmp    18c <strcmp+0xd>
    p++, q++;
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	84 c0                	test   %al,%al
 194:	74 10                	je     1a6 <strcmp+0x27>
 196:	8b 45 08             	mov    0x8(%ebp),%eax
 199:	0f b6 10             	movzbl (%eax),%edx
 19c:	8b 45 0c             	mov    0xc(%ebp),%eax
 19f:	0f b6 00             	movzbl (%eax),%eax
 1a2:	38 c2                	cmp    %al,%dl
 1a4:	74 de                	je     184 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	0f b6 00             	movzbl (%eax),%eax
 1ac:	0f b6 d0             	movzbl %al,%edx
 1af:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b2:	0f b6 00             	movzbl (%eax),%eax
 1b5:	0f b6 c0             	movzbl %al,%eax
 1b8:	29 c2                	sub    %eax,%edx
 1ba:	89 d0                	mov    %edx,%eax
}
 1bc:	5d                   	pop    %ebp
 1bd:	c3                   	ret    

000001be <strlen>:

uint
strlen(char *s)
{
 1be:	55                   	push   %ebp
 1bf:	89 e5                	mov    %esp,%ebp
 1c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1cb:	eb 04                	jmp    1d1 <strlen+0x13>
 1cd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	01 d0                	add    %edx,%eax
 1d9:	0f b6 00             	movzbl (%eax),%eax
 1dc:	84 c0                	test   %al,%al
 1de:	75 ed                	jne    1cd <strlen+0xf>
    ;
  return n;
 1e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1e8:	8b 45 10             	mov    0x10(%ebp),%eax
 1eb:	50                   	push   %eax
 1ec:	ff 75 0c             	pushl  0xc(%ebp)
 1ef:	ff 75 08             	pushl  0x8(%ebp)
 1f2:	e8 32 ff ff ff       	call   129 <stosb>
 1f7:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fd:	c9                   	leave  
 1fe:	c3                   	ret    

000001ff <strchr>:

char*
strchr(const char *s, char c)
{
 1ff:	55                   	push   %ebp
 200:	89 e5                	mov    %esp,%ebp
 202:	83 ec 04             	sub    $0x4,%esp
 205:	8b 45 0c             	mov    0xc(%ebp),%eax
 208:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 20b:	eb 14                	jmp    221 <strchr+0x22>
    if(*s == c)
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
 210:	0f b6 00             	movzbl (%eax),%eax
 213:	3a 45 fc             	cmp    -0x4(%ebp),%al
 216:	75 05                	jne    21d <strchr+0x1e>
      return (char*)s;
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	eb 13                	jmp    230 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 21d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	0f b6 00             	movzbl (%eax),%eax
 227:	84 c0                	test   %al,%al
 229:	75 e2                	jne    20d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 22b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 230:	c9                   	leave  
 231:	c3                   	ret    

00000232 <gets>:

char*
gets(char *buf, int max)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 238:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 23f:	eb 42                	jmp    283 <gets+0x51>
    cc = read(0, &c, 1);
 241:	83 ec 04             	sub    $0x4,%esp
 244:	6a 01                	push   $0x1
 246:	8d 45 ef             	lea    -0x11(%ebp),%eax
 249:	50                   	push   %eax
 24a:	6a 00                	push   $0x0
 24c:	e8 b2 02 00 00       	call   503 <read>
 251:	83 c4 10             	add    $0x10,%esp
 254:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 257:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 25b:	7e 33                	jle    290 <gets+0x5e>
      break;
    buf[i++] = c;
 25d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 260:	8d 50 01             	lea    0x1(%eax),%edx
 263:	89 55 f4             	mov    %edx,-0xc(%ebp)
 266:	89 c2                	mov    %eax,%edx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	01 c2                	add    %eax,%edx
 26d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 271:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 273:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 277:	3c 0a                	cmp    $0xa,%al
 279:	74 16                	je     291 <gets+0x5f>
 27b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27f:	3c 0d                	cmp    $0xd,%al
 281:	74 0e                	je     291 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 283:	8b 45 f4             	mov    -0xc(%ebp),%eax
 286:	83 c0 01             	add    $0x1,%eax
 289:	3b 45 0c             	cmp    0xc(%ebp),%eax
 28c:	7c b3                	jl     241 <gets+0xf>
 28e:	eb 01                	jmp    291 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 290:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 291:	8b 55 f4             	mov    -0xc(%ebp),%edx
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	01 d0                	add    %edx,%eax
 299:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <stat>:

int
stat(char *n, struct stat *st)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a7:	83 ec 08             	sub    $0x8,%esp
 2aa:	6a 00                	push   $0x0
 2ac:	ff 75 08             	pushl  0x8(%ebp)
 2af:	e8 77 02 00 00       	call   52b <open>
 2b4:	83 c4 10             	add    $0x10,%esp
 2b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2be:	79 07                	jns    2c7 <stat+0x26>
    return -1;
 2c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c5:	eb 25                	jmp    2ec <stat+0x4b>
  r = fstat(fd, st);
 2c7:	83 ec 08             	sub    $0x8,%esp
 2ca:	ff 75 0c             	pushl  0xc(%ebp)
 2cd:	ff 75 f4             	pushl  -0xc(%ebp)
 2d0:	e8 6e 02 00 00       	call   543 <fstat>
 2d5:	83 c4 10             	add    $0x10,%esp
 2d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2db:	83 ec 0c             	sub    $0xc,%esp
 2de:	ff 75 f4             	pushl  -0xc(%ebp)
 2e1:	e8 2d 02 00 00       	call   513 <close>
 2e6:	83 c4 10             	add    $0x10,%esp
  return r;
 2e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2ec:	c9                   	leave  
 2ed:	c3                   	ret    

000002ee <atoi>:

int
atoi(const char *s)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2f4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2fb:	eb 04                	jmp    301 <atoi+0x13>
 2fd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	0f b6 00             	movzbl (%eax),%eax
 307:	3c 20                	cmp    $0x20,%al
 309:	74 f2                	je     2fd <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	0f b6 00             	movzbl (%eax),%eax
 311:	3c 2d                	cmp    $0x2d,%al
 313:	75 07                	jne    31c <atoi+0x2e>
 315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 31a:	eb 05                	jmp    321 <atoi+0x33>
 31c:	b8 01 00 00 00       	mov    $0x1,%eax
 321:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	0f b6 00             	movzbl (%eax),%eax
 32a:	3c 2b                	cmp    $0x2b,%al
 32c:	74 0a                	je     338 <atoi+0x4a>
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	0f b6 00             	movzbl (%eax),%eax
 334:	3c 2d                	cmp    $0x2d,%al
 336:	75 2b                	jne    363 <atoi+0x75>
    s++;
 338:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 33c:	eb 25                	jmp    363 <atoi+0x75>
    n = n*10 + *s++ - '0';
 33e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 341:	89 d0                	mov    %edx,%eax
 343:	c1 e0 02             	shl    $0x2,%eax
 346:	01 d0                	add    %edx,%eax
 348:	01 c0                	add    %eax,%eax
 34a:	89 c1                	mov    %eax,%ecx
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
 34f:	8d 50 01             	lea    0x1(%eax),%edx
 352:	89 55 08             	mov    %edx,0x8(%ebp)
 355:	0f b6 00             	movzbl (%eax),%eax
 358:	0f be c0             	movsbl %al,%eax
 35b:	01 c8                	add    %ecx,%eax
 35d:	83 e8 30             	sub    $0x30,%eax
 360:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	0f b6 00             	movzbl (%eax),%eax
 369:	3c 2f                	cmp    $0x2f,%al
 36b:	7e 0a                	jle    377 <atoi+0x89>
 36d:	8b 45 08             	mov    0x8(%ebp),%eax
 370:	0f b6 00             	movzbl (%eax),%eax
 373:	3c 39                	cmp    $0x39,%al
 375:	7e c7                	jle    33e <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 377:	8b 45 f8             	mov    -0x8(%ebp),%eax
 37a:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 37e:	c9                   	leave  
 37f:	c3                   	ret    

00000380 <atoo>:

int
atoo(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 386:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 38d:	eb 04                	jmp    393 <atoo+0x13>
 38f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	0f b6 00             	movzbl (%eax),%eax
 399:	3c 20                	cmp    $0x20,%al
 39b:	74 f2                	je     38f <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
 3a0:	0f b6 00             	movzbl (%eax),%eax
 3a3:	3c 2d                	cmp    $0x2d,%al
 3a5:	75 07                	jne    3ae <atoo+0x2e>
 3a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ac:	eb 05                	jmp    3b3 <atoo+0x33>
 3ae:	b8 01 00 00 00       	mov    $0x1,%eax
 3b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 00             	movzbl (%eax),%eax
 3bc:	3c 2b                	cmp    $0x2b,%al
 3be:	74 0a                	je     3ca <atoo+0x4a>
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	0f b6 00             	movzbl (%eax),%eax
 3c6:	3c 2d                	cmp    $0x2d,%al
 3c8:	75 27                	jne    3f1 <atoo+0x71>
    s++;
 3ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 3ce:	eb 21                	jmp    3f1 <atoo+0x71>
    n = n*8 + *s++ - '0';
 3d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3d3:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 3da:	8b 45 08             	mov    0x8(%ebp),%eax
 3dd:	8d 50 01             	lea    0x1(%eax),%edx
 3e0:	89 55 08             	mov    %edx,0x8(%ebp)
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f be c0             	movsbl %al,%eax
 3e9:	01 c8                	add    %ecx,%eax
 3eb:	83 e8 30             	sub    $0x30,%eax
 3ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	0f b6 00             	movzbl (%eax),%eax
 3f7:	3c 2f                	cmp    $0x2f,%al
 3f9:	7e 0a                	jle    405 <atoo+0x85>
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	0f b6 00             	movzbl (%eax),%eax
 401:	3c 37                	cmp    $0x37,%al
 403:	7e cb                	jle    3d0 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 405:	8b 45 f8             	mov    -0x8(%ebp),%eax
 408:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 414:	8b 45 08             	mov    0x8(%ebp),%eax
 417:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 41a:	8b 45 0c             	mov    0xc(%ebp),%eax
 41d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 420:	eb 17                	jmp    439 <memmove+0x2b>
    *dst++ = *src++;
 422:	8b 45 fc             	mov    -0x4(%ebp),%eax
 425:	8d 50 01             	lea    0x1(%eax),%edx
 428:	89 55 fc             	mov    %edx,-0x4(%ebp)
 42b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 42e:	8d 4a 01             	lea    0x1(%edx),%ecx
 431:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 434:	0f b6 12             	movzbl (%edx),%edx
 437:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 439:	8b 45 10             	mov    0x10(%ebp),%eax
 43c:	8d 50 ff             	lea    -0x1(%eax),%edx
 43f:	89 55 10             	mov    %edx,0x10(%ebp)
 442:	85 c0                	test   %eax,%eax
 444:	7f dc                	jg     422 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 446:	8b 45 08             	mov    0x8(%ebp),%eax
}
 449:	c9                   	leave  
 44a:	c3                   	ret    

0000044b <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 44b:	55                   	push   %ebp
 44c:	89 e5                	mov    %esp,%ebp
 44e:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 451:	8b 4d 08             	mov    0x8(%ebp),%ecx
 454:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 459:	89 c8                	mov    %ecx,%eax
 45b:	f7 e2                	mul    %edx
 45d:	89 d0                	mov    %edx,%eax
 45f:	c1 e8 06             	shr    $0x6,%eax
 462:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 468:	29 c1                	sub    %eax,%ecx
 46a:	89 c8                	mov    %ecx,%eax
 46c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 477:	f7 e2                	mul    %edx
 479:	89 d0                	mov    %edx,%eax
 47b:	c1 e8 06             	shr    $0x6,%eax
 47e:	83 ec 04             	sub    $0x4,%esp
 481:	50                   	push   %eax
 482:	68 e9 0a 00 00       	push   $0xae9
 487:	6a 01                	push   $0x1
 489:	e8 14 02 00 00       	call   6a2 <printf>
 48e:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 491:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 495:	7e 17                	jle    4ae <zeropad+0x63>
    printf(1,"%d", miliseconds);
 497:	83 ec 04             	sub    $0x4,%esp
 49a:	ff 75 f4             	pushl  -0xc(%ebp)
 49d:	68 ed 0a 00 00       	push   $0xaed
 4a2:	6a 01                	push   $0x1
 4a4:	e8 f9 01 00 00       	call   6a2 <printf>
 4a9:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 4ac:	eb 32                	jmp    4e0 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 4ae:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 4b2:	7e 17                	jle    4cb <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 4b4:	83 ec 04             	sub    $0x4,%esp
 4b7:	ff 75 f4             	pushl  -0xc(%ebp)
 4ba:	68 f0 0a 00 00       	push   $0xaf0
 4bf:	6a 01                	push   $0x1
 4c1:	e8 dc 01 00 00       	call   6a2 <printf>
 4c6:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 4c9:	eb 15                	jmp    4e0 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 4cb:	83 ec 04             	sub    $0x4,%esp
 4ce:	ff 75 f4             	pushl  -0xc(%ebp)
 4d1:	68 f4 0a 00 00       	push   $0xaf4
 4d6:	6a 01                	push   $0x1
 4d8:	e8 c5 01 00 00       	call   6a2 <printf>
 4dd:	83 c4 10             	add    $0x10,%esp
};
 4e0:	90                   	nop
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4e3:	b8 01 00 00 00       	mov    $0x1,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <exit>:
SYSCALL(exit)
 4eb:	b8 02 00 00 00       	mov    $0x2,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <wait>:
SYSCALL(wait)
 4f3:	b8 03 00 00 00       	mov    $0x3,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <pipe>:
SYSCALL(pipe)
 4fb:	b8 04 00 00 00       	mov    $0x4,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <read>:
SYSCALL(read)
 503:	b8 05 00 00 00       	mov    $0x5,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <write>:
SYSCALL(write)
 50b:	b8 10 00 00 00       	mov    $0x10,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <close>:
SYSCALL(close)
 513:	b8 15 00 00 00       	mov    $0x15,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <kill>:
SYSCALL(kill)
 51b:	b8 06 00 00 00       	mov    $0x6,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <exec>:
SYSCALL(exec)
 523:	b8 07 00 00 00       	mov    $0x7,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <open>:
SYSCALL(open)
 52b:	b8 0f 00 00 00       	mov    $0xf,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <mknod>:
SYSCALL(mknod)
 533:	b8 11 00 00 00       	mov    $0x11,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <unlink>:
SYSCALL(unlink)
 53b:	b8 12 00 00 00       	mov    $0x12,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <fstat>:
SYSCALL(fstat)
 543:	b8 08 00 00 00       	mov    $0x8,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <link>:
SYSCALL(link)
 54b:	b8 13 00 00 00       	mov    $0x13,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <mkdir>:
SYSCALL(mkdir)
 553:	b8 14 00 00 00       	mov    $0x14,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <chdir>:
SYSCALL(chdir)
 55b:	b8 09 00 00 00       	mov    $0x9,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <dup>:
SYSCALL(dup)
 563:	b8 0a 00 00 00       	mov    $0xa,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <getpid>:
SYSCALL(getpid)
 56b:	b8 0b 00 00 00       	mov    $0xb,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sbrk>:
SYSCALL(sbrk)
 573:	b8 0c 00 00 00       	mov    $0xc,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <sleep>:
SYSCALL(sleep)
 57b:	b8 0d 00 00 00       	mov    $0xd,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <uptime>:
SYSCALL(uptime)
 583:	b8 0e 00 00 00       	mov    $0xe,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <halt>:
SYSCALL(halt)
 58b:	b8 16 00 00 00       	mov    $0x16,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <date>:

SYSCALL(date)
 593:	b8 17 00 00 00       	mov    $0x17,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <getuid>:
SYSCALL(getuid)
 59b:	b8 18 00 00 00       	mov    $0x18,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <getgid>:
SYSCALL(getgid)
 5a3:	b8 19 00 00 00       	mov    $0x19,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <getppid>:
SYSCALL(getppid)
 5ab:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <setuid>:
SYSCALL(setuid)
 5b3:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <setgid>:
SYSCALL(setgid)
 5bb:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <getprocs>:
SYSCALL(getprocs)
 5c3:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5cb:	55                   	push   %ebp
 5cc:	89 e5                	mov    %esp,%ebp
 5ce:	83 ec 18             	sub    $0x18,%esp
 5d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5d7:	83 ec 04             	sub    $0x4,%esp
 5da:	6a 01                	push   $0x1
 5dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5df:	50                   	push   %eax
 5e0:	ff 75 08             	pushl  0x8(%ebp)
 5e3:	e8 23 ff ff ff       	call   50b <write>
 5e8:	83 c4 10             	add    $0x10,%esp
}
 5eb:	90                   	nop
 5ec:	c9                   	leave  
 5ed:	c3                   	ret    

000005ee <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ee:	55                   	push   %ebp
 5ef:	89 e5                	mov    %esp,%ebp
 5f1:	53                   	push   %ebx
 5f2:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5f5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5fc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 600:	74 17                	je     619 <printint+0x2b>
 602:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 606:	79 11                	jns    619 <printint+0x2b>
    neg = 1;
 608:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 60f:	8b 45 0c             	mov    0xc(%ebp),%eax
 612:	f7 d8                	neg    %eax
 614:	89 45 ec             	mov    %eax,-0x14(%ebp)
 617:	eb 06                	jmp    61f <printint+0x31>
  } else {
    x = xx;
 619:	8b 45 0c             	mov    0xc(%ebp),%eax
 61c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 61f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 626:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 629:	8d 41 01             	lea    0x1(%ecx),%eax
 62c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 62f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 632:	8b 45 ec             	mov    -0x14(%ebp),%eax
 635:	ba 00 00 00 00       	mov    $0x0,%edx
 63a:	f7 f3                	div    %ebx
 63c:	89 d0                	mov    %edx,%eax
 63e:	0f b6 80 a8 0d 00 00 	movzbl 0xda8(%eax),%eax
 645:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 649:	8b 5d 10             	mov    0x10(%ebp),%ebx
 64c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 64f:	ba 00 00 00 00       	mov    $0x0,%edx
 654:	f7 f3                	div    %ebx
 656:	89 45 ec             	mov    %eax,-0x14(%ebp)
 659:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 65d:	75 c7                	jne    626 <printint+0x38>
  if(neg)
 65f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 663:	74 2d                	je     692 <printint+0xa4>
    buf[i++] = '-';
 665:	8b 45 f4             	mov    -0xc(%ebp),%eax
 668:	8d 50 01             	lea    0x1(%eax),%edx
 66b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 66e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 673:	eb 1d                	jmp    692 <printint+0xa4>
    putc(fd, buf[i]);
 675:	8d 55 dc             	lea    -0x24(%ebp),%edx
 678:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67b:	01 d0                	add    %edx,%eax
 67d:	0f b6 00             	movzbl (%eax),%eax
 680:	0f be c0             	movsbl %al,%eax
 683:	83 ec 08             	sub    $0x8,%esp
 686:	50                   	push   %eax
 687:	ff 75 08             	pushl  0x8(%ebp)
 68a:	e8 3c ff ff ff       	call   5cb <putc>
 68f:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 692:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 696:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 69a:	79 d9                	jns    675 <printint+0x87>
    putc(fd, buf[i]);
}
 69c:	90                   	nop
 69d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a0:	c9                   	leave  
 6a1:	c3                   	ret    

000006a2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6a2:	55                   	push   %ebp
 6a3:	89 e5                	mov    %esp,%ebp
 6a5:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6af:	8d 45 0c             	lea    0xc(%ebp),%eax
 6b2:	83 c0 04             	add    $0x4,%eax
 6b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6bf:	e9 59 01 00 00       	jmp    81d <printf+0x17b>
    c = fmt[i] & 0xff;
 6c4:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ca:	01 d0                	add    %edx,%eax
 6cc:	0f b6 00             	movzbl (%eax),%eax
 6cf:	0f be c0             	movsbl %al,%eax
 6d2:	25 ff 00 00 00       	and    $0xff,%eax
 6d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6da:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6de:	75 2c                	jne    70c <printf+0x6a>
      if(c == '%'){
 6e0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e4:	75 0c                	jne    6f2 <printf+0x50>
        state = '%';
 6e6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6ed:	e9 27 01 00 00       	jmp    819 <printf+0x177>
      } else {
        putc(fd, c);
 6f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f5:	0f be c0             	movsbl %al,%eax
 6f8:	83 ec 08             	sub    $0x8,%esp
 6fb:	50                   	push   %eax
 6fc:	ff 75 08             	pushl  0x8(%ebp)
 6ff:	e8 c7 fe ff ff       	call   5cb <putc>
 704:	83 c4 10             	add    $0x10,%esp
 707:	e9 0d 01 00 00       	jmp    819 <printf+0x177>
      }
    } else if(state == '%'){
 70c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 710:	0f 85 03 01 00 00    	jne    819 <printf+0x177>
      if(c == 'd'){
 716:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 71a:	75 1e                	jne    73a <printf+0x98>
        printint(fd, *ap, 10, 1);
 71c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71f:	8b 00                	mov    (%eax),%eax
 721:	6a 01                	push   $0x1
 723:	6a 0a                	push   $0xa
 725:	50                   	push   %eax
 726:	ff 75 08             	pushl  0x8(%ebp)
 729:	e8 c0 fe ff ff       	call   5ee <printint>
 72e:	83 c4 10             	add    $0x10,%esp
        ap++;
 731:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 735:	e9 d8 00 00 00       	jmp    812 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 73a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 73e:	74 06                	je     746 <printf+0xa4>
 740:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 744:	75 1e                	jne    764 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 746:	8b 45 e8             	mov    -0x18(%ebp),%eax
 749:	8b 00                	mov    (%eax),%eax
 74b:	6a 00                	push   $0x0
 74d:	6a 10                	push   $0x10
 74f:	50                   	push   %eax
 750:	ff 75 08             	pushl  0x8(%ebp)
 753:	e8 96 fe ff ff       	call   5ee <printint>
 758:	83 c4 10             	add    $0x10,%esp
        ap++;
 75b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 75f:	e9 ae 00 00 00       	jmp    812 <printf+0x170>
      } else if(c == 's'){
 764:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 768:	75 43                	jne    7ad <printf+0x10b>
        s = (char*)*ap;
 76a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76d:	8b 00                	mov    (%eax),%eax
 76f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 772:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 776:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 77a:	75 25                	jne    7a1 <printf+0xff>
          s = "(null)";
 77c:	c7 45 f4 f9 0a 00 00 	movl   $0xaf9,-0xc(%ebp)
        while(*s != 0){
 783:	eb 1c                	jmp    7a1 <printf+0xff>
          putc(fd, *s);
 785:	8b 45 f4             	mov    -0xc(%ebp),%eax
 788:	0f b6 00             	movzbl (%eax),%eax
 78b:	0f be c0             	movsbl %al,%eax
 78e:	83 ec 08             	sub    $0x8,%esp
 791:	50                   	push   %eax
 792:	ff 75 08             	pushl  0x8(%ebp)
 795:	e8 31 fe ff ff       	call   5cb <putc>
 79a:	83 c4 10             	add    $0x10,%esp
          s++;
 79d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a4:	0f b6 00             	movzbl (%eax),%eax
 7a7:	84 c0                	test   %al,%al
 7a9:	75 da                	jne    785 <printf+0xe3>
 7ab:	eb 65                	jmp    812 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ad:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7b1:	75 1d                	jne    7d0 <printf+0x12e>
        putc(fd, *ap);
 7b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	0f be c0             	movsbl %al,%eax
 7bb:	83 ec 08             	sub    $0x8,%esp
 7be:	50                   	push   %eax
 7bf:	ff 75 08             	pushl  0x8(%ebp)
 7c2:	e8 04 fe ff ff       	call   5cb <putc>
 7c7:	83 c4 10             	add    $0x10,%esp
        ap++;
 7ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ce:	eb 42                	jmp    812 <printf+0x170>
      } else if(c == '%'){
 7d0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7d4:	75 17                	jne    7ed <printf+0x14b>
        putc(fd, c);
 7d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d9:	0f be c0             	movsbl %al,%eax
 7dc:	83 ec 08             	sub    $0x8,%esp
 7df:	50                   	push   %eax
 7e0:	ff 75 08             	pushl  0x8(%ebp)
 7e3:	e8 e3 fd ff ff       	call   5cb <putc>
 7e8:	83 c4 10             	add    $0x10,%esp
 7eb:	eb 25                	jmp    812 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ed:	83 ec 08             	sub    $0x8,%esp
 7f0:	6a 25                	push   $0x25
 7f2:	ff 75 08             	pushl  0x8(%ebp)
 7f5:	e8 d1 fd ff ff       	call   5cb <putc>
 7fa:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 7fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 800:	0f be c0             	movsbl %al,%eax
 803:	83 ec 08             	sub    $0x8,%esp
 806:	50                   	push   %eax
 807:	ff 75 08             	pushl  0x8(%ebp)
 80a:	e8 bc fd ff ff       	call   5cb <putc>
 80f:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 812:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 819:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 81d:	8b 55 0c             	mov    0xc(%ebp),%edx
 820:	8b 45 f0             	mov    -0x10(%ebp),%eax
 823:	01 d0                	add    %edx,%eax
 825:	0f b6 00             	movzbl (%eax),%eax
 828:	84 c0                	test   %al,%al
 82a:	0f 85 94 fe ff ff    	jne    6c4 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 830:	90                   	nop
 831:	c9                   	leave  
 832:	c3                   	ret    

00000833 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 833:	55                   	push   %ebp
 834:	89 e5                	mov    %esp,%ebp
 836:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
 83c:	83 e8 08             	sub    $0x8,%eax
 83f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 842:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 847:	89 45 fc             	mov    %eax,-0x4(%ebp)
 84a:	eb 24                	jmp    870 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	8b 00                	mov    (%eax),%eax
 851:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 854:	77 12                	ja     868 <free+0x35>
 856:	8b 45 f8             	mov    -0x8(%ebp),%eax
 859:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 85c:	77 24                	ja     882 <free+0x4f>
 85e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 861:	8b 00                	mov    (%eax),%eax
 863:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 866:	77 1a                	ja     882 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 868:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86b:	8b 00                	mov    (%eax),%eax
 86d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 870:	8b 45 f8             	mov    -0x8(%ebp),%eax
 873:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 876:	76 d4                	jbe    84c <free+0x19>
 878:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87b:	8b 00                	mov    (%eax),%eax
 87d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 880:	76 ca                	jbe    84c <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 882:	8b 45 f8             	mov    -0x8(%ebp),%eax
 885:	8b 40 04             	mov    0x4(%eax),%eax
 888:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 88f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 892:	01 c2                	add    %eax,%edx
 894:	8b 45 fc             	mov    -0x4(%ebp),%eax
 897:	8b 00                	mov    (%eax),%eax
 899:	39 c2                	cmp    %eax,%edx
 89b:	75 24                	jne    8c1 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 89d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a0:	8b 50 04             	mov    0x4(%eax),%edx
 8a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a6:	8b 00                	mov    (%eax),%eax
 8a8:	8b 40 04             	mov    0x4(%eax),%eax
 8ab:	01 c2                	add    %eax,%edx
 8ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b6:	8b 00                	mov    (%eax),%eax
 8b8:	8b 10                	mov    (%eax),%edx
 8ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bd:	89 10                	mov    %edx,(%eax)
 8bf:	eb 0a                	jmp    8cb <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c4:	8b 10                	mov    (%eax),%edx
 8c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c9:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ce:	8b 40 04             	mov    0x4(%eax),%eax
 8d1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8db:	01 d0                	add    %edx,%eax
 8dd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e0:	75 20                	jne    902 <free+0xcf>
    p->s.size += bp->s.size;
 8e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e5:	8b 50 04             	mov    0x4(%eax),%edx
 8e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8eb:	8b 40 04             	mov    0x4(%eax),%eax
 8ee:	01 c2                	add    %eax,%edx
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f9:	8b 10                	mov    (%eax),%edx
 8fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fe:	89 10                	mov    %edx,(%eax)
 900:	eb 08                	jmp    90a <free+0xd7>
  } else
    p->s.ptr = bp;
 902:	8b 45 fc             	mov    -0x4(%ebp),%eax
 905:	8b 55 f8             	mov    -0x8(%ebp),%edx
 908:	89 10                	mov    %edx,(%eax)
  freep = p;
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	a3 c4 0d 00 00       	mov    %eax,0xdc4
}
 912:	90                   	nop
 913:	c9                   	leave  
 914:	c3                   	ret    

00000915 <morecore>:

static Header*
morecore(uint nu)
{
 915:	55                   	push   %ebp
 916:	89 e5                	mov    %esp,%ebp
 918:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 91b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 922:	77 07                	ja     92b <morecore+0x16>
    nu = 4096;
 924:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 92b:	8b 45 08             	mov    0x8(%ebp),%eax
 92e:	c1 e0 03             	shl    $0x3,%eax
 931:	83 ec 0c             	sub    $0xc,%esp
 934:	50                   	push   %eax
 935:	e8 39 fc ff ff       	call   573 <sbrk>
 93a:	83 c4 10             	add    $0x10,%esp
 93d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 940:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 944:	75 07                	jne    94d <morecore+0x38>
    return 0;
 946:	b8 00 00 00 00       	mov    $0x0,%eax
 94b:	eb 26                	jmp    973 <morecore+0x5e>
  hp = (Header*)p;
 94d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 950:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 953:	8b 45 f0             	mov    -0x10(%ebp),%eax
 956:	8b 55 08             	mov    0x8(%ebp),%edx
 959:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 95c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95f:	83 c0 08             	add    $0x8,%eax
 962:	83 ec 0c             	sub    $0xc,%esp
 965:	50                   	push   %eax
 966:	e8 c8 fe ff ff       	call   833 <free>
 96b:	83 c4 10             	add    $0x10,%esp
  return freep;
 96e:	a1 c4 0d 00 00       	mov    0xdc4,%eax
}
 973:	c9                   	leave  
 974:	c3                   	ret    

00000975 <malloc>:

void*
malloc(uint nbytes)
{
 975:	55                   	push   %ebp
 976:	89 e5                	mov    %esp,%ebp
 978:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 97b:	8b 45 08             	mov    0x8(%ebp),%eax
 97e:	83 c0 07             	add    $0x7,%eax
 981:	c1 e8 03             	shr    $0x3,%eax
 984:	83 c0 01             	add    $0x1,%eax
 987:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 98a:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 98f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 992:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 996:	75 23                	jne    9bb <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 998:	c7 45 f0 bc 0d 00 00 	movl   $0xdbc,-0x10(%ebp)
 99f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a2:	a3 c4 0d 00 00       	mov    %eax,0xdc4
 9a7:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 9ac:	a3 bc 0d 00 00       	mov    %eax,0xdbc
    base.s.size = 0;
 9b1:	c7 05 c0 0d 00 00 00 	movl   $0x0,0xdc0
 9b8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9be:	8b 00                	mov    (%eax),%eax
 9c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c6:	8b 40 04             	mov    0x4(%eax),%eax
 9c9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9cc:	72 4d                	jb     a1b <malloc+0xa6>
      if(p->s.size == nunits)
 9ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d1:	8b 40 04             	mov    0x4(%eax),%eax
 9d4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9d7:	75 0c                	jne    9e5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dc:	8b 10                	mov    (%eax),%edx
 9de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e1:	89 10                	mov    %edx,(%eax)
 9e3:	eb 26                	jmp    a0b <malloc+0x96>
      else {
        p->s.size -= nunits;
 9e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e8:	8b 40 04             	mov    0x4(%eax),%eax
 9eb:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9ee:	89 c2                	mov    %eax,%edx
 9f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f9:	8b 40 04             	mov    0x4(%eax),%eax
 9fc:	c1 e0 03             	shl    $0x3,%eax
 9ff:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a05:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a08:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0e:	a3 c4 0d 00 00       	mov    %eax,0xdc4
      return (void*)(p + 1);
 a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a16:	83 c0 08             	add    $0x8,%eax
 a19:	eb 3b                	jmp    a56 <malloc+0xe1>
    }
    if(p == freep)
 a1b:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 a20:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a23:	75 1e                	jne    a43 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a25:	83 ec 0c             	sub    $0xc,%esp
 a28:	ff 75 ec             	pushl  -0x14(%ebp)
 a2b:	e8 e5 fe ff ff       	call   915 <morecore>
 a30:	83 c4 10             	add    $0x10,%esp
 a33:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a36:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a3a:	75 07                	jne    a43 <malloc+0xce>
        return 0;
 a3c:	b8 00 00 00 00       	mov    $0x0,%eax
 a41:	eb 13                	jmp    a56 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a46:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4c:	8b 00                	mov    (%eax),%eax
 a4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a51:	e9 6d ff ff ff       	jmp    9c3 <malloc+0x4e>
}
 a56:	c9                   	leave  
 a57:	c3                   	ret    
