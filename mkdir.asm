
_mkdir:     file format elf32-i386


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
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
  14:	83 3b 01             	cmpl   $0x1,(%ebx)
  17:	7f 17                	jg     30 <main+0x30>
    printf(2, "Usage: mkdir files...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 bf 09 00 00       	push   $0x9bf
  21:	6a 02                	push   $0x2
  23:	e8 e1 05 00 00       	call   609 <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 22 04 00 00       	call   452 <exit>
  }

  for(i = 1; i < argc; i++){
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 4b                	jmp    84 <main+0x84>
    if(mkdir(argv[i]) < 0){
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 67 04 00 00       	call   4ba <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 26                	jns    80 <main+0x80>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  64:	8b 43 04             	mov    0x4(%ebx),%eax
  67:	01 d0                	add    %edx,%eax
  69:	8b 00                	mov    (%eax),%eax
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	50                   	push   %eax
  6f:	68 d6 09 00 00       	push   $0x9d6
  74:	6a 02                	push   $0x2
  76:	e8 8e 05 00 00       	call   609 <printf>
  7b:	83 c4 10             	add    $0x10,%esp
      break;
  7e:	eb 0b                	jmp    8b <main+0x8b>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  87:	3b 03                	cmp    (%ebx),%eax
  89:	7c ae                	jl     39 <main+0x39>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  8b:	e8 c2 03 00 00       	call   452 <exit>

00000090 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	57                   	push   %edi
  94:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  95:	8b 4d 08             	mov    0x8(%ebp),%ecx
  98:	8b 55 10             	mov    0x10(%ebp),%edx
  9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  9e:	89 cb                	mov    %ecx,%ebx
  a0:	89 df                	mov    %ebx,%edi
  a2:	89 d1                	mov    %edx,%ecx
  a4:	fc                   	cld    
  a5:	f3 aa                	rep stos %al,%es:(%edi)
  a7:	89 ca                	mov    %ecx,%edx
  a9:	89 fb                	mov    %edi,%ebx
  ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b1:	90                   	nop
  b2:	5b                   	pop    %ebx
  b3:	5f                   	pop    %edi
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    

000000b6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  bc:	8b 45 08             	mov    0x8(%ebp),%eax
  bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c2:	90                   	nop
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	8d 50 01             	lea    0x1(%eax),%edx
  c9:	89 55 08             	mov    %edx,0x8(%ebp)
  cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  cf:	8d 4a 01             	lea    0x1(%edx),%ecx
  d2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d5:	0f b6 12             	movzbl (%edx),%edx
  d8:	88 10                	mov    %dl,(%eax)
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 e2                	jne    c3 <strcpy+0xd>
    ;
  return os;
  e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e4:	c9                   	leave  
  e5:	c3                   	ret    

000000e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e9:	eb 08                	jmp    f3 <strcmp+0xd>
    p++, q++;
  eb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	84 c0                	test   %al,%al
  fb:	74 10                	je     10d <strcmp+0x27>
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 10             	movzbl (%eax),%edx
 103:	8b 45 0c             	mov    0xc(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	38 c2                	cmp    %al,%dl
 10b:	74 de                	je     eb <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 10d:	8b 45 08             	mov    0x8(%ebp),%eax
 110:	0f b6 00             	movzbl (%eax),%eax
 113:	0f b6 d0             	movzbl %al,%edx
 116:	8b 45 0c             	mov    0xc(%ebp),%eax
 119:	0f b6 00             	movzbl (%eax),%eax
 11c:	0f b6 c0             	movzbl %al,%eax
 11f:	29 c2                	sub    %eax,%edx
 121:	89 d0                	mov    %edx,%eax
}
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <strlen>:

uint
strlen(char *s)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 12b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 132:	eb 04                	jmp    138 <strlen+0x13>
 134:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 138:	8b 55 fc             	mov    -0x4(%ebp),%edx
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	01 d0                	add    %edx,%eax
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	84 c0                	test   %al,%al
 145:	75 ed                	jne    134 <strlen+0xf>
    ;
  return n;
 147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <memset>:

void*
memset(void *dst, int c, uint n)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 14f:	8b 45 10             	mov    0x10(%ebp),%eax
 152:	50                   	push   %eax
 153:	ff 75 0c             	pushl  0xc(%ebp)
 156:	ff 75 08             	pushl  0x8(%ebp)
 159:	e8 32 ff ff ff       	call   90 <stosb>
 15e:	83 c4 0c             	add    $0xc,%esp
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a6:	eb 42                	jmp    1ea <gets+0x51>
    cc = read(0, &c, 1);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	6a 01                	push   $0x1
 1ad:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 b2 02 00 00       	call   46a <read>
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c2:	7e 33                	jle    1f7 <gets+0x5e>
      break;
    buf[i++] = c;
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	8d 50 01             	lea    0x1(%eax),%edx
 1ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1cd:	89 c2                	mov    %eax,%edx
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	01 c2                	add    %eax,%edx
 1d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1de:	3c 0a                	cmp    $0xa,%al
 1e0:	74 16                	je     1f8 <gets+0x5f>
 1e2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e6:	3c 0d                	cmp    $0xd,%al
 1e8:	74 0e                	je     1f8 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f3:	7c b3                	jl     1a8 <gets+0xf>
 1f5:	eb 01                	jmp    1f8 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f7:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 d0                	add    %edx,%eax
 200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	83 ec 08             	sub    $0x8,%esp
 211:	6a 00                	push   $0x0
 213:	ff 75 08             	pushl  0x8(%ebp)
 216:	e8 77 02 00 00       	call   492 <open>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 221:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 225:	79 07                	jns    22e <stat+0x26>
    return -1;
 227:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22c:	eb 25                	jmp    253 <stat+0x4b>
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	pushl  0xc(%ebp)
 234:	ff 75 f4             	pushl  -0xc(%ebp)
 237:	e8 6e 02 00 00       	call   4aa <fstat>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 242:	83 ec 0c             	sub    $0xc,%esp
 245:	ff 75 f4             	pushl  -0xc(%ebp)
 248:	e8 2d 02 00 00       	call   47a <close>
 24d:	83 c4 10             	add    $0x10,%esp
  return r;
 250:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 253:	c9                   	leave  
 254:	c3                   	ret    

00000255 <atoi>:

int
atoi(const char *s)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 25b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 262:	eb 04                	jmp    268 <atoi+0x13>
 264:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	0f b6 00             	movzbl (%eax),%eax
 26e:	3c 20                	cmp    $0x20,%al
 270:	74 f2                	je     264 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	3c 2d                	cmp    $0x2d,%al
 27a:	75 07                	jne    283 <atoi+0x2e>
 27c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 281:	eb 05                	jmp    288 <atoi+0x33>
 283:	b8 01 00 00 00       	mov    $0x1,%eax
 288:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 28b:	8b 45 08             	mov    0x8(%ebp),%eax
 28e:	0f b6 00             	movzbl (%eax),%eax
 291:	3c 2b                	cmp    $0x2b,%al
 293:	74 0a                	je     29f <atoi+0x4a>
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	0f b6 00             	movzbl (%eax),%eax
 29b:	3c 2d                	cmp    $0x2d,%al
 29d:	75 2b                	jne    2ca <atoi+0x75>
    s++;
 29f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 2a3:	eb 25                	jmp    2ca <atoi+0x75>
    n = n*10 + *s++ - '0';
 2a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2a8:	89 d0                	mov    %edx,%eax
 2aa:	c1 e0 02             	shl    $0x2,%eax
 2ad:	01 d0                	add    %edx,%eax
 2af:	01 c0                	add    %eax,%eax
 2b1:	89 c1                	mov    %eax,%ecx
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	8d 50 01             	lea    0x1(%eax),%edx
 2b9:	89 55 08             	mov    %edx,0x8(%ebp)
 2bc:	0f b6 00             	movzbl (%eax),%eax
 2bf:	0f be c0             	movsbl %al,%eax
 2c2:	01 c8                	add    %ecx,%eax
 2c4:	83 e8 30             	sub    $0x30,%eax
 2c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 2ca:	8b 45 08             	mov    0x8(%ebp),%eax
 2cd:	0f b6 00             	movzbl (%eax),%eax
 2d0:	3c 2f                	cmp    $0x2f,%al
 2d2:	7e 0a                	jle    2de <atoi+0x89>
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	3c 39                	cmp    $0x39,%al
 2dc:	7e c7                	jle    2a5 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 2de:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2e1:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <atoo>:

int
atoo(const char *s)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2f4:	eb 04                	jmp    2fa <atoo+0x13>
 2f6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2fa:	8b 45 08             	mov    0x8(%ebp),%eax
 2fd:	0f b6 00             	movzbl (%eax),%eax
 300:	3c 20                	cmp    $0x20,%al
 302:	74 f2                	je     2f6 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	0f b6 00             	movzbl (%eax),%eax
 30a:	3c 2d                	cmp    $0x2d,%al
 30c:	75 07                	jne    315 <atoo+0x2e>
 30e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 313:	eb 05                	jmp    31a <atoo+0x33>
 315:	b8 01 00 00 00       	mov    $0x1,%eax
 31a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
 320:	0f b6 00             	movzbl (%eax),%eax
 323:	3c 2b                	cmp    $0x2b,%al
 325:	74 0a                	je     331 <atoo+0x4a>
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	0f b6 00             	movzbl (%eax),%eax
 32d:	3c 2d                	cmp    $0x2d,%al
 32f:	75 27                	jne    358 <atoo+0x71>
    s++;
 331:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 335:	eb 21                	jmp    358 <atoo+0x71>
    n = n*8 + *s++ - '0';
 337:	8b 45 fc             	mov    -0x4(%ebp),%eax
 33a:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	8d 50 01             	lea    0x1(%eax),%edx
 347:	89 55 08             	mov    %edx,0x8(%ebp)
 34a:	0f b6 00             	movzbl (%eax),%eax
 34d:	0f be c0             	movsbl %al,%eax
 350:	01 c8                	add    %ecx,%eax
 352:	83 e8 30             	sub    $0x30,%eax
 355:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 358:	8b 45 08             	mov    0x8(%ebp),%eax
 35b:	0f b6 00             	movzbl (%eax),%eax
 35e:	3c 2f                	cmp    $0x2f,%al
 360:	7e 0a                	jle    36c <atoo+0x85>
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	0f b6 00             	movzbl (%eax),%eax
 368:	3c 37                	cmp    $0x37,%al
 36a:	7e cb                	jle    337 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 36c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 36f:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 387:	eb 17                	jmp    3a0 <memmove+0x2b>
    *dst++ = *src++;
 389:	8b 45 fc             	mov    -0x4(%ebp),%eax
 38c:	8d 50 01             	lea    0x1(%eax),%edx
 38f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 392:	8b 55 f8             	mov    -0x8(%ebp),%edx
 395:	8d 4a 01             	lea    0x1(%edx),%ecx
 398:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 39b:	0f b6 12             	movzbl (%edx),%edx
 39e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a0:	8b 45 10             	mov    0x10(%ebp),%eax
 3a3:	8d 50 ff             	lea    -0x1(%eax),%edx
 3a6:	89 55 10             	mov    %edx,0x10(%ebp)
 3a9:	85 c0                	test   %eax,%eax
 3ab:	7f dc                	jg     389 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3b0:	c9                   	leave  
 3b1:	c3                   	ret    

000003b2 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 3b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3bb:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3c0:	89 c8                	mov    %ecx,%eax
 3c2:	f7 e2                	mul    %edx
 3c4:	89 d0                	mov    %edx,%eax
 3c6:	c1 e8 06             	shr    $0x6,%eax
 3c9:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 3cf:	29 c1                	sub    %eax,%ecx
 3d1:	89 c8                	mov    %ecx,%eax
 3d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3de:	f7 e2                	mul    %edx
 3e0:	89 d0                	mov    %edx,%eax
 3e2:	c1 e8 06             	shr    $0x6,%eax
 3e5:	83 ec 04             	sub    $0x4,%esp
 3e8:	50                   	push   %eax
 3e9:	68 f2 09 00 00       	push   $0x9f2
 3ee:	6a 01                	push   $0x1
 3f0:	e8 14 02 00 00       	call   609 <printf>
 3f5:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 3f8:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 3fc:	7e 17                	jle    415 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 3fe:	83 ec 04             	sub    $0x4,%esp
 401:	ff 75 f4             	pushl  -0xc(%ebp)
 404:	68 f6 09 00 00       	push   $0x9f6
 409:	6a 01                	push   $0x1
 40b:	e8 f9 01 00 00       	call   609 <printf>
 410:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 413:	eb 32                	jmp    447 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 415:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 419:	7e 17                	jle    432 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 41b:	83 ec 04             	sub    $0x4,%esp
 41e:	ff 75 f4             	pushl  -0xc(%ebp)
 421:	68 f9 09 00 00       	push   $0x9f9
 426:	6a 01                	push   $0x1
 428:	e8 dc 01 00 00       	call   609 <printf>
 42d:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 430:	eb 15                	jmp    447 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 432:	83 ec 04             	sub    $0x4,%esp
 435:	ff 75 f4             	pushl  -0xc(%ebp)
 438:	68 fd 09 00 00       	push   $0x9fd
 43d:	6a 01                	push   $0x1
 43f:	e8 c5 01 00 00       	call   609 <printf>
 444:	83 c4 10             	add    $0x10,%esp
};
 447:	90                   	nop
 448:	c9                   	leave  
 449:	c3                   	ret    

0000044a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44a:	b8 01 00 00 00       	mov    $0x1,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <exit>:
SYSCALL(exit)
 452:	b8 02 00 00 00       	mov    $0x2,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <wait>:
SYSCALL(wait)
 45a:	b8 03 00 00 00       	mov    $0x3,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <pipe>:
SYSCALL(pipe)
 462:	b8 04 00 00 00       	mov    $0x4,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <read>:
SYSCALL(read)
 46a:	b8 05 00 00 00       	mov    $0x5,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <write>:
SYSCALL(write)
 472:	b8 10 00 00 00       	mov    $0x10,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <close>:
SYSCALL(close)
 47a:	b8 15 00 00 00       	mov    $0x15,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <kill>:
SYSCALL(kill)
 482:	b8 06 00 00 00       	mov    $0x6,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <exec>:
SYSCALL(exec)
 48a:	b8 07 00 00 00       	mov    $0x7,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <open>:
SYSCALL(open)
 492:	b8 0f 00 00 00       	mov    $0xf,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <mknod>:
SYSCALL(mknod)
 49a:	b8 11 00 00 00       	mov    $0x11,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <unlink>:
SYSCALL(unlink)
 4a2:	b8 12 00 00 00       	mov    $0x12,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <fstat>:
SYSCALL(fstat)
 4aa:	b8 08 00 00 00       	mov    $0x8,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <link>:
SYSCALL(link)
 4b2:	b8 13 00 00 00       	mov    $0x13,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <mkdir>:
SYSCALL(mkdir)
 4ba:	b8 14 00 00 00       	mov    $0x14,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <chdir>:
SYSCALL(chdir)
 4c2:	b8 09 00 00 00       	mov    $0x9,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <dup>:
SYSCALL(dup)
 4ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <getpid>:
SYSCALL(getpid)
 4d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <sbrk>:
SYSCALL(sbrk)
 4da:	b8 0c 00 00 00       	mov    $0xc,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <sleep>:
SYSCALL(sleep)
 4e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <uptime>:
SYSCALL(uptime)
 4ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <halt>:
SYSCALL(halt)
 4f2:	b8 16 00 00 00       	mov    $0x16,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <date>:

SYSCALL(date)
 4fa:	b8 17 00 00 00       	mov    $0x17,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <getuid>:
SYSCALL(getuid)
 502:	b8 18 00 00 00       	mov    $0x18,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <getgid>:
SYSCALL(getgid)
 50a:	b8 19 00 00 00       	mov    $0x19,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <getppid>:
SYSCALL(getppid)
 512:	b8 1a 00 00 00       	mov    $0x1a,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <setuid>:
SYSCALL(setuid)
 51a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <setgid>:
SYSCALL(setgid)
 522:	b8 1c 00 00 00       	mov    $0x1c,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <getprocs>:
SYSCALL(getprocs)
 52a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	83 ec 18             	sub    $0x18,%esp
 538:	8b 45 0c             	mov    0xc(%ebp),%eax
 53b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 53e:	83 ec 04             	sub    $0x4,%esp
 541:	6a 01                	push   $0x1
 543:	8d 45 f4             	lea    -0xc(%ebp),%eax
 546:	50                   	push   %eax
 547:	ff 75 08             	pushl  0x8(%ebp)
 54a:	e8 23 ff ff ff       	call   472 <write>
 54f:	83 c4 10             	add    $0x10,%esp
}
 552:	90                   	nop
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	53                   	push   %ebx
 559:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 55c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 563:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 567:	74 17                	je     580 <printint+0x2b>
 569:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 56d:	79 11                	jns    580 <printint+0x2b>
    neg = 1;
 56f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 576:	8b 45 0c             	mov    0xc(%ebp),%eax
 579:	f7 d8                	neg    %eax
 57b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 57e:	eb 06                	jmp    586 <printint+0x31>
  } else {
    x = xx;
 580:	8b 45 0c             	mov    0xc(%ebp),%eax
 583:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 586:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 58d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 590:	8d 41 01             	lea    0x1(%ecx),%eax
 593:	89 45 f4             	mov    %eax,-0xc(%ebp)
 596:	8b 5d 10             	mov    0x10(%ebp),%ebx
 599:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59c:	ba 00 00 00 00       	mov    $0x0,%edx
 5a1:	f7 f3                	div    %ebx
 5a3:	89 d0                	mov    %edx,%eax
 5a5:	0f b6 80 98 0c 00 00 	movzbl 0xc98(%eax),%eax
 5ac:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5b0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b6:	ba 00 00 00 00       	mov    $0x0,%edx
 5bb:	f7 f3                	div    %ebx
 5bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c4:	75 c7                	jne    58d <printint+0x38>
  if(neg)
 5c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ca:	74 2d                	je     5f9 <printint+0xa4>
    buf[i++] = '-';
 5cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cf:	8d 50 01             	lea    0x1(%eax),%edx
 5d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5d5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5da:	eb 1d                	jmp    5f9 <printint+0xa4>
    putc(fd, buf[i]);
 5dc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e2:	01 d0                	add    %edx,%eax
 5e4:	0f b6 00             	movzbl (%eax),%eax
 5e7:	0f be c0             	movsbl %al,%eax
 5ea:	83 ec 08             	sub    $0x8,%esp
 5ed:	50                   	push   %eax
 5ee:	ff 75 08             	pushl  0x8(%ebp)
 5f1:	e8 3c ff ff ff       	call   532 <putc>
 5f6:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5f9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 601:	79 d9                	jns    5dc <printint+0x87>
    putc(fd, buf[i]);
}
 603:	90                   	nop
 604:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 607:	c9                   	leave  
 608:	c3                   	ret    

