
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
  write(fd, s, strlen(s));
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	ff 75 0c             	pushl  0xc(%ebp)
   c:	e8 97 01 00 00       	call   1a8 <strlen>
  11:	83 c4 10             	add    $0x10,%esp
  14:	83 ec 04             	sub    $0x4,%esp
  17:	50                   	push   %eax
  18:	ff 75 0c             	pushl  0xc(%ebp)
  1b:	ff 75 08             	pushl  0x8(%ebp)
  1e:	e8 d2 04 00 00       	call   4f5 <write>
  23:	83 c4 10             	add    $0x10,%esp
}
  26:	90                   	nop
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	83 ec 08             	sub    $0x8,%esp
  32:	68 b8 05 00 00       	push   $0x5b8
  37:	6a 01                	push   $0x1
  39:	e8 c2 ff ff ff       	call   0 <printf>
  3e:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<N; n++){
  41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  48:	eb 1d                	jmp    67 <forktest+0x3e>
    pid = fork();
  4a:	e8 7e 04 00 00       	call   4cd <fork>
  4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  52:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  56:	78 1a                	js     72 <forktest+0x49>
      break;
    if(pid == 0)
  58:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  5c:	75 05                	jne    63 <forktest+0x3a>
      exit();
  5e:	e8 72 04 00 00       	call   4d5 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  67:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  6e:	7e da                	jle    4a <forktest+0x21>
  70:	eb 01                	jmp    73 <forktest+0x4a>
    pid = fork();
    if(pid < 0)
      break;
  72:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == N){
  73:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
  7a:	75 40                	jne    bc <forktest+0x93>
    printf(1, "fork claimed to work N times!\n", N);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	68 e8 03 00 00       	push   $0x3e8
  84:	68 c4 05 00 00       	push   $0x5c4
  89:	6a 01                	push   $0x1
  8b:	e8 70 ff ff ff       	call   0 <printf>
  90:	83 c4 10             	add    $0x10,%esp
    exit();
  93:	e8 3d 04 00 00       	call   4d5 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
  98:	e8 40 04 00 00       	call   4dd <wait>
  9d:	85 c0                	test   %eax,%eax
  9f:	79 17                	jns    b8 <forktest+0x8f>
      printf(1, "wait stopped early\n");
  a1:	83 ec 08             	sub    $0x8,%esp
  a4:	68 e3 05 00 00       	push   $0x5e3
  a9:	6a 01                	push   $0x1
  ab:	e8 50 ff ff ff       	call   0 <printf>
  b0:	83 c4 10             	add    $0x10,%esp
      exit();
  b3:	e8 1d 04 00 00       	call   4d5 <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  b8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c0:	7f d6                	jg     98 <forktest+0x6f>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  c2:	e8 16 04 00 00       	call   4dd <wait>
  c7:	83 f8 ff             	cmp    $0xffffffff,%eax
  ca:	74 17                	je     e3 <forktest+0xba>
    printf(1, "wait got too many\n");
  cc:	83 ec 08             	sub    $0x8,%esp
  cf:	68 f7 05 00 00       	push   $0x5f7
  d4:	6a 01                	push   $0x1
  d6:	e8 25 ff ff ff       	call   0 <printf>
  db:	83 c4 10             	add    $0x10,%esp
    exit();
  de:	e8 f2 03 00 00       	call   4d5 <exit>
  }
  
  printf(1, "fork test OK\n");
  e3:	83 ec 08             	sub    $0x8,%esp
  e6:	68 0a 06 00 00       	push   $0x60a
  eb:	6a 01                	push   $0x1
  ed:	e8 0e ff ff ff       	call   0 <printf>
  f2:	83 c4 10             	add    $0x10,%esp
}
  f5:	90                   	nop
  f6:	c9                   	leave  
  f7:	c3                   	ret    

000000f8 <main>:

