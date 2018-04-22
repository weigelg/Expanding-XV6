
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
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
   f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
  11:	83 3b 03             	cmpl   $0x3,(%ebx)
  14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
  16:	83 ec 08             	sub    $0x8,%esp
  19:	68 a3 09 00 00       	push   $0x9a3
  1e:	6a 02                	push   $0x2
  20:	e8 c8 05 00 00       	call   5ed <printf>
  25:	83 c4 10             	add    $0x10,%esp
    exit();
  28:	e8 09 04 00 00       	call   436 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	83 c0 08             	add    $0x8,%eax
  33:	8b 10                	mov    (%eax),%edx
  35:	8b 43 04             	mov    0x4(%ebx),%eax
  38:	83 c0 04             	add    $0x4,%eax
  3b:	8b 00                	mov    (%eax),%eax
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	e8 4f 04 00 00       	call   496 <link>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	83 c0 08             	add    $0x8,%eax
  54:	8b 10                	mov    (%eax),%edx
  56:	8b 43 04             	mov    0x4(%ebx),%eax
  59:	83 c0 04             	add    $0x4,%eax
  5c:	8b 00                	mov    (%eax),%eax
  5e:	52                   	push   %edx
  5f:	50                   	push   %eax
  60:	68 b6 09 00 00       	push   $0x9b6
  65:	6a 02                	push   $0x2
  67:	e8 81 05 00 00       	call   5ed <printf>
  6c:	83 c4 10             	add    $0x10,%esp
  exit();
  6f:	e8 c2 03 00 00       	call   436 <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	57                   	push   %edi
  78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7c:	8b 55 10             	mov    0x10(%ebp),%edx
  7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  82:	89 cb                	mov    %ecx,%ebx
  84:	89 df                	mov    %ebx,%edi
  86:	89 d1                	mov    %edx,%ecx
  88:	fc                   	cld    
  89:	f3 aa                	rep stos %al,%es:(%edi)
  8b:	89 ca                	mov    %ecx,%edx
  8d:	89 fb                	mov    %edi,%ebx
  8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  95:	90                   	nop
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8d 50 01             	lea    0x1(%eax),%edx
  ad:	89 55 08             	mov    %edx,0x8(%ebp)
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c0             	movzbl %al,%eax
 103:	29 c2                	sub    %eax,%edx
 105:	89 d0                	mov    %edx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 133:	8b 45 10             	mov    0x10(%ebp),%eax
 136:	50                   	push   %eax
 137:	ff 75 0c             	pushl  0xc(%ebp)
 13a:	ff 75 08             	pushl  0x8(%ebp)
 13d:	e8 32 ff ff ff       	call   74 <stosb>
 142:	83 c4 0c             	add    $0xc,%esp
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	6a 01                	push   $0x1
 191:	8d 45 ef             	lea    -0x11(%ebp),%eax
 194:	50                   	push   %eax
 195:	6a 00                	push   $0x0
 197:	e8 b2 02 00 00       	call   44e <read>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
 1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ab:	8d 50 01             	lea    0x1(%eax),%edx
 1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 c2                	add    %eax,%edx
 1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	74 16                	je     1dc <gets+0x5f>
 1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ca:	3c 0d                	cmp    $0xd,%al
 1cc:	74 0e                	je     1dc <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d7:	7c b3                	jl     18c <gets+0xf>
 1d9:	eb 01                	jmp    1dc <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1db:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	01 d0                	add    %edx,%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	83 ec 08             	sub    $0x8,%esp
 1f5:	6a 00                	push   $0x0
 1f7:	ff 75 08             	pushl  0x8(%ebp)
 1fa:	e8 77 02 00 00       	call   476 <open>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 209:	79 07                	jns    212 <stat+0x26>
    return -1;
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
 212:	83 ec 08             	sub    $0x8,%esp
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 f4             	pushl  -0xc(%ebp)
 21b:	e8 6e 02 00 00       	call   48e <fstat>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 226:	83 ec 0c             	sub    $0xc,%esp
 229:	ff 75 f4             	pushl  -0xc(%ebp)
 22c:	e8 2d 02 00 00       	call   45e <close>
 231:	83 c4 10             	add    $0x10,%esp
  return r;
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 246:	eb 04                	jmp    24c <atoi+0x13>
 248:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	3c 20                	cmp    $0x20,%al
 254:	74 f2                	je     248 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	0f b6 00             	movzbl (%eax),%eax
 25c:	3c 2d                	cmp    $0x2d,%al
 25e:	75 07                	jne    267 <atoi+0x2e>
 260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 265:	eb 05                	jmp    26c <atoi+0x33>
 267:	b8 01 00 00 00       	mov    $0x1,%eax
 26c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	0f b6 00             	movzbl (%eax),%eax
 275:	3c 2b                	cmp    $0x2b,%al
 277:	74 0a                	je     283 <atoi+0x4a>
 279:	8b 45 08             	mov    0x8(%ebp),%eax
 27c:	0f b6 00             	movzbl (%eax),%eax
 27f:	3c 2d                	cmp    $0x2d,%al
 281:	75 2b                	jne    2ae <atoi+0x75>
    s++;
 283:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 287:	eb 25                	jmp    2ae <atoi+0x75>
    n = n*10 + *s++ - '0';
 289:	8b 55 fc             	mov    -0x4(%ebp),%edx
 28c:	89 d0                	mov    %edx,%eax
 28e:	c1 e0 02             	shl    $0x2,%eax
 291:	01 d0                	add    %edx,%eax
 293:	01 c0                	add    %eax,%eax
 295:	89 c1                	mov    %eax,%ecx
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	8d 50 01             	lea    0x1(%eax),%edx
 29d:	89 55 08             	mov    %edx,0x8(%ebp)
 2a0:	0f b6 00             	movzbl (%eax),%eax
 2a3:	0f be c0             	movsbl %al,%eax
 2a6:	01 c8                	add    %ecx,%eax
 2a8:	83 e8 30             	sub    $0x30,%eax
 2ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
 2b1:	0f b6 00             	movzbl (%eax),%eax
 2b4:	3c 2f                	cmp    $0x2f,%al
 2b6:	7e 0a                	jle    2c2 <atoi+0x89>
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	0f b6 00             	movzbl (%eax),%eax
 2be:	3c 39                	cmp    $0x39,%al
 2c0:	7e c7                	jle    289 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 2c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2c5:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 2c9:	c9                   	leave  
 2ca:	c3                   	ret    

