
_echo:     file format elf32-i386


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

  for(i = 1; i < argc; i++)
  14:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1b:	eb 3c                	jmp    59 <main+0x59>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20:	83 c0 01             	add    $0x1,%eax
  23:	3b 03                	cmp    (%ebx),%eax
  25:	7d 07                	jge    2e <main+0x2e>
  27:	ba 94 09 00 00       	mov    $0x994,%edx
  2c:	eb 05                	jmp    33 <main+0x33>
  2e:	ba 96 09 00 00       	mov    $0x996,%edx
  33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  3d:	8b 43 04             	mov    0x4(%ebx),%eax
  40:	01 c8                	add    %ecx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	52                   	push   %edx
  45:	50                   	push   %eax
  46:	68 98 09 00 00       	push   $0x998
  4b:	6a 01                	push   $0x1
  4d:	e8 8c 05 00 00       	call   5de <printf>
  52:	83 c4 10             	add    $0x10,%esp
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5c:	3b 03                	cmp    (%ebx),%eax
  5e:	7c bd                	jl     1d <main+0x1d>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  60:	e8 c2 03 00 00       	call   427 <exit>

00000065 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	57                   	push   %edi
  69:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 55 10             	mov    0x10(%ebp),%edx
  70:	8b 45 0c             	mov    0xc(%ebp),%eax
  73:	89 cb                	mov    %ecx,%ebx
  75:	89 df                	mov    %ebx,%edi
  77:	89 d1                	mov    %edx,%ecx
  79:	fc                   	cld    
  7a:	f3 aa                	rep stos %al,%es:(%edi)
  7c:	89 ca                	mov    %ecx,%edx
  7e:	89 fb                	mov    %edi,%ebx
  80:	89 5d 08             	mov    %ebx,0x8(%ebp)
  83:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  86:	90                   	nop
  87:	5b                   	pop    %ebx
  88:	5f                   	pop    %edi
  89:	5d                   	pop    %ebp
  8a:	c3                   	ret    

0000008b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  8b:	55                   	push   %ebp
  8c:	89 e5                	mov    %esp,%ebp
  8e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  97:	90                   	nop
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	8d 50 01             	lea    0x1(%eax),%edx
  9e:	89 55 08             	mov    %edx,0x8(%ebp)
  a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  a4:	8d 4a 01             	lea    0x1(%edx),%ecx
  a7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  aa:	0f b6 12             	movzbl (%edx),%edx
  ad:	88 10                	mov    %dl,(%eax)
  af:	0f b6 00             	movzbl (%eax),%eax
  b2:	84 c0                	test   %al,%al
  b4:	75 e2                	jne    98 <strcpy+0xd>
    ;
  return os;
  b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  b9:	c9                   	leave  
  ba:	c3                   	ret    

000000bb <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bb:	55                   	push   %ebp
  bc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  be:	eb 08                	jmp    c8 <strcmp+0xd>
    p++, q++;
  c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	0f b6 00             	movzbl (%eax),%eax
  ce:	84 c0                	test   %al,%al
  d0:	74 10                	je     e2 <strcmp+0x27>
  d2:	8b 45 08             	mov    0x8(%ebp),%eax
  d5:	0f b6 10             	movzbl (%eax),%edx
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	0f b6 00             	movzbl (%eax),%eax
  de:	38 c2                	cmp    %al,%dl
  e0:	74 de                	je     c0 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e2:	8b 45 08             	mov    0x8(%ebp),%eax
  e5:	0f b6 00             	movzbl (%eax),%eax
  e8:	0f b6 d0             	movzbl %al,%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	0f b6 c0             	movzbl %al,%eax
  f4:	29 c2                	sub    %eax,%edx
  f6:	89 d0                	mov    %edx,%eax
}
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <strlen>:

uint
strlen(char *s)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 100:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 107:	eb 04                	jmp    10d <strlen+0x13>
 109:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	01 d0                	add    %edx,%eax
 115:	0f b6 00             	movzbl (%eax),%eax
 118:	84 c0                	test   %al,%al
 11a:	75 ed                	jne    109 <strlen+0xf>
    ;
  return n;
 11c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11f:	c9                   	leave  
 120:	c3                   	ret    

00000121 <memset>:

void*
memset(void *dst, int c, uint n)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 124:	8b 45 10             	mov    0x10(%ebp),%eax
 127:	50                   	push   %eax
 128:	ff 75 0c             	pushl  0xc(%ebp)
 12b:	ff 75 08             	pushl  0x8(%ebp)
 12e:	e8 32 ff ff ff       	call   65 <stosb>
 133:	83 c4 0c             	add    $0xc,%esp
  return dst;
 136:	8b 45 08             	mov    0x8(%ebp),%eax
}
 139:	c9                   	leave  
 13a:	c3                   	ret    

0000013b <strchr>:

char*
strchr(const char *s, char c)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	83 ec 04             	sub    $0x4,%esp
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 147:	eb 14                	jmp    15d <strchr+0x22>
    if(*s == c)
 149:	8b 45 08             	mov    0x8(%ebp),%eax
 14c:	0f b6 00             	movzbl (%eax),%eax
 14f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 152:	75 05                	jne    159 <strchr+0x1e>
      return (char*)s;
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	eb 13                	jmp    16c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 159:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 00             	movzbl (%eax),%eax
 163:	84 c0                	test   %al,%al
 165:	75 e2                	jne    149 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 167:	b8 00 00 00 00       	mov    $0x0,%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <gets>:

char*
gets(char *buf, int max)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 174:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 17b:	eb 42                	jmp    1bf <gets+0x51>
    cc = read(0, &c, 1);
 17d:	83 ec 04             	sub    $0x4,%esp
 180:	6a 01                	push   $0x1
 182:	8d 45 ef             	lea    -0x11(%ebp),%eax
 185:	50                   	push   %eax
 186:	6a 00                	push   $0x0
 188:	e8 b2 02 00 00       	call   43f <read>
 18d:	83 c4 10             	add    $0x10,%esp
 190:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 193:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 197:	7e 33                	jle    1cc <gets+0x5e>
      break;
    buf[i++] = c;
 199:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19c:	8d 50 01             	lea    0x1(%eax),%edx
 19f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1a2:	89 c2                	mov    %eax,%edx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	01 c2                	add    %eax,%edx
 1a9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ad:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1b3:	3c 0a                	cmp    $0xa,%al
 1b5:	74 16                	je     1cd <gets+0x5f>
 1b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	74 0e                	je     1cd <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c2:	83 c0 01             	add    $0x1,%eax
 1c5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1c8:	7c b3                	jl     17d <gets+0xf>
 1ca:	eb 01                	jmp    1cd <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1cc:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	01 d0                	add    %edx,%eax
 1d5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1db:	c9                   	leave  
 1dc:	c3                   	ret    

000001dd <stat>:

int
stat(char *n, struct stat *st)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e3:	83 ec 08             	sub    $0x8,%esp
 1e6:	6a 00                	push   $0x0
 1e8:	ff 75 08             	pushl  0x8(%ebp)
 1eb:	e8 77 02 00 00       	call   467 <open>
 1f0:	83 c4 10             	add    $0x10,%esp
 1f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1fa:	79 07                	jns    203 <stat+0x26>
    return -1;
 1fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 201:	eb 25                	jmp    228 <stat+0x4b>
  r = fstat(fd, st);
 203:	83 ec 08             	sub    $0x8,%esp
 206:	ff 75 0c             	pushl  0xc(%ebp)
 209:	ff 75 f4             	pushl  -0xc(%ebp)
 20c:	e8 6e 02 00 00       	call   47f <fstat>
 211:	83 c4 10             	add    $0x10,%esp
 214:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 217:	83 ec 0c             	sub    $0xc,%esp
 21a:	ff 75 f4             	pushl  -0xc(%ebp)
 21d:	e8 2d 02 00 00       	call   44f <close>
 222:	83 c4 10             	add    $0x10,%esp
  return r;
 225:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 228:	c9                   	leave  
 229:	c3                   	ret    

0000022a <atoi>:

int
atoi(const char *s)
{
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 230:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 237:	eb 04                	jmp    23d <atoi+0x13>
 239:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23d:	8b 45 08             	mov    0x8(%ebp),%eax
 240:	0f b6 00             	movzbl (%eax),%eax
 243:	3c 20                	cmp    $0x20,%al
 245:	74 f2                	je     239 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	0f b6 00             	movzbl (%eax),%eax
 24d:	3c 2d                	cmp    $0x2d,%al
 24f:	75 07                	jne    258 <atoi+0x2e>
 251:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 256:	eb 05                	jmp    25d <atoi+0x33>
 258:	b8 01 00 00 00       	mov    $0x1,%eax
 25d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	3c 2b                	cmp    $0x2b,%al
 268:	74 0a                	je     274 <atoi+0x4a>
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	3c 2d                	cmp    $0x2d,%al
 272:	75 2b                	jne    29f <atoi+0x75>
    s++;
 274:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 278:	eb 25                	jmp    29f <atoi+0x75>
    n = n*10 + *s++ - '0';
 27a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27d:	89 d0                	mov    %edx,%eax
 27f:	c1 e0 02             	shl    $0x2,%eax
 282:	01 d0                	add    %edx,%eax
 284:	01 c0                	add    %eax,%eax
 286:	89 c1                	mov    %eax,%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8d 50 01             	lea    0x1(%eax),%edx
 28e:	89 55 08             	mov    %edx,0x8(%ebp)
 291:	0f b6 00             	movzbl (%eax),%eax
 294:	0f be c0             	movsbl %al,%eax
 297:	01 c8                	add    %ecx,%eax
 299:	83 e8 30             	sub    $0x30,%eax
 29c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	0f b6 00             	movzbl (%eax),%eax
 2a5:	3c 2f                	cmp    $0x2f,%al
 2a7:	7e 0a                	jle    2b3 <atoi+0x89>
 2a9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ac:	0f b6 00             	movzbl (%eax),%eax
 2af:	3c 39                	cmp    $0x39,%al
 2b1:	7e c7                	jle    27a <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 2b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2b6:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    

000002bc <atoo>:

int
atoo(const char *s)
{
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2c9:	eb 04                	jmp    2cf <atoo+0x13>
 2cb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2cf:	8b 45 08             	mov    0x8(%ebp),%eax
 2d2:	0f b6 00             	movzbl (%eax),%eax
 2d5:	3c 20                	cmp    $0x20,%al
 2d7:	74 f2                	je     2cb <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
 2dc:	0f b6 00             	movzbl (%eax),%eax
 2df:	3c 2d                	cmp    $0x2d,%al
 2e1:	75 07                	jne    2ea <atoo+0x2e>
 2e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e8:	eb 05                	jmp    2ef <atoo+0x33>
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2f2:	8b 45 08             	mov    0x8(%ebp),%eax
 2f5:	0f b6 00             	movzbl (%eax),%eax
 2f8:	3c 2b                	cmp    $0x2b,%al
 2fa:	74 0a                	je     306 <atoo+0x4a>
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	0f b6 00             	movzbl (%eax),%eax
 302:	3c 2d                	cmp    $0x2d,%al
 304:	75 27                	jne    32d <atoo+0x71>
    s++;
 306:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 30a:	eb 21                	jmp    32d <atoo+0x71>
    n = n*8 + *s++ - '0';
 30c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 30f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 316:	8b 45 08             	mov    0x8(%ebp),%eax
 319:	8d 50 01             	lea    0x1(%eax),%edx
 31c:	89 55 08             	mov    %edx,0x8(%ebp)
 31f:	0f b6 00             	movzbl (%eax),%eax
 322:	0f be c0             	movsbl %al,%eax
 325:	01 c8                	add    %ecx,%eax
 327:	83 e8 30             	sub    $0x30,%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
 330:	0f b6 00             	movzbl (%eax),%eax
 333:	3c 2f                	cmp    $0x2f,%al
 335:	7e 0a                	jle    341 <atoo+0x85>
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	0f b6 00             	movzbl (%eax),%eax
 33d:	3c 37                	cmp    $0x37,%al
 33f:	7e cb                	jle    30c <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 341:	8b 45 f8             	mov    -0x8(%ebp),%eax
 344:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 35c:	eb 17                	jmp    375 <memmove+0x2b>
    *dst++ = *src++;
 35e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 361:	8d 50 01             	lea    0x1(%eax),%edx
 364:	89 55 fc             	mov    %edx,-0x4(%ebp)
 367:	8b 55 f8             	mov    -0x8(%ebp),%edx
 36a:	8d 4a 01             	lea    0x1(%edx),%ecx
 36d:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 370:	0f b6 12             	movzbl (%edx),%edx
 373:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 375:	8b 45 10             	mov    0x10(%ebp),%eax
 378:	8d 50 ff             	lea    -0x1(%eax),%edx
 37b:	89 55 10             	mov    %edx,0x10(%ebp)
 37e:	85 c0                	test   %eax,%eax
 380:	7f dc                	jg     35e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 382:	8b 45 08             	mov    0x8(%ebp),%eax
}
 385:	c9                   	leave  
 386:	c3                   	ret    

00000387 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 38d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 390:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 395:	89 c8                	mov    %ecx,%eax
 397:	f7 e2                	mul    %edx
 399:	89 d0                	mov    %edx,%eax
 39b:	c1 e8 06             	shr    $0x6,%eax
 39e:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 3a4:	29 c1                	sub    %eax,%ecx
 3a6:	89 c8                	mov    %ecx,%eax
 3a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 3ab:	8b 45 08             	mov    0x8(%ebp),%eax
 3ae:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3b3:	f7 e2                	mul    %edx
 3b5:	89 d0                	mov    %edx,%eax
 3b7:	c1 e8 06             	shr    $0x6,%eax
 3ba:	83 ec 04             	sub    $0x4,%esp
 3bd:	50                   	push   %eax
 3be:	68 9d 09 00 00       	push   $0x99d
 3c3:	6a 01                	push   $0x1
 3c5:	e8 14 02 00 00       	call   5de <printf>
 3ca:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 3cd:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 3d1:	7e 17                	jle    3ea <zeropad+0x63>
    printf(1,"%d", miliseconds);
 3d3:	83 ec 04             	sub    $0x4,%esp
 3d6:	ff 75 f4             	pushl  -0xc(%ebp)
 3d9:	68 a1 09 00 00       	push   $0x9a1
 3de:	6a 01                	push   $0x1
 3e0:	e8 f9 01 00 00       	call   5de <printf>
 3e5:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 3e8:	eb 32                	jmp    41c <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 3ea:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 3ee:	7e 17                	jle    407 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	ff 75 f4             	pushl  -0xc(%ebp)
 3f6:	68 a4 09 00 00       	push   $0x9a4
 3fb:	6a 01                	push   $0x1
 3fd:	e8 dc 01 00 00       	call   5de <printf>
 402:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 405:	eb 15                	jmp    41c <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 407:	83 ec 04             	sub    $0x4,%esp
 40a:	ff 75 f4             	pushl  -0xc(%ebp)
 40d:	68 a8 09 00 00       	push   $0x9a8
 412:	6a 01                	push   $0x1
 414:	e8 c5 01 00 00       	call   5de <printf>
 419:	83 c4 10             	add    $0x10,%esp
};
 41c:	90                   	nop
 41d:	c9                   	leave  
 41e:	c3                   	ret    

