
_halt:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
// halt the system.
#include "types.h"
#include "user.h"

int
main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  halt();
  11:	e8 70 04 00 00       	call   486 <halt>
  return 0;
  16:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1b:	83 c4 04             	add    $0x4,%esp
  1e:	59                   	pop    %ecx
  1f:	5d                   	pop    %ebp
  20:	8d 61 fc             	lea    -0x4(%ecx),%esp
  23:	c3                   	ret    

00000024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	57                   	push   %edi
  28:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  29:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2c:	8b 55 10             	mov    0x10(%ebp),%edx
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	89 cb                	mov    %ecx,%ebx
  34:	89 df                	mov    %ebx,%edi
  36:	89 d1                	mov    %edx,%ecx
  38:	fc                   	cld    
  39:	f3 aa                	rep stos %al,%es:(%edi)
  3b:	89 ca                	mov    %ecx,%edx
  3d:	89 fb                	mov    %edi,%ebx
  3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  42:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  45:	90                   	nop
  46:	5b                   	pop    %ebx
  47:	5f                   	pop    %edi
  48:	5d                   	pop    %ebp
  49:	c3                   	ret    

0000004a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  4a:	55                   	push   %ebp
  4b:	89 e5                	mov    %esp,%ebp
  4d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  50:	8b 45 08             	mov    0x8(%ebp),%eax
  53:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  56:	90                   	nop
  57:	8b 45 08             	mov    0x8(%ebp),%eax
  5a:	8d 50 01             	lea    0x1(%eax),%edx
  5d:	89 55 08             	mov    %edx,0x8(%ebp)
  60:	8b 55 0c             	mov    0xc(%ebp),%edx
  63:	8d 4a 01             	lea    0x1(%edx),%ecx
  66:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  69:	0f b6 12             	movzbl (%edx),%edx
  6c:	88 10                	mov    %dl,(%eax)
  6e:	0f b6 00             	movzbl (%eax),%eax
  71:	84 c0                	test   %al,%al
  73:	75 e2                	jne    57 <strcpy+0xd>
    ;
  return os;
  75:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  78:	c9                   	leave  
  79:	c3                   	ret    

0000007a <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7d:	eb 08                	jmp    87 <strcmp+0xd>
    p++, q++;
  7f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  83:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  87:	8b 45 08             	mov    0x8(%ebp),%eax
  8a:	0f b6 00             	movzbl (%eax),%eax
  8d:	84 c0                	test   %al,%al
  8f:	74 10                	je     a1 <strcmp+0x27>
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	0f b6 10             	movzbl (%eax),%edx
  97:	8b 45 0c             	mov    0xc(%ebp),%eax
  9a:	0f b6 00             	movzbl (%eax),%eax
  9d:	38 c2                	cmp    %al,%dl
  9f:	74 de                	je     7f <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a1:	8b 45 08             	mov    0x8(%ebp),%eax
  a4:	0f b6 00             	movzbl (%eax),%eax
  a7:	0f b6 d0             	movzbl %al,%edx
  aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  ad:	0f b6 00             	movzbl (%eax),%eax
  b0:	0f b6 c0             	movzbl %al,%eax
  b3:	29 c2                	sub    %eax,%edx
  b5:	89 d0                	mov    %edx,%eax
}
  b7:	5d                   	pop    %ebp
  b8:	c3                   	ret    

000000b9 <strlen>:

uint
strlen(char *s)
{
  b9:	55                   	push   %ebp
  ba:	89 e5                	mov    %esp,%ebp
  bc:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c6:	eb 04                	jmp    cc <strlen+0x13>
  c8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  cc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cf:	8b 45 08             	mov    0x8(%ebp),%eax
  d2:	01 d0                	add    %edx,%eax
  d4:	0f b6 00             	movzbl (%eax),%eax
  d7:	84 c0                	test   %al,%al
  d9:	75 ed                	jne    c8 <strlen+0xf>
    ;
  return n;
  db:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  de:	c9                   	leave  
  df:	c3                   	ret    

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  e3:	8b 45 10             	mov    0x10(%ebp),%eax
  e6:	50                   	push   %eax
  e7:	ff 75 0c             	pushl  0xc(%ebp)
  ea:	ff 75 08             	pushl  0x8(%ebp)
  ed:	e8 32 ff ff ff       	call   24 <stosb>
  f2:	83 c4 0c             	add    $0xc,%esp
  return dst;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
  f8:	c9                   	leave  
  f9:	c3                   	ret    

000000fa <strchr>:

char*
strchr(const char *s, char c)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	83 ec 04             	sub    $0x4,%esp
 100:	8b 45 0c             	mov    0xc(%ebp),%eax
 103:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 106:	eb 14                	jmp    11c <strchr+0x22>
    if(*s == c)
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	0f b6 00             	movzbl (%eax),%eax
 10e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 111:	75 05                	jne    118 <strchr+0x1e>
      return (char*)s;
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	eb 13                	jmp    12b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 118:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	0f b6 00             	movzbl (%eax),%eax
 122:	84 c0                	test   %al,%al
 124:	75 e2                	jne    108 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 126:	b8 00 00 00 00       	mov    $0x0,%eax
}
 12b:	c9                   	leave  
 12c:	c3                   	ret    

