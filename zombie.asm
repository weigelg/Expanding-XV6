
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 d0 03 00 00       	call   3e6 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 5a 04 00 00       	call   47e <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 c2 03 00 00       	call   3ee <exit>

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	57                   	push   %edi
  30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  31:	8b 4d 08             	mov    0x8(%ebp),%ecx
  34:	8b 55 10             	mov    0x10(%ebp),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	89 cb                	mov    %ecx,%ebx
  3c:	89 df                	mov    %ebx,%edi
  3e:	89 d1                	mov    %edx,%ecx
  40:	fc                   	cld    
  41:	f3 aa                	rep stos %al,%es:(%edi)
  43:	89 ca                	mov    %ecx,%edx
  45:	89 fb                	mov    %edi,%ebx
  47:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4d:	90                   	nop
  4e:	5b                   	pop    %ebx
  4f:	5f                   	pop    %edi
  50:	5d                   	pop    %ebp
  51:	c3                   	ret    

00000052 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  52:	55                   	push   %ebp
  53:	89 e5                	mov    %esp,%ebp
  55:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  58:	8b 45 08             	mov    0x8(%ebp),%eax
  5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5e:	90                   	nop
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  62:	8d 50 01             	lea    0x1(%eax),%edx
  65:	89 55 08             	mov    %edx,0x8(%ebp)
  68:	8b 55 0c             	mov    0xc(%ebp),%edx
  6b:	8d 4a 01             	lea    0x1(%edx),%ecx
  6e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  71:	0f b6 12             	movzbl (%edx),%edx
  74:	88 10                	mov    %dl,(%eax)
  76:	0f b6 00             	movzbl (%eax),%eax
  79:	84 c0                	test   %al,%al
  7b:	75 e2                	jne    5f <strcpy+0xd>
    ;
  return os;
  7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  80:	c9                   	leave  
  81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  85:	eb 08                	jmp    8f <strcmp+0xd>
    p++, q++;
  87:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 00             	movzbl (%eax),%eax
  95:	84 c0                	test   %al,%al
  97:	74 10                	je     a9 <strcmp+0x27>
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	0f b6 10             	movzbl (%eax),%edx
  9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	38 c2                	cmp    %al,%dl
  a7:	74 de                	je     87 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	0f b6 d0             	movzbl %al,%edx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	0f b6 c0             	movzbl %al,%eax
  bb:	29 c2                	sub    %eax,%edx
  bd:	89 d0                	mov    %edx,%eax
}
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    

000000c1 <strlen>:

uint
strlen(char *s)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  c4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ce:	eb 04                	jmp    d4 <strlen+0x13>
  d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	01 d0                	add    %edx,%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	84 c0                	test   %al,%al
  e1:	75 ed                	jne    d0 <strlen+0xf>
    ;
  return n;
  e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e6:	c9                   	leave  
  e7:	c3                   	ret    

000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  eb:	8b 45 10             	mov    0x10(%ebp),%eax
  ee:	50                   	push   %eax
  ef:	ff 75 0c             	pushl  0xc(%ebp)
  f2:	ff 75 08             	pushl  0x8(%ebp)
  f5:	e8 32 ff ff ff       	call   2c <stosb>
  fa:	83 c4 0c             	add    $0xc,%esp
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 42                	jmp    186 <gets+0x51>
    cc = read(0, &c, 1);
 144:	83 ec 04             	sub    $0x4,%esp
 147:	6a 01                	push   $0x1
 149:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14c:	50                   	push   %eax
 14d:	6a 00                	push   $0x0
 14f:	e8 b2 02 00 00       	call   406 <read>
 154:	83 c4 10             	add    $0x10,%esp
 157:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 15a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 15e:	7e 33                	jle    193 <gets+0x5e>
      break;
    buf[i++] = c;
 160:	8b 45 f4             	mov    -0xc(%ebp),%eax
 163:	8d 50 01             	lea    0x1(%eax),%edx
 166:	89 55 f4             	mov    %edx,-0xc(%ebp)
 169:	89 c2                	mov    %eax,%edx
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	01 c2                	add    %eax,%edx
 170:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 174:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17a:	3c 0a                	cmp    $0xa,%al
 17c:	74 16                	je     194 <gets+0x5f>
 17e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 182:	3c 0d                	cmp    $0xd,%al
 184:	74 0e                	je     194 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	8b 45 f4             	mov    -0xc(%ebp),%eax
 189:	83 c0 01             	add    $0x1,%eax
 18c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 18f:	7c b3                	jl     144 <gets+0xf>
 191:	eb 01                	jmp    194 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 193:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 194:	8b 55 f4             	mov    -0xc(%ebp),%edx
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	01 d0                	add    %edx,%eax
 19c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a2:	c9                   	leave  
 1a3:	c3                   	ret    