0000041f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41f:	b8 01 00 00 00       	mov    $0x1,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <exit>:
SYSCALL(exit)
 427:	b8 02 00 00 00       	mov    $0x2,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <wait>:
SYSCALL(wait)
 42f:	b8 03 00 00 00       	mov    $0x3,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <pipe>:
SYSCALL(pipe)
 437:	b8 04 00 00 00       	mov    $0x4,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <read>:
SYSCALL(read)
 43f:	b8 05 00 00 00       	mov    $0x5,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <write>:
SYSCALL(write)
 447:	b8 10 00 00 00       	mov    $0x10,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <close>:
SYSCALL(close)
 44f:	b8 15 00 00 00       	mov    $0x15,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <kill>:
SYSCALL(kill)
 457:	b8 06 00 00 00       	mov    $0x6,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <exec>:
SYSCALL(exec)
 45f:	b8 07 00 00 00       	mov    $0x7,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <open>:
SYSCALL(open)
 467:	b8 0f 00 00 00       	mov    $0xf,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <mknod>:
SYSCALL(mknod)
 46f:	b8 11 00 00 00       	mov    $0x11,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <unlink>:
SYSCALL(unlink)
 477:	b8 12 00 00 00       	mov    $0x12,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <fstat>:
SYSCALL(fstat)
 47f:	b8 08 00 00 00       	mov    $0x8,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <link>:
SYSCALL(link)
 487:	b8 13 00 00 00       	mov    $0x13,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <mkdir>:
SYSCALL(mkdir)
 48f:	b8 14 00 00 00       	mov    $0x14,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <chdir>:
SYSCALL(chdir)
 497:	b8 09 00 00 00       	mov    $0x9,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <dup>:
SYSCALL(dup)
 49f:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <getpid>:
SYSCALL(getpid)
 4a7:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <sbrk>:
SYSCALL(sbrk)
 4af:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <sleep>:
SYSCALL(sleep)
 4b7:	b8 0d 00 00 00       	mov    $0xd,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <uptime>:
SYSCALL(uptime)
 4bf:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <halt>:
SYSCALL(halt)
 4c7:	b8 16 00 00 00       	mov    $0x16,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <date>:

SYSCALL(date)
 4cf:	b8 17 00 00 00       	mov    $0x17,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <getuid>:
SYSCALL(getuid)
 4d7:	b8 18 00 00 00       	mov    $0x18,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <getgid>:
SYSCALL(getgid)
 4df:	b8 19 00 00 00       	mov    $0x19,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <getppid>:
SYSCALL(getppid)
 4e7:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <setuid>:
SYSCALL(setuid)
 4ef:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <setgid>:
SYSCALL(setgid)
 4f7:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <getprocs>:
SYSCALL(getprocs)
 4ff:	b8 1d 00 00 00       	mov    $0x1d,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 507:	55                   	push   %ebp
 508:	89 e5                	mov    %esp,%ebp
 50a:	83 ec 18             	sub    $0x18,%esp
 50d:	8b 45 0c             	mov    0xc(%ebp),%eax
 510:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 513:	83 ec 04             	sub    $0x4,%esp
 516:	6a 01                	push   $0x1
 518:	8d 45 f4             	lea    -0xc(%ebp),%eax
 51b:	50                   	push   %eax
 51c:	ff 75 08             	pushl  0x8(%ebp)
 51f:	e8 23 ff ff ff       	call   447 <write>
 524:	83 c4 10             	add    $0x10,%esp
}
 527:	90                   	nop
 528:	c9                   	leave  
 529:	c3                   	ret    

0000052a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	53                   	push   %ebx
 52e:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 531:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 538:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 53c:	74 17                	je     555 <printint+0x2b>
 53e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 542:	79 11                	jns    555 <printint+0x2b>
    neg = 1;
 544:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 54b:	8b 45 0c             	mov    0xc(%ebp),%eax
 54e:	f7 d8                	neg    %eax
 550:	89 45 ec             	mov    %eax,-0x14(%ebp)
 553:	eb 06                	jmp    55b <printint+0x31>
  } else {
    x = xx;
 555:	8b 45 0c             	mov    0xc(%ebp),%eax
 558:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 55b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 562:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 565:	8d 41 01             	lea    0x1(%ecx),%eax
 568:	89 45 f4             	mov    %eax,-0xc(%ebp)
 56b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 56e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 571:	ba 00 00 00 00       	mov    $0x0,%edx
 576:	f7 f3                	div    %ebx
 578:	89 d0                	mov    %edx,%eax
 57a:	0f b6 80 40 0c 00 00 	movzbl 0xc40(%eax),%eax
 581:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 585:	8b 5d 10             	mov    0x10(%ebp),%ebx
 588:	8b 45 ec             	mov    -0x14(%ebp),%eax
 58b:	ba 00 00 00 00       	mov    $0x0,%edx
 590:	f7 f3                	div    %ebx
 592:	89 45 ec             	mov    %eax,-0x14(%ebp)
 595:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 599:	75 c7                	jne    562 <printint+0x38>
  if(neg)
 59b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 59f:	74 2d                	je     5ce <printint+0xa4>
    buf[i++] = '-';
 5a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a4:	8d 50 01             	lea    0x1(%eax),%edx
 5a7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5aa:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5af:	eb 1d                	jmp    5ce <printint+0xa4>
    putc(fd, buf[i]);
 5b1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b7:	01 d0                	add    %edx,%eax
 5b9:	0f b6 00             	movzbl (%eax),%eax
 5bc:	0f be c0             	movsbl %al,%eax
 5bf:	83 ec 08             	sub    $0x8,%esp
 5c2:	50                   	push   %eax
 5c3:	ff 75 08             	pushl  0x8(%ebp)
 5c6:	e8 3c ff ff ff       	call   507 <putc>
 5cb:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5ce:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5d6:	79 d9                	jns    5b1 <printint+0x87>
    putc(fd, buf[i]);
}
 5d8:	90                   	nop
 5d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5dc:	c9                   	leave  
 5dd:	c3                   	ret    

