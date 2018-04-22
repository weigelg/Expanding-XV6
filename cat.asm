
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   6:	eb 15                	jmp    1d <cat+0x1d>
    write(1, buf, n);
   8:	83 ec 04             	sub    $0x4,%esp
   b:	ff 75 f4             	pushl  -0xc(%ebp)
   e:	68 60 0d 00 00       	push   $0xd60
  13:	6a 01                	push   $0x1
  15:	e8 d7 04 00 00       	call   4f1 <write>
  1a:	83 c4 10             	add    $0x10,%esp
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  1d:	83 ec 04             	sub    $0x4,%esp
  20:	68 00 02 00 00       	push   $0x200
  25:	68 60 0d 00 00       	push   $0xd60
  2a:	ff 75 08             	pushl  0x8(%ebp)
  2d:	e8 b7 04 00 00       	call   4e9 <read>
  32:	83 c4 10             	add    $0x10,%esp
  35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3c:	7f ca                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  42:	79 17                	jns    5b <cat+0x5b>
    printf(1, "cat: read error\n");
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 3e 0a 00 00       	push   $0xa3e
  4c:	6a 01                	push   $0x1
  4e:	e8 35 06 00 00       	call   688 <printf>
  53:	83 c4 10             	add    $0x10,%esp
    exit();
  56:	e8 76 04 00 00       	call   4d1 <exit>
  }
}
  5b:	90                   	nop
  5c:	c9                   	leave  
  5d:	c3                   	ret    

0000005e <main>:

int
main(int argc, char *argv[])
{
  5e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  62:	83 e4 f0             	and    $0xfffffff0,%esp
  65:	ff 71 fc             	pushl  -0x4(%ecx)
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	53                   	push   %ebx
  6c:	51                   	push   %ecx
  6d:	83 ec 10             	sub    $0x10,%esp
  70:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
  72:	83 3b 01             	cmpl   $0x1,(%ebx)
  75:	7f 12                	jg     89 <main+0x2b>
    cat(0);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	6a 00                	push   $0x0
  7c:	e8 7f ff ff ff       	call   0 <cat>
  81:	83 c4 10             	add    $0x10,%esp
    exit();
  84:	e8 48 04 00 00       	call   4d1 <exit>
  }

  for(i = 1; i < argc; i++){
  89:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  90:	eb 71                	jmp    103 <main+0xa5>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  95:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  9c:	8b 43 04             	mov    0x4(%ebx),%eax
  9f:	01 d0                	add    %edx,%eax
  a1:	8b 00                	mov    (%eax),%eax
  a3:	83 ec 08             	sub    $0x8,%esp
  a6:	6a 00                	push   $0x0
  a8:	50                   	push   %eax
  a9:	e8 63 04 00 00       	call   511 <open>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  b8:	79 29                	jns    e3 <main+0x85>
      printf(1, "cat: cannot open %s\n", argv[i]);
  ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  bd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c4:	8b 43 04             	mov    0x4(%ebx),%eax
  c7:	01 d0                	add    %edx,%eax
  c9:	8b 00                	mov    (%eax),%eax
  cb:	83 ec 04             	sub    $0x4,%esp
  ce:	50                   	push   %eax
  cf:	68 4f 0a 00 00       	push   $0xa4f
  d4:	6a 01                	push   $0x1
  d6:	e8 ad 05 00 00       	call   688 <printf>
  db:	83 c4 10             	add    $0x10,%esp
      exit();
  de:	e8 ee 03 00 00       	call   4d1 <exit>
    }
    cat(fd);
  e3:	83 ec 0c             	sub    $0xc,%esp
  e6:	ff 75 f0             	pushl  -0x10(%ebp)
  e9:	e8 12 ff ff ff       	call   0 <cat>
  ee:	83 c4 10             	add    $0x10,%esp
    close(fd);
  f1:	83 ec 0c             	sub    $0xc,%esp
  f4:	ff 75 f0             	pushl  -0x10(%ebp)
  f7:	e8 fd 03 00 00       	call   4f9 <close>
  fc:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 103:	8b 45 f4             	mov    -0xc(%ebp),%eax
 106:	3b 03                	cmp    (%ebx),%eax
 108:	7c 88                	jl     92 <main+0x34>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 10a:	e8 c2 03 00 00       	call   4d1 <exit>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	90                   	nop
 131:	5b                   	pop    %ebx
 132:	5f                   	pop    %edi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 141:	90                   	nop
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	8d 50 01             	lea    0x1(%eax),%edx
 148:	89 55 08             	mov    %edx,0x8(%ebp)
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
 14e:	8d 4a 01             	lea    0x1(%edx),%ecx
 151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 154:	0f b6 12             	movzbl (%edx),%edx
 157:	88 10                	mov    %dl,(%eax)
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	84 c0                	test   %al,%al
 15e:	75 e2                	jne    142 <strcpy+0xd>
    ;
  return os;
 160:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 163:	c9                   	leave  
 164:	c3                   	ret    