000001a4 <stat>:

int
stat(char *n, struct stat *st)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1aa:	83 ec 08             	sub    $0x8,%esp
 1ad:	6a 00                	push   $0x0
 1af:	ff 75 08             	pushl  0x8(%ebp)
 1b2:	e8 77 02 00 00       	call   42e <open>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c1:	79 07                	jns    1ca <stat+0x26>
    return -1;
 1c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c8:	eb 25                	jmp    1ef <stat+0x4b>
  r = fstat(fd, st);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	ff 75 0c             	pushl  0xc(%ebp)
 1d0:	ff 75 f4             	pushl  -0xc(%ebp)
 1d3:	e8 6e 02 00 00       	call   446 <fstat>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1de:	83 ec 0c             	sub    $0xc,%esp
 1e1:	ff 75 f4             	pushl  -0xc(%ebp)
 1e4:	e8 2d 02 00 00       	call   416 <close>
 1e9:	83 c4 10             	add    $0x10,%esp
  return r;
 1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1ef:	c9                   	leave  
 1f0:	c3                   	ret    

000001f1 <atoi>:

int
atoi(const char *s)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 1f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 1fe:	eb 04                	jmp    204 <atoi+0x13>
 200:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	0f b6 00             	movzbl (%eax),%eax
 20a:	3c 20                	cmp    $0x20,%al
 20c:	74 f2                	je     200 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	0f b6 00             	movzbl (%eax),%eax
 214:	3c 2d                	cmp    $0x2d,%al
 216:	75 07                	jne    21f <atoi+0x2e>
 218:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21d:	eb 05                	jmp    224 <atoi+0x33>
 21f:	b8 01 00 00 00       	mov    $0x1,%eax
 224:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 00             	movzbl (%eax),%eax
 22d:	3c 2b                	cmp    $0x2b,%al
 22f:	74 0a                	je     23b <atoi+0x4a>
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	0f b6 00             	movzbl (%eax),%eax
 237:	3c 2d                	cmp    $0x2d,%al
 239:	75 2b                	jne    266 <atoi+0x75>
    s++;
 23b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 23f:	eb 25                	jmp    266 <atoi+0x75>
    n = n*10 + *s++ - '0';
 241:	8b 55 fc             	mov    -0x4(%ebp),%edx
 244:	89 d0                	mov    %edx,%eax
 246:	c1 e0 02             	shl    $0x2,%eax
 249:	01 d0                	add    %edx,%eax
 24b:	01 c0                	add    %eax,%eax
 24d:	89 c1                	mov    %eax,%ecx
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	8d 50 01             	lea    0x1(%eax),%edx
 255:	89 55 08             	mov    %edx,0x8(%ebp)
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f be c0             	movsbl %al,%eax
 25e:	01 c8                	add    %ecx,%eax
 260:	83 e8 30             	sub    $0x30,%eax
 263:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	0f b6 00             	movzbl (%eax),%eax
 26c:	3c 2f                	cmp    $0x2f,%al
 26e:	7e 0a                	jle    27a <atoi+0x89>
 270:	8b 45 08             	mov    0x8(%ebp),%eax
 273:	0f b6 00             	movzbl (%eax),%eax
 276:	3c 39                	cmp    $0x39,%al
 278:	7e c7                	jle    241 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 27a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 27d:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <atoo>:

int
atoo(const char *s)
{
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
 286:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 289:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 290:	eb 04                	jmp    296 <atoo+0x13>
 292:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	0f b6 00             	movzbl (%eax),%eax
 29c:	3c 20                	cmp    $0x20,%al
 29e:	74 f2                	je     292 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	3c 2d                	cmp    $0x2d,%al
 2a8:	75 07                	jne    2b1 <atoo+0x2e>
 2aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2af:	eb 05                	jmp    2b6 <atoo+0x33>
 2b1:	b8 01 00 00 00       	mov    $0x1,%eax
 2b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2b9:	8b 45 08             	mov    0x8(%ebp),%eax
 2bc:	0f b6 00             	movzbl (%eax),%eax
 2bf:	3c 2b                	cmp    $0x2b,%al
 2c1:	74 0a                	je     2cd <atoo+0x4a>
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f b6 00             	movzbl (%eax),%eax
 2c9:	3c 2d                	cmp    $0x2d,%al
 2cb:	75 27                	jne    2f4 <atoo+0x71>
    s++;
 2cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 2d1:	eb 21                	jmp    2f4 <atoo+0x71>
    n = n*8 + *s++ - '0';
 2d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2d6:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
 2e0:	8d 50 01             	lea    0x1(%eax),%edx
 2e3:	89 55 08             	mov    %edx,0x8(%ebp)
 2e6:	0f b6 00             	movzbl (%eax),%eax
 2e9:	0f be c0             	movsbl %al,%eax
 2ec:	01 c8                	add    %ecx,%eax
 2ee:	83 e8 30             	sub    $0x30,%eax
 2f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	0f b6 00             	movzbl (%eax),%eax
 2fa:	3c 2f                	cmp    $0x2f,%al
 2fc:	7e 0a                	jle    308 <atoo+0x85>
 2fe:	8b 45 08             	mov    0x8(%ebp),%eax
 301:	0f b6 00             	movzbl (%eax),%eax
 304:	3c 37                	cmp    $0x37,%al
 306:	7e cb                	jle    2d3 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 308:	8b 45 f8             	mov    -0x8(%ebp),%eax
 30b:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 31d:	8b 45 0c             	mov    0xc(%ebp),%eax
 320:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 323:	eb 17                	jmp    33c <memmove+0x2b>
    *dst++ = *src++;
 325:	8b 45 fc             	mov    -0x4(%ebp),%eax
 328:	8d 50 01             	lea    0x1(%eax),%edx
 32b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 32e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 331:	8d 4a 01             	lea    0x1(%edx),%ecx
 334:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 337:	0f b6 12             	movzbl (%edx),%edx
 33a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33c:	8b 45 10             	mov    0x10(%ebp),%eax
 33f:	8d 50 ff             	lea    -0x1(%eax),%edx
 342:	89 55 10             	mov    %edx,0x10(%ebp)
 345:	85 c0                	test   %eax,%eax
 347:	7f dc                	jg     325 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 349:	8b 45 08             	mov    0x8(%ebp),%eax
}
 34c:	c9                   	leave  
 34d:	c3                   	ret    

0000034e <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 354:	8b 4d 08             	mov    0x8(%ebp),%ecx
 357:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 35c:	89 c8                	mov    %ecx,%eax
 35e:	f7 e2                	mul    %edx
 360:	89 d0                	mov    %edx,%eax
 362:	c1 e8 06             	shr    $0x6,%eax
 365:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 36b:	29 c1                	sub    %eax,%ecx
 36d:	89 c8                	mov    %ecx,%eax
 36f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 37a:	f7 e2                	mul    %edx
 37c:	89 d0                	mov    %edx,%eax
 37e:	c1 e8 06             	shr    $0x6,%eax
 381:	83 ec 04             	sub    $0x4,%esp
 384:	50                   	push   %eax
 385:	68 5b 09 00 00       	push   $0x95b
 38a:	6a 01                	push   $0x1
 38c:	e8 14 02 00 00       	call   5a5 <printf>
 391:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 394:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 398:	7e 17                	jle    3b1 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 39a:	83 ec 04             	sub    $0x4,%esp
 39d:	ff 75 f4             	pushl  -0xc(%ebp)
 3a0:	68 5f 09 00 00       	push   $0x95f
 3a5:	6a 01                	push   $0x1
 3a7:	e8 f9 01 00 00       	call   5a5 <printf>
 3ac:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 3af:	eb 32                	jmp    3e3 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 3b1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 3b5:	7e 17                	jle    3ce <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 3b7:	83 ec 04             	sub    $0x4,%esp
 3ba:	ff 75 f4             	pushl  -0xc(%ebp)
 3bd:	68 62 09 00 00       	push   $0x962
 3c2:	6a 01                	push   $0x1
 3c4:	e8 dc 01 00 00       	call   5a5 <printf>
 3c9:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 3cc:	eb 15                	jmp    3e3 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 3ce:	83 ec 04             	sub    $0x4,%esp
 3d1:	ff 75 f4             	pushl  -0xc(%ebp)
 3d4:	68 66 09 00 00       	push   $0x966
 3d9:	6a 01                	push   $0x1
 3db:	e8 c5 01 00 00       	call   5a5 <printf>
 3e0:	83 c4 10             	add    $0x10,%esp
};
 3e3:	90                   	nop
 3e4:	c9                   	leave  
 3e5:	c3                   	ret    