0000012d <gets>:

char*
gets(char *buf, int max)
{
 12d:	55                   	push   %ebp
 12e:	89 e5                	mov    %esp,%ebp
 130:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 133:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 13a:	eb 42                	jmp    17e <gets+0x51>
    cc = read(0, &c, 1);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	6a 01                	push   $0x1
 141:	8d 45 ef             	lea    -0x11(%ebp),%eax
 144:	50                   	push   %eax
 145:	6a 00                	push   $0x0
 147:	e8 b2 02 00 00       	call   3fe <read>
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 152:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 156:	7e 33                	jle    18b <gets+0x5e>
      break;
    buf[i++] = c;
 158:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15b:	8d 50 01             	lea    0x1(%eax),%edx
 15e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 161:	89 c2                	mov    %eax,%edx
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	01 c2                	add    %eax,%edx
 168:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 172:	3c 0a                	cmp    $0xa,%al
 174:	74 16                	je     18c <gets+0x5f>
 176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17a:	3c 0d                	cmp    $0xd,%al
 17c:	74 0e                	je     18c <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 181:	83 c0 01             	add    $0x1,%eax
 184:	3b 45 0c             	cmp    0xc(%ebp),%eax
 187:	7c b3                	jl     13c <gets+0xf>
 189:	eb 01                	jmp    18c <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 18b:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 18c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18f:	8b 45 08             	mov    0x8(%ebp),%eax
 192:	01 d0                	add    %edx,%eax
 194:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 197:	8b 45 08             	mov    0x8(%ebp),%eax
}
 19a:	c9                   	leave  
 19b:	c3                   	ret    

0000019c <stat>:

int
stat(char *n, struct stat *st)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a2:	83 ec 08             	sub    $0x8,%esp
 1a5:	6a 00                	push   $0x0
 1a7:	ff 75 08             	pushl  0x8(%ebp)
 1aa:	e8 77 02 00 00       	call   426 <open>
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b9:	79 07                	jns    1c2 <stat+0x26>
    return -1;
 1bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c0:	eb 25                	jmp    1e7 <stat+0x4b>
  r = fstat(fd, st);
 1c2:	83 ec 08             	sub    $0x8,%esp
 1c5:	ff 75 0c             	pushl  0xc(%ebp)
 1c8:	ff 75 f4             	pushl  -0xc(%ebp)
 1cb:	e8 6e 02 00 00       	call   43e <fstat>
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	83 ec 0c             	sub    $0xc,%esp
 1d9:	ff 75 f4             	pushl  -0xc(%ebp)
 1dc:	e8 2d 02 00 00       	call   40e <close>
 1e1:	83 c4 10             	add    $0x10,%esp
  return r;
 1e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    

000001e9 <atoi>:

int
atoi(const char *s)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 1ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 1f6:	eb 04                	jmp    1fc <atoi+0x13>
 1f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3c 20                	cmp    $0x20,%al
 204:	74 f2                	je     1f8 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 2d                	cmp    $0x2d,%al
 20e:	75 07                	jne    217 <atoi+0x2e>
 210:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 215:	eb 05                	jmp    21c <atoi+0x33>
 217:	b8 01 00 00 00       	mov    $0x1,%eax
 21c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	3c 2b                	cmp    $0x2b,%al
 227:	74 0a                	je     233 <atoi+0x4a>
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	3c 2d                	cmp    $0x2d,%al
 231:	75 2b                	jne    25e <atoi+0x75>
    s++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 237:	eb 25                	jmp    25e <atoi+0x75>
    n = n*10 + *s++ - '0';
 239:	8b 55 fc             	mov    -0x4(%ebp),%edx
 23c:	89 d0                	mov    %edx,%eax
 23e:	c1 e0 02             	shl    $0x2,%eax
 241:	01 d0                	add    %edx,%eax
 243:	01 c0                	add    %eax,%eax
 245:	89 c1                	mov    %eax,%ecx
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 08             	mov    %edx,0x8(%ebp)
 250:	0f b6 00             	movzbl (%eax),%eax
 253:	0f be c0             	movsbl %al,%eax
 256:	01 c8                	add    %ecx,%eax
 258:	83 e8 30             	sub    $0x30,%eax
 25b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 25e:	8b 45 08             	mov    0x8(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	3c 2f                	cmp    $0x2f,%al
 266:	7e 0a                	jle    272 <atoi+0x89>
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	0f b6 00             	movzbl (%eax),%eax
 26e:	3c 39                	cmp    $0x39,%al
 270:	7e c7                	jle    239 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 272:	8b 45 f8             	mov    -0x8(%ebp),%eax
 275:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 279:	c9                   	leave  
 27a:	c3                   	ret    

0000027b <atoo>:

int
atoo(const char *s)
{
 27b:	55                   	push   %ebp
 27c:	89 e5                	mov    %esp,%ebp
 27e:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 281:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 288:	eb 04                	jmp    28e <atoo+0x13>
 28a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
 291:	0f b6 00             	movzbl (%eax),%eax
 294:	3c 20                	cmp    $0x20,%al
 296:	74 f2                	je     28a <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	0f b6 00             	movzbl (%eax),%eax
 29e:	3c 2d                	cmp    $0x2d,%al
 2a0:	75 07                	jne    2a9 <atoo+0x2e>
 2a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a7:	eb 05                	jmp    2ae <atoo+0x33>
 2a9:	b8 01 00 00 00       	mov    $0x1,%eax
 2ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2b1:	8b 45 08             	mov    0x8(%ebp),%eax
 2b4:	0f b6 00             	movzbl (%eax),%eax
 2b7:	3c 2b                	cmp    $0x2b,%al
 2b9:	74 0a                	je     2c5 <atoo+0x4a>
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	0f b6 00             	movzbl (%eax),%eax
 2c1:	3c 2d                	cmp    $0x2d,%al
 2c3:	75 27                	jne    2ec <atoo+0x71>
    s++;
 2c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 2c9:	eb 21                	jmp    2ec <atoo+0x71>
    n = n*8 + *s++ - '0';
 2cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2ce:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	8d 50 01             	lea    0x1(%eax),%edx
 2db:	89 55 08             	mov    %edx,0x8(%ebp)
 2de:	0f b6 00             	movzbl (%eax),%eax
 2e1:	0f be c0             	movsbl %al,%eax
 2e4:	01 c8                	add    %ecx,%eax
 2e6:	83 e8 30             	sub    $0x30,%eax
 2e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
 2ef:	0f b6 00             	movzbl (%eax),%eax
 2f2:	3c 2f                	cmp    $0x2f,%al
 2f4:	7e 0a                	jle    300 <atoo+0x85>
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	0f b6 00             	movzbl (%eax),%eax
 2fc:	3c 37                	cmp    $0x37,%al
 2fe:	7e cb                	jle    2cb <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 300:	8b 45 f8             	mov    -0x8(%ebp),%eax
 303:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 307:	c9                   	leave  
 308:	c3                   	ret    

00000309 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 315:	8b 45 0c             	mov    0xc(%ebp),%eax
 318:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 31b:	eb 17                	jmp    334 <memmove+0x2b>
    *dst++ = *src++;
 31d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 320:	8d 50 01             	lea    0x1(%eax),%edx
 323:	89 55 fc             	mov    %edx,-0x4(%ebp)
 326:	8b 55 f8             	mov    -0x8(%ebp),%edx
 329:	8d 4a 01             	lea    0x1(%edx),%ecx
 32c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 32f:	0f b6 12             	movzbl (%edx),%edx
 332:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8d 50 ff             	lea    -0x1(%eax),%edx
 33a:	89 55 10             	mov    %edx,0x10(%ebp)
 33d:	85 c0                	test   %eax,%eax
 33f:	7f dc                	jg     31d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 341:	8b 45 08             	mov    0x8(%ebp),%eax
}
 344:	c9                   	leave  
 345:	c3                   	ret    

00000346 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 34c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34f:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 354:	89 c8                	mov    %ecx,%eax
 356:	f7 e2                	mul    %edx
 358:	89 d0                	mov    %edx,%eax
 35a:	c1 e8 06             	shr    $0x6,%eax
 35d:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 363:	29 c1                	sub    %eax,%ecx
 365:	89 c8                	mov    %ecx,%eax
 367:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 372:	f7 e2                	mul    %edx
 374:	89 d0                	mov    %edx,%eax
 376:	c1 e8 06             	shr    $0x6,%eax
 379:	83 ec 04             	sub    $0x4,%esp
 37c:	50                   	push   %eax
 37d:	68 53 09 00 00       	push   $0x953
 382:	6a 01                	push   $0x1
 384:	e8 14 02 00 00       	call   59d <printf>
 389:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 38c:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 390:	7e 17                	jle    3a9 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 392:	83 ec 04             	sub    $0x4,%esp
 395:	ff 75 f4             	pushl  -0xc(%ebp)
 398:	68 57 09 00 00       	push   $0x957
 39d:	6a 01                	push   $0x1
 39f:	e8 f9 01 00 00       	call   59d <printf>
 3a4:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 3a7:	eb 32                	jmp    3db <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 3a9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 3ad:	7e 17                	jle    3c6 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 3af:	83 ec 04             	sub    $0x4,%esp
 3b2:	ff 75 f4             	pushl  -0xc(%ebp)
 3b5:	68 5a 09 00 00       	push   $0x95a
 3ba:	6a 01                	push   $0x1
 3bc:	e8 dc 01 00 00       	call   59d <printf>
 3c1:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 3c4:	eb 15                	jmp    3db <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 3c6:	83 ec 04             	sub    $0x4,%esp
 3c9:	ff 75 f4             	pushl  -0xc(%ebp)
 3cc:	68 5e 09 00 00       	push   $0x95e
 3d1:	6a 01                	push   $0x1
 3d3:	e8 c5 01 00 00       	call   59d <printf>
 3d8:	83 c4 10             	add    $0x10,%esp
};
 3db:	90                   	nop
 3dc:	c9                   	leave  
 3dd:	c3                   	ret    

