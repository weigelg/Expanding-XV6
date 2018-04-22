
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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
    printf(2, "usage: kill pid...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 a1 09 00 00       	push   $0x9a1
  21:	6a 02                	push   $0x2
  23:	e8 c3 05 00 00       	call   5eb <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 04 04 00 00       	call   434 <exit>
  }
  for(i=1; i<argc; i++)
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 2d                	jmp    66 <main+0x66>
    kill(atoi(argv[i]));
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 e4 01 00 00       	call   237 <atoi>
  53:	83 c4 10             	add    $0x10,%esp
  56:	83 ec 0c             	sub    $0xc,%esp
  59:	50                   	push   %eax
  5a:	e8 05 04 00 00       	call   464 <kill>
  5f:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  66:	8b 45 f4             	mov    -0xc(%ebp),%eax
  69:	3b 03                	cmp    (%ebx),%eax
  6b:	7c cc                	jl     39 <main+0x39>
    kill(atoi(argv[i]));
  exit();
  6d:	e8 c2 03 00 00       	call   434 <exit>

00000072 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	57                   	push   %edi
  76:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  77:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7a:	8b 55 10             	mov    0x10(%ebp),%edx
  7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  80:	89 cb                	mov    %ecx,%ebx
  82:	89 df                	mov    %ebx,%edi
  84:	89 d1                	mov    %edx,%ecx
  86:	fc                   	cld    
  87:	f3 aa                	rep stos %al,%es:(%edi)
  89:	89 ca                	mov    %ecx,%edx
  8b:	89 fb                	mov    %edi,%ebx
  8d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  90:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  93:	90                   	nop
  94:	5b                   	pop    %ebx
  95:	5f                   	pop    %edi
  96:	5d                   	pop    %ebp
  97:	c3                   	ret    

00000098 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  98:	55                   	push   %ebp
  99:	89 e5                	mov    %esp,%ebp
  9b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a4:	90                   	nop
  a5:	8b 45 08             	mov    0x8(%ebp),%eax
  a8:	8d 50 01             	lea    0x1(%eax),%edx
  ab:	89 55 08             	mov    %edx,0x8(%ebp)
  ae:	8b 55 0c             	mov    0xc(%ebp),%edx
  b1:	8d 4a 01             	lea    0x1(%edx),%ecx
  b4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b7:	0f b6 12             	movzbl (%edx),%edx
  ba:	88 10                	mov    %dl,(%eax)
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	84 c0                	test   %al,%al
  c1:	75 e2                	jne    a5 <strcpy+0xd>
    ;
  return os;
  c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c6:	c9                   	leave  
  c7:	c3                   	ret    

000000c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cb:	eb 08                	jmp    d5 <strcmp+0xd>
    p++, q++;
  cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	74 10                	je     ef <strcmp+0x27>
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	0f b6 10             	movzbl (%eax),%edx
  e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  e8:	0f b6 00             	movzbl (%eax),%eax
  eb:	38 c2                	cmp    %al,%dl
  ed:	74 de                	je     cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	0f b6 00             	movzbl (%eax),%eax
  f5:	0f b6 d0             	movzbl %al,%edx
  f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  fb:	0f b6 00             	movzbl (%eax),%eax
  fe:	0f b6 c0             	movzbl %al,%eax
 101:	29 c2                	sub    %eax,%edx
 103:	89 d0                	mov    %edx,%eax
}
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    

00000107 <strlen>:

uint
strlen(char *s)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 114:	eb 04                	jmp    11a <strlen+0x13>
 116:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	01 d0                	add    %edx,%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	84 c0                	test   %al,%al
 127:	75 ed                	jne    116 <strlen+0xf>
    ;
  return n;
 129:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12c:	c9                   	leave  
 12d:	c3                   	ret    

0000012e <memset>:

void*
memset(void *dst, int c, uint n)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 131:	8b 45 10             	mov    0x10(%ebp),%eax
 134:	50                   	push   %eax
 135:	ff 75 0c             	pushl  0xc(%ebp)
 138:	ff 75 08             	pushl  0x8(%ebp)
 13b:	e8 32 ff ff ff       	call   72 <stosb>
 140:	83 c4 0c             	add    $0xc,%esp
  return dst;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
}
 146:	c9                   	leave  
 147:	c3                   	ret    

00000148 <strchr>:

char*
strchr(const char *s, char c)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	83 ec 04             	sub    $0x4,%esp
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 154:	eb 14                	jmp    16a <strchr+0x22>
    if(*s == c)
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15f:	75 05                	jne    166 <strchr+0x1e>
      return (char*)s;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
 164:	eb 13                	jmp    179 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 166:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	0f b6 00             	movzbl (%eax),%eax
 170:	84 c0                	test   %al,%al
 172:	75 e2                	jne    156 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 174:	b8 00 00 00 00       	mov    $0x0,%eax
}
 179:	c9                   	leave  
 17a:	c3                   	ret    

0000017b <gets>:

char*
gets(char *buf, int max)
{
 17b:	55                   	push   %ebp
 17c:	89 e5                	mov    %esp,%ebp
 17e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 181:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 188:	eb 42                	jmp    1cc <gets+0x51>
    cc = read(0, &c, 1);
 18a:	83 ec 04             	sub    $0x4,%esp
 18d:	6a 01                	push   $0x1
 18f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 192:	50                   	push   %eax
 193:	6a 00                	push   $0x0
 195:	e8 b2 02 00 00       	call   44c <read>
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a4:	7e 33                	jle    1d9 <gets+0x5e>
      break;
    buf[i++] = c;
 1a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a9:	8d 50 01             	lea    0x1(%eax),%edx
 1ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1af:	89 c2                	mov    %eax,%edx
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	01 c2                	add    %eax,%edx
 1b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ba:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c0:	3c 0a                	cmp    $0xa,%al
 1c2:	74 16                	je     1da <gets+0x5f>
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0d                	cmp    $0xd,%al
 1ca:	74 0e                	je     1da <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cf:	83 c0 01             	add    $0x1,%eax
 1d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d5:	7c b3                	jl     18a <gets+0xf>
 1d7:	eb 01                	jmp    1da <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1da:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1dd:	8b 45 08             	mov    0x8(%ebp),%eax
 1e0:	01 d0                	add    %edx,%eax
 1e2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e8:	c9                   	leave  
 1e9:	c3                   	ret    

000001ea <stat>:

int
stat(char *n, struct stat *st)
{
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
 1ed:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	6a 00                	push   $0x0
 1f5:	ff 75 08             	pushl  0x8(%ebp)
 1f8:	e8 77 02 00 00       	call   474 <open>
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 203:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 207:	79 07                	jns    210 <stat+0x26>
    return -1;
 209:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 20e:	eb 25                	jmp    235 <stat+0x4b>
  r = fstat(fd, st);
 210:	83 ec 08             	sub    $0x8,%esp
 213:	ff 75 0c             	pushl  0xc(%ebp)
 216:	ff 75 f4             	pushl  -0xc(%ebp)
 219:	e8 6e 02 00 00       	call   48c <fstat>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 224:	83 ec 0c             	sub    $0xc,%esp
 227:	ff 75 f4             	pushl  -0xc(%ebp)
 22a:	e8 2d 02 00 00       	call   45c <close>
 22f:	83 c4 10             	add    $0x10,%esp
  return r;
 232:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 235:	c9                   	leave  
 236:	c3                   	ret    

00000237 <atoi>:

int
atoi(const char *s)
{
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 23d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 244:	eb 04                	jmp    24a <atoi+0x13>
 246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	3c 20                	cmp    $0x20,%al
 252:	74 f2                	je     246 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	0f b6 00             	movzbl (%eax),%eax
 25a:	3c 2d                	cmp    $0x2d,%al
 25c:	75 07                	jne    265 <atoi+0x2e>
 25e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 263:	eb 05                	jmp    26a <atoi+0x33>
 265:	b8 01 00 00 00       	mov    $0x1,%eax
 26a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2b                	cmp    $0x2b,%al
 275:	74 0a                	je     281 <atoi+0x4a>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 2d                	cmp    $0x2d,%al
 27f:	75 2b                	jne    2ac <atoi+0x75>
    s++;
 281:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 285:	eb 25                	jmp    2ac <atoi+0x75>
    n = n*10 + *s++ - '0';
 287:	8b 55 fc             	mov    -0x4(%ebp),%edx
 28a:	89 d0                	mov    %edx,%eax
 28c:	c1 e0 02             	shl    $0x2,%eax
 28f:	01 d0                	add    %edx,%eax
 291:	01 c0                	add    %eax,%eax
 293:	89 c1                	mov    %eax,%ecx
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	8d 50 01             	lea    0x1(%eax),%edx
 29b:	89 55 08             	mov    %edx,0x8(%ebp)
 29e:	0f b6 00             	movzbl (%eax),%eax
 2a1:	0f be c0             	movsbl %al,%eax
 2a4:	01 c8                	add    %ecx,%eax
 2a6:	83 e8 30             	sub    $0x30,%eax
 2a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	0f b6 00             	movzbl (%eax),%eax
 2b2:	3c 2f                	cmp    $0x2f,%al
 2b4:	7e 0a                	jle    2c0 <atoi+0x89>
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	0f b6 00             	movzbl (%eax),%eax
 2bc:	3c 39                	cmp    $0x39,%al
 2be:	7e c7                	jle    287 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 2c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2c3:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 2c7:	c9                   	leave  
 2c8:	c3                   	ret    

000002c9 <atoo>:

int
atoo(const char *s)
{
 2c9:	55                   	push   %ebp
 2ca:	89 e5                	mov    %esp,%ebp
 2cc:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2cf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2d6:	eb 04                	jmp    2dc <atoo+0x13>
 2d8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	0f b6 00             	movzbl (%eax),%eax
 2e2:	3c 20                	cmp    $0x20,%al
 2e4:	74 f2                	je     2d8 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 2e6:	8b 45 08             	mov    0x8(%ebp),%eax
 2e9:	0f b6 00             	movzbl (%eax),%eax
 2ec:	3c 2d                	cmp    $0x2d,%al
 2ee:	75 07                	jne    2f7 <atoo+0x2e>
 2f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f5:	eb 05                	jmp    2fc <atoo+0x33>
 2f7:	b8 01 00 00 00       	mov    $0x1,%eax
 2fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2ff:	8b 45 08             	mov    0x8(%ebp),%eax
 302:	0f b6 00             	movzbl (%eax),%eax
 305:	3c 2b                	cmp    $0x2b,%al
 307:	74 0a                	je     313 <atoo+0x4a>
 309:	8b 45 08             	mov    0x8(%ebp),%eax
 30c:	0f b6 00             	movzbl (%eax),%eax
 30f:	3c 2d                	cmp    $0x2d,%al
 311:	75 27                	jne    33a <atoo+0x71>
    s++;
 313:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 317:	eb 21                	jmp    33a <atoo+0x71>
    n = n*8 + *s++ - '0';
 319:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31c:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	8d 50 01             	lea    0x1(%eax),%edx
 329:	89 55 08             	mov    %edx,0x8(%ebp)
 32c:	0f b6 00             	movzbl (%eax),%eax
 32f:	0f be c0             	movsbl %al,%eax
 332:	01 c8                	add    %ecx,%eax
 334:	83 e8 30             	sub    $0x30,%eax
 337:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	0f b6 00             	movzbl (%eax),%eax
 340:	3c 2f                	cmp    $0x2f,%al
 342:	7e 0a                	jle    34e <atoo+0x85>
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	0f b6 00             	movzbl (%eax),%eax
 34a:	3c 37                	cmp    $0x37,%al
 34c:	7e cb                	jle    319 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 34e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 351:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 355:	c9                   	leave  
 356:	c3                   	ret    

00000357 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 363:	8b 45 0c             	mov    0xc(%ebp),%eax
 366:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 369:	eb 17                	jmp    382 <memmove+0x2b>
    *dst++ = *src++;
 36b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 36e:	8d 50 01             	lea    0x1(%eax),%edx
 371:	89 55 fc             	mov    %edx,-0x4(%ebp)
 374:	8b 55 f8             	mov    -0x8(%ebp),%edx
 377:	8d 4a 01             	lea    0x1(%edx),%ecx
 37a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 37d:	0f b6 12             	movzbl (%edx),%edx
 380:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	8b 45 10             	mov    0x10(%ebp),%eax
 385:	8d 50 ff             	lea    -0x1(%eax),%edx
 388:	89 55 10             	mov    %edx,0x10(%ebp)
 38b:	85 c0                	test   %eax,%eax
 38d:	7f dc                	jg     36b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 38f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 392:	c9                   	leave  
 393:	c3                   	ret    

00000394 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 39a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 39d:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3a2:	89 c8                	mov    %ecx,%eax
 3a4:	f7 e2                	mul    %edx
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	c1 e8 06             	shr    $0x6,%eax
 3ab:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 3b1:	29 c1                	sub    %eax,%ecx
 3b3:	89 c8                	mov    %ecx,%eax
 3b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 3c0:	f7 e2                	mul    %edx
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	c1 e8 06             	shr    $0x6,%eax
 3c7:	83 ec 04             	sub    $0x4,%esp
 3ca:	50                   	push   %eax
 3cb:	68 b5 09 00 00       	push   $0x9b5
 3d0:	6a 01                	push   $0x1
 3d2:	e8 14 02 00 00       	call   5eb <printf>
 3d7:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 3da:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 3de:	7e 17                	jle    3f7 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	ff 75 f4             	pushl  -0xc(%ebp)
 3e6:	68 b9 09 00 00       	push   $0x9b9
 3eb:	6a 01                	push   $0x1
 3ed:	e8 f9 01 00 00       	call   5eb <printf>
 3f2:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 3f5:	eb 32                	jmp    429 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 3f7:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 3fb:	7e 17                	jle    414 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 3fd:	83 ec 04             	sub    $0x4,%esp
 400:	ff 75 f4             	pushl  -0xc(%ebp)
 403:	68 bc 09 00 00       	push   $0x9bc
 408:	6a 01                	push   $0x1
 40a:	e8 dc 01 00 00       	call   5eb <printf>
 40f:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 412:	eb 15                	jmp    429 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 414:	83 ec 04             	sub    $0x4,%esp
 417:	ff 75 f4             	pushl  -0xc(%ebp)
 41a:	68 c0 09 00 00       	push   $0x9c0
 41f:	6a 01                	push   $0x1
 421:	e8 c5 01 00 00       	call   5eb <printf>
 426:	83 c4 10             	add    $0x10,%esp
};
 429:	90                   	nop
 42a:	c9                   	leave  
 42b:	c3                   	ret    

0000042c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42c:	b8 01 00 00 00       	mov    $0x1,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <exit>:
SYSCALL(exit)
 434:	b8 02 00 00 00       	mov    $0x2,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <wait>:
SYSCALL(wait)
 43c:	b8 03 00 00 00       	mov    $0x3,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <pipe>:
SYSCALL(pipe)
 444:	b8 04 00 00 00       	mov    $0x4,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <read>:
SYSCALL(read)
 44c:	b8 05 00 00 00       	mov    $0x5,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <write>:
SYSCALL(write)
 454:	b8 10 00 00 00       	mov    $0x10,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <close>:
SYSCALL(close)
 45c:	b8 15 00 00 00       	mov    $0x15,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <kill>:
SYSCALL(kill)
 464:	b8 06 00 00 00       	mov    $0x6,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <exec>:
SYSCALL(exec)
 46c:	b8 07 00 00 00       	mov    $0x7,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <open>:
SYSCALL(open)
 474:	b8 0f 00 00 00       	mov    $0xf,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mknod>:
SYSCALL(mknod)
 47c:	b8 11 00 00 00       	mov    $0x11,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <unlink>:
SYSCALL(unlink)
 484:	b8 12 00 00 00       	mov    $0x12,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <fstat>:
SYSCALL(fstat)
 48c:	b8 08 00 00 00       	mov    $0x8,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <link>:
SYSCALL(link)
 494:	b8 13 00 00 00       	mov    $0x13,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <mkdir>:
SYSCALL(mkdir)
 49c:	b8 14 00 00 00       	mov    $0x14,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <chdir>:
SYSCALL(chdir)
 4a4:	b8 09 00 00 00       	mov    $0x9,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <dup>:
SYSCALL(dup)
 4ac:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <getpid>:
SYSCALL(getpid)
 4b4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <sbrk>:
SYSCALL(sbrk)
 4bc:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <sleep>:
SYSCALL(sleep)
 4c4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <uptime>:
SYSCALL(uptime)
 4cc:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <halt>:
SYSCALL(halt)
 4d4:	b8 16 00 00 00       	mov    $0x16,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <date>:

SYSCALL(date)
 4dc:	b8 17 00 00 00       	mov    $0x17,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <getuid>:
SYSCALL(getuid)
 4e4:	b8 18 00 00 00       	mov    $0x18,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <getgid>:
SYSCALL(getgid)
 4ec:	b8 19 00 00 00       	mov    $0x19,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <getppid>:
SYSCALL(getppid)
 4f4:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <setuid>:
SYSCALL(setuid)
 4fc:	b8 1b 00 00 00       	mov    $0x1b,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <setgid>:
SYSCALL(setgid)
 504:	b8 1c 00 00 00       	mov    $0x1c,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <getprocs>:
SYSCALL(getprocs)
 50c:	b8 1d 00 00 00       	mov    $0x1d,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 18             	sub    $0x18,%esp
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	6a 01                	push   $0x1
 525:	8d 45 f4             	lea    -0xc(%ebp),%eax
 528:	50                   	push   %eax
 529:	ff 75 08             	pushl  0x8(%ebp)
 52c:	e8 23 ff ff ff       	call   454 <write>
 531:	83 c4 10             	add    $0x10,%esp
}
 534:	90                   	nop
 535:	c9                   	leave  
 536:	c3                   	ret    

00000537 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 537:	55                   	push   %ebp
 538:	89 e5                	mov    %esp,%ebp
 53a:	53                   	push   %ebx
 53b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 53e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 545:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 549:	74 17                	je     562 <printint+0x2b>
 54b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 54f:	79 11                	jns    562 <printint+0x2b>
    neg = 1;
 551:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 558:	8b 45 0c             	mov    0xc(%ebp),%eax
 55b:	f7 d8                	neg    %eax
 55d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 560:	eb 06                	jmp    568 <printint+0x31>
  } else {
    x = xx;
 562:	8b 45 0c             	mov    0xc(%ebp),%eax
 565:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 568:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 56f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 572:	8d 41 01             	lea    0x1(%ecx),%eax
 575:	89 45 f4             	mov    %eax,-0xc(%ebp)
 578:	8b 5d 10             	mov    0x10(%ebp),%ebx
 57b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 57e:	ba 00 00 00 00       	mov    $0x0,%edx
 583:	f7 f3                	div    %ebx
 585:	89 d0                	mov    %edx,%eax
 587:	0f b6 80 58 0c 00 00 	movzbl 0xc58(%eax),%eax
 58e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 592:	8b 5d 10             	mov    0x10(%ebp),%ebx
 595:	8b 45 ec             	mov    -0x14(%ebp),%eax
 598:	ba 00 00 00 00       	mov    $0x0,%edx
 59d:	f7 f3                	div    %ebx
 59f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a6:	75 c7                	jne    56f <printint+0x38>
  if(neg)
 5a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ac:	74 2d                	je     5db <printint+0xa4>
    buf[i++] = '-';
 5ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b1:	8d 50 01             	lea    0x1(%eax),%edx
 5b4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5b7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5bc:	eb 1d                	jmp    5db <printint+0xa4>
    putc(fd, buf[i]);
 5be:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c4:	01 d0                	add    %edx,%eax
 5c6:	0f b6 00             	movzbl (%eax),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	83 ec 08             	sub    $0x8,%esp
 5cf:	50                   	push   %eax
 5d0:	ff 75 08             	pushl  0x8(%ebp)
 5d3:	e8 3c ff ff ff       	call   514 <putc>
 5d8:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5db:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e3:	79 d9                	jns    5be <printint+0x87>
    putc(fd, buf[i]);
}
 5e5:	90                   	nop
 5e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    

000005eb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5f8:	8d 45 0c             	lea    0xc(%ebp),%eax
 5fb:	83 c0 04             	add    $0x4,%eax
 5fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 601:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 608:	e9 59 01 00 00       	jmp    766 <printf+0x17b>
    c = fmt[i] & 0xff;
 60d:	8b 55 0c             	mov    0xc(%ebp),%edx
 610:	8b 45 f0             	mov    -0x10(%ebp),%eax
 613:	01 d0                	add    %edx,%eax
 615:	0f b6 00             	movzbl (%eax),%eax
 618:	0f be c0             	movsbl %al,%eax
 61b:	25 ff 00 00 00       	and    $0xff,%eax
 620:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 623:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 627:	75 2c                	jne    655 <printf+0x6a>
      if(c == '%'){
 629:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 62d:	75 0c                	jne    63b <printf+0x50>
        state = '%';
 62f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 636:	e9 27 01 00 00       	jmp    762 <printf+0x177>
      } else {
        putc(fd, c);
 63b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63e:	0f be c0             	movsbl %al,%eax
 641:	83 ec 08             	sub    $0x8,%esp
 644:	50                   	push   %eax
 645:	ff 75 08             	pushl  0x8(%ebp)
 648:	e8 c7 fe ff ff       	call   514 <putc>
 64d:	83 c4 10             	add    $0x10,%esp
 650:	e9 0d 01 00 00       	jmp    762 <printf+0x177>
      }
    } else if(state == '%'){
 655:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 659:	0f 85 03 01 00 00    	jne    762 <printf+0x177>
      if(c == 'd'){
 65f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 663:	75 1e                	jne    683 <printf+0x98>
        printint(fd, *ap, 10, 1);
 665:	8b 45 e8             	mov    -0x18(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	6a 01                	push   $0x1
 66c:	6a 0a                	push   $0xa
 66e:	50                   	push   %eax
 66f:	ff 75 08             	pushl  0x8(%ebp)
 672:	e8 c0 fe ff ff       	call   537 <printint>
 677:	83 c4 10             	add    $0x10,%esp
        ap++;
 67a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 67e:	e9 d8 00 00 00       	jmp    75b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 683:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 687:	74 06                	je     68f <printf+0xa4>
 689:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 68d:	75 1e                	jne    6ad <printf+0xc2>
        printint(fd, *ap, 16, 0);
 68f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 692:	8b 00                	mov    (%eax),%eax
 694:	6a 00                	push   $0x0
 696:	6a 10                	push   $0x10
 698:	50                   	push   %eax
 699:	ff 75 08             	pushl  0x8(%ebp)
 69c:	e8 96 fe ff ff       	call   537 <printint>
 6a1:	83 c4 10             	add    $0x10,%esp
        ap++;
 6a4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6a8:	e9 ae 00 00 00       	jmp    75b <printf+0x170>
      } else if(c == 's'){
 6ad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b1:	75 43                	jne    6f6 <printf+0x10b>
        s = (char*)*ap;
 6b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b6:	8b 00                	mov    (%eax),%eax
 6b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c3:	75 25                	jne    6ea <printf+0xff>
          s = "(null)";
 6c5:	c7 45 f4 c5 09 00 00 	movl   $0x9c5,-0xc(%ebp)
        while(*s != 0){
 6cc:	eb 1c                	jmp    6ea <printf+0xff>
          putc(fd, *s);
 6ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d1:	0f b6 00             	movzbl (%eax),%eax
 6d4:	0f be c0             	movsbl %al,%eax
 6d7:	83 ec 08             	sub    $0x8,%esp
 6da:	50                   	push   %eax
 6db:	ff 75 08             	pushl  0x8(%ebp)
 6de:	e8 31 fe ff ff       	call   514 <putc>
 6e3:	83 c4 10             	add    $0x10,%esp
          s++;
 6e6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ed:	0f b6 00             	movzbl (%eax),%eax
 6f0:	84 c0                	test   %al,%al
 6f2:	75 da                	jne    6ce <printf+0xe3>
 6f4:	eb 65                	jmp    75b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6f6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6fa:	75 1d                	jne    719 <printf+0x12e>
        putc(fd, *ap);
 6fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	0f be c0             	movsbl %al,%eax
 704:	83 ec 08             	sub    $0x8,%esp
 707:	50                   	push   %eax
 708:	ff 75 08             	pushl  0x8(%ebp)
 70b:	e8 04 fe ff ff       	call   514 <putc>
 710:	83 c4 10             	add    $0x10,%esp
        ap++;
 713:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 717:	eb 42                	jmp    75b <printf+0x170>
      } else if(c == '%'){
 719:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 71d:	75 17                	jne    736 <printf+0x14b>
        putc(fd, c);
 71f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 722:	0f be c0             	movsbl %al,%eax
 725:	83 ec 08             	sub    $0x8,%esp
 728:	50                   	push   %eax
 729:	ff 75 08             	pushl  0x8(%ebp)
 72c:	e8 e3 fd ff ff       	call   514 <putc>
 731:	83 c4 10             	add    $0x10,%esp
 734:	eb 25                	jmp    75b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 736:	83 ec 08             	sub    $0x8,%esp
 739:	6a 25                	push   $0x25
 73b:	ff 75 08             	pushl  0x8(%ebp)
 73e:	e8 d1 fd ff ff       	call   514 <putc>
 743:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 746:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 749:	0f be c0             	movsbl %al,%eax
 74c:	83 ec 08             	sub    $0x8,%esp
 74f:	50                   	push   %eax
 750:	ff 75 08             	pushl  0x8(%ebp)
 753:	e8 bc fd ff ff       	call   514 <putc>
 758:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 75b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 762:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 766:	8b 55 0c             	mov    0xc(%ebp),%edx
 769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76c:	01 d0                	add    %edx,%eax
 76e:	0f b6 00             	movzbl (%eax),%eax
 771:	84 c0                	test   %al,%al
 773:	0f 85 94 fe ff ff    	jne    60d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 779:	90                   	nop
 77a:	c9                   	leave  
 77b:	c3                   	ret    

0000077c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 77c:	55                   	push   %ebp
 77d:	89 e5                	mov    %esp,%ebp
 77f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	83 e8 08             	sub    $0x8,%eax
 788:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78b:	a1 74 0c 00 00       	mov    0xc74,%eax
 790:	89 45 fc             	mov    %eax,-0x4(%ebp)
 793:	eb 24                	jmp    7b9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 795:	8b 45 fc             	mov    -0x4(%ebp),%eax
 798:	8b 00                	mov    (%eax),%eax
 79a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 79d:	77 12                	ja     7b1 <free+0x35>
 79f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a5:	77 24                	ja     7cb <free+0x4f>
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7af:	77 1a                	ja     7cb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	8b 00                	mov    (%eax),%eax
 7b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7bf:	76 d4                	jbe    795 <free+0x19>
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	8b 00                	mov    (%eax),%eax
 7c6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c9:	76 ca                	jbe    795 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ce:	8b 40 04             	mov    0x4(%eax),%eax
 7d1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7db:	01 c2                	add    %eax,%edx
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 00                	mov    (%eax),%eax
 7e2:	39 c2                	cmp    %eax,%edx
 7e4:	75 24                	jne    80a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e9:	8b 50 04             	mov    0x4(%eax),%edx
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	8b 40 04             	mov    0x4(%eax),%eax
 7f4:	01 c2                	add    %eax,%edx
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ff:	8b 00                	mov    (%eax),%eax
 801:	8b 10                	mov    (%eax),%edx
 803:	8b 45 f8             	mov    -0x8(%ebp),%eax
 806:	89 10                	mov    %edx,(%eax)
 808:	eb 0a                	jmp    814 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 10                	mov    (%eax),%edx
 80f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 812:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	8b 40 04             	mov    0x4(%eax),%eax
 81a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 821:	8b 45 fc             	mov    -0x4(%ebp),%eax
 824:	01 d0                	add    %edx,%eax
 826:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 829:	75 20                	jne    84b <free+0xcf>
    p->s.size += bp->s.size;
 82b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82e:	8b 50 04             	mov    0x4(%eax),%edx
 831:	8b 45 f8             	mov    -0x8(%ebp),%eax
 834:	8b 40 04             	mov    0x4(%eax),%eax
 837:	01 c2                	add    %eax,%edx
 839:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	8b 10                	mov    (%eax),%edx
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	89 10                	mov    %edx,(%eax)
 849:	eb 08                	jmp    853 <free+0xd7>
  } else
    p->s.ptr = bp;
 84b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 851:	89 10                	mov    %edx,(%eax)
  freep = p;
 853:	8b 45 fc             	mov    -0x4(%ebp),%eax
 856:	a3 74 0c 00 00       	mov    %eax,0xc74
}
 85b:	90                   	nop
 85c:	c9                   	leave  
 85d:	c3                   	ret    

0000085e <morecore>:

static Header*
morecore(uint nu)
{
 85e:	55                   	push   %ebp
 85f:	89 e5                	mov    %esp,%ebp
 861:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 864:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 86b:	77 07                	ja     874 <morecore+0x16>
    nu = 4096;
 86d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 874:	8b 45 08             	mov    0x8(%ebp),%eax
 877:	c1 e0 03             	shl    $0x3,%eax
 87a:	83 ec 0c             	sub    $0xc,%esp
 87d:	50                   	push   %eax
 87e:	e8 39 fc ff ff       	call   4bc <sbrk>
 883:	83 c4 10             	add    $0x10,%esp
 886:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 889:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 88d:	75 07                	jne    896 <morecore+0x38>
    return 0;
 88f:	b8 00 00 00 00       	mov    $0x0,%eax
 894:	eb 26                	jmp    8bc <morecore+0x5e>
  hp = (Header*)p;
 896:	8b 45 f4             	mov    -0xc(%ebp),%eax
 899:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 89c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89f:	8b 55 08             	mov    0x8(%ebp),%edx
 8a2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a8:	83 c0 08             	add    $0x8,%eax
 8ab:	83 ec 0c             	sub    $0xc,%esp
 8ae:	50                   	push   %eax
 8af:	e8 c8 fe ff ff       	call   77c <free>
 8b4:	83 c4 10             	add    $0x10,%esp
  return freep;
 8b7:	a1 74 0c 00 00       	mov    0xc74,%eax
}
 8bc:	c9                   	leave  
 8bd:	c3                   	ret    

000008be <malloc>:

void*
malloc(uint nbytes)
{
 8be:	55                   	push   %ebp
 8bf:	89 e5                	mov    %esp,%ebp
 8c1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	83 c0 07             	add    $0x7,%eax
 8ca:	c1 e8 03             	shr    $0x3,%eax
 8cd:	83 c0 01             	add    $0x1,%eax
 8d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8d3:	a1 74 0c 00 00       	mov    0xc74,%eax
 8d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8df:	75 23                	jne    904 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e1:	c7 45 f0 6c 0c 00 00 	movl   $0xc6c,-0x10(%ebp)
 8e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8eb:	a3 74 0c 00 00       	mov    %eax,0xc74
 8f0:	a1 74 0c 00 00       	mov    0xc74,%eax
 8f5:	a3 6c 0c 00 00       	mov    %eax,0xc6c
    base.s.size = 0;
 8fa:	c7 05 70 0c 00 00 00 	movl   $0x0,0xc70
 901:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 904:	8b 45 f0             	mov    -0x10(%ebp),%eax
 907:	8b 00                	mov    (%eax),%eax
 909:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 90c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90f:	8b 40 04             	mov    0x4(%eax),%eax
 912:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 915:	72 4d                	jb     964 <malloc+0xa6>
      if(p->s.size == nunits)
 917:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91a:	8b 40 04             	mov    0x4(%eax),%eax
 91d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 920:	75 0c                	jne    92e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 922:	8b 45 f4             	mov    -0xc(%ebp),%eax
 925:	8b 10                	mov    (%eax),%edx
 927:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92a:	89 10                	mov    %edx,(%eax)
 92c:	eb 26                	jmp    954 <malloc+0x96>
      else {
        p->s.size -= nunits;
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	2b 45 ec             	sub    -0x14(%ebp),%eax
 937:	89 c2                	mov    %eax,%edx
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 942:	8b 40 04             	mov    0x4(%eax),%eax
 945:	c1 e0 03             	shl    $0x3,%eax
 948:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 951:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 954:	8b 45 f0             	mov    -0x10(%ebp),%eax
 957:	a3 74 0c 00 00       	mov    %eax,0xc74
      return (void*)(p + 1);
 95c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95f:	83 c0 08             	add    $0x8,%eax
 962:	eb 3b                	jmp    99f <malloc+0xe1>
    }
    if(p == freep)
 964:	a1 74 0c 00 00       	mov    0xc74,%eax
 969:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 96c:	75 1e                	jne    98c <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 96e:	83 ec 0c             	sub    $0xc,%esp
 971:	ff 75 ec             	pushl  -0x14(%ebp)
 974:	e8 e5 fe ff ff       	call   85e <morecore>
 979:	83 c4 10             	add    $0x10,%esp
 97c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 97f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 983:	75 07                	jne    98c <malloc+0xce>
        return 0;
 985:	b8 00 00 00 00       	mov    $0x0,%eax
 98a:	eb 13                	jmp    99f <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 992:	8b 45 f4             	mov    -0xc(%ebp),%eax
 995:	8b 00                	mov    (%eax),%eax
 997:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 99a:	e9 6d ff ff ff       	jmp    90c <malloc+0x4e>
}
 99f:	c9                   	leave  
 9a0:	c3                   	ret    