000003e6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e6:	b8 01 00 00 00       	mov    $0x1,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <exit>:
SYSCALL(exit)
 3ee:	b8 02 00 00 00       	mov    $0x2,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <wait>:
SYSCALL(wait)
 3f6:	b8 03 00 00 00       	mov    $0x3,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <pipe>:
SYSCALL(pipe)
 3fe:	b8 04 00 00 00       	mov    $0x4,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <read>:
SYSCALL(read)
 406:	b8 05 00 00 00       	mov    $0x5,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <write>:
SYSCALL(write)
 40e:	b8 10 00 00 00       	mov    $0x10,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <close>:
SYSCALL(close)
 416:	b8 15 00 00 00       	mov    $0x15,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <kill>:
SYSCALL(kill)
 41e:	b8 06 00 00 00       	mov    $0x6,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <exec>:
SYSCALL(exec)
 426:	b8 07 00 00 00       	mov    $0x7,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <open>:
SYSCALL(open)
 42e:	b8 0f 00 00 00       	mov    $0xf,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <mknod>:
SYSCALL(mknod)
 436:	b8 11 00 00 00       	mov    $0x11,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <unlink>:
SYSCALL(unlink)
 43e:	b8 12 00 00 00       	mov    $0x12,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <fstat>:
SYSCALL(fstat)
 446:	b8 08 00 00 00       	mov    $0x8,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <link>:
SYSCALL(link)
 44e:	b8 13 00 00 00       	mov    $0x13,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <mkdir>:
SYSCALL(mkdir)
 456:	b8 14 00 00 00       	mov    $0x14,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <chdir>:
SYSCALL(chdir)
 45e:	b8 09 00 00 00       	mov    $0x9,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <dup>:
SYSCALL(dup)
 466:	b8 0a 00 00 00       	mov    $0xa,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <getpid>:
SYSCALL(getpid)
 46e:	b8 0b 00 00 00       	mov    $0xb,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <sbrk>:
SYSCALL(sbrk)
 476:	b8 0c 00 00 00       	mov    $0xc,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <sleep>:
SYSCALL(sleep)
 47e:	b8 0d 00 00 00       	mov    $0xd,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <uptime>:
SYSCALL(uptime)
 486:	b8 0e 00 00 00       	mov    $0xe,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <halt>:
SYSCALL(halt)
 48e:	b8 16 00 00 00       	mov    $0x16,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <date>:

SYSCALL(date)
 496:	b8 17 00 00 00       	mov    $0x17,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <getuid>:
SYSCALL(getuid)
 49e:	b8 18 00 00 00       	mov    $0x18,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <getgid>:
SYSCALL(getgid)
 4a6:	b8 19 00 00 00       	mov    $0x19,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <getppid>:
SYSCALL(getppid)
 4ae:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <setuid>:
SYSCALL(setuid)
 4b6:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <setgid>:
SYSCALL(setgid)
 4be:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <getprocs>:
SYSCALL(getprocs)
 4c6:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	83 ec 18             	sub    $0x18,%esp
 4d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4da:	83 ec 04             	sub    $0x4,%esp
 4dd:	6a 01                	push   $0x1
 4df:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4e2:	50                   	push   %eax
 4e3:	ff 75 08             	pushl  0x8(%ebp)
 4e6:	e8 23 ff ff ff       	call   40e <write>
 4eb:	83 c4 10             	add    $0x10,%esp
}
 4ee:	90                   	nop
 4ef:	c9                   	leave  
 4f0:	c3                   	ret    

000004f1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f1:	55                   	push   %ebp
 4f2:	89 e5                	mov    %esp,%ebp
 4f4:	53                   	push   %ebx
 4f5:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4f8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4ff:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 503:	74 17                	je     51c <printint+0x2b>
 505:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 509:	79 11                	jns    51c <printint+0x2b>
    neg = 1;
 50b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 512:	8b 45 0c             	mov    0xc(%ebp),%eax
 515:	f7 d8                	neg    %eax
 517:	89 45 ec             	mov    %eax,-0x14(%ebp)
 51a:	eb 06                	jmp    522 <printint+0x31>
  } else {
    x = xx;
 51c:	8b 45 0c             	mov    0xc(%ebp),%eax
 51f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 522:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 529:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 52c:	8d 41 01             	lea    0x1(%ecx),%eax
 52f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 532:	8b 5d 10             	mov    0x10(%ebp),%ebx
 535:	8b 45 ec             	mov    -0x14(%ebp),%eax
 538:	ba 00 00 00 00       	mov    $0x0,%edx
 53d:	f7 f3                	div    %ebx
 53f:	89 d0                	mov    %edx,%eax
 541:	0f b6 80 fc 0b 00 00 	movzbl 0xbfc(%eax),%eax
 548:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 54c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 54f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 552:	ba 00 00 00 00       	mov    $0x0,%edx
 557:	f7 f3                	div    %ebx
 559:	89 45 ec             	mov    %eax,-0x14(%ebp)
 55c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 560:	75 c7                	jne    529 <printint+0x38>
  if(neg)
 562:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 566:	74 2d                	je     595 <printint+0xa4>
    buf[i++] = '-';
 568:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56b:	8d 50 01             	lea    0x1(%eax),%edx
 56e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 571:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 576:	eb 1d                	jmp    595 <printint+0xa4>
    putc(fd, buf[i]);
 578:	8d 55 dc             	lea    -0x24(%ebp),%edx
 57b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57e:	01 d0                	add    %edx,%eax
 580:	0f b6 00             	movzbl (%eax),%eax
 583:	0f be c0             	movsbl %al,%eax
 586:	83 ec 08             	sub    $0x8,%esp
 589:	50                   	push   %eax
 58a:	ff 75 08             	pushl  0x8(%ebp)
 58d:	e8 3c ff ff ff       	call   4ce <putc>
 592:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 595:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 599:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 59d:	79 d9                	jns    578 <printint+0x87>
    putc(fd, buf[i]);
}
 59f:	90                   	nop
 5a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a3:	c9                   	leave  
 5a4:	c3                   	ret    