int
main(void)
{
  f8:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  fc:	83 e4 f0             	and    $0xfffffff0,%esp
  ff:	ff 71 fc             	pushl  -0x4(%ecx)
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	51                   	push   %ecx
 106:	83 ec 04             	sub    $0x4,%esp
  forktest();
 109:	e8 1b ff ff ff       	call   29 <forktest>
  exit();
 10e:	e8 c2 03 00 00       	call   4d5 <exit>

00000113 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 118:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11b:	8b 55 10             	mov    0x10(%ebp),%edx
 11e:	8b 45 0c             	mov    0xc(%ebp),%eax
 121:	89 cb                	mov    %ecx,%ebx
 123:	89 df                	mov    %ebx,%edi
 125:	89 d1                	mov    %edx,%ecx
 127:	fc                   	cld    
 128:	f3 aa                	rep stos %al,%es:(%edi)
 12a:	89 ca                	mov    %ecx,%edx
 12c:	89 fb                	mov    %edi,%ebx
 12e:	89 5d 08             	mov    %ebx,0x8(%ebp)
 131:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 134:	90                   	nop
 135:	5b                   	pop    %ebx
 136:	5f                   	pop    %edi
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    

00000139 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 145:	90                   	nop
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	8d 50 01             	lea    0x1(%eax),%edx
 14c:	89 55 08             	mov    %edx,0x8(%ebp)
 14f:	8b 55 0c             	mov    0xc(%ebp),%edx
 152:	8d 4a 01             	lea    0x1(%edx),%ecx
 155:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 158:	0f b6 12             	movzbl (%edx),%edx
 15b:	88 10                	mov    %dl,(%eax)
 15d:	0f b6 00             	movzbl (%eax),%eax
 160:	84 c0                	test   %al,%al
 162:	75 e2                	jne    146 <strcpy+0xd>
    ;
  return os;
 164:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 167:	c9                   	leave  
 168:	c3                   	ret    

00000169 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16c:	eb 08                	jmp    176 <strcmp+0xd>
    p++, q++;
 16e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 172:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	84 c0                	test   %al,%al
 17e:	74 10                	je     190 <strcmp+0x27>
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	0f b6 10             	movzbl (%eax),%edx
 186:	8b 45 0c             	mov    0xc(%ebp),%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	38 c2                	cmp    %al,%dl
 18e:	74 de                	je     16e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	0f b6 d0             	movzbl %al,%edx
 199:	8b 45 0c             	mov    0xc(%ebp),%eax
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	0f b6 c0             	movzbl %al,%eax
 1a2:	29 c2                	sub    %eax,%edx
 1a4:	89 d0                	mov    %edx,%eax
}
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    

000001a8 <strlen>:

uint
strlen(char *s)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b5:	eb 04                	jmp    1bb <strlen+0x13>
 1b7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 d0                	add    %edx,%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	84 c0                	test   %al,%al
 1c8:	75 ed                	jne    1b7 <strlen+0xf>
    ;
  return n;
 1ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1cd:	c9                   	leave  
 1ce:	c3                   	ret    

000001cf <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1d2:	8b 45 10             	mov    0x10(%ebp),%eax
 1d5:	50                   	push   %eax
 1d6:	ff 75 0c             	pushl  0xc(%ebp)
 1d9:	ff 75 08             	pushl  0x8(%ebp)
 1dc:	e8 32 ff ff ff       	call   113 <stosb>
 1e1:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    

000001e9 <strchr>:

char*
strchr(const char *s, char c)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 04             	sub    $0x4,%esp
 1ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f2:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1f5:	eb 14                	jmp    20b <strchr+0x22>
    if(*s == c)
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 00             	movzbl (%eax),%eax
 1fd:	3a 45 fc             	cmp    -0x4(%ebp),%al
 200:	75 05                	jne    207 <strchr+0x1e>
      return (char*)s;
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	eb 13                	jmp    21a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 207:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	0f b6 00             	movzbl (%eax),%eax
 211:	84 c0                	test   %al,%al
 213:	75 e2                	jne    1f7 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 215:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    

0000021c <gets>:

char*
gets(char *buf, int max)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 222:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 229:	eb 42                	jmp    26d <gets+0x51>
    cc = read(0, &c, 1);
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	6a 01                	push   $0x1
 230:	8d 45 ef             	lea    -0x11(%ebp),%eax
 233:	50                   	push   %eax
 234:	6a 00                	push   $0x0
 236:	e8 b2 02 00 00       	call   4ed <read>
 23b:	83 c4 10             	add    $0x10,%esp
 23e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 241:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 245:	7e 33                	jle    27a <gets+0x5e>
      break;
    buf[i++] = c;
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 250:	89 c2                	mov    %eax,%edx
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	01 c2                	add    %eax,%edx
 257:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 25d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 261:	3c 0a                	cmp    $0xa,%al
 263:	74 16                	je     27b <gets+0x5f>
 265:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 269:	3c 0d                	cmp    $0xd,%al
 26b:	74 0e                	je     27b <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 270:	83 c0 01             	add    $0x1,%eax
 273:	3b 45 0c             	cmp    0xc(%ebp),%eax
 276:	7c b3                	jl     22b <gets+0xf>
 278:	eb 01                	jmp    27b <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 27a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 27b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
 281:	01 d0                	add    %edx,%eax
 283:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 286:	8b 45 08             	mov    0x8(%ebp),%eax
}
 289:	c9                   	leave  
 28a:	c3                   	ret    