00000165 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 168:	eb 08                	jmp    172 <strcmp+0xd>
    p++, q++;
 16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	74 10                	je     18c <strcmp+0x27>
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 10             	movzbl (%eax),%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	0f b6 00             	movzbl (%eax),%eax
 188:	38 c2                	cmp    %al,%dl
 18a:	74 de                	je     16a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	0f b6 d0             	movzbl %al,%edx
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	0f b6 c0             	movzbl %al,%eax
 19e:	29 c2                	sub    %eax,%edx
 1a0:	89 d0                	mov    %edx,%eax
}
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    

000001a4 <strlen>:

uint
strlen(char *s)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b1:	eb 04                	jmp    1b7 <strlen+0x13>
 1b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	01 d0                	add    %edx,%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	84 c0                	test   %al,%al
 1c4:	75 ed                	jne    1b3 <strlen+0xf>
    ;
  return n;
 1c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c9:	c9                   	leave  
 1ca:	c3                   	ret    

000001cb <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1ce:	8b 45 10             	mov    0x10(%ebp),%eax
 1d1:	50                   	push   %eax
 1d2:	ff 75 0c             	pushl  0xc(%ebp)
 1d5:	ff 75 08             	pushl  0x8(%ebp)
 1d8:	e8 32 ff ff ff       	call   10f <stosb>
 1dd:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <strchr>:

char*
strchr(const char *s, char c)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	83 ec 04             	sub    $0x4,%esp
 1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ee:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1f1:	eb 14                	jmp    207 <strchr+0x22>
    if(*s == c)
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 00             	movzbl (%eax),%eax
 1f9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1fc:	75 05                	jne    203 <strchr+0x1e>
      return (char*)s;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	eb 13                	jmp    216 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 203:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	0f b6 00             	movzbl (%eax),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 e2                	jne    1f3 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 211:	b8 00 00 00 00       	mov    $0x0,%eax
}
 216:	c9                   	leave  
 217:	c3                   	ret    

00000218 <gets>:

char*
gets(char *buf, int max)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 225:	eb 42                	jmp    269 <gets+0x51>
    cc = read(0, &c, 1);
 227:	83 ec 04             	sub    $0x4,%esp
 22a:	6a 01                	push   $0x1
 22c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 22f:	50                   	push   %eax
 230:	6a 00                	push   $0x0
 232:	e8 b2 02 00 00       	call   4e9 <read>
 237:	83 c4 10             	add    $0x10,%esp
 23a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 23d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 241:	7e 33                	jle    276 <gets+0x5e>
      break;
    buf[i++] = c;
 243:	8b 45 f4             	mov    -0xc(%ebp),%eax
 246:	8d 50 01             	lea    0x1(%eax),%edx
 249:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24c:	89 c2                	mov    %eax,%edx
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	01 c2                	add    %eax,%edx
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 259:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 16                	je     277 <gets+0x5f>
 261:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 265:	3c 0d                	cmp    $0xd,%al
 267:	74 0e                	je     277 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 272:	7c b3                	jl     227 <gets+0xf>
 274:	eb 01                	jmp    277 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 276:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 277:	8b 55 f4             	mov    -0xc(%ebp),%edx
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	01 d0                	add    %edx,%eax
 27f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 282:	8b 45 08             	mov    0x8(%ebp),%eax
}
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <stat>:

int
stat(char *n, struct stat *st)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	6a 00                	push   $0x0
 292:	ff 75 08             	pushl  0x8(%ebp)
 295:	e8 77 02 00 00       	call   511 <open>
 29a:	83 c4 10             	add    $0x10,%esp
 29d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a4:	79 07                	jns    2ad <stat+0x26>
    return -1;
 2a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ab:	eb 25                	jmp    2d2 <stat+0x4b>
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	ff 75 f4             	pushl  -0xc(%ebp)
 2b6:	e8 6e 02 00 00       	call   529 <fstat>
 2bb:	83 c4 10             	add    $0x10,%esp
 2be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c1:	83 ec 0c             	sub    $0xc,%esp
 2c4:	ff 75 f4             	pushl  -0xc(%ebp)
 2c7:	e8 2d 02 00 00       	call   4f9 <close>
 2cc:	83 c4 10             	add    $0x10,%esp
  return r;
 2cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <atoi>:

int
atoi(const char *s)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2e1:	eb 04                	jmp    2e7 <atoi+0x13>
 2e3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	3c 20                	cmp    $0x20,%al
 2ef:	74 f2                	je     2e3 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	0f b6 00             	movzbl (%eax),%eax
 2f7:	3c 2d                	cmp    $0x2d,%al
 2f9:	75 07                	jne    302 <atoi+0x2e>
 2fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 300:	eb 05                	jmp    307 <atoi+0x33>
 302:	b8 01 00 00 00       	mov    $0x1,%eax
 307:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 30a:	8b 45 08             	mov    0x8(%ebp),%eax
 30d:	0f b6 00             	movzbl (%eax),%eax
 310:	3c 2b                	cmp    $0x2b,%al
 312:	74 0a                	je     31e <atoi+0x4a>
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	0f b6 00             	movzbl (%eax),%eax
 31a:	3c 2d                	cmp    $0x2d,%al
 31c:	75 2b                	jne    349 <atoi+0x75>
    s++;
 31e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 322:	eb 25                	jmp    349 <atoi+0x75>
    n = n*10 + *s++ - '0';
 324:	8b 55 fc             	mov    -0x4(%ebp),%edx
 327:	89 d0                	mov    %edx,%eax
 329:	c1 e0 02             	shl    $0x2,%eax
 32c:	01 d0                	add    %edx,%eax
 32e:	01 c0                	add    %eax,%eax
 330:	89 c1                	mov    %eax,%ecx
 332:	8b 45 08             	mov    0x8(%ebp),%eax
 335:	8d 50 01             	lea    0x1(%eax),%edx
 338:	89 55 08             	mov    %edx,0x8(%ebp)
 33b:	0f b6 00             	movzbl (%eax),%eax
 33e:	0f be c0             	movsbl %al,%eax
 341:	01 c8                	add    %ecx,%eax
 343:	83 e8 30             	sub    $0x30,%eax
 346:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	0f b6 00             	movzbl (%eax),%eax
 34f:	3c 2f                	cmp    $0x2f,%al
 351:	7e 0a                	jle    35d <atoi+0x89>
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	0f b6 00             	movzbl (%eax),%eax
 359:	3c 39                	cmp    $0x39,%al
 35b:	7e c7                	jle    324 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 35d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 360:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <atoo>:

int
atoo(const char *s)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 36c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 373:	eb 04                	jmp    379 <atoo+0x13>
 375:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 379:	8b 45 08             	mov    0x8(%ebp),%eax
 37c:	0f b6 00             	movzbl (%eax),%eax
 37f:	3c 20                	cmp    $0x20,%al
 381:	74 f2                	je     375 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	0f b6 00             	movzbl (%eax),%eax
 389:	3c 2d                	cmp    $0x2d,%al
 38b:	75 07                	jne    394 <atoo+0x2e>
 38d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 392:	eb 05                	jmp    399 <atoo+0x33>
 394:	b8 01 00 00 00       	mov    $0x1,%eax
 399:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
 39f:	0f b6 00             	movzbl (%eax),%eax
 3a2:	3c 2b                	cmp    $0x2b,%al
 3a4:	74 0a                	je     3b0 <atoo+0x4a>
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	3c 2d                	cmp    $0x2d,%al
 3ae:	75 27                	jne    3d7 <atoo+0x71>
    s++;
 3b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 3b4:	eb 21                	jmp    3d7 <atoo+0x71>
    n = n*8 + *s++ - '0';
 3b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3b9:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	8d 50 01             	lea    0x1(%eax),%edx
 3c6:	89 55 08             	mov    %edx,0x8(%ebp)
 3c9:	0f b6 00             	movzbl (%eax),%eax
 3cc:	0f be c0             	movsbl %al,%eax
 3cf:	01 c8                	add    %ecx,%eax
 3d1:	83 e8 30             	sub    $0x30,%eax
 3d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	3c 2f                	cmp    $0x2f,%al
 3df:	7e 0a                	jle    3eb <atoo+0x85>
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	0f b6 00             	movzbl (%eax),%eax
 3e7:	3c 37                	cmp    $0x37,%al
 3e9:	7e cb                	jle    3b6 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 3eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3ee:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 3f2:	c9                   	leave  
 3f3:	c3                   	ret    