000003de <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3de:	b8 01 00 00 00       	mov    $0x1,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <exit>:
SYSCALL(exit)
 3e6:	b8 02 00 00 00       	mov    $0x2,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <wait>:
SYSCALL(wait)
 3ee:	b8 03 00 00 00       	mov    $0x3,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <pipe>:
SYSCALL(pipe)
 3f6:	b8 04 00 00 00       	mov    $0x4,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <read>:
SYSCALL(read)
 3fe:	b8 05 00 00 00       	mov    $0x5,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <write>:
SYSCALL(write)
 406:	b8 10 00 00 00       	mov    $0x10,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <close>:
SYSCALL(close)
 40e:	b8 15 00 00 00       	mov    $0x15,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <kill>:
SYSCALL(kill)
 416:	b8 06 00 00 00       	mov    $0x6,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <exec>:
SYSCALL(exec)
 41e:	b8 07 00 00 00       	mov    $0x7,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <open>:
SYSCALL(open)
 426:	b8 0f 00 00 00       	mov    $0xf,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <mknod>:
SYSCALL(mknod)
 42e:	b8 11 00 00 00       	mov    $0x11,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <unlink>:
SYSCALL(unlink)
 436:	b8 12 00 00 00       	mov    $0x12,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <fstat>:
SYSCALL(fstat)
 43e:	b8 08 00 00 00       	mov    $0x8,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <link>:
SYSCALL(link)
 446:	b8 13 00 00 00       	mov    $0x13,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <mkdir>:
SYSCALL(mkdir)
 44e:	b8 14 00 00 00       	mov    $0x14,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <chdir>:
SYSCALL(chdir)
 456:	b8 09 00 00 00       	mov    $0x9,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <dup>:
SYSCALL(dup)
 45e:	b8 0a 00 00 00       	mov    $0xa,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <getpid>:
SYSCALL(getpid)
 466:	b8 0b 00 00 00       	mov    $0xb,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <sbrk>:
SYSCALL(sbrk)
 46e:	b8 0c 00 00 00       	mov    $0xc,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <sleep>:
SYSCALL(sleep)
 476:	b8 0d 00 00 00       	mov    $0xd,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <uptime>:
SYSCALL(uptime)
 47e:	b8 0e 00 00 00       	mov    $0xe,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <halt>:
SYSCALL(halt)
 486:	b8 16 00 00 00       	mov    $0x16,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <date>:

SYSCALL(date)
 48e:	b8 17 00 00 00       	mov    $0x17,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <getuid>:
SYSCALL(getuid)
 496:	b8 18 00 00 00       	mov    $0x18,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <getgid>:
SYSCALL(getgid)
 49e:	b8 19 00 00 00       	mov    $0x19,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <getppid>:
SYSCALL(getppid)
 4a6:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <setuid>:
SYSCALL(setuid)
 4ae:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <setgid>:
SYSCALL(setgid)
 4b6:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <getprocs>:
SYSCALL(getprocs)
 4be:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c6:	55                   	push   %ebp
 4c7:	89 e5                	mov    %esp,%ebp
 4c9:	83 ec 18             	sub    $0x18,%esp
 4cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cf:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d2:	83 ec 04             	sub    $0x4,%esp
 4d5:	6a 01                	push   $0x1
 4d7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4da:	50                   	push   %eax
 4db:	ff 75 08             	pushl  0x8(%ebp)
 4de:	e8 23 ff ff ff       	call   406 <write>
 4e3:	83 c4 10             	add    $0x10,%esp
}
 4e6:	90                   	nop
 4e7:	c9                   	leave  
 4e8:	c3                   	ret    

000004e9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e9:	55                   	push   %ebp
 4ea:	89 e5                	mov    %esp,%ebp
 4ec:	53                   	push   %ebx
 4ed:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4f7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4fb:	74 17                	je     514 <printint+0x2b>
 4fd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 501:	79 11                	jns    514 <printint+0x2b>
    neg = 1;
 503:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 50a:	8b 45 0c             	mov    0xc(%ebp),%eax
 50d:	f7 d8                	neg    %eax
 50f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 512:	eb 06                	jmp    51a <printint+0x31>
  } else {
    x = xx;
 514:	8b 45 0c             	mov    0xc(%ebp),%eax
 517:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 51a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 521:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 524:	8d 41 01             	lea    0x1(%ecx),%eax
 527:	89 45 f4             	mov    %eax,-0xc(%ebp)
 52a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 52d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 530:	ba 00 00 00 00       	mov    $0x0,%edx
 535:	f7 f3                	div    %ebx
 537:	89 d0                	mov    %edx,%eax
 539:	0f b6 80 fc 0b 00 00 	movzbl 0xbfc(%eax),%eax
 540:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 544:	8b 5d 10             	mov    0x10(%ebp),%ebx
 547:	8b 45 ec             	mov    -0x14(%ebp),%eax
 54a:	ba 00 00 00 00       	mov    $0x0,%edx
 54f:	f7 f3                	div    %ebx
 551:	89 45 ec             	mov    %eax,-0x14(%ebp)
 554:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 558:	75 c7                	jne    521 <printint+0x38>
  if(neg)
 55a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 55e:	74 2d                	je     58d <printint+0xa4>
    buf[i++] = '-';
 560:	8b 45 f4             	mov    -0xc(%ebp),%eax
 563:	8d 50 01             	lea    0x1(%eax),%edx
 566:	89 55 f4             	mov    %edx,-0xc(%ebp)
 569:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 56e:	eb 1d                	jmp    58d <printint+0xa4>
    putc(fd, buf[i]);
 570:	8d 55 dc             	lea    -0x24(%ebp),%edx
 573:	8b 45 f4             	mov    -0xc(%ebp),%eax
 576:	01 d0                	add    %edx,%eax
 578:	0f b6 00             	movzbl (%eax),%eax
 57b:	0f be c0             	movsbl %al,%eax
 57e:	83 ec 08             	sub    $0x8,%esp
 581:	50                   	push   %eax
 582:	ff 75 08             	pushl  0x8(%ebp)
 585:	e8 3c ff ff ff       	call   4c6 <putc>
 58a:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 58d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 591:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 595:	79 d9                	jns    570 <printint+0x87>
    putc(fd, buf[i]);
}
 597:	90                   	nop
 598:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 59b:	c9                   	leave  
 59c:	c3                   	ret    