000002cb <atoo>:

int
atoo(const char *s)
{
 2cb:	55                   	push   %ebp
 2cc:	89 e5                	mov    %esp,%ebp
 2ce:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2d8:	eb 04                	jmp    2de <atoo+0x13>
 2da:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2de:	8b 45 08             	mov    0x8(%ebp),%eax
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	3c 20                	cmp    $0x20,%al
 2e6:	74 f2                	je     2da <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	0f b6 00             	movzbl (%eax),%eax
 2ee:	3c 2d                	cmp    $0x2d,%al
 2f0:	75 07                	jne    2f9 <atoo+0x2e>
 2f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f7:	eb 05                	jmp    2fe <atoo+0x33>
 2f9:	b8 01 00 00 00       	mov    $0x1,%eax
 2fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	0f b6 00             	movzbl (%eax),%eax
 307:	3c 2b                	cmp    $0x2b,%al
 309:	74 0a                	je     315 <atoo+0x4a>
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	0f b6 00             	movzbl (%eax),%eax
 311:	3c 2d                	cmp    $0x2d,%al
 313:	75 27                	jne    33c <atoo+0x71>
    s++;
 315:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 319:	eb 21                	jmp    33c <atoo+0x71>
    n = n*8 + *s++ - '0';
 31b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31e:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 325:	8b 45 08             	mov    0x8(%ebp),%eax
 328:	8d 50 01             	lea    0x1(%eax),%edx
 32b:	89 55 08             	mov    %edx,0x8(%ebp)
 32e:	0f b6 00             	movzbl (%eax),%eax
 331:	0f be c0             	movsbl %al,%eax
 334:	01 c8                	add    %ecx,%eax
 336:	83 e8 30             	sub    $0x30,%eax
 339:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	3c 2f                	cmp    $0x2f,%al
 344:	7e 0a                	jle    350 <atoo+0x85>
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	0f b6 00             	movzbl (%eax),%eax
 34c:	3c 37                	cmp    $0x37,%al
 34e:	7e cb                	jle    31b <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 350:	8b 45 f8             	mov    -0x8(%ebp),%eax
 353:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 357:	c9                   	leave  
 358:	c3                   	ret    

00000359 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 365:	8b 45 0c             	mov    0xc(%ebp),%eax
 368:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 36b:	eb 17                	jmp    384 <memmove+0x2b>
    *dst++ = *src++;
 36d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 370:	8d 50 01             	lea    0x1(%eax),%edx
 373:	89 55 fc             	mov    %edx,-0x4(%ebp)
 376:	8b 55 f8             	mov    -0x8(%ebp),%edx
 379:	8d 4a 01             	lea    0x1(%edx),%ecx
 37c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 37f:	0f b6 12             	movzbl (%edx),%edx
 382:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	8d 50 ff             	lea    -0x1(%eax),%edx
 38a:	89 55 10             	mov    %edx,0x10(%ebp)
 38d:	85 c0                	test   %eax,%eax
 38f:	7f dc                	jg     36d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 391:	8b 45 08             	mov    0x8(%ebp),%eax
}
 394:	c9                   	leave  
 395:	c3                   	ret    