000005de <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5de:	55                   	push   %ebp
 5df:	89 e5                	mov    %esp,%ebp
 5e1:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5e4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5eb:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ee:	83 c0 04             	add    $0x4,%eax
 5f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5f4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5fb:	e9 59 01 00 00       	jmp    759 <printf+0x17b>
    c = fmt[i] & 0xff;
 600:	8b 55 0c             	mov    0xc(%ebp),%edx
 603:	8b 45 f0             	mov    -0x10(%ebp),%eax
 606:	01 d0                	add    %edx,%eax
 608:	0f b6 00             	movzbl (%eax),%eax
 60b:	0f be c0             	movsbl %al,%eax
 60e:	25 ff 00 00 00       	and    $0xff,%eax
 613:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 616:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 61a:	75 2c                	jne    648 <printf+0x6a>
      if(c == '%'){
 61c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 620:	75 0c                	jne    62e <printf+0x50>
        state = '%';
 622:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 629:	e9 27 01 00 00       	jmp    755 <printf+0x177>
      } else {
        putc(fd, c);
 62e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 631:	0f be c0             	movsbl %al,%eax
 634:	83 ec 08             	sub    $0x8,%esp
 637:	50                   	push   %eax
 638:	ff 75 08             	pushl  0x8(%ebp)
 63b:	e8 c7 fe ff ff       	call   507 <putc>
 640:	83 c4 10             	add    $0x10,%esp
 643:	e9 0d 01 00 00       	jmp    755 <printf+0x177>
      }
    } else if(state == '%'){
 648:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 64c:	0f 85 03 01 00 00    	jne    755 <printf+0x177>
      if(c == 'd'){
 652:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 656:	75 1e                	jne    676 <printf+0x98>
        printint(fd, *ap, 10, 1);
 658:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65b:	8b 00                	mov    (%eax),%eax
 65d:	6a 01                	push   $0x1
 65f:	6a 0a                	push   $0xa
 661:	50                   	push   %eax
 662:	ff 75 08             	pushl  0x8(%ebp)
 665:	e8 c0 fe ff ff       	call   52a <printint>
 66a:	83 c4 10             	add    $0x10,%esp
        ap++;
 66d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 671:	e9 d8 00 00 00       	jmp    74e <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 676:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 67a:	74 06                	je     682 <printf+0xa4>
 67c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 680:	75 1e                	jne    6a0 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 682:	8b 45 e8             	mov    -0x18(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	6a 00                	push   $0x0
 689:	6a 10                	push   $0x10
 68b:	50                   	push   %eax
 68c:	ff 75 08             	pushl  0x8(%ebp)
 68f:	e8 96 fe ff ff       	call   52a <printint>
 694:	83 c4 10             	add    $0x10,%esp
        ap++;
 697:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69b:	e9 ae 00 00 00       	jmp    74e <printf+0x170>
      } else if(c == 's'){
 6a0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6a4:	75 43                	jne    6e9 <printf+0x10b>
        s = (char*)*ap;
 6a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a9:	8b 00                	mov    (%eax),%eax
 6ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6ae:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6b6:	75 25                	jne    6dd <printf+0xff>
          s = "(null)";
 6b8:	c7 45 f4 ad 09 00 00 	movl   $0x9ad,-0xc(%ebp)
        while(*s != 0){
 6bf:	eb 1c                	jmp    6dd <printf+0xff>
          putc(fd, *s);
 6c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c4:	0f b6 00             	movzbl (%eax),%eax
 6c7:	0f be c0             	movsbl %al,%eax
 6ca:	83 ec 08             	sub    $0x8,%esp
 6cd:	50                   	push   %eax
 6ce:	ff 75 08             	pushl  0x8(%ebp)
 6d1:	e8 31 fe ff ff       	call   507 <putc>
 6d6:	83 c4 10             	add    $0x10,%esp
          s++;
 6d9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e0:	0f b6 00             	movzbl (%eax),%eax
 6e3:	84 c0                	test   %al,%al
 6e5:	75 da                	jne    6c1 <printf+0xe3>
 6e7:	eb 65                	jmp    74e <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6e9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6ed:	75 1d                	jne    70c <printf+0x12e>
        putc(fd, *ap);
 6ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f2:	8b 00                	mov    (%eax),%eax
 6f4:	0f be c0             	movsbl %al,%eax
 6f7:	83 ec 08             	sub    $0x8,%esp
 6fa:	50                   	push   %eax
 6fb:	ff 75 08             	pushl  0x8(%ebp)
 6fe:	e8 04 fe ff ff       	call   507 <putc>
 703:	83 c4 10             	add    $0x10,%esp
        ap++;
 706:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 70a:	eb 42                	jmp    74e <printf+0x170>
      } else if(c == '%'){
 70c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 710:	75 17                	jne    729 <printf+0x14b>
        putc(fd, c);
 712:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 715:	0f be c0             	movsbl %al,%eax
 718:	83 ec 08             	sub    $0x8,%esp
 71b:	50                   	push   %eax
 71c:	ff 75 08             	pushl  0x8(%ebp)
 71f:	e8 e3 fd ff ff       	call   507 <putc>
 724:	83 c4 10             	add    $0x10,%esp
 727:	eb 25                	jmp    74e <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 729:	83 ec 08             	sub    $0x8,%esp
 72c:	6a 25                	push   $0x25
 72e:	ff 75 08             	pushl  0x8(%ebp)
 731:	e8 d1 fd ff ff       	call   507 <putc>
 736:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 739:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73c:	0f be c0             	movsbl %al,%eax
 73f:	83 ec 08             	sub    $0x8,%esp
 742:	50                   	push   %eax
 743:	ff 75 08             	pushl  0x8(%ebp)
 746:	e8 bc fd ff ff       	call   507 <putc>
 74b:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 74e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 755:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 759:	8b 55 0c             	mov    0xc(%ebp),%edx
 75c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75f:	01 d0                	add    %edx,%eax
 761:	0f b6 00             	movzbl (%eax),%eax
 764:	84 c0                	test   %al,%al
 766:	0f 85 94 fe ff ff    	jne    600 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 76c:	90                   	nop
 76d:	c9                   	leave  
 76e:	c3                   	ret    

0000076f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 76f:	55                   	push   %ebp
 770:	89 e5                	mov    %esp,%ebp
 772:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	83 e8 08             	sub    $0x8,%eax
 77b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77e:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 783:	89 45 fc             	mov    %eax,-0x4(%ebp)
 786:	eb 24                	jmp    7ac <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	8b 00                	mov    (%eax),%eax
 78d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 790:	77 12                	ja     7a4 <free+0x35>
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 798:	77 24                	ja     7be <free+0x4f>
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a2:	77 1a                	ja     7be <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a7:	8b 00                	mov    (%eax),%eax
 7a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7af:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b2:	76 d4                	jbe    788 <free+0x19>
 7b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b7:	8b 00                	mov    (%eax),%eax
 7b9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7bc:	76 ca                	jbe    788 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c1:	8b 40 04             	mov    0x4(%eax),%eax
 7c4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ce:	01 c2                	add    %eax,%edx
 7d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	39 c2                	cmp    %eax,%edx
 7d7:	75 24                	jne    7fd <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dc:	8b 50 04             	mov    0x4(%eax),%edx
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	8b 00                	mov    (%eax),%eax
 7e4:	8b 40 04             	mov    0x4(%eax),%eax
 7e7:	01 c2                	add    %eax,%edx
 7e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ec:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f2:	8b 00                	mov    (%eax),%eax
 7f4:	8b 10                	mov    (%eax),%edx
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	89 10                	mov    %edx,(%eax)
 7fb:	eb 0a                	jmp    807 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 800:	8b 10                	mov    (%eax),%edx
 802:	8b 45 f8             	mov    -0x8(%ebp),%eax
 805:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 807:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80a:	8b 40 04             	mov    0x4(%eax),%eax
 80d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	01 d0                	add    %edx,%eax
 819:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 81c:	75 20                	jne    83e <free+0xcf>
    p->s.size += bp->s.size;
 81e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 821:	8b 50 04             	mov    0x4(%eax),%edx
 824:	8b 45 f8             	mov    -0x8(%ebp),%eax
 827:	8b 40 04             	mov    0x4(%eax),%eax
 82a:	01 c2                	add    %eax,%edx
 82c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 832:	8b 45 f8             	mov    -0x8(%ebp),%eax
 835:	8b 10                	mov    (%eax),%edx
 837:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83a:	89 10                	mov    %edx,(%eax)
 83c:	eb 08                	jmp    846 <free+0xd7>
  } else
    p->s.ptr = bp;
 83e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 841:	8b 55 f8             	mov    -0x8(%ebp),%edx
 844:	89 10                	mov    %edx,(%eax)
  freep = p;
 846:	8b 45 fc             	mov    -0x4(%ebp),%eax
 849:	a3 5c 0c 00 00       	mov    %eax,0xc5c
}
 84e:	90                   	nop
 84f:	c9                   	leave  
 850:	c3                   	ret    

00000851 <morecore>:

static Header*
morecore(uint nu)
{
 851:	55                   	push   %ebp
 852:	89 e5                	mov    %esp,%ebp
 854:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 857:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 85e:	77 07                	ja     867 <morecore+0x16>
    nu = 4096;
 860:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 867:	8b 45 08             	mov    0x8(%ebp),%eax
 86a:	c1 e0 03             	shl    $0x3,%eax
 86d:	83 ec 0c             	sub    $0xc,%esp
 870:	50                   	push   %eax
 871:	e8 39 fc ff ff       	call   4af <sbrk>
 876:	83 c4 10             	add    $0x10,%esp
 879:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 87c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 880:	75 07                	jne    889 <morecore+0x38>
    return 0;
 882:	b8 00 00 00 00       	mov    $0x0,%eax
 887:	eb 26                	jmp    8af <morecore+0x5e>
  hp = (Header*)p;
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	8b 55 08             	mov    0x8(%ebp),%edx
 895:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 898:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89b:	83 c0 08             	add    $0x8,%eax
 89e:	83 ec 0c             	sub    $0xc,%esp
 8a1:	50                   	push   %eax
 8a2:	e8 c8 fe ff ff       	call   76f <free>
 8a7:	83 c4 10             	add    $0x10,%esp
  return freep;
 8aa:	a1 5c 0c 00 00       	mov    0xc5c,%eax
}
 8af:	c9                   	leave  
 8b0:	c3                   	ret    

000008b1 <malloc>:

void*
malloc(uint nbytes)
{
 8b1:	55                   	push   %ebp
 8b2:	89 e5                	mov    %esp,%ebp
 8b4:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ba:	83 c0 07             	add    $0x7,%eax
 8bd:	c1 e8 03             	shr    $0x3,%eax
 8c0:	83 c0 01             	add    $0x1,%eax
 8c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8c6:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 8cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8d2:	75 23                	jne    8f7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8d4:	c7 45 f0 54 0c 00 00 	movl   $0xc54,-0x10(%ebp)
 8db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8de:	a3 5c 0c 00 00       	mov    %eax,0xc5c
 8e3:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 8e8:	a3 54 0c 00 00       	mov    %eax,0xc54
    base.s.size = 0;
 8ed:	c7 05 58 0c 00 00 00 	movl   $0x0,0xc58
 8f4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fa:	8b 00                	mov    (%eax),%eax
 8fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	8b 40 04             	mov    0x4(%eax),%eax
 905:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 908:	72 4d                	jb     957 <malloc+0xa6>
      if(p->s.size == nunits)
 90a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90d:	8b 40 04             	mov    0x4(%eax),%eax
 910:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 913:	75 0c                	jne    921 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 915:	8b 45 f4             	mov    -0xc(%ebp),%eax
 918:	8b 10                	mov    (%eax),%edx
 91a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91d:	89 10                	mov    %edx,(%eax)
 91f:	eb 26                	jmp    947 <malloc+0x96>
      else {
        p->s.size -= nunits;
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	8b 40 04             	mov    0x4(%eax),%eax
 927:	2b 45 ec             	sub    -0x14(%ebp),%eax
 92a:	89 c2                	mov    %eax,%edx
 92c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 932:	8b 45 f4             	mov    -0xc(%ebp),%eax
 935:	8b 40 04             	mov    0x4(%eax),%eax
 938:	c1 e0 03             	shl    $0x3,%eax
 93b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	8b 55 ec             	mov    -0x14(%ebp),%edx
 944:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 947:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94a:	a3 5c 0c 00 00       	mov    %eax,0xc5c
      return (void*)(p + 1);
 94f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 952:	83 c0 08             	add    $0x8,%eax
 955:	eb 3b                	jmp    992 <malloc+0xe1>
    }
    if(p == freep)
 957:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 95c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 95f:	75 1e                	jne    97f <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 961:	83 ec 0c             	sub    $0xc,%esp
 964:	ff 75 ec             	pushl  -0x14(%ebp)
 967:	e8 e5 fe ff ff       	call   851 <morecore>
 96c:	83 c4 10             	add    $0x10,%esp
 96f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 972:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 976:	75 07                	jne    97f <malloc+0xce>
        return 0;
 978:	b8 00 00 00 00       	mov    $0x0,%eax
 97d:	eb 13                	jmp    992 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 982:	89 45 f0             	mov    %eax,-0x10(%ebp)
 985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 988:	8b 00                	mov    (%eax),%eax
 98a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 98d:	e9 6d ff ff ff       	jmp    8ff <malloc+0x4e>
}
 992:	c9                   	leave  
 993:	c3                   	ret    