0000059d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 59d:	55                   	push   %ebp
 59e:	89 e5                	mov    %esp,%ebp
 5a0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5aa:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ba:	e9 59 01 00 00       	jmp    718 <printf+0x17b>
    c = fmt[i] & 0xff;
 5bf:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c5:	01 d0                	add    %edx,%eax
 5c7:	0f b6 00             	movzbl (%eax),%eax
 5ca:	0f be c0             	movsbl %al,%eax
 5cd:	25 ff 00 00 00       	and    $0xff,%eax
 5d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d9:	75 2c                	jne    607 <printf+0x6a>
      if(c == '%'){
 5db:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5df:	75 0c                	jne    5ed <printf+0x50>
        state = '%';
 5e1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5e8:	e9 27 01 00 00       	jmp    714 <printf+0x177>
      } else {
        putc(fd, c);
 5ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f0:	0f be c0             	movsbl %al,%eax
 5f3:	83 ec 08             	sub    $0x8,%esp
 5f6:	50                   	push   %eax
 5f7:	ff 75 08             	pushl  0x8(%ebp)
 5fa:	e8 c7 fe ff ff       	call   4c6 <putc>
 5ff:	83 c4 10             	add    $0x10,%esp
 602:	e9 0d 01 00 00       	jmp    714 <printf+0x177>
      }
    } else if(state == '%'){
 607:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 60b:	0f 85 03 01 00 00    	jne    714 <printf+0x177>
      if(c == 'd'){
 611:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 615:	75 1e                	jne    635 <printf+0x98>
        printint(fd, *ap, 10, 1);
 617:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61a:	8b 00                	mov    (%eax),%eax
 61c:	6a 01                	push   $0x1
 61e:	6a 0a                	push   $0xa
 620:	50                   	push   %eax
 621:	ff 75 08             	pushl  0x8(%ebp)
 624:	e8 c0 fe ff ff       	call   4e9 <printint>
 629:	83 c4 10             	add    $0x10,%esp
        ap++;
 62c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 630:	e9 d8 00 00 00       	jmp    70d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 635:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 639:	74 06                	je     641 <printf+0xa4>
 63b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 63f:	75 1e                	jne    65f <printf+0xc2>
        printint(fd, *ap, 16, 0);
 641:	8b 45 e8             	mov    -0x18(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	6a 00                	push   $0x0
 648:	6a 10                	push   $0x10
 64a:	50                   	push   %eax
 64b:	ff 75 08             	pushl  0x8(%ebp)
 64e:	e8 96 fe ff ff       	call   4e9 <printint>
 653:	83 c4 10             	add    $0x10,%esp
        ap++;
 656:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65a:	e9 ae 00 00 00       	jmp    70d <printf+0x170>
      } else if(c == 's'){
 65f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 663:	75 43                	jne    6a8 <printf+0x10b>
        s = (char*)*ap;
 665:	8b 45 e8             	mov    -0x18(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 66d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 671:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 675:	75 25                	jne    69c <printf+0xff>
          s = "(null)";
 677:	c7 45 f4 63 09 00 00 	movl   $0x963,-0xc(%ebp)
        while(*s != 0){
 67e:	eb 1c                	jmp    69c <printf+0xff>
          putc(fd, *s);
 680:	8b 45 f4             	mov    -0xc(%ebp),%eax
 683:	0f b6 00             	movzbl (%eax),%eax
 686:	0f be c0             	movsbl %al,%eax
 689:	83 ec 08             	sub    $0x8,%esp
 68c:	50                   	push   %eax
 68d:	ff 75 08             	pushl  0x8(%ebp)
 690:	e8 31 fe ff ff       	call   4c6 <putc>
 695:	83 c4 10             	add    $0x10,%esp
          s++;
 698:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 69c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69f:	0f b6 00             	movzbl (%eax),%eax
 6a2:	84 c0                	test   %al,%al
 6a4:	75 da                	jne    680 <printf+0xe3>
 6a6:	eb 65                	jmp    70d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6ac:	75 1d                	jne    6cb <printf+0x12e>
        putc(fd, *ap);
 6ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b1:	8b 00                	mov    (%eax),%eax
 6b3:	0f be c0             	movsbl %al,%eax
 6b6:	83 ec 08             	sub    $0x8,%esp
 6b9:	50                   	push   %eax
 6ba:	ff 75 08             	pushl  0x8(%ebp)
 6bd:	e8 04 fe ff ff       	call   4c6 <putc>
 6c2:	83 c4 10             	add    $0x10,%esp
        ap++;
 6c5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c9:	eb 42                	jmp    70d <printf+0x170>
      } else if(c == '%'){
 6cb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6cf:	75 17                	jne    6e8 <printf+0x14b>
        putc(fd, c);
 6d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d4:	0f be c0             	movsbl %al,%eax
 6d7:	83 ec 08             	sub    $0x8,%esp
 6da:	50                   	push   %eax
 6db:	ff 75 08             	pushl  0x8(%ebp)
 6de:	e8 e3 fd ff ff       	call   4c6 <putc>
 6e3:	83 c4 10             	add    $0x10,%esp
 6e6:	eb 25                	jmp    70d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e8:	83 ec 08             	sub    $0x8,%esp
 6eb:	6a 25                	push   $0x25
 6ed:	ff 75 08             	pushl  0x8(%ebp)
 6f0:	e8 d1 fd ff ff       	call   4c6 <putc>
 6f5:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 6f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fb:	0f be c0             	movsbl %al,%eax
 6fe:	83 ec 08             	sub    $0x8,%esp
 701:	50                   	push   %eax
 702:	ff 75 08             	pushl  0x8(%ebp)
 705:	e8 bc fd ff ff       	call   4c6 <putc>
 70a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 70d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 714:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 718:	8b 55 0c             	mov    0xc(%ebp),%edx
 71b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71e:	01 d0                	add    %edx,%eax
 720:	0f b6 00             	movzbl (%eax),%eax
 723:	84 c0                	test   %al,%al
 725:	0f 85 94 fe ff ff    	jne    5bf <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 72b:	90                   	nop
 72c:	c9                   	leave  
 72d:	c3                   	ret    

0000072e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72e:	55                   	push   %ebp
 72f:	89 e5                	mov    %esp,%ebp
 731:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 734:	8b 45 08             	mov    0x8(%ebp),%eax
 737:	83 e8 08             	sub    $0x8,%eax
 73a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73d:	a1 18 0c 00 00       	mov    0xc18,%eax
 742:	89 45 fc             	mov    %eax,-0x4(%ebp)
 745:	eb 24                	jmp    76b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74f:	77 12                	ja     763 <free+0x35>
 751:	8b 45 f8             	mov    -0x8(%ebp),%eax
 754:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 757:	77 24                	ja     77d <free+0x4f>
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 00                	mov    (%eax),%eax
 75e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 761:	77 1a                	ja     77d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	89 45 fc             	mov    %eax,-0x4(%ebp)
 76b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 771:	76 d4                	jbe    747 <free+0x19>
 773:	8b 45 fc             	mov    -0x4(%ebp),%eax
 776:	8b 00                	mov    (%eax),%eax
 778:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77b:	76 ca                	jbe    747 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 77d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 780:	8b 40 04             	mov    0x4(%eax),%eax
 783:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 78a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78d:	01 c2                	add    %eax,%edx
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	8b 00                	mov    (%eax),%eax
 794:	39 c2                	cmp    %eax,%edx
 796:	75 24                	jne    7bc <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	8b 50 04             	mov    0x4(%eax),%edx
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	8b 00                	mov    (%eax),%eax
 7a3:	8b 40 04             	mov    0x4(%eax),%eax
 7a6:	01 c2                	add    %eax,%edx
 7a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ab:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b1:	8b 00                	mov    (%eax),%eax
 7b3:	8b 10                	mov    (%eax),%edx
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	89 10                	mov    %edx,(%eax)
 7ba:	eb 0a                	jmp    7c6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	8b 10                	mov    (%eax),%edx
 7c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c9:	8b 40 04             	mov    0x4(%eax),%eax
 7cc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d6:	01 d0                	add    %edx,%eax
 7d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7db:	75 20                	jne    7fd <free+0xcf>
    p->s.size += bp->s.size;
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 50 04             	mov    0x4(%eax),%edx
 7e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e6:	8b 40 04             	mov    0x4(%eax),%eax
 7e9:	01 c2                	add    %eax,%edx
 7eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f4:	8b 10                	mov    (%eax),%edx
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	89 10                	mov    %edx,(%eax)
 7fb:	eb 08                	jmp    805 <free+0xd7>
  } else
    p->s.ptr = bp;
 7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 800:	8b 55 f8             	mov    -0x8(%ebp),%edx
 803:	89 10                	mov    %edx,(%eax)
  freep = p;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	a3 18 0c 00 00       	mov    %eax,0xc18
}
 80d:	90                   	nop
 80e:	c9                   	leave  
 80f:	c3                   	ret    

00000810 <morecore>:

static Header*
morecore(uint nu)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 816:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 81d:	77 07                	ja     826 <morecore+0x16>
    nu = 4096;
 81f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 826:	8b 45 08             	mov    0x8(%ebp),%eax
 829:	c1 e0 03             	shl    $0x3,%eax
 82c:	83 ec 0c             	sub    $0xc,%esp
 82f:	50                   	push   %eax
 830:	e8 39 fc ff ff       	call   46e <sbrk>
 835:	83 c4 10             	add    $0x10,%esp
 838:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 83b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 83f:	75 07                	jne    848 <morecore+0x38>
    return 0;
 841:	b8 00 00 00 00       	mov    $0x0,%eax
 846:	eb 26                	jmp    86e <morecore+0x5e>
  hp = (Header*)p;
 848:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 84e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 851:	8b 55 08             	mov    0x8(%ebp),%edx
 854:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 857:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85a:	83 c0 08             	add    $0x8,%eax
 85d:	83 ec 0c             	sub    $0xc,%esp
 860:	50                   	push   %eax
 861:	e8 c8 fe ff ff       	call   72e <free>
 866:	83 c4 10             	add    $0x10,%esp
  return freep;
 869:	a1 18 0c 00 00       	mov    0xc18,%eax
}
 86e:	c9                   	leave  
 86f:	c3                   	ret    

00000870 <malloc>:

void*
malloc(uint nbytes)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	83 c0 07             	add    $0x7,%eax
 87c:	c1 e8 03             	shr    $0x3,%eax
 87f:	83 c0 01             	add    $0x1,%eax
 882:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 885:	a1 18 0c 00 00       	mov    0xc18,%eax
 88a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 891:	75 23                	jne    8b6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 893:	c7 45 f0 10 0c 00 00 	movl   $0xc10,-0x10(%ebp)
 89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89d:	a3 18 0c 00 00       	mov    %eax,0xc18
 8a2:	a1 18 0c 00 00       	mov    0xc18,%eax
 8a7:	a3 10 0c 00 00       	mov    %eax,0xc10
    base.s.size = 0;
 8ac:	c7 05 14 0c 00 00 00 	movl   $0x0,0xc14
 8b3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b9:	8b 00                	mov    (%eax),%eax
 8bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	8b 40 04             	mov    0x4(%eax),%eax
 8c4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c7:	72 4d                	jb     916 <malloc+0xa6>
      if(p->s.size == nunits)
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	8b 40 04             	mov    0x4(%eax),%eax
 8cf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d2:	75 0c                	jne    8e0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d7:	8b 10                	mov    (%eax),%edx
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	89 10                	mov    %edx,(%eax)
 8de:	eb 26                	jmp    906 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e3:	8b 40 04             	mov    0x4(%eax),%eax
 8e6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e9:	89 c2                	mov    %eax,%edx
 8eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f4:	8b 40 04             	mov    0x4(%eax),%eax
 8f7:	c1 e0 03             	shl    $0x3,%eax
 8fa:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 900:	8b 55 ec             	mov    -0x14(%ebp),%edx
 903:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 906:	8b 45 f0             	mov    -0x10(%ebp),%eax
 909:	a3 18 0c 00 00       	mov    %eax,0xc18
      return (void*)(p + 1);
 90e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 911:	83 c0 08             	add    $0x8,%eax
 914:	eb 3b                	jmp    951 <malloc+0xe1>
    }
    if(p == freep)
 916:	a1 18 0c 00 00       	mov    0xc18,%eax
 91b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91e:	75 1e                	jne    93e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 920:	83 ec 0c             	sub    $0xc,%esp
 923:	ff 75 ec             	pushl  -0x14(%ebp)
 926:	e8 e5 fe ff ff       	call   810 <morecore>
 92b:	83 c4 10             	add    $0x10,%esp
 92e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 931:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 935:	75 07                	jne    93e <malloc+0xce>
        return 0;
 937:	b8 00 00 00 00       	mov    $0x0,%eax
 93c:	eb 13                	jmp    951 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	89 45 f0             	mov    %eax,-0x10(%ebp)
 944:	8b 45 f4             	mov    -0xc(%ebp),%eax
 947:	8b 00                	mov    (%eax),%eax
 949:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 94c:	e9 6d ff ff ff       	jmp    8be <malloc+0x4e>
}
 951:	c9                   	leave  
 952:	c3                   	ret    