00000396 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 39c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 39f:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3a4:	89 c8                	mov    %ecx,%eax
 3a6:	f7 e2                	mul    %edx
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	c1 e8 06             	shr    $0x6,%eax
 3ad:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 3b3:	29 c1                	sub    %eax,%ecx
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3c2:	f7 e2                	mul    %edx
 3c4:	89 d0                	mov    %edx,%eax
 3c6:	c1 e8 06             	shr    $0x6,%eax
 3c9:	83 ec 04             	sub    $0x4,%esp
 3cc:	50                   	push   %eax
 3cd:	68 ca 09 00 00       	push   $0x9ca
 3d2:	6a 01                	push   $0x1
 3d4:	e8 14 02 00 00       	call   5ed <printf>
 3d9:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 3dc:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 3e0:	7e 17                	jle    3f9 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 3e2:	83 ec 04             	sub    $0x4,%esp
 3e5:	ff 75 f4             	pushl  -0xc(%ebp)
 3e8:	68 ce 09 00 00       	push   $0x9ce
 3ed:	6a 01                	push   $0x1
 3ef:	e8 f9 01 00 00       	call   5ed <printf>
 3f4:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 3f7:	eb 32                	jmp    42b <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 3f9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 3fd:	7e 17                	jle    416 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 3ff:	83 ec 04             	sub    $0x4,%esp
 402:	ff 75 f4             	pushl  -0xc(%ebp)
 405:	68 d1 09 00 00       	push   $0x9d1
 40a:	6a 01                	push   $0x1
 40c:	e8 dc 01 00 00       	call   5ed <printf>
 411:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 414:	eb 15                	jmp    42b <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 416:	83 ec 04             	sub    $0x4,%esp
 419:	ff 75 f4             	pushl  -0xc(%ebp)
 41c:	68 d5 09 00 00       	push   $0x9d5
 421:	6a 01                	push   $0x1
 423:	e8 c5 01 00 00       	call   5ed <printf>
 428:	83 c4 10             	add    $0x10,%esp
};
 42b:	90                   	nop
 42c:	c9                   	leave  
 42d:	c3                   	ret    