000003f4 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3fa:	8b 45 08             	mov    0x8(%ebp),%eax
 3fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 400:	8b 45 0c             	mov    0xc(%ebp),%eax
 403:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 406:	eb 17                	jmp    41f <memmove+0x2b>
    *dst++ = *src++;
 408:	8b 45 fc             	mov    -0x4(%ebp),%eax
 40b:	8d 50 01             	lea    0x1(%eax),%edx
 40e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 411:	8b 55 f8             	mov    -0x8(%ebp),%edx
 414:	8d 4a 01             	lea    0x1(%edx),%ecx
 417:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 41a:	0f b6 12             	movzbl (%edx),%edx
 41d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 41f:	8b 45 10             	mov    0x10(%ebp),%eax
 422:	8d 50 ff             	lea    -0x1(%eax),%edx
 425:	89 55 10             	mov    %edx,0x10(%ebp)
 428:	85 c0                	test   %eax,%eax
 42a:	7f dc                	jg     408 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 42c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 42f:	c9                   	leave  
 430:	c3                   	ret    

00000431 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 431:	55                   	push   %ebp
 432:	89 e5                	mov    %esp,%ebp
 434:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 437:	8b 4d 08             	mov    0x8(%ebp),%ecx
 43a:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 43f:	89 c8                	mov    %ecx,%eax
 441:	f7 e2                	mul    %edx
 443:	89 d0                	mov    %edx,%eax
 445:	c1 e8 06             	shr    $0x6,%eax
 448:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 44e:	29 c1                	sub    %eax,%ecx
 450:	89 c8                	mov    %ecx,%eax
 452:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 455:	8b 45 08             	mov    0x8(%ebp),%eax
 458:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 45d:	f7 e2                	mul    %edx
 45f:	89 d0                	mov    %edx,%eax
 461:	c1 e8 06             	shr    $0x6,%eax
 464:	83 ec 04             	sub    $0x4,%esp
 467:	50                   	push   %eax
 468:	68 64 0a 00 00       	push   $0xa64
 46d:	6a 01                	push   $0x1
 46f:	e8 14 02 00 00       	call   688 <printf>
 474:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 477:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 47b:	7e 17                	jle    494 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 47d:	83 ec 04             	sub    $0x4,%esp
 480:	ff 75 f4             	pushl  -0xc(%ebp)
 483:	68 68 0a 00 00       	push   $0xa68
 488:	6a 01                	push   $0x1
 48a:	e8 f9 01 00 00       	call   688 <printf>
 48f:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 492:	eb 32                	jmp    4c6 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 494:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 498:	7e 17                	jle    4b1 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 49a:	83 ec 04             	sub    $0x4,%esp
 49d:	ff 75 f4             	pushl  -0xc(%ebp)
 4a0:	68 6b 0a 00 00       	push   $0xa6b
 4a5:	6a 01                	push   $0x1
 4a7:	e8 dc 01 00 00       	call   688 <printf>
 4ac:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 4af:	eb 15                	jmp    4c6 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 4b1:	83 ec 04             	sub    $0x4,%esp
 4b4:	ff 75 f4             	pushl  -0xc(%ebp)
 4b7:	68 6f 0a 00 00       	push   $0xa6f
 4bc:	6a 01                	push   $0x1
 4be:	e8 c5 01 00 00       	call   688 <printf>
 4c3:	83 c4 10             	add    $0x10,%esp
};
 4c6:	90                   	nop
 4c7:	c9                   	leave  
 4c8:	c3                   	ret    

000004c9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c9:	b8 01 00 00 00       	mov    $0x1,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <exit>:
SYSCALL(exit)
 4d1:	b8 02 00 00 00       	mov    $0x2,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <wait>:
SYSCALL(wait)
 4d9:	b8 03 00 00 00       	mov    $0x3,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <pipe>:
SYSCALL(pipe)
 4e1:	b8 04 00 00 00       	mov    $0x4,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <read>:
SYSCALL(read)
 4e9:	b8 05 00 00 00       	mov    $0x5,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <write>:
SYSCALL(write)
 4f1:	b8 10 00 00 00       	mov    $0x10,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <close>:
SYSCALL(close)
 4f9:	b8 15 00 00 00       	mov    $0x15,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <kill>:
SYSCALL(kill)
 501:	b8 06 00 00 00       	mov    $0x6,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <exec>:
SYSCALL(exec)
 509:	b8 07 00 00 00       	mov    $0x7,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <open>:
SYSCALL(open)
 511:	b8 0f 00 00 00       	mov    $0xf,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <mknod>:
SYSCALL(mknod)
 519:	b8 11 00 00 00       	mov    $0x11,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <unlink>:
SYSCALL(unlink)
 521:	b8 12 00 00 00       	mov    $0x12,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <fstat>:
SYSCALL(fstat)
 529:	b8 08 00 00 00       	mov    $0x8,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <link>:
SYSCALL(link)
 531:	b8 13 00 00 00       	mov    $0x13,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <mkdir>:
SYSCALL(mkdir)
 539:	b8 14 00 00 00       	mov    $0x14,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <chdir>:
SYSCALL(chdir)
 541:	b8 09 00 00 00       	mov    $0x9,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <dup>:
SYSCALL(dup)
 549:	b8 0a 00 00 00       	mov    $0xa,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <getpid>:
SYSCALL(getpid)
 551:	b8 0b 00 00 00       	mov    $0xb,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <sbrk>:
SYSCALL(sbrk)
 559:	b8 0c 00 00 00       	mov    $0xc,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <sleep>:
SYSCALL(sleep)
 561:	b8 0d 00 00 00       	mov    $0xd,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <uptime>:
SYSCALL(uptime)
 569:	b8 0e 00 00 00       	mov    $0xe,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <halt>:
SYSCALL(halt)
 571:	b8 16 00 00 00       	mov    $0x16,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <date>:

SYSCALL(date)
 579:	b8 17 00 00 00       	mov    $0x17,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <getuid>:
SYSCALL(getuid)
 581:	b8 18 00 00 00       	mov    $0x18,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <getgid>:
SYSCALL(getgid)
 589:	b8 19 00 00 00       	mov    $0x19,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <getppid>:
SYSCALL(getppid)
 591:	b8 1a 00 00 00       	mov    $0x1a,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <setuid>:
SYSCALL(setuid)
 599:	b8 1b 00 00 00       	mov    $0x1b,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <setgid>:
SYSCALL(setgid)
 5a1:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <getprocs>:
SYSCALL(getprocs)
 5a9:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5b1:	55                   	push   %ebp
 5b2:	89 e5                	mov    %esp,%ebp
 5b4:	83 ec 18             	sub    $0x18,%esp
 5b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ba:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5bd:	83 ec 04             	sub    $0x4,%esp
 5c0:	6a 01                	push   $0x1
 5c2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5c5:	50                   	push   %eax
 5c6:	ff 75 08             	pushl  0x8(%ebp)
 5c9:	e8 23 ff ff ff       	call   4f1 <write>
 5ce:	83 c4 10             	add    $0x10,%esp
}
 5d1:	90                   	nop
 5d2:	c9                   	leave  
 5d3:	c3                   	ret    

000005d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	53                   	push   %ebx
 5d8:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5db:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5e2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5e6:	74 17                	je     5ff <printint+0x2b>
 5e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5ec:	79 11                	jns    5ff <printint+0x2b>
    neg = 1;
 5ee:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f8:	f7 d8                	neg    %eax
 5fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5fd:	eb 06                	jmp    605 <printint+0x31>
  } else {
    x = xx;
 5ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 602:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 605:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 60c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 60f:	8d 41 01             	lea    0x1(%ecx),%eax
 612:	89 45 f4             	mov    %eax,-0xc(%ebp)
 615:	8b 5d 10             	mov    0x10(%ebp),%ebx
 618:	8b 45 ec             	mov    -0x14(%ebp),%eax
 61b:	ba 00 00 00 00       	mov    $0x0,%edx
 620:	f7 f3                	div    %ebx
 622:	89 d0                	mov    %edx,%eax
 624:	0f b6 80 28 0d 00 00 	movzbl 0xd28(%eax),%eax
 62b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 62f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 632:	8b 45 ec             	mov    -0x14(%ebp),%eax
 635:	ba 00 00 00 00       	mov    $0x0,%edx
 63a:	f7 f3                	div    %ebx
 63c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 63f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 643:	75 c7                	jne    60c <printint+0x38>
  if(neg)
 645:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 649:	74 2d                	je     678 <printint+0xa4>
    buf[i++] = '-';
 64b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64e:	8d 50 01             	lea    0x1(%eax),%edx
 651:	89 55 f4             	mov    %edx,-0xc(%ebp)
 654:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 659:	eb 1d                	jmp    678 <printint+0xa4>
    putc(fd, buf[i]);
 65b:	8d 55 dc             	lea    -0x24(%ebp),%edx
 65e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 661:	01 d0                	add    %edx,%eax
 663:	0f b6 00             	movzbl (%eax),%eax
 666:	0f be c0             	movsbl %al,%eax
 669:	83 ec 08             	sub    $0x8,%esp
 66c:	50                   	push   %eax
 66d:	ff 75 08             	pushl  0x8(%ebp)
 670:	e8 3c ff ff ff       	call   5b1 <putc>
 675:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 678:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 67c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 680:	79 d9                	jns    65b <printint+0x87>
    putc(fd, buf[i]);
}
 682:	90                   	nop
 683:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 686:	c9                   	leave  
 687:	c3                   	ret    