0000028b <stat>:

int
stat(char *n, struct stat *st)
{
 28b:	55                   	push   %ebp
 28c:	89 e5                	mov    %esp,%ebp
 28e:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 291:	83 ec 08             	sub    $0x8,%esp
 294:	6a 00                	push   $0x0
 296:	ff 75 08             	pushl  0x8(%ebp)
 299:	e8 77 02 00 00       	call   515 <open>
 29e:	83 c4 10             	add    $0x10,%esp
 2a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a8:	79 07                	jns    2b1 <stat+0x26>
    return -1;
 2aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2af:	eb 25                	jmp    2d6 <stat+0x4b>
  r = fstat(fd, st);
 2b1:	83 ec 08             	sub    $0x8,%esp
 2b4:	ff 75 0c             	pushl  0xc(%ebp)
 2b7:	ff 75 f4             	pushl  -0xc(%ebp)
 2ba:	e8 6e 02 00 00       	call   52d <fstat>
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c5:	83 ec 0c             	sub    $0xc,%esp
 2c8:	ff 75 f4             	pushl  -0xc(%ebp)
 2cb:	e8 2d 02 00 00       	call   4fd <close>
 2d0:	83 c4 10             	add    $0x10,%esp
  return r;
 2d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d6:	c9                   	leave  
 2d7:	c3                   	ret    

000002d8 <atoi>:

int
atoi(const char *s)
{
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2de:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2e5:	eb 04                	jmp    2eb <atoi+0x13>
 2e7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	0f b6 00             	movzbl (%eax),%eax
 2f1:	3c 20                	cmp    $0x20,%al
 2f3:	74 f2                	je     2e7 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 2f5:	8b 45 08             	mov    0x8(%ebp),%eax
 2f8:	0f b6 00             	movzbl (%eax),%eax
 2fb:	3c 2d                	cmp    $0x2d,%al
 2fd:	75 07                	jne    306 <atoi+0x2e>
 2ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 304:	eb 05                	jmp    30b <atoi+0x33>
 306:	b8 01 00 00 00       	mov    $0x1,%eax
 30b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	0f b6 00             	movzbl (%eax),%eax
 314:	3c 2b                	cmp    $0x2b,%al
 316:	74 0a                	je     322 <atoi+0x4a>
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	0f b6 00             	movzbl (%eax),%eax
 31e:	3c 2d                	cmp    $0x2d,%al
 320:	75 2b                	jne    34d <atoi+0x75>
    s++;
 322:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 326:	eb 25                	jmp    34d <atoi+0x75>
    n = n*10 + *s++ - '0';
 328:	8b 55 fc             	mov    -0x4(%ebp),%edx
 32b:	89 d0                	mov    %edx,%eax
 32d:	c1 e0 02             	shl    $0x2,%eax
 330:	01 d0                	add    %edx,%eax
 332:	01 c0                	add    %eax,%eax
 334:	89 c1                	mov    %eax,%ecx
 336:	8b 45 08             	mov    0x8(%ebp),%eax
 339:	8d 50 01             	lea    0x1(%eax),%edx
 33c:	89 55 08             	mov    %edx,0x8(%ebp)
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	0f be c0             	movsbl %al,%eax
 345:	01 c8                	add    %ecx,%eax
 347:	83 e8 30             	sub    $0x30,%eax
 34a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 00             	movzbl (%eax),%eax
 353:	3c 2f                	cmp    $0x2f,%al
 355:	7e 0a                	jle    361 <atoi+0x89>
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	0f b6 00             	movzbl (%eax),%eax
 35d:	3c 39                	cmp    $0x39,%al
 35f:	7e c7                	jle    328 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 361:	8b 45 f8             	mov    -0x8(%ebp),%eax
 364:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 368:	c9                   	leave  
 369:	c3                   	ret    

0000036a <atoo>:

int
atoo(const char *s)
{
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 370:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 377:	eb 04                	jmp    37d <atoo+0x13>
 379:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
 380:	0f b6 00             	movzbl (%eax),%eax
 383:	3c 20                	cmp    $0x20,%al
 385:	74 f2                	je     379 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	0f b6 00             	movzbl (%eax),%eax
 38d:	3c 2d                	cmp    $0x2d,%al
 38f:	75 07                	jne    398 <atoo+0x2e>
 391:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 396:	eb 05                	jmp    39d <atoo+0x33>
 398:	b8 01 00 00 00       	mov    $0x1,%eax
 39d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3a0:	8b 45 08             	mov    0x8(%ebp),%eax
 3a3:	0f b6 00             	movzbl (%eax),%eax
 3a6:	3c 2b                	cmp    $0x2b,%al
 3a8:	74 0a                	je     3b4 <atoo+0x4a>
 3aa:	8b 45 08             	mov    0x8(%ebp),%eax
 3ad:	0f b6 00             	movzbl (%eax),%eax
 3b0:	3c 2d                	cmp    $0x2d,%al
 3b2:	75 27                	jne    3db <atoo+0x71>
    s++;
 3b4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 3b8:	eb 21                	jmp    3db <atoo+0x71>
    n = n*8 + *s++ - '0';
 3ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3bd:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	8d 50 01             	lea    0x1(%eax),%edx
 3ca:	89 55 08             	mov    %edx,0x8(%ebp)
 3cd:	0f b6 00             	movzbl (%eax),%eax
 3d0:	0f be c0             	movsbl %al,%eax
 3d3:	01 c8                	add    %ecx,%eax
 3d5:	83 e8 30             	sub    $0x30,%eax
 3d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 3db:	8b 45 08             	mov    0x8(%ebp),%eax
 3de:	0f b6 00             	movzbl (%eax),%eax
 3e1:	3c 2f                	cmp    $0x2f,%al
 3e3:	7e 0a                	jle    3ef <atoo+0x85>
 3e5:	8b 45 08             	mov    0x8(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	3c 37                	cmp    $0x37,%al
 3ed:	7e cb                	jle    3ba <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 3ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3f2:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 3f6:	c9                   	leave  
 3f7:	c3                   	ret    

000003f8 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 404:	8b 45 0c             	mov    0xc(%ebp),%eax
 407:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40a:	eb 17                	jmp    423 <memmove+0x2b>
    *dst++ = *src++;
 40c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 40f:	8d 50 01             	lea    0x1(%eax),%edx
 412:	89 55 fc             	mov    %edx,-0x4(%ebp)
 415:	8b 55 f8             	mov    -0x8(%ebp),%edx
 418:	8d 4a 01             	lea    0x1(%edx),%ecx
 41b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 41e:	0f b6 12             	movzbl (%edx),%edx
 421:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 423:	8b 45 10             	mov    0x10(%ebp),%eax
 426:	8d 50 ff             	lea    -0x1(%eax),%edx
 429:	89 55 10             	mov    %edx,0x10(%ebp)
 42c:	85 c0                	test   %eax,%eax
 42e:	7f dc                	jg     40c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 430:	8b 45 08             	mov    0x8(%ebp),%eax
}
 433:	c9                   	leave  
 434:	c3                   	ret    

00000435 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
 438:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 43b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 43e:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 443:	89 c8                	mov    %ecx,%eax
 445:	f7 e2                	mul    %edx
 447:	89 d0                	mov    %edx,%eax
 449:	c1 e8 06             	shr    $0x6,%eax
 44c:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 452:	29 c1                	sub    %eax,%ecx
 454:	89 c8                	mov    %ecx,%eax
 456:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 459:	8b 45 08             	mov    0x8(%ebp),%eax
 45c:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 461:	f7 e2                	mul    %edx
 463:	89 d0                	mov    %edx,%eax
 465:	c1 e8 06             	shr    $0x6,%eax
 468:	83 ec 04             	sub    $0x4,%esp
 46b:	50                   	push   %eax
 46c:	68 18 06 00 00       	push   $0x618
 471:	6a 01                	push   $0x1
 473:	e8 88 fb ff ff       	call   0 <printf>
 478:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 47b:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 47f:	7e 17                	jle    498 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 481:	83 ec 04             	sub    $0x4,%esp
 484:	ff 75 f4             	pushl  -0xc(%ebp)
 487:	68 1c 06 00 00       	push   $0x61c
 48c:	6a 01                	push   $0x1
 48e:	e8 6d fb ff ff       	call   0 <printf>
 493:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 496:	eb 32                	jmp    4ca <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 498:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 49c:	7e 17                	jle    4b5 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 49e:	83 ec 04             	sub    $0x4,%esp
 4a1:	ff 75 f4             	pushl  -0xc(%ebp)
 4a4:	68 1f 06 00 00       	push   $0x61f
 4a9:	6a 01                	push   $0x1
 4ab:	e8 50 fb ff ff       	call   0 <printf>
 4b0:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 4b3:	eb 15                	jmp    4ca <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 4b5:	83 ec 04             	sub    $0x4,%esp
 4b8:	ff 75 f4             	pushl  -0xc(%ebp)
 4bb:	68 23 06 00 00       	push   $0x623
 4c0:	6a 01                	push   $0x1
 4c2:	e8 39 fb ff ff       	call   0 <printf>
 4c7:	83 c4 10             	add    $0x10,%esp
};
 4ca:	90                   	nop
 4cb:	c9                   	leave  
 4cc:	c3                   	ret    

000004cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4cd:	b8 01 00 00 00       	mov    $0x1,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <exit>:
SYSCALL(exit)
 4d5:	b8 02 00 00 00       	mov    $0x2,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <wait>:
SYSCALL(wait)
 4dd:	b8 03 00 00 00       	mov    $0x3,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <pipe>:
SYSCALL(pipe)
 4e5:	b8 04 00 00 00       	mov    $0x4,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <read>:
SYSCALL(read)
 4ed:	b8 05 00 00 00       	mov    $0x5,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <write>:
SYSCALL(write)
 4f5:	b8 10 00 00 00       	mov    $0x10,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <close>:
SYSCALL(close)
 4fd:	b8 15 00 00 00       	mov    $0x15,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <kill>:
SYSCALL(kill)
 505:	b8 06 00 00 00       	mov    $0x6,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <exec>:
SYSCALL(exec)
 50d:	b8 07 00 00 00       	mov    $0x7,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <open>:
SYSCALL(open)
 515:	b8 0f 00 00 00       	mov    $0xf,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <mknod>:
SYSCALL(mknod)
 51d:	b8 11 00 00 00       	mov    $0x11,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <unlink>:
SYSCALL(unlink)
 525:	b8 12 00 00 00       	mov    $0x12,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <fstat>:
SYSCALL(fstat)
 52d:	b8 08 00 00 00       	mov    $0x8,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <link>:
SYSCALL(link)
 535:	b8 13 00 00 00       	mov    $0x13,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <mkdir>:
SYSCALL(mkdir)
 53d:	b8 14 00 00 00       	mov    $0x14,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <chdir>:
SYSCALL(chdir)
 545:	b8 09 00 00 00       	mov    $0x9,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <dup>:
SYSCALL(dup)
 54d:	b8 0a 00 00 00       	mov    $0xa,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <getpid>:
SYSCALL(getpid)
 555:	b8 0b 00 00 00       	mov    $0xb,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <sbrk>:
SYSCALL(sbrk)
 55d:	b8 0c 00 00 00       	mov    $0xc,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <sleep>:
SYSCALL(sleep)
 565:	b8 0d 00 00 00       	mov    $0xd,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <uptime>:
SYSCALL(uptime)
 56d:	b8 0e 00 00 00       	mov    $0xe,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <halt>:
SYSCALL(halt)
 575:	b8 16 00 00 00       	mov    $0x16,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <date>:

SYSCALL(date)
 57d:	b8 17 00 00 00       	mov    $0x17,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <getuid>:
SYSCALL(getuid)
 585:	b8 18 00 00 00       	mov    $0x18,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <getgid>:
SYSCALL(getgid)
 58d:	b8 19 00 00 00       	mov    $0x19,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <getppid>:
SYSCALL(getppid)
 595:	b8 1a 00 00 00       	mov    $0x1a,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <setuid>:
SYSCALL(setuid)
 59d:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <setgid>:
SYSCALL(setgid)
 5a5:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <getprocs>:
SYSCALL(getprocs)
 5ad:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    