0000042e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42e:	b8 01 00 00 00       	mov    $0x1,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <exit>:
SYSCALL(exit)
 436:	b8 02 00 00 00       	mov    $0x2,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <wait>:
SYSCALL(wait)
 43e:	b8 03 00 00 00       	mov    $0x3,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <pipe>:
SYSCALL(pipe)
 446:	b8 04 00 00 00       	mov    $0x4,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <read>:
SYSCALL(read)
 44e:	b8 05 00 00 00       	mov    $0x5,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <write>:
SYSCALL(write)
 456:	b8 10 00 00 00       	mov    $0x10,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <close>:
SYSCALL(close)
 45e:	b8 15 00 00 00       	mov    $0x15,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <kill>:
SYSCALL(kill)
 466:	b8 06 00 00 00       	mov    $0x6,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <exec>:
SYSCALL(exec)
 46e:	b8 07 00 00 00       	mov    $0x7,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <open>:
SYSCALL(open)
 476:	b8 0f 00 00 00       	mov    $0xf,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <mknod>:
SYSCALL(mknod)
 47e:	b8 11 00 00 00       	mov    $0x11,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <unlink>:
SYSCALL(unlink)
 486:	b8 12 00 00 00       	mov    $0x12,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <fstat>:
SYSCALL(fstat)
 48e:	b8 08 00 00 00       	mov    $0x8,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <link>:
SYSCALL(link)
 496:	b8 13 00 00 00       	mov    $0x13,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <mkdir>:
SYSCALL(mkdir)
 49e:	b8 14 00 00 00       	mov    $0x14,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <chdir>:
SYSCALL(chdir)
 4a6:	b8 09 00 00 00       	mov    $0x9,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <dup>:
SYSCALL(dup)
 4ae:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <getpid>:
SYSCALL(getpid)
 4b6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <sbrk>:
SYSCALL(sbrk)
 4be:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <sleep>:
SYSCALL(sleep)
 4c6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <uptime>:
SYSCALL(uptime)
 4ce:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <halt>:
SYSCALL(halt)
 4d6:	b8 16 00 00 00       	mov    $0x16,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <date>:

SYSCALL(date)
 4de:	b8 17 00 00 00       	mov    $0x17,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <getuid>:
SYSCALL(getuid)
 4e6:	b8 18 00 00 00       	mov    $0x18,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <getgid>:
SYSCALL(getgid)
 4ee:	b8 19 00 00 00       	mov    $0x19,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <getppid>:
SYSCALL(getppid)
 4f6:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <setuid>:
SYSCALL(setuid)
 4fe:	b8 1b 00 00 00       	mov    $0x1b,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <setgid>:
SYSCALL(setgid)
 506:	b8 1c 00 00 00       	mov    $0x1c,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <getprocs>:
SYSCALL(getprocs)
 50e:	b8 1d 00 00 00       	mov    $0x1d,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	83 ec 18             	sub    $0x18,%esp
 51c:	8b 45 0c             	mov    0xc(%ebp),%eax
 51f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 522:	83 ec 04             	sub    $0x4,%esp
 525:	6a 01                	push   $0x1
 527:	8d 45 f4             	lea    -0xc(%ebp),%eax
 52a:	50                   	push   %eax
 52b:	ff 75 08             	pushl  0x8(%ebp)
 52e:	e8 23 ff ff ff       	call   456 <write>
 533:	83 c4 10             	add    $0x10,%esp
}
 536:	90                   	nop
 537:	c9                   	leave  
 538:	c3                   	ret    