000005a5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5b2:	8d 45 0c             	lea    0xc(%ebp),%eax
 5b5:	83 c0 04             	add    $0x4,%eax
 5b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5c2:	e9 59 01 00 00       	jmp    720 <printf+0x17b>
    c = fmt[i] & 0xff;
 5c7:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5cd:	01 d0                	add    %edx,%eax
 5cf:	0f b6 00             	movzbl (%eax),%eax
 5d2:	0f be c0             	movsbl %al,%eax
 5d5:	25 ff 00 00 00       	and    $0xff,%eax
 5da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e1:	75 2c                	jne    60f <printf+0x6a>
      if(c == '%'){
 5e3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5e7:	75 0c                	jne    5f5 <printf+0x50>
        state = '%';
 5e9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5f0:	e9 27 01 00 00       	jmp    71c <printf+0x177>
      } else {
        putc(fd, c);
 5f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f8:	0f be c0             	movsbl %al,%eax
 5fb:	83 ec 08             	sub    $0x8,%esp
 5fe:	50                   	push   %eax
 5ff:	ff 75 08             	pushl  0x8(%ebp)
 602:	e8 c7 fe ff ff       	call   4ce <putc>
 607:	83 c4 10             	add    $0x10,%esp
 60a:	e9 0d 01 00 00       	jmp    71c <printf+0x177>
      }
    } else if(state == '%'){
 60f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 613:	0f 85 03 01 00 00    	jne    71c <printf+0x177>
      if(c == 'd'){
 619:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 61d:	75 1e                	jne    63d <printf+0x98>
        printint(fd, *ap, 10, 1);
 61f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 622:	8b 00                	mov    (%eax),%eax
 624:	6a 01                	push   $0x1
 626:	6a 0a                	push   $0xa
 628:	50                   	push   %eax
 629:	ff 75 08             	pushl  0x8(%ebp)
 62c:	e8 c0 fe ff ff       	call   4f1 <printint>
 631:	83 c4 10             	add    $0x10,%esp
        ap++;
 634:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 638:	e9 d8 00 00 00       	jmp    715 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 63d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 641:	74 06                	je     649 <printf+0xa4>
 643:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 647:	75 1e                	jne    667 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 649:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	6a 00                	push   $0x0
 650:	6a 10                	push   $0x10
 652:	50                   	push   %eax
 653:	ff 75 08             	pushl  0x8(%ebp)
 656:	e8 96 fe ff ff       	call   4f1 <printint>
 65b:	83 c4 10             	add    $0x10,%esp
        ap++;
 65e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 662:	e9 ae 00 00 00       	jmp    715 <printf+0x170>
      } else if(c == 's'){
 667:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 66b:	75 43                	jne    6b0 <printf+0x10b>
        s = (char*)*ap;
 66d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 675:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 679:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67d:	75 25                	jne    6a4 <printf+0xff>
          s = "(null)";
 67f:	c7 45 f4 6b 09 00 00 	movl   $0x96b,-0xc(%ebp)
        while(*s != 0){
 686:	eb 1c                	jmp    6a4 <printf+0xff>
          putc(fd, *s);
 688:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68b:	0f b6 00             	movzbl (%eax),%eax
 68e:	0f be c0             	movsbl %al,%eax
 691:	83 ec 08             	sub    $0x8,%esp
 694:	50                   	push   %eax
 695:	ff 75 08             	pushl  0x8(%ebp)
 698:	e8 31 fe ff ff       	call   4ce <putc>
 69d:	83 c4 10             	add    $0x10,%esp
          s++;
 6a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a7:	0f b6 00             	movzbl (%eax),%eax
 6aa:	84 c0                	test   %al,%al
 6ac:	75 da                	jne    688 <printf+0xe3>
 6ae:	eb 65                	jmp    715 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6b0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b4:	75 1d                	jne    6d3 <printf+0x12e>
        putc(fd, *ap);
 6b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b9:	8b 00                	mov    (%eax),%eax
 6bb:	0f be c0             	movsbl %al,%eax
 6be:	83 ec 08             	sub    $0x8,%esp
 6c1:	50                   	push   %eax
 6c2:	ff 75 08             	pushl  0x8(%ebp)
 6c5:	e8 04 fe ff ff       	call   4ce <putc>
 6ca:	83 c4 10             	add    $0x10,%esp
        ap++;
 6cd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d1:	eb 42                	jmp    715 <printf+0x170>
      } else if(c == '%'){
 6d3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6d7:	75 17                	jne    6f0 <printf+0x14b>
        putc(fd, c);
 6d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6dc:	0f be c0             	movsbl %al,%eax
 6df:	83 ec 08             	sub    $0x8,%esp
 6e2:	50                   	push   %eax
 6e3:	ff 75 08             	pushl  0x8(%ebp)
 6e6:	e8 e3 fd ff ff       	call   4ce <putc>
 6eb:	83 c4 10             	add    $0x10,%esp
 6ee:	eb 25                	jmp    715 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f0:	83 ec 08             	sub    $0x8,%esp
 6f3:	6a 25                	push   $0x25
 6f5:	ff 75 08             	pushl  0x8(%ebp)
 6f8:	e8 d1 fd ff ff       	call   4ce <putc>
 6fd:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 700:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 703:	0f be c0             	movsbl %al,%eax
 706:	83 ec 08             	sub    $0x8,%esp
 709:	50                   	push   %eax
 70a:	ff 75 08             	pushl  0x8(%ebp)
 70d:	e8 bc fd ff ff       	call   4ce <putc>
 712:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 715:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 71c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 720:	8b 55 0c             	mov    0xc(%ebp),%edx
 723:	8b 45 f0             	mov    -0x10(%ebp),%eax
 726:	01 d0                	add    %edx,%eax
 728:	0f b6 00             	movzbl (%eax),%eax
 72b:	84 c0                	test   %al,%al
 72d:	0f 85 94 fe ff ff    	jne    5c7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 733:	90                   	nop
 734:	c9                   	leave  
 735:	c3                   	ret    

00000736 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 736:	55                   	push   %ebp
 737:	89 e5                	mov    %esp,%ebp
 739:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	83 e8 08             	sub    $0x8,%eax
 742:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 745:	a1 18 0c 00 00       	mov    0xc18,%eax
 74a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 74d:	eb 24                	jmp    773 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	8b 00                	mov    (%eax),%eax
 754:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 757:	77 12                	ja     76b <free+0x35>
 759:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75f:	77 24                	ja     785 <free+0x4f>
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 769:	77 1a                	ja     785 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76e:	8b 00                	mov    (%eax),%eax
 770:	89 45 fc             	mov    %eax,-0x4(%ebp)
 773:	8b 45 f8             	mov    -0x8(%ebp),%eax
 776:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 779:	76 d4                	jbe    74f <free+0x19>
 77b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77e:	8b 00                	mov    (%eax),%eax
 780:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 783:	76 ca                	jbe    74f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 785:	8b 45 f8             	mov    -0x8(%ebp),%eax
 788:	8b 40 04             	mov    0x4(%eax),%eax
 78b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	01 c2                	add    %eax,%edx
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	39 c2                	cmp    %eax,%edx
 79e:	75 24                	jne    7c4 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a3:	8b 50 04             	mov    0x4(%eax),%edx
 7a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a9:	8b 00                	mov    (%eax),%eax
 7ab:	8b 40 04             	mov    0x4(%eax),%eax
 7ae:	01 c2                	add    %eax,%edx
 7b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b3:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c0:	89 10                	mov    %edx,(%eax)
 7c2:	eb 0a                	jmp    7ce <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	8b 10                	mov    (%eax),%edx
 7c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cc:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	01 d0                	add    %edx,%eax
 7e0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e3:	75 20                	jne    805 <free+0xcf>
    p->s.size += bp->s.size;
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	8b 50 04             	mov    0x4(%eax),%edx
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	8b 40 04             	mov    0x4(%eax),%eax
 7f1:	01 c2                	add    %eax,%edx
 7f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fc:	8b 10                	mov    (%eax),%edx
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	89 10                	mov    %edx,(%eax)
 803:	eb 08                	jmp    80d <free+0xd7>
  } else
    p->s.ptr = bp;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80b:	89 10                	mov    %edx,(%eax)
  freep = p;
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	a3 18 0c 00 00       	mov    %eax,0xc18
}
 815:	90                   	nop
 816:	c9                   	leave  
 817:	c3                   	ret    

00000818 <morecore>:

static Header*
morecore(uint nu)
{
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 81e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 825:	77 07                	ja     82e <morecore+0x16>
    nu = 4096;
 827:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 82e:	8b 45 08             	mov    0x8(%ebp),%eax
 831:	c1 e0 03             	shl    $0x3,%eax
 834:	83 ec 0c             	sub    $0xc,%esp
 837:	50                   	push   %eax
 838:	e8 39 fc ff ff       	call   476 <sbrk>
 83d:	83 c4 10             	add    $0x10,%esp
 840:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 843:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 847:	75 07                	jne    850 <morecore+0x38>
    return 0;
 849:	b8 00 00 00 00       	mov    $0x0,%eax
 84e:	eb 26                	jmp    876 <morecore+0x5e>
  hp = (Header*)p;
 850:	8b 45 f4             	mov    -0xc(%ebp),%eax
 853:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	8b 55 08             	mov    0x8(%ebp),%edx
 85c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 862:	83 c0 08             	add    $0x8,%eax
 865:	83 ec 0c             	sub    $0xc,%esp
 868:	50                   	push   %eax
 869:	e8 c8 fe ff ff       	call   736 <free>
 86e:	83 c4 10             	add    $0x10,%esp
  return freep;
 871:	a1 18 0c 00 00       	mov    0xc18,%eax
}
 876:	c9                   	leave  
 877:	c3                   	ret    

00000878 <malloc>:

void*
malloc(uint nbytes)
{
 878:	55                   	push   %ebp
 879:	89 e5                	mov    %esp,%ebp
 87b:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87e:	8b 45 08             	mov    0x8(%ebp),%eax
 881:	83 c0 07             	add    $0x7,%eax
 884:	c1 e8 03             	shr    $0x3,%eax
 887:	83 c0 01             	add    $0x1,%eax
 88a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 88d:	a1 18 0c 00 00       	mov    0xc18,%eax
 892:	89 45 f0             	mov    %eax,-0x10(%ebp)
 895:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 899:	75 23                	jne    8be <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 89b:	c7 45 f0 10 0c 00 00 	movl   $0xc10,-0x10(%ebp)
 8a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a5:	a3 18 0c 00 00       	mov    %eax,0xc18
 8aa:	a1 18 0c 00 00       	mov    0xc18,%eax
 8af:	a3 10 0c 00 00       	mov    %eax,0xc10
    base.s.size = 0;
 8b4:	c7 05 14 0c 00 00 00 	movl   $0x0,0xc14
 8bb:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c1:	8b 00                	mov    (%eax),%eax
 8c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c9:	8b 40 04             	mov    0x4(%eax),%eax
 8cc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8cf:	72 4d                	jb     91e <malloc+0xa6>
      if(p->s.size == nunits)
 8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d4:	8b 40 04             	mov    0x4(%eax),%eax
 8d7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8da:	75 0c                	jne    8e8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 10                	mov    (%eax),%edx
 8e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e4:	89 10                	mov    %edx,(%eax)
 8e6:	eb 26                	jmp    90e <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 40 04             	mov    0x4(%eax),%eax
 8ee:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8f1:	89 c2                	mov    %eax,%edx
 8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	8b 40 04             	mov    0x4(%eax),%eax
 8ff:	c1 e0 03             	shl    $0x3,%eax
 902:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 905:	8b 45 f4             	mov    -0xc(%ebp),%eax
 908:	8b 55 ec             	mov    -0x14(%ebp),%edx
 90b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 90e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 911:	a3 18 0c 00 00       	mov    %eax,0xc18
      return (void*)(p + 1);
 916:	8b 45 f4             	mov    -0xc(%ebp),%eax
 919:	83 c0 08             	add    $0x8,%eax
 91c:	eb 3b                	jmp    959 <malloc+0xe1>
    }
    if(p == freep)
 91e:	a1 18 0c 00 00       	mov    0xc18,%eax
 923:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 926:	75 1e                	jne    946 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 928:	83 ec 0c             	sub    $0xc,%esp
 92b:	ff 75 ec             	pushl  -0x14(%ebp)
 92e:	e8 e5 fe ff ff       	call   818 <morecore>
 933:	83 c4 10             	add    $0x10,%esp
 936:	89 45 f4             	mov    %eax,-0xc(%ebp)
 939:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 93d:	75 07                	jne    946 <malloc+0xce>
        return 0;
 93f:	b8 00 00 00 00       	mov    $0x0,%eax
 944:	eb 13                	jmp    959 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 946:	8b 45 f4             	mov    -0xc(%ebp),%eax
 949:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94f:	8b 00                	mov    (%eax),%eax
 951:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 954:	e9 6d ff ff ff       	jmp    8c6 <malloc+0x4e>
}
 959:	c9                   	leave  
 95a:	c3                   	ret    