00000688 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 688:	55                   	push   %ebp
 689:	89 e5                	mov    %esp,%ebp
 68b:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 68e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 695:	8d 45 0c             	lea    0xc(%ebp),%eax
 698:	83 c0 04             	add    $0x4,%eax
 69b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 69e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6a5:	e9 59 01 00 00       	jmp    803 <printf+0x17b>
    c = fmt[i] & 0xff;
 6aa:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b0:	01 d0                	add    %edx,%eax
 6b2:	0f b6 00             	movzbl (%eax),%eax
 6b5:	0f be c0             	movsbl %al,%eax
 6b8:	25 ff 00 00 00       	and    $0xff,%eax
 6bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6c4:	75 2c                	jne    6f2 <printf+0x6a>
      if(c == '%'){
 6c6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ca:	75 0c                	jne    6d8 <printf+0x50>
        state = '%';
 6cc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6d3:	e9 27 01 00 00       	jmp    7ff <printf+0x177>
      } else {
        putc(fd, c);
 6d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6db:	0f be c0             	movsbl %al,%eax
 6de:	83 ec 08             	sub    $0x8,%esp
 6e1:	50                   	push   %eax
 6e2:	ff 75 08             	pushl  0x8(%ebp)
 6e5:	e8 c7 fe ff ff       	call   5b1 <putc>
 6ea:	83 c4 10             	add    $0x10,%esp
 6ed:	e9 0d 01 00 00       	jmp    7ff <printf+0x177>
      }
    } else if(state == '%'){
 6f2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6f6:	0f 85 03 01 00 00    	jne    7ff <printf+0x177>
      if(c == 'd'){
 6fc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 700:	75 1e                	jne    720 <printf+0x98>
        printint(fd, *ap, 10, 1);
 702:	8b 45 e8             	mov    -0x18(%ebp),%eax
 705:	8b 00                	mov    (%eax),%eax
 707:	6a 01                	push   $0x1
 709:	6a 0a                	push   $0xa
 70b:	50                   	push   %eax
 70c:	ff 75 08             	pushl  0x8(%ebp)
 70f:	e8 c0 fe ff ff       	call   5d4 <printint>
 714:	83 c4 10             	add    $0x10,%esp
        ap++;
 717:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 71b:	e9 d8 00 00 00       	jmp    7f8 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 720:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 724:	74 06                	je     72c <printf+0xa4>
 726:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 72a:	75 1e                	jne    74a <printf+0xc2>
        printint(fd, *ap, 16, 0);
 72c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72f:	8b 00                	mov    (%eax),%eax
 731:	6a 00                	push   $0x0
 733:	6a 10                	push   $0x10
 735:	50                   	push   %eax
 736:	ff 75 08             	pushl  0x8(%ebp)
 739:	e8 96 fe ff ff       	call   5d4 <printint>
 73e:	83 c4 10             	add    $0x10,%esp
        ap++;
 741:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 745:	e9 ae 00 00 00       	jmp    7f8 <printf+0x170>
      } else if(c == 's'){
 74a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 74e:	75 43                	jne    793 <printf+0x10b>
        s = (char*)*ap;
 750:	8b 45 e8             	mov    -0x18(%ebp),%eax
 753:	8b 00                	mov    (%eax),%eax
 755:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 758:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 75c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 760:	75 25                	jne    787 <printf+0xff>
          s = "(null)";
 762:	c7 45 f4 74 0a 00 00 	movl   $0xa74,-0xc(%ebp)
        while(*s != 0){
 769:	eb 1c                	jmp    787 <printf+0xff>
          putc(fd, *s);
 76b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76e:	0f b6 00             	movzbl (%eax),%eax
 771:	0f be c0             	movsbl %al,%eax
 774:	83 ec 08             	sub    $0x8,%esp
 777:	50                   	push   %eax
 778:	ff 75 08             	pushl  0x8(%ebp)
 77b:	e8 31 fe ff ff       	call   5b1 <putc>
 780:	83 c4 10             	add    $0x10,%esp
          s++;
 783:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	0f b6 00             	movzbl (%eax),%eax
 78d:	84 c0                	test   %al,%al
 78f:	75 da                	jne    76b <printf+0xe3>
 791:	eb 65                	jmp    7f8 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 793:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 797:	75 1d                	jne    7b6 <printf+0x12e>
        putc(fd, *ap);
 799:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	0f be c0             	movsbl %al,%eax
 7a1:	83 ec 08             	sub    $0x8,%esp
 7a4:	50                   	push   %eax
 7a5:	ff 75 08             	pushl  0x8(%ebp)
 7a8:	e8 04 fe ff ff       	call   5b1 <putc>
 7ad:	83 c4 10             	add    $0x10,%esp
        ap++;
 7b0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7b4:	eb 42                	jmp    7f8 <printf+0x170>
      } else if(c == '%'){
 7b6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ba:	75 17                	jne    7d3 <printf+0x14b>
        putc(fd, c);
 7bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7bf:	0f be c0             	movsbl %al,%eax
 7c2:	83 ec 08             	sub    $0x8,%esp
 7c5:	50                   	push   %eax
 7c6:	ff 75 08             	pushl  0x8(%ebp)
 7c9:	e8 e3 fd ff ff       	call   5b1 <putc>
 7ce:	83 c4 10             	add    $0x10,%esp
 7d1:	eb 25                	jmp    7f8 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7d3:	83 ec 08             	sub    $0x8,%esp
 7d6:	6a 25                	push   $0x25
 7d8:	ff 75 08             	pushl  0x8(%ebp)
 7db:	e8 d1 fd ff ff       	call   5b1 <putc>
 7e0:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 7e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7e6:	0f be c0             	movsbl %al,%eax
 7e9:	83 ec 08             	sub    $0x8,%esp
 7ec:	50                   	push   %eax
 7ed:	ff 75 08             	pushl  0x8(%ebp)
 7f0:	e8 bc fd ff ff       	call   5b1 <putc>
 7f5:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7f8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 803:	8b 55 0c             	mov    0xc(%ebp),%edx
 806:	8b 45 f0             	mov    -0x10(%ebp),%eax
 809:	01 d0                	add    %edx,%eax
 80b:	0f b6 00             	movzbl (%eax),%eax
 80e:	84 c0                	test   %al,%al
 810:	0f 85 94 fe ff ff    	jne    6aa <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 816:	90                   	nop
 817:	c9                   	leave  
 818:	c3                   	ret    

00000819 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 819:	55                   	push   %ebp
 81a:	89 e5                	mov    %esp,%ebp
 81c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	83 e8 08             	sub    $0x8,%eax
 825:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 828:	a1 48 0d 00 00       	mov    0xd48,%eax
 82d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 830:	eb 24                	jmp    856 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 832:	8b 45 fc             	mov    -0x4(%ebp),%eax
 835:	8b 00                	mov    (%eax),%eax
 837:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 83a:	77 12                	ja     84e <free+0x35>
 83c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 842:	77 24                	ja     868 <free+0x4f>
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	8b 00                	mov    (%eax),%eax
 849:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 84c:	77 1a                	ja     868 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 00                	mov    (%eax),%eax
 853:	89 45 fc             	mov    %eax,-0x4(%ebp)
 856:	8b 45 f8             	mov    -0x8(%ebp),%eax
 859:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 85c:	76 d4                	jbe    832 <free+0x19>
 85e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 861:	8b 00                	mov    (%eax),%eax
 863:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 866:	76 ca                	jbe    832 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86b:	8b 40 04             	mov    0x4(%eax),%eax
 86e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 875:	8b 45 f8             	mov    -0x8(%ebp),%eax
 878:	01 c2                	add    %eax,%edx
 87a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87d:	8b 00                	mov    (%eax),%eax
 87f:	39 c2                	cmp    %eax,%edx
 881:	75 24                	jne    8a7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 883:	8b 45 f8             	mov    -0x8(%ebp),%eax
 886:	8b 50 04             	mov    0x4(%eax),%edx
 889:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88c:	8b 00                	mov    (%eax),%eax
 88e:	8b 40 04             	mov    0x4(%eax),%eax
 891:	01 c2                	add    %eax,%edx
 893:	8b 45 f8             	mov    -0x8(%ebp),%eax
 896:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89c:	8b 00                	mov    (%eax),%eax
 89e:	8b 10                	mov    (%eax),%edx
 8a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a3:	89 10                	mov    %edx,(%eax)
 8a5:	eb 0a                	jmp    8b1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8aa:	8b 10                	mov    (%eax),%edx
 8ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8af:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b4:	8b 40 04             	mov    0x4(%eax),%eax
 8b7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c1:	01 d0                	add    %edx,%eax
 8c3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8c6:	75 20                	jne    8e8 <free+0xcf>
    p->s.size += bp->s.size;
 8c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cb:	8b 50 04             	mov    0x4(%eax),%edx
 8ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d1:	8b 40 04             	mov    0x4(%eax),%eax
 8d4:	01 c2                	add    %eax,%edx
 8d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8df:	8b 10                	mov    (%eax),%edx
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	89 10                	mov    %edx,(%eax)
 8e6:	eb 08                	jmp    8f0 <free+0xd7>
  } else
    p->s.ptr = bp;
 8e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8eb:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8ee:	89 10                	mov    %edx,(%eax)
  freep = p;
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 8f8:	90                   	nop
 8f9:	c9                   	leave  
 8fa:	c3                   	ret    

000008fb <morecore>:

static Header*
morecore(uint nu)
{
 8fb:	55                   	push   %ebp
 8fc:	89 e5                	mov    %esp,%ebp
 8fe:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 901:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 908:	77 07                	ja     911 <morecore+0x16>
    nu = 4096;
 90a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 911:	8b 45 08             	mov    0x8(%ebp),%eax
 914:	c1 e0 03             	shl    $0x3,%eax
 917:	83 ec 0c             	sub    $0xc,%esp
 91a:	50                   	push   %eax
 91b:	e8 39 fc ff ff       	call   559 <sbrk>
 920:	83 c4 10             	add    $0x10,%esp
 923:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 926:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 92a:	75 07                	jne    933 <morecore+0x38>
    return 0;
 92c:	b8 00 00 00 00       	mov    $0x0,%eax
 931:	eb 26                	jmp    959 <morecore+0x5e>
  hp = (Header*)p;
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 939:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93c:	8b 55 08             	mov    0x8(%ebp),%edx
 93f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 942:	8b 45 f0             	mov    -0x10(%ebp),%eax
 945:	83 c0 08             	add    $0x8,%eax
 948:	83 ec 0c             	sub    $0xc,%esp
 94b:	50                   	push   %eax
 94c:	e8 c8 fe ff ff       	call   819 <free>
 951:	83 c4 10             	add    $0x10,%esp
  return freep;
 954:	a1 48 0d 00 00       	mov    0xd48,%eax
}
 959:	c9                   	leave  
 95a:	c3                   	ret    

0000095b <malloc>:

void*
malloc(uint nbytes)
{
 95b:	55                   	push   %ebp
 95c:	89 e5                	mov    %esp,%ebp
 95e:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 961:	8b 45 08             	mov    0x8(%ebp),%eax
 964:	83 c0 07             	add    $0x7,%eax
 967:	c1 e8 03             	shr    $0x3,%eax
 96a:	83 c0 01             	add    $0x1,%eax
 96d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 970:	a1 48 0d 00 00       	mov    0xd48,%eax
 975:	89 45 f0             	mov    %eax,-0x10(%ebp)
 978:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 97c:	75 23                	jne    9a1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 97e:	c7 45 f0 40 0d 00 00 	movl   $0xd40,-0x10(%ebp)
 985:	8b 45 f0             	mov    -0x10(%ebp),%eax
 988:	a3 48 0d 00 00       	mov    %eax,0xd48
 98d:	a1 48 0d 00 00       	mov    0xd48,%eax
 992:	a3 40 0d 00 00       	mov    %eax,0xd40
    base.s.size = 0;
 997:	c7 05 44 0d 00 00 00 	movl   $0x0,0xd44
 99e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a4:	8b 00                	mov    (%eax),%eax
 9a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ac:	8b 40 04             	mov    0x4(%eax),%eax
 9af:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9b2:	72 4d                	jb     a01 <malloc+0xa6>
      if(p->s.size == nunits)
 9b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b7:	8b 40 04             	mov    0x4(%eax),%eax
 9ba:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9bd:	75 0c                	jne    9cb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c2:	8b 10                	mov    (%eax),%edx
 9c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c7:	89 10                	mov    %edx,(%eax)
 9c9:	eb 26                	jmp    9f1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ce:	8b 40 04             	mov    0x4(%eax),%eax
 9d1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9d4:	89 c2                	mov    %eax,%edx
 9d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9df:	8b 40 04             	mov    0x4(%eax),%eax
 9e2:	c1 e0 03             	shl    $0x3,%eax
 9e5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9ee:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f4:	a3 48 0d 00 00       	mov    %eax,0xd48
      return (void*)(p + 1);
 9f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fc:	83 c0 08             	add    $0x8,%eax
 9ff:	eb 3b                	jmp    a3c <malloc+0xe1>
    }
    if(p == freep)
 a01:	a1 48 0d 00 00       	mov    0xd48,%eax
 a06:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a09:	75 1e                	jne    a29 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a0b:	83 ec 0c             	sub    $0xc,%esp
 a0e:	ff 75 ec             	pushl  -0x14(%ebp)
 a11:	e8 e5 fe ff ff       	call   8fb <morecore>
 a16:	83 c4 10             	add    $0x10,%esp
 a19:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a20:	75 07                	jne    a29 <malloc+0xce>
        return 0;
 a22:	b8 00 00 00 00       	mov    $0x0,%eax
 a27:	eb 13                	jmp    a3c <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a32:	8b 00                	mov    (%eax),%eax
 a34:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a37:	e9 6d ff ff ff       	jmp    9a9 <malloc+0x4e>
}
 a3c:	c9                   	leave  
 a3d:	c3                   	ret    