00000539 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	53                   	push   %ebx
 53d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 540:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 547:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 54b:	74 17                	je     564 <printint+0x2b>
 54d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 551:	79 11                	jns    564 <printint+0x2b>
    neg = 1;
 553:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 55a:	8b 45 0c             	mov    0xc(%ebp),%eax
 55d:	f7 d8                	neg    %eax
 55f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 562:	eb 06                	jmp    56a <printint+0x31>
  } else {
    x = xx;
 564:	8b 45 0c             	mov    0xc(%ebp),%eax
 567:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 56a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 571:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 574:	8d 41 01             	lea    0x1(%ecx),%eax
 577:	89 45 f4             	mov    %eax,-0xc(%ebp)
 57a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 57d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 580:	ba 00 00 00 00       	mov    $0x0,%edx
 585:	f7 f3                	div    %ebx
 587:	89 d0                	mov    %edx,%eax
 589:	0f b6 80 70 0c 00 00 	movzbl 0xc70(%eax),%eax
 590:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 594:	8b 5d 10             	mov    0x10(%ebp),%ebx
 597:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59a:	ba 00 00 00 00       	mov    $0x0,%edx
 59f:	f7 f3                	div    %ebx
 5a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a8:	75 c7                	jne    571 <printint+0x38>
  if(neg)
 5aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ae:	74 2d                	je     5dd <printint+0xa4>
    buf[i++] = '-';
 5b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b3:	8d 50 01             	lea    0x1(%eax),%edx
 5b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5b9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5be:	eb 1d                	jmp    5dd <printint+0xa4>
    putc(fd, buf[i]);
 5c0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c6:	01 d0                	add    %edx,%eax
 5c8:	0f b6 00             	movzbl (%eax),%eax
 5cb:	0f be c0             	movsbl %al,%eax
 5ce:	83 ec 08             	sub    $0x8,%esp
 5d1:	50                   	push   %eax
 5d2:	ff 75 08             	pushl  0x8(%ebp)
 5d5:	e8 3c ff ff ff       	call   516 <putc>
 5da:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5dd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e5:	79 d9                	jns    5c0 <printint+0x87>
    putc(fd, buf[i]);
}
 5e7:	90                   	nop
 5e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5eb:	c9                   	leave  
 5ec:	c3                   	ret    