00000609 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 609:	55                   	push   %ebp
 60a:	89 e5                	mov    %esp,%ebp
 60c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 60f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 616:	8d 45 0c             	lea    0xc(%ebp),%eax
 619:	83 c0 04             	add    $0x4,%eax
 61c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 61f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 626:	e9 59 01 00 00       	jmp    784 <printf+0x17b>
    c = fmt[i] & 0xff;
 62b:	8b 55 0c             	mov    0xc(%ebp),%edx
 62e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 631:	01 d0                	add    %edx,%eax
 633:	0f b6 00             	movzbl (%eax),%eax
 636:	0f be c0             	movsbl %al,%eax
 639:	25 ff 00 00 00       	and    $0xff,%eax
 63e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 641:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 645:	75 2c                	jne    673 <printf+0x6a>
      if(c == '%'){
 647:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 64b:	75 0c                	jne    659 <printf+0x50>
        state = '%';
 64d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 654:	e9 27 01 00 00       	jmp    780 <printf+0x177>
      } else {
        putc(fd, c);
 659:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 65c:	0f be c0             	movsbl %al,%eax
 65f:	83 ec 08             	sub    $0x8,%esp
 662:	50                   	push   %eax
 663:	ff 75 08             	pushl  0x8(%ebp)
 666:	e8 c7 fe ff ff       	call   532 <putc>
 66b:	83 c4 10             	add    $0x10,%esp
 66e:	e9 0d 01 00 00       	jmp    780 <printf+0x177>
      }
    } else if(state == '%'){
 673:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 677:	0f 85 03 01 00 00    	jne    780 <printf+0x177>
      if(c == 'd'){
 67d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 681:	75 1e                	jne    6a1 <printf+0x98>
        printint(fd, *ap, 10, 1);
 683:	8b 45 e8             	mov    -0x18(%ebp),%eax
 686:	8b 00                	mov    (%eax),%eax
 688:	6a 01                	push   $0x1
 68a:	6a 0a                	push   $0xa
 68c:	50                   	push   %eax
 68d:	ff 75 08             	pushl  0x8(%ebp)
 690:	e8 c0 fe ff ff       	call   555 <printint>
 695:	83 c4 10             	add    $0x10,%esp
        ap++;
 698:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69c:	e9 d8 00 00 00       	jmp    779 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 6a1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6a5:	74 06                	je     6ad <printf+0xa4>
 6a7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6ab:	75 1e                	jne    6cb <printf+0xc2>
        printint(fd, *ap, 16, 0);
 6ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b0:	8b 00                	mov    (%eax),%eax
 6b2:	6a 00                	push   $0x0
 6b4:	6a 10                	push   $0x10
 6b6:	50                   	push   %eax
 6b7:	ff 75 08             	pushl  0x8(%ebp)
 6ba:	e8 96 fe ff ff       	call   555 <printint>
 6bf:	83 c4 10             	add    $0x10,%esp
        ap++;
 6c2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c6:	e9 ae 00 00 00       	jmp    779 <printf+0x170>
      } else if(c == 's'){
 6cb:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6cf:	75 43                	jne    714 <printf+0x10b>
        s = (char*)*ap;
 6d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d4:	8b 00                	mov    (%eax),%eax
 6d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6d9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6e1:	75 25                	jne    708 <printf+0xff>
          s = "(null)";
 6e3:	c7 45 f4 02 0a 00 00 	movl   $0xa02,-0xc(%ebp)
        while(*s != 0){
 6ea:	eb 1c                	jmp    708 <printf+0xff>
          putc(fd, *s);
 6ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ef:	0f b6 00             	movzbl (%eax),%eax
 6f2:	0f be c0             	movsbl %al,%eax
 6f5:	83 ec 08             	sub    $0x8,%esp
 6f8:	50                   	push   %eax
 6f9:	ff 75 08             	pushl  0x8(%ebp)
 6fc:	e8 31 fe ff ff       	call   532 <putc>
 701:	83 c4 10             	add    $0x10,%esp
          s++;
 704:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 708:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70b:	0f b6 00             	movzbl (%eax),%eax
 70e:	84 c0                	test   %al,%al
 710:	75 da                	jne    6ec <printf+0xe3>
 712:	eb 65                	jmp    779 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 714:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 718:	75 1d                	jne    737 <printf+0x12e>
        putc(fd, *ap);
 71a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	0f be c0             	movsbl %al,%eax
 722:	83 ec 08             	sub    $0x8,%esp
 725:	50                   	push   %eax
 726:	ff 75 08             	pushl  0x8(%ebp)
 729:	e8 04 fe ff ff       	call   532 <putc>
 72e:	83 c4 10             	add    $0x10,%esp
        ap++;
 731:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 735:	eb 42                	jmp    779 <printf+0x170>
      } else if(c == '%'){
 737:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 73b:	75 17                	jne    754 <printf+0x14b>
        putc(fd, c);
 73d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 740:	0f be c0             	movsbl %al,%eax
 743:	83 ec 08             	sub    $0x8,%esp
 746:	50                   	push   %eax
 747:	ff 75 08             	pushl  0x8(%ebp)
 74a:	e8 e3 fd ff ff       	call   532 <putc>
 74f:	83 c4 10             	add    $0x10,%esp
 752:	eb 25                	jmp    779 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 754:	83 ec 08             	sub    $0x8,%esp
 757:	6a 25                	push   $0x25
 759:	ff 75 08             	pushl  0x8(%ebp)
 75c:	e8 d1 fd ff ff       	call   532 <putc>
 761:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 764:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 767:	0f be c0             	movsbl %al,%eax
 76a:	83 ec 08             	sub    $0x8,%esp
 76d:	50                   	push   %eax
 76e:	ff 75 08             	pushl  0x8(%ebp)
 771:	e8 bc fd ff ff       	call   532 <putc>
 776:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 779:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 780:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 784:	8b 55 0c             	mov    0xc(%ebp),%edx
 787:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78a:	01 d0                	add    %edx,%eax
 78c:	0f b6 00             	movzbl (%eax),%eax
 78f:	84 c0                	test   %al,%al
 791:	0f 85 94 fe ff ff    	jne    62b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 797:	90                   	nop
 798:	c9                   	leave  
 799:	c3                   	ret    

0000079a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79a:	55                   	push   %ebp
 79b:	89 e5                	mov    %esp,%ebp
 79d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	83 e8 08             	sub    $0x8,%eax
 7a6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a9:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 7ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b1:	eb 24                	jmp    7d7 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7bb:	77 12                	ja     7cf <free+0x35>
 7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c3:	77 24                	ja     7e9 <free+0x4f>
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cd:	77 1a                	ja     7e9 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7dd:	76 d4                	jbe    7b3 <free+0x19>
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	8b 00                	mov    (%eax),%eax
 7e4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e7:	76 ca                	jbe    7b3 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ec:	8b 40 04             	mov    0x4(%eax),%eax
 7ef:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	01 c2                	add    %eax,%edx
 7fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fe:	8b 00                	mov    (%eax),%eax
 800:	39 c2                	cmp    %eax,%edx
 802:	75 24                	jne    828 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 804:	8b 45 f8             	mov    -0x8(%ebp),%eax
 807:	8b 50 04             	mov    0x4(%eax),%edx
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 00                	mov    (%eax),%eax
 80f:	8b 40 04             	mov    0x4(%eax),%eax
 812:	01 c2                	add    %eax,%edx
 814:	8b 45 f8             	mov    -0x8(%ebp),%eax
 817:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 81a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81d:	8b 00                	mov    (%eax),%eax
 81f:	8b 10                	mov    (%eax),%edx
 821:	8b 45 f8             	mov    -0x8(%ebp),%eax
 824:	89 10                	mov    %edx,(%eax)
 826:	eb 0a                	jmp    832 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 828:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82b:	8b 10                	mov    (%eax),%edx
 82d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 830:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 832:	8b 45 fc             	mov    -0x4(%ebp),%eax
 835:	8b 40 04             	mov    0x4(%eax),%eax
 838:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	01 d0                	add    %edx,%eax
 844:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 847:	75 20                	jne    869 <free+0xcf>
    p->s.size += bp->s.size;
 849:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84c:	8b 50 04             	mov    0x4(%eax),%edx
 84f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 852:	8b 40 04             	mov    0x4(%eax),%eax
 855:	01 c2                	add    %eax,%edx
 857:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 860:	8b 10                	mov    (%eax),%edx
 862:	8b 45 fc             	mov    -0x4(%ebp),%eax
 865:	89 10                	mov    %edx,(%eax)
 867:	eb 08                	jmp    871 <free+0xd7>
  } else
    p->s.ptr = bp;
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 86f:	89 10                	mov    %edx,(%eax)
  freep = p;
 871:	8b 45 fc             	mov    -0x4(%ebp),%eax
 874:	a3 b4 0c 00 00       	mov    %eax,0xcb4
}
 879:	90                   	nop
 87a:	c9                   	leave  
 87b:	c3                   	ret    

0000087c <morecore>:

static Header*
morecore(uint nu)
{
 87c:	55                   	push   %ebp
 87d:	89 e5                	mov    %esp,%ebp
 87f:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 882:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 889:	77 07                	ja     892 <morecore+0x16>
    nu = 4096;
 88b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 892:	8b 45 08             	mov    0x8(%ebp),%eax
 895:	c1 e0 03             	shl    $0x3,%eax
 898:	83 ec 0c             	sub    $0xc,%esp
 89b:	50                   	push   %eax
 89c:	e8 39 fc ff ff       	call   4da <sbrk>
 8a1:	83 c4 10             	add    $0x10,%esp
 8a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8a7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8ab:	75 07                	jne    8b4 <morecore+0x38>
    return 0;
 8ad:	b8 00 00 00 00       	mov    $0x0,%eax
 8b2:	eb 26                	jmp    8da <morecore+0x5e>
  hp = (Header*)p;
 8b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bd:	8b 55 08             	mov    0x8(%ebp),%edx
 8c0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c6:	83 c0 08             	add    $0x8,%eax
 8c9:	83 ec 0c             	sub    $0xc,%esp
 8cc:	50                   	push   %eax
 8cd:	e8 c8 fe ff ff       	call   79a <free>
 8d2:	83 c4 10             	add    $0x10,%esp
  return freep;
 8d5:	a1 b4 0c 00 00       	mov    0xcb4,%eax
}
 8da:	c9                   	leave  
 8db:	c3                   	ret    

000008dc <malloc>:

void*
malloc(uint nbytes)
{
 8dc:	55                   	push   %ebp
 8dd:	89 e5                	mov    %esp,%ebp
 8df:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	8b 45 08             	mov    0x8(%ebp),%eax
 8e5:	83 c0 07             	add    $0x7,%eax
 8e8:	c1 e8 03             	shr    $0x3,%eax
 8eb:	83 c0 01             	add    $0x1,%eax
 8ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8f1:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 8f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8fd:	75 23                	jne    922 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ff:	c7 45 f0 ac 0c 00 00 	movl   $0xcac,-0x10(%ebp)
 906:	8b 45 f0             	mov    -0x10(%ebp),%eax
 909:	a3 b4 0c 00 00       	mov    %eax,0xcb4
 90e:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 913:	a3 ac 0c 00 00       	mov    %eax,0xcac
    base.s.size = 0;
 918:	c7 05 b0 0c 00 00 00 	movl   $0x0,0xcb0
 91f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 922:	8b 45 f0             	mov    -0x10(%ebp),%eax
 925:	8b 00                	mov    (%eax),%eax
 927:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 92a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92d:	8b 40 04             	mov    0x4(%eax),%eax
 930:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 933:	72 4d                	jb     982 <malloc+0xa6>
      if(p->s.size == nunits)
 935:	8b 45 f4             	mov    -0xc(%ebp),%eax
 938:	8b 40 04             	mov    0x4(%eax),%eax
 93b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 93e:	75 0c                	jne    94c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 940:	8b 45 f4             	mov    -0xc(%ebp),%eax
 943:	8b 10                	mov    (%eax),%edx
 945:	8b 45 f0             	mov    -0x10(%ebp),%eax
 948:	89 10                	mov    %edx,(%eax)
 94a:	eb 26                	jmp    972 <malloc+0x96>
      else {
        p->s.size -= nunits;
 94c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94f:	8b 40 04             	mov    0x4(%eax),%eax
 952:	2b 45 ec             	sub    -0x14(%ebp),%eax
 955:	89 c2                	mov    %eax,%edx
 957:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 95d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 960:	8b 40 04             	mov    0x4(%eax),%eax
 963:	c1 e0 03             	shl    $0x3,%eax
 966:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 96f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 972:	8b 45 f0             	mov    -0x10(%ebp),%eax
 975:	a3 b4 0c 00 00       	mov    %eax,0xcb4
      return (void*)(p + 1);
 97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97d:	83 c0 08             	add    $0x8,%eax
 980:	eb 3b                	jmp    9bd <malloc+0xe1>
    }
    if(p == freep)
 982:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 987:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 98a:	75 1e                	jne    9aa <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 98c:	83 ec 0c             	sub    $0xc,%esp
 98f:	ff 75 ec             	pushl  -0x14(%ebp)
 992:	e8 e5 fe ff ff       	call   87c <morecore>
 997:	83 c4 10             	add    $0x10,%esp
 99a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 99d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9a1:	75 07                	jne    9aa <malloc+0xce>
        return 0;
 9a3:	b8 00 00 00 00       	mov    $0x0,%eax
 9a8:	eb 13                	jmp    9bd <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	8b 00                	mov    (%eax),%eax
 9b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9b8:	e9 6d ff ff ff       	jmp    92a <malloc+0x4e>
}
 9bd:	c9                   	leave  
 9be:	c3                   	ret    