000005ed <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5fa:	8d 45 0c             	lea    0xc(%ebp),%eax
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 603:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 60a:	e9 59 01 00 00       	jmp    768 <printf+0x17b>
    c = fmt[i] & 0xff;
 60f:	8b 55 0c             	mov    0xc(%ebp),%edx
 612:	8b 45 f0             	mov    -0x10(%ebp),%eax
 615:	01 d0                	add    %edx,%eax
 617:	0f b6 00             	movzbl (%eax),%eax
 61a:	0f be c0             	movsbl %al,%eax
 61d:	25 ff 00 00 00       	and    $0xff,%eax
 622:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 625:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 629:	75 2c                	jne    657 <printf+0x6a>
      if(c == '%'){
 62b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 62f:	75 0c                	jne    63d <printf+0x50>
        state = '%';
 631:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 638:	e9 27 01 00 00       	jmp    764 <printf+0x177>
      } else {
        putc(fd, c);
 63d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 640:	0f be c0             	movsbl %al,%eax
 643:	83 ec 08             	sub    $0x8,%esp
 646:	50                   	push   %eax
 647:	ff 75 08             	pushl  0x8(%ebp)
 64a:	e8 c7 fe ff ff       	call   516 <putc>
 64f:	83 c4 10             	add    $0x10,%esp
 652:	e9 0d 01 00 00       	jmp    764 <printf+0x177>
      }
    } else if(state == '%'){
 657:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 65b:	0f 85 03 01 00 00    	jne    764 <printf+0x177>
      if(c == 'd'){
 661:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 665:	75 1e                	jne    685 <printf+0x98>
        printint(fd, *ap, 10, 1);
 667:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66a:	8b 00                	mov    (%eax),%eax
 66c:	6a 01                	push   $0x1
 66e:	6a 0a                	push   $0xa
 670:	50                   	push   %eax
 671:	ff 75 08             	pushl  0x8(%ebp)
 674:	e8 c0 fe ff ff       	call   539 <printint>
 679:	83 c4 10             	add    $0x10,%esp
        ap++;
 67c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 680:	e9 d8 00 00 00       	jmp    75d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 685:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 689:	74 06                	je     691 <printf+0xa4>
 68b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 68f:	75 1e                	jne    6af <printf+0xc2>
        printint(fd, *ap, 16, 0);
 691:	8b 45 e8             	mov    -0x18(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	6a 00                	push   $0x0
 698:	6a 10                	push   $0x10
 69a:	50                   	push   %eax
 69b:	ff 75 08             	pushl  0x8(%ebp)
 69e:	e8 96 fe ff ff       	call   539 <printint>
 6a3:	83 c4 10             	add    $0x10,%esp
        ap++;
 6a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6aa:	e9 ae 00 00 00       	jmp    75d <printf+0x170>
      } else if(c == 's'){
 6af:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b3:	75 43                	jne    6f8 <printf+0x10b>
        s = (char*)*ap;
 6b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b8:	8b 00                	mov    (%eax),%eax
 6ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c5:	75 25                	jne    6ec <printf+0xff>
          s = "(null)";
 6c7:	c7 45 f4 da 09 00 00 	movl   $0x9da,-0xc(%ebp)
        while(*s != 0){
 6ce:	eb 1c                	jmp    6ec <printf+0xff>
          putc(fd, *s);
 6d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d3:	0f b6 00             	movzbl (%eax),%eax
 6d6:	0f be c0             	movsbl %al,%eax
 6d9:	83 ec 08             	sub    $0x8,%esp
 6dc:	50                   	push   %eax
 6dd:	ff 75 08             	pushl  0x8(%ebp)
 6e0:	e8 31 fe ff ff       	call   516 <putc>
 6e5:	83 c4 10             	add    $0x10,%esp
          s++;
 6e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ef:	0f b6 00             	movzbl (%eax),%eax
 6f2:	84 c0                	test   %al,%al
 6f4:	75 da                	jne    6d0 <printf+0xe3>
 6f6:	eb 65                	jmp    75d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6f8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6fc:	75 1d                	jne    71b <printf+0x12e>
        putc(fd, *ap);
 6fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	0f be c0             	movsbl %al,%eax
 706:	83 ec 08             	sub    $0x8,%esp
 709:	50                   	push   %eax
 70a:	ff 75 08             	pushl  0x8(%ebp)
 70d:	e8 04 fe ff ff       	call   516 <putc>
 712:	83 c4 10             	add    $0x10,%esp
        ap++;
 715:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 719:	eb 42                	jmp    75d <printf+0x170>
      } else if(c == '%'){
 71b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 71f:	75 17                	jne    738 <printf+0x14b>
        putc(fd, c);
 721:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 724:	0f be c0             	movsbl %al,%eax
 727:	83 ec 08             	sub    $0x8,%esp
 72a:	50                   	push   %eax
 72b:	ff 75 08             	pushl  0x8(%ebp)
 72e:	e8 e3 fd ff ff       	call   516 <putc>
 733:	83 c4 10             	add    $0x10,%esp
 736:	eb 25                	jmp    75d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 738:	83 ec 08             	sub    $0x8,%esp
 73b:	6a 25                	push   $0x25
 73d:	ff 75 08             	pushl  0x8(%ebp)
 740:	e8 d1 fd ff ff       	call   516 <putc>
 745:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 748:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74b:	0f be c0             	movsbl %al,%eax
 74e:	83 ec 08             	sub    $0x8,%esp
 751:	50                   	push   %eax
 752:	ff 75 08             	pushl  0x8(%ebp)
 755:	e8 bc fd ff ff       	call   516 <putc>
 75a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 75d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 764:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 768:	8b 55 0c             	mov    0xc(%ebp),%edx
 76b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76e:	01 d0                	add    %edx,%eax
 770:	0f b6 00             	movzbl (%eax),%eax
 773:	84 c0                	test   %al,%al
 775:	0f 85 94 fe ff ff    	jne    60f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 77b:	90                   	nop
 77c:	c9                   	leave  
 77d:	c3                   	ret    

0000077e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 77e:	55                   	push   %ebp
 77f:	89 e5                	mov    %esp,%ebp
 781:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 784:	8b 45 08             	mov    0x8(%ebp),%eax
 787:	83 e8 08             	sub    $0x8,%eax
 78a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78d:	a1 8c 0c 00 00       	mov    0xc8c,%eax
 792:	89 45 fc             	mov    %eax,-0x4(%ebp)
 795:	eb 24                	jmp    7bb <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 79f:	77 12                	ja     7b3 <free+0x35>
 7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a7:	77 24                	ja     7cd <free+0x4f>
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b1:	77 1a                	ja     7cd <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c1:	76 d4                	jbe    797 <free+0x19>
 7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c6:	8b 00                	mov    (%eax),%eax
 7c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cb:	76 ca                	jbe    797 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d0:	8b 40 04             	mov    0x4(%eax),%eax
 7d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dd:	01 c2                	add    %eax,%edx
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	8b 00                	mov    (%eax),%eax
 7e4:	39 c2                	cmp    %eax,%edx
 7e6:	75 24                	jne    80c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7eb:	8b 50 04             	mov    0x4(%eax),%edx
 7ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f1:	8b 00                	mov    (%eax),%eax
 7f3:	8b 40 04             	mov    0x4(%eax),%eax
 7f6:	01 c2                	add    %eax,%edx
 7f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fb:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	8b 10                	mov    (%eax),%edx
 805:	8b 45 f8             	mov    -0x8(%ebp),%eax
 808:	89 10                	mov    %edx,(%eax)
 80a:	eb 0a                	jmp    816 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80f:	8b 10                	mov    (%eax),%edx
 811:	8b 45 f8             	mov    -0x8(%ebp),%eax
 814:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 816:	8b 45 fc             	mov    -0x4(%ebp),%eax
 819:	8b 40 04             	mov    0x4(%eax),%eax
 81c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 823:	8b 45 fc             	mov    -0x4(%ebp),%eax
 826:	01 d0                	add    %edx,%eax
 828:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82b:	75 20                	jne    84d <free+0xcf>
    p->s.size += bp->s.size;
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	8b 50 04             	mov    0x4(%eax),%edx
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	8b 40 04             	mov    0x4(%eax),%eax
 839:	01 c2                	add    %eax,%edx
 83b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 841:	8b 45 f8             	mov    -0x8(%ebp),%eax
 844:	8b 10                	mov    (%eax),%edx
 846:	8b 45 fc             	mov    -0x4(%ebp),%eax
 849:	89 10                	mov    %edx,(%eax)
 84b:	eb 08                	jmp    855 <free+0xd7>
  } else
    p->s.ptr = bp;
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	8b 55 f8             	mov    -0x8(%ebp),%edx
 853:	89 10                	mov    %edx,(%eax)
  freep = p;
 855:	8b 45 fc             	mov    -0x4(%ebp),%eax
 858:	a3 8c 0c 00 00       	mov    %eax,0xc8c
}
 85d:	90                   	nop
 85e:	c9                   	leave  
 85f:	c3                   	ret    

00000860 <morecore>:

static Header*
morecore(uint nu)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 866:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 86d:	77 07                	ja     876 <morecore+0x16>
    nu = 4096;
 86f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	c1 e0 03             	shl    $0x3,%eax
 87c:	83 ec 0c             	sub    $0xc,%esp
 87f:	50                   	push   %eax
 880:	e8 39 fc ff ff       	call   4be <sbrk>
 885:	83 c4 10             	add    $0x10,%esp
 888:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 88b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 88f:	75 07                	jne    898 <morecore+0x38>
    return 0;
 891:	b8 00 00 00 00       	mov    $0x0,%eax
 896:	eb 26                	jmp    8be <morecore+0x5e>
  hp = (Header*)p;
 898:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 89e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a1:	8b 55 08             	mov    0x8(%ebp),%edx
 8a4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8aa:	83 c0 08             	add    $0x8,%eax
 8ad:	83 ec 0c             	sub    $0xc,%esp
 8b0:	50                   	push   %eax
 8b1:	e8 c8 fe ff ff       	call   77e <free>
 8b6:	83 c4 10             	add    $0x10,%esp
  return freep;
 8b9:	a1 8c 0c 00 00       	mov    0xc8c,%eax
}
 8be:	c9                   	leave  
 8bf:	c3                   	ret    

000008c0 <malloc>:

void*
malloc(uint nbytes)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c6:	8b 45 08             	mov    0x8(%ebp),%eax
 8c9:	83 c0 07             	add    $0x7,%eax
 8cc:	c1 e8 03             	shr    $0x3,%eax
 8cf:	83 c0 01             	add    $0x1,%eax
 8d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8d5:	a1 8c 0c 00 00       	mov    0xc8c,%eax
 8da:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8e1:	75 23                	jne    906 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e3:	c7 45 f0 84 0c 00 00 	movl   $0xc84,-0x10(%ebp)
 8ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ed:	a3 8c 0c 00 00       	mov    %eax,0xc8c
 8f2:	a1 8c 0c 00 00       	mov    0xc8c,%eax
 8f7:	a3 84 0c 00 00       	mov    %eax,0xc84
    base.s.size = 0;
 8fc:	c7 05 88 0c 00 00 00 	movl   $0x0,0xc88
 903:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 906:	8b 45 f0             	mov    -0x10(%ebp),%eax
 909:	8b 00                	mov    (%eax),%eax
 90b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 90e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 911:	8b 40 04             	mov    0x4(%eax),%eax
 914:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 917:	72 4d                	jb     966 <malloc+0xa6>
      if(p->s.size == nunits)
 919:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91c:	8b 40 04             	mov    0x4(%eax),%eax
 91f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 922:	75 0c                	jne    930 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 924:	8b 45 f4             	mov    -0xc(%ebp),%eax
 927:	8b 10                	mov    (%eax),%edx
 929:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92c:	89 10                	mov    %edx,(%eax)
 92e:	eb 26                	jmp    956 <malloc+0x96>
      else {
        p->s.size -= nunits;
 930:	8b 45 f4             	mov    -0xc(%ebp),%eax
 933:	8b 40 04             	mov    0x4(%eax),%eax
 936:	2b 45 ec             	sub    -0x14(%ebp),%eax
 939:	89 c2                	mov    %eax,%edx
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 941:	8b 45 f4             	mov    -0xc(%ebp),%eax
 944:	8b 40 04             	mov    0x4(%eax),%eax
 947:	c1 e0 03             	shl    $0x3,%eax
 94a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 94d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 950:	8b 55 ec             	mov    -0x14(%ebp),%edx
 953:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 956:	8b 45 f0             	mov    -0x10(%ebp),%eax
 959:	a3 8c 0c 00 00       	mov    %eax,0xc8c
      return (void*)(p + 1);
 95e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 961:	83 c0 08             	add    $0x8,%eax
 964:	eb 3b                	jmp    9a1 <malloc+0xe1>
    }
    if(p == freep)
 966:	a1 8c 0c 00 00       	mov    0xc8c,%eax
 96b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 96e:	75 1e                	jne    98e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 970:	83 ec 0c             	sub    $0xc,%esp
 973:	ff 75 ec             	pushl  -0x14(%ebp)
 976:	e8 e5 fe ff ff       	call   860 <morecore>
 97b:	83 c4 10             	add    $0x10,%esp
 97e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 981:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 985:	75 07                	jne    98e <malloc+0xce>
        return 0;
 987:	b8 00 00 00 00       	mov    $0x0,%eax
 98c:	eb 13                	jmp    9a1 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	89 45 f0             	mov    %eax,-0x10(%ebp)
 994:	8b 45 f4             	mov    -0xc(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 99c:	e9 6d ff ff ff       	jmp    90e <malloc+0x4e>
}
 9a1:	c9                   	leave  
 9a2:	c3                   	ret    
