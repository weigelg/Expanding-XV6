
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
  1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
  22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 81 0a 00 00       	push   $0xa81
  30:	6a 01                	push   $0x1
  32:	e8 94 06 00 00       	call   6cb <printf>
  37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 be 01 00 00       	call   20e <memset>
  50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  5a:	eb 0d                	jmp    69 <main+0x69>
    if(fork() > 0)
  5c:	e8 ab 04 00 00       	call   50c <fork>
  61:	85 c0                	test   %eax,%eax
  63:	7f 0c                	jg     71 <main+0x71>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  69:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  6d:	7e ed                	jle    5c <main+0x5c>
  6f:	eb 01                	jmp    72 <main+0x72>
    if(fork() > 0)
      break;
  71:	90                   	nop

  printf(1, "write %d\n", i);
  72:	83 ec 04             	sub    $0x4,%esp
  75:	ff 75 f4             	pushl  -0xc(%ebp)
  78:	68 94 0a 00 00       	push   $0xa94
  7d:	6a 01                	push   $0x1
  7f:	e8 47 06 00 00       	call   6cb <printf>
  84:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
  87:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  8b:	89 c2                	mov    %eax,%edx
  8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  90:	01 d0                	add    %edx,%eax
  92:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	83 ec 08             	sub    $0x8,%esp
  98:	68 02 02 00 00       	push   $0x202
  9d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
  a0:	50                   	push   %eax
  a1:	e8 ae 04 00 00       	call   554 <open>
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
  ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  b3:	eb 1e                	jmp    d3 <main+0xd3>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b5:	83 ec 04             	sub    $0x4,%esp
  b8:	68 00 02 00 00       	push   $0x200
  bd:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	ff 75 f0             	pushl  -0x10(%ebp)
  c7:	e8 68 04 00 00       	call   534 <write>
  cc:	83 c4 10             	add    $0x10,%esp

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  d7:	7e dc                	jle    b5 <main+0xb5>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	ff 75 f0             	pushl  -0x10(%ebp)
  df:	e8 58 04 00 00       	call   53c <close>
  e4:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
  e7:	83 ec 08             	sub    $0x8,%esp
  ea:	68 9e 0a 00 00       	push   $0xa9e
  ef:	6a 01                	push   $0x1
  f1:	e8 d5 05 00 00       	call   6cb <printf>
  f6:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	6a 00                	push   $0x0
  fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 101:	50                   	push   %eax
 102:	e8 4d 04 00 00       	call   554 <open>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
 10d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 114:	eb 1e                	jmp    134 <main+0x134>
    read(fd, data, sizeof(data));
 116:	83 ec 04             	sub    $0x4,%esp
 119:	68 00 02 00 00       	push   $0x200
 11e:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
 124:	50                   	push   %eax
 125:	ff 75 f0             	pushl  -0x10(%ebp)
 128:	e8 ff 03 00 00       	call   52c <read>
 12d:	83 c4 10             	add    $0x10,%esp
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 130:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 134:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
 138:	7e dc                	jle    116 <main+0x116>
    read(fd, data, sizeof(data));
  close(fd);
 13a:	83 ec 0c             	sub    $0xc,%esp
 13d:	ff 75 f0             	pushl  -0x10(%ebp)
 140:	e8 f7 03 00 00       	call   53c <close>
 145:	83 c4 10             	add    $0x10,%esp

  wait();
 148:	e8 cf 03 00 00       	call   51c <wait>
  
  exit();
 14d:	e8 c2 03 00 00       	call   514 <exit>

00000152 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 157:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15a:	8b 55 10             	mov    0x10(%ebp),%edx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	89 cb                	mov    %ecx,%ebx
 162:	89 df                	mov    %ebx,%edi
 164:	89 d1                	mov    %edx,%ecx
 166:	fc                   	cld    
 167:	f3 aa                	rep stos %al,%es:(%edi)
 169:	89 ca                	mov    %ecx,%edx
 16b:	89 fb                	mov    %edi,%ebx
 16d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 170:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 173:	90                   	nop
 174:	5b                   	pop    %ebx
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 184:	90                   	nop
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	8d 50 01             	lea    0x1(%eax),%edx
 18b:	89 55 08             	mov    %edx,0x8(%ebp)
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
 191:	8d 4a 01             	lea    0x1(%edx),%ecx
 194:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 197:	0f b6 12             	movzbl (%edx),%edx
 19a:	88 10                	mov    %dl,(%eax)
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	84 c0                	test   %al,%al
 1a1:	75 e2                	jne    185 <strcpy+0xd>
    ;
  return os;
 1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1ab:	eb 08                	jmp    1b5 <strcmp+0xd>
    p++, q++;
 1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
 1b8:	0f b6 00             	movzbl (%eax),%eax
 1bb:	84 c0                	test   %al,%al
 1bd:	74 10                	je     1cf <strcmp+0x27>
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	0f b6 10             	movzbl (%eax),%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	38 c2                	cmp    %al,%dl
 1cd:	74 de                	je     1ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	0f b6 00             	movzbl (%eax),%eax
 1d5:	0f b6 d0             	movzbl %al,%edx
 1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1db:	0f b6 00             	movzbl (%eax),%eax
 1de:	0f b6 c0             	movzbl %al,%eax
 1e1:	29 c2                	sub    %eax,%edx
 1e3:	89 d0                	mov    %edx,%eax
}
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <strlen>:

uint
strlen(char *s)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1f4:	eb 04                	jmp    1fa <strlen+0x13>
 1f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	01 d0                	add    %edx,%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	84 c0                	test   %al,%al
 207:	75 ed                	jne    1f6 <strlen+0xf>
    ;
  return n;
 209:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <memset>:

void*
memset(void *dst, int c, uint n)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 211:	8b 45 10             	mov    0x10(%ebp),%eax
 214:	50                   	push   %eax
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 08             	pushl  0x8(%ebp)
 21b:	e8 32 ff ff ff       	call   152 <stosb>
 220:	83 c4 0c             	add    $0xc,%esp
  return dst;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 234:	eb 14                	jmp    24a <strchr+0x22>
    if(*s == c)
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 23f:	75 05                	jne    246 <strchr+0x1e>
      return (char*)s;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	eb 13                	jmp    259 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 e2                	jne    236 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <gets>:

char*
gets(char *buf, int max)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 261:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 268:	eb 42                	jmp    2ac <gets+0x51>
    cc = read(0, &c, 1);
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	6a 01                	push   $0x1
 26f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 272:	50                   	push   %eax
 273:	6a 00                	push   $0x0
 275:	e8 b2 02 00 00       	call   52c <read>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 284:	7e 33                	jle    2b9 <gets+0x5e>
      break;
    buf[i++] = c;
 286:	8b 45 f4             	mov    -0xc(%ebp),%eax
 289:	8d 50 01             	lea    0x1(%eax),%edx
 28c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28f:	89 c2                	mov    %eax,%edx
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	01 c2                	add    %eax,%edx
 296:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 29c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a0:	3c 0a                	cmp    $0xa,%al
 2a2:	74 16                	je     2ba <gets+0x5f>
 2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a8:	3c 0d                	cmp    $0xd,%al
 2aa:	74 0e                	je     2ba <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b5:	7c b3                	jl     26a <gets+0xf>
 2b7:	eb 01                	jmp    2ba <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2b9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	01 d0                	add    %edx,%eax
 2c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <stat>:

int
stat(char *n, struct stat *st)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	6a 00                	push   $0x0
 2d5:	ff 75 08             	pushl  0x8(%ebp)
 2d8:	e8 77 02 00 00       	call   554 <open>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e7:	79 07                	jns    2f0 <stat+0x26>
    return -1;
 2e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ee:	eb 25                	jmp    315 <stat+0x4b>
  r = fstat(fd, st);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	ff 75 0c             	pushl  0xc(%ebp)
 2f6:	ff 75 f4             	pushl  -0xc(%ebp)
 2f9:	e8 6e 02 00 00       	call   56c <fstat>
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 304:	83 ec 0c             	sub    $0xc,%esp
 307:	ff 75 f4             	pushl  -0xc(%ebp)
 30a:	e8 2d 02 00 00       	call   53c <close>
 30f:	83 c4 10             	add    $0x10,%esp
  return r;
 312:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 315:	c9                   	leave  
 316:	c3                   	ret    

00000317 <atoi>:

int
atoi(const char *s)
{
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 31d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 324:	eb 04                	jmp    32a <atoi+0x13>
 326:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 32a:	8b 45 08             	mov    0x8(%ebp),%eax
 32d:	0f b6 00             	movzbl (%eax),%eax
 330:	3c 20                	cmp    $0x20,%al
 332:	74 f2                	je     326 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	3c 2d                	cmp    $0x2d,%al
 33c:	75 07                	jne    345 <atoi+0x2e>
 33e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 343:	eb 05                	jmp    34a <atoi+0x33>
 345:	b8 01 00 00 00       	mov    $0x1,%eax
 34a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 00             	movzbl (%eax),%eax
 353:	3c 2b                	cmp    $0x2b,%al
 355:	74 0a                	je     361 <atoi+0x4a>
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	0f b6 00             	movzbl (%eax),%eax
 35d:	3c 2d                	cmp    $0x2d,%al
 35f:	75 2b                	jne    38c <atoi+0x75>
    s++;
 361:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 365:	eb 25                	jmp    38c <atoi+0x75>
    n = n*10 + *s++ - '0';
 367:	8b 55 fc             	mov    -0x4(%ebp),%edx
 36a:	89 d0                	mov    %edx,%eax
 36c:	c1 e0 02             	shl    $0x2,%eax
 36f:	01 d0                	add    %edx,%eax
 371:	01 c0                	add    %eax,%eax
 373:	89 c1                	mov    %eax,%ecx
 375:	8b 45 08             	mov    0x8(%ebp),%eax
 378:	8d 50 01             	lea    0x1(%eax),%edx
 37b:	89 55 08             	mov    %edx,0x8(%ebp)
 37e:	0f b6 00             	movzbl (%eax),%eax
 381:	0f be c0             	movsbl %al,%eax
 384:	01 c8                	add    %ecx,%eax
 386:	83 e8 30             	sub    $0x30,%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	0f b6 00             	movzbl (%eax),%eax
 392:	3c 2f                	cmp    $0x2f,%al
 394:	7e 0a                	jle    3a0 <atoi+0x89>
 396:	8b 45 08             	mov    0x8(%ebp),%eax
 399:	0f b6 00             	movzbl (%eax),%eax
 39c:	3c 39                	cmp    $0x39,%al
 39e:	7e c7                	jle    367 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 3a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3a3:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 3a7:	c9                   	leave  
 3a8:	c3                   	ret    

000003a9 <atoo>:

int
atoo(const char *s)
{
 3a9:	55                   	push   %ebp
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 3af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 3b6:	eb 04                	jmp    3bc <atoo+0x13>
 3b8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3bc:	8b 45 08             	mov    0x8(%ebp),%eax
 3bf:	0f b6 00             	movzbl (%eax),%eax
 3c2:	3c 20                	cmp    $0x20,%al
 3c4:	74 f2                	je     3b8 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 3c6:	8b 45 08             	mov    0x8(%ebp),%eax
 3c9:	0f b6 00             	movzbl (%eax),%eax
 3cc:	3c 2d                	cmp    $0x2d,%al
 3ce:	75 07                	jne    3d7 <atoo+0x2e>
 3d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d5:	eb 05                	jmp    3dc <atoo+0x33>
 3d7:	b8 01 00 00 00       	mov    $0x1,%eax
 3dc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	0f b6 00             	movzbl (%eax),%eax
 3e5:	3c 2b                	cmp    $0x2b,%al
 3e7:	74 0a                	je     3f3 <atoo+0x4a>
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
 3ef:	3c 2d                	cmp    $0x2d,%al
 3f1:	75 27                	jne    41a <atoo+0x71>
    s++;
 3f3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 3f7:	eb 21                	jmp    41a <atoo+0x71>
    n = n*8 + *s++ - '0';
 3f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3fc:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	8d 50 01             	lea    0x1(%eax),%edx
 409:	89 55 08             	mov    %edx,0x8(%ebp)
 40c:	0f b6 00             	movzbl (%eax),%eax
 40f:	0f be c0             	movsbl %al,%eax
 412:	01 c8                	add    %ecx,%eax
 414:	83 e8 30             	sub    $0x30,%eax
 417:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 41a:	8b 45 08             	mov    0x8(%ebp),%eax
 41d:	0f b6 00             	movzbl (%eax),%eax
 420:	3c 2f                	cmp    $0x2f,%al
 422:	7e 0a                	jle    42e <atoo+0x85>
 424:	8b 45 08             	mov    0x8(%ebp),%eax
 427:	0f b6 00             	movzbl (%eax),%eax
 42a:	3c 37                	cmp    $0x37,%al
 42c:	7e cb                	jle    3f9 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 42e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 431:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
 440:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 443:	8b 45 0c             	mov    0xc(%ebp),%eax
 446:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 449:	eb 17                	jmp    462 <memmove+0x2b>
    *dst++ = *src++;
 44b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 44e:	8d 50 01             	lea    0x1(%eax),%edx
 451:	89 55 fc             	mov    %edx,-0x4(%ebp)
 454:	8b 55 f8             	mov    -0x8(%ebp),%edx
 457:	8d 4a 01             	lea    0x1(%edx),%ecx
 45a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 45d:	0f b6 12             	movzbl (%edx),%edx
 460:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 462:	8b 45 10             	mov    0x10(%ebp),%eax
 465:	8d 50 ff             	lea    -0x1(%eax),%edx
 468:	89 55 10             	mov    %edx,0x10(%ebp)
 46b:	85 c0                	test   %eax,%eax
 46d:	7f dc                	jg     44b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 472:	c9                   	leave  
 473:	c3                   	ret    

00000474 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 47a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 47d:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 482:	89 c8                	mov    %ecx,%eax
 484:	f7 e2                	mul    %edx
 486:	89 d0                	mov    %edx,%eax
 488:	c1 e8 06             	shr    $0x6,%eax
 48b:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 491:	29 c1                	sub    %eax,%ecx
 493:	89 c8                	mov    %ecx,%eax
 495:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 4a0:	f7 e2                	mul    %edx
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	c1 e8 06             	shr    $0x6,%eax
 4a7:	83 ec 04             	sub    $0x4,%esp
 4aa:	50                   	push   %eax
 4ab:	68 a4 0a 00 00       	push   $0xaa4
 4b0:	6a 01                	push   $0x1
 4b2:	e8 14 02 00 00       	call   6cb <printf>
 4b7:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 4ba:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 4be:	7e 17                	jle    4d7 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	ff 75 f4             	pushl  -0xc(%ebp)
 4c6:	68 a8 0a 00 00       	push   $0xaa8
 4cb:	6a 01                	push   $0x1
 4cd:	e8 f9 01 00 00       	call   6cb <printf>
 4d2:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 4d5:	eb 32                	jmp    509 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 4d7:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 4db:	7e 17                	jle    4f4 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	ff 75 f4             	pushl  -0xc(%ebp)
 4e3:	68 ab 0a 00 00       	push   $0xaab
 4e8:	6a 01                	push   $0x1
 4ea:	e8 dc 01 00 00       	call   6cb <printf>
 4ef:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 4f2:	eb 15                	jmp    509 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 4f4:	83 ec 04             	sub    $0x4,%esp
 4f7:	ff 75 f4             	pushl  -0xc(%ebp)
 4fa:	68 af 0a 00 00       	push   $0xaaf
 4ff:	6a 01                	push   $0x1
 501:	e8 c5 01 00 00       	call   6cb <printf>
 506:	83 c4 10             	add    $0x10,%esp
};
 509:	90                   	nop
 50a:	c9                   	leave  
 50b:	c3                   	ret    

0000050c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 50c:	b8 01 00 00 00       	mov    $0x1,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <exit>:
SYSCALL(exit)
 514:	b8 02 00 00 00       	mov    $0x2,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <wait>:
SYSCALL(wait)
 51c:	b8 03 00 00 00       	mov    $0x3,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <pipe>:
SYSCALL(pipe)
 524:	b8 04 00 00 00       	mov    $0x4,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <read>:
SYSCALL(read)
 52c:	b8 05 00 00 00       	mov    $0x5,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <write>:
SYSCALL(write)
 534:	b8 10 00 00 00       	mov    $0x10,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <close>:
SYSCALL(close)
 53c:	b8 15 00 00 00       	mov    $0x15,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <kill>:
SYSCALL(kill)
 544:	b8 06 00 00 00       	mov    $0x6,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <exec>:
SYSCALL(exec)
 54c:	b8 07 00 00 00       	mov    $0x7,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <open>:
SYSCALL(open)
 554:	b8 0f 00 00 00       	mov    $0xf,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <mknod>:
SYSCALL(mknod)
 55c:	b8 11 00 00 00       	mov    $0x11,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <unlink>:
SYSCALL(unlink)
 564:	b8 12 00 00 00       	mov    $0x12,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <fstat>:
SYSCALL(fstat)
 56c:	b8 08 00 00 00       	mov    $0x8,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <link>:
SYSCALL(link)
 574:	b8 13 00 00 00       	mov    $0x13,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <mkdir>:
SYSCALL(mkdir)
 57c:	b8 14 00 00 00       	mov    $0x14,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <chdir>:
SYSCALL(chdir)
 584:	b8 09 00 00 00       	mov    $0x9,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <dup>:
SYSCALL(dup)
 58c:	b8 0a 00 00 00       	mov    $0xa,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <getpid>:
SYSCALL(getpid)
 594:	b8 0b 00 00 00       	mov    $0xb,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <sbrk>:
SYSCALL(sbrk)
 59c:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <sleep>:
SYSCALL(sleep)
 5a4:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <uptime>:
SYSCALL(uptime)
 5ac:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <halt>:
SYSCALL(halt)
 5b4:	b8 16 00 00 00       	mov    $0x16,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <date>:

SYSCALL(date)
 5bc:	b8 17 00 00 00       	mov    $0x17,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <getuid>:
SYSCALL(getuid)
 5c4:	b8 18 00 00 00       	mov    $0x18,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <getgid>:
SYSCALL(getgid)
 5cc:	b8 19 00 00 00       	mov    $0x19,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <getppid>:
SYSCALL(getppid)
 5d4:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <setuid>:
SYSCALL(setuid)
 5dc:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <setgid>:
SYSCALL(setgid)
 5e4:	b8 1c 00 00 00       	mov    $0x1c,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <getprocs>:
SYSCALL(getprocs)
 5ec:	b8 1d 00 00 00       	mov    $0x1d,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	83 ec 18             	sub    $0x18,%esp
 5fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 5fd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	6a 01                	push   $0x1
 605:	8d 45 f4             	lea    -0xc(%ebp),%eax
 608:	50                   	push   %eax
 609:	ff 75 08             	pushl  0x8(%ebp)
 60c:	e8 23 ff ff ff       	call   534 <write>
 611:	83 c4 10             	add    $0x10,%esp
}
 614:	90                   	nop
 615:	c9                   	leave  
 616:	c3                   	ret    

00000617 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 617:	55                   	push   %ebp
 618:	89 e5                	mov    %esp,%ebp
 61a:	53                   	push   %ebx
 61b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 61e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 625:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 629:	74 17                	je     642 <printint+0x2b>
 62b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 62f:	79 11                	jns    642 <printint+0x2b>
    neg = 1;
 631:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 638:	8b 45 0c             	mov    0xc(%ebp),%eax
 63b:	f7 d8                	neg    %eax
 63d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 640:	eb 06                	jmp    648 <printint+0x31>
  } else {
    x = xx;
 642:	8b 45 0c             	mov    0xc(%ebp),%eax
 645:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 648:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 64f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 652:	8d 41 01             	lea    0x1(%ecx),%eax
 655:	89 45 f4             	mov    %eax,-0xc(%ebp)
 658:	8b 5d 10             	mov    0x10(%ebp),%ebx
 65b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 65e:	ba 00 00 00 00       	mov    $0x0,%edx
 663:	f7 f3                	div    %ebx
 665:	89 d0                	mov    %edx,%eax
 667:	0f b6 80 44 0d 00 00 	movzbl 0xd44(%eax),%eax
 66e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 672:	8b 5d 10             	mov    0x10(%ebp),%ebx
 675:	8b 45 ec             	mov    -0x14(%ebp),%eax
 678:	ba 00 00 00 00       	mov    $0x0,%edx
 67d:	f7 f3                	div    %ebx
 67f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 682:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 686:	75 c7                	jne    64f <printint+0x38>
  if(neg)
 688:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 68c:	74 2d                	je     6bb <printint+0xa4>
    buf[i++] = '-';
 68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 691:	8d 50 01             	lea    0x1(%eax),%edx
 694:	89 55 f4             	mov    %edx,-0xc(%ebp)
 697:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 69c:	eb 1d                	jmp    6bb <printint+0xa4>
    putc(fd, buf[i]);
 69e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a4:	01 d0                	add    %edx,%eax
 6a6:	0f b6 00             	movzbl (%eax),%eax
 6a9:	0f be c0             	movsbl %al,%eax
 6ac:	83 ec 08             	sub    $0x8,%esp
 6af:	50                   	push   %eax
 6b0:	ff 75 08             	pushl  0x8(%ebp)
 6b3:	e8 3c ff ff ff       	call   5f4 <putc>
 6b8:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6bb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c3:	79 d9                	jns    69e <printint+0x87>
    putc(fd, buf[i]);
}
 6c5:	90                   	nop
 6c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6c9:	c9                   	leave  
 6ca:	c3                   	ret    

000006cb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6cb:	55                   	push   %ebp
 6cc:	89 e5                	mov    %esp,%ebp
 6ce:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6d1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6d8:	8d 45 0c             	lea    0xc(%ebp),%eax
 6db:	83 c0 04             	add    $0x4,%eax
 6de:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6e8:	e9 59 01 00 00       	jmp    846 <printf+0x17b>
    c = fmt[i] & 0xff;
 6ed:	8b 55 0c             	mov    0xc(%ebp),%edx
 6f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f3:	01 d0                	add    %edx,%eax
 6f5:	0f b6 00             	movzbl (%eax),%eax
 6f8:	0f be c0             	movsbl %al,%eax
 6fb:	25 ff 00 00 00       	and    $0xff,%eax
 700:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 703:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 707:	75 2c                	jne    735 <printf+0x6a>
      if(c == '%'){
 709:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 70d:	75 0c                	jne    71b <printf+0x50>
        state = '%';
 70f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 716:	e9 27 01 00 00       	jmp    842 <printf+0x177>
      } else {
        putc(fd, c);
 71b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71e:	0f be c0             	movsbl %al,%eax
 721:	83 ec 08             	sub    $0x8,%esp
 724:	50                   	push   %eax
 725:	ff 75 08             	pushl  0x8(%ebp)
 728:	e8 c7 fe ff ff       	call   5f4 <putc>
 72d:	83 c4 10             	add    $0x10,%esp
 730:	e9 0d 01 00 00       	jmp    842 <printf+0x177>
      }
    } else if(state == '%'){
 735:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 739:	0f 85 03 01 00 00    	jne    842 <printf+0x177>
      if(c == 'd'){
 73f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 743:	75 1e                	jne    763 <printf+0x98>
        printint(fd, *ap, 10, 1);
 745:	8b 45 e8             	mov    -0x18(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	6a 01                	push   $0x1
 74c:	6a 0a                	push   $0xa
 74e:	50                   	push   %eax
 74f:	ff 75 08             	pushl  0x8(%ebp)
 752:	e8 c0 fe ff ff       	call   617 <printint>
 757:	83 c4 10             	add    $0x10,%esp
        ap++;
 75a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 75e:	e9 d8 00 00 00       	jmp    83b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 763:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 767:	74 06                	je     76f <printf+0xa4>
 769:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 76d:	75 1e                	jne    78d <printf+0xc2>
        printint(fd, *ap, 16, 0);
 76f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 772:	8b 00                	mov    (%eax),%eax
 774:	6a 00                	push   $0x0
 776:	6a 10                	push   $0x10
 778:	50                   	push   %eax
 779:	ff 75 08             	pushl  0x8(%ebp)
 77c:	e8 96 fe ff ff       	call   617 <printint>
 781:	83 c4 10             	add    $0x10,%esp
        ap++;
 784:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 788:	e9 ae 00 00 00       	jmp    83b <printf+0x170>
      } else if(c == 's'){
 78d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 791:	75 43                	jne    7d6 <printf+0x10b>
        s = (char*)*ap;
 793:	8b 45 e8             	mov    -0x18(%ebp),%eax
 796:	8b 00                	mov    (%eax),%eax
 798:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 79b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 79f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7a3:	75 25                	jne    7ca <printf+0xff>
          s = "(null)";
 7a5:	c7 45 f4 b4 0a 00 00 	movl   $0xab4,-0xc(%ebp)
        while(*s != 0){
 7ac:	eb 1c                	jmp    7ca <printf+0xff>
          putc(fd, *s);
 7ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b1:	0f b6 00             	movzbl (%eax),%eax
 7b4:	0f be c0             	movsbl %al,%eax
 7b7:	83 ec 08             	sub    $0x8,%esp
 7ba:	50                   	push   %eax
 7bb:	ff 75 08             	pushl  0x8(%ebp)
 7be:	e8 31 fe ff ff       	call   5f4 <putc>
 7c3:	83 c4 10             	add    $0x10,%esp
          s++;
 7c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cd:	0f b6 00             	movzbl (%eax),%eax
 7d0:	84 c0                	test   %al,%al
 7d2:	75 da                	jne    7ae <printf+0xe3>
 7d4:	eb 65                	jmp    83b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7d6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7da:	75 1d                	jne    7f9 <printf+0x12e>
        putc(fd, *ap);
 7dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	0f be c0             	movsbl %al,%eax
 7e4:	83 ec 08             	sub    $0x8,%esp
 7e7:	50                   	push   %eax
 7e8:	ff 75 08             	pushl  0x8(%ebp)
 7eb:	e8 04 fe ff ff       	call   5f4 <putc>
 7f0:	83 c4 10             	add    $0x10,%esp
        ap++;
 7f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f7:	eb 42                	jmp    83b <printf+0x170>
      } else if(c == '%'){
 7f9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7fd:	75 17                	jne    816 <printf+0x14b>
        putc(fd, c);
 7ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 802:	0f be c0             	movsbl %al,%eax
 805:	83 ec 08             	sub    $0x8,%esp
 808:	50                   	push   %eax
 809:	ff 75 08             	pushl  0x8(%ebp)
 80c:	e8 e3 fd ff ff       	call   5f4 <putc>
 811:	83 c4 10             	add    $0x10,%esp
 814:	eb 25                	jmp    83b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 816:	83 ec 08             	sub    $0x8,%esp
 819:	6a 25                	push   $0x25
 81b:	ff 75 08             	pushl  0x8(%ebp)
 81e:	e8 d1 fd ff ff       	call   5f4 <putc>
 823:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 826:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 829:	0f be c0             	movsbl %al,%eax
 82c:	83 ec 08             	sub    $0x8,%esp
 82f:	50                   	push   %eax
 830:	ff 75 08             	pushl  0x8(%ebp)
 833:	e8 bc fd ff ff       	call   5f4 <putc>
 838:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 83b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 842:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 846:	8b 55 0c             	mov    0xc(%ebp),%edx
 849:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84c:	01 d0                	add    %edx,%eax
 84e:	0f b6 00             	movzbl (%eax),%eax
 851:	84 c0                	test   %al,%al
 853:	0f 85 94 fe ff ff    	jne    6ed <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 859:	90                   	nop
 85a:	c9                   	leave  
 85b:	c3                   	ret    

0000085c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 85c:	55                   	push   %ebp
 85d:	89 e5                	mov    %esp,%ebp
 85f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 862:	8b 45 08             	mov    0x8(%ebp),%eax
 865:	83 e8 08             	sub    $0x8,%eax
 868:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86b:	a1 60 0d 00 00       	mov    0xd60,%eax
 870:	89 45 fc             	mov    %eax,-0x4(%ebp)
 873:	eb 24                	jmp    899 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 875:	8b 45 fc             	mov    -0x4(%ebp),%eax
 878:	8b 00                	mov    (%eax),%eax
 87a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 87d:	77 12                	ja     891 <free+0x35>
 87f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 882:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 885:	77 24                	ja     8ab <free+0x4f>
 887:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88a:	8b 00                	mov    (%eax),%eax
 88c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 88f:	77 1a                	ja     8ab <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	8b 45 fc             	mov    -0x4(%ebp),%eax
 894:	8b 00                	mov    (%eax),%eax
 896:	89 45 fc             	mov    %eax,-0x4(%ebp)
 899:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 89f:	76 d4                	jbe    875 <free+0x19>
 8a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a4:	8b 00                	mov    (%eax),%eax
 8a6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a9:	76 ca                	jbe    875 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ae:	8b 40 04             	mov    0x4(%eax),%eax
 8b1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bb:	01 c2                	add    %eax,%edx
 8bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c0:	8b 00                	mov    (%eax),%eax
 8c2:	39 c2                	cmp    %eax,%edx
 8c4:	75 24                	jne    8ea <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c9:	8b 50 04             	mov    0x4(%eax),%edx
 8cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cf:	8b 00                	mov    (%eax),%eax
 8d1:	8b 40 04             	mov    0x4(%eax),%eax
 8d4:	01 c2                	add    %eax,%edx
 8d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8df:	8b 00                	mov    (%eax),%eax
 8e1:	8b 10                	mov    (%eax),%edx
 8e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e6:	89 10                	mov    %edx,(%eax)
 8e8:	eb 0a                	jmp    8f4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ed:	8b 10                	mov    (%eax),%edx
 8ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f7:	8b 40 04             	mov    0x4(%eax),%eax
 8fa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 901:	8b 45 fc             	mov    -0x4(%ebp),%eax
 904:	01 d0                	add    %edx,%eax
 906:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 909:	75 20                	jne    92b <free+0xcf>
    p->s.size += bp->s.size;
 90b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90e:	8b 50 04             	mov    0x4(%eax),%edx
 911:	8b 45 f8             	mov    -0x8(%ebp),%eax
 914:	8b 40 04             	mov    0x4(%eax),%eax
 917:	01 c2                	add    %eax,%edx
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 91f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 922:	8b 10                	mov    (%eax),%edx
 924:	8b 45 fc             	mov    -0x4(%ebp),%eax
 927:	89 10                	mov    %edx,(%eax)
 929:	eb 08                	jmp    933 <free+0xd7>
  } else
    p->s.ptr = bp;
 92b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 931:	89 10                	mov    %edx,(%eax)
  freep = p;
 933:	8b 45 fc             	mov    -0x4(%ebp),%eax
 936:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 93b:	90                   	nop
 93c:	c9                   	leave  
 93d:	c3                   	ret    

0000093e <morecore>:

static Header*
morecore(uint nu)
{
 93e:	55                   	push   %ebp
 93f:	89 e5                	mov    %esp,%ebp
 941:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 944:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 94b:	77 07                	ja     954 <morecore+0x16>
    nu = 4096;
 94d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 954:	8b 45 08             	mov    0x8(%ebp),%eax
 957:	c1 e0 03             	shl    $0x3,%eax
 95a:	83 ec 0c             	sub    $0xc,%esp
 95d:	50                   	push   %eax
 95e:	e8 39 fc ff ff       	call   59c <sbrk>
 963:	83 c4 10             	add    $0x10,%esp
 966:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 969:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 96d:	75 07                	jne    976 <morecore+0x38>
    return 0;
 96f:	b8 00 00 00 00       	mov    $0x0,%eax
 974:	eb 26                	jmp    99c <morecore+0x5e>
  hp = (Header*)p;
 976:	8b 45 f4             	mov    -0xc(%ebp),%eax
 979:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 97c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97f:	8b 55 08             	mov    0x8(%ebp),%edx
 982:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 985:	8b 45 f0             	mov    -0x10(%ebp),%eax
 988:	83 c0 08             	add    $0x8,%eax
 98b:	83 ec 0c             	sub    $0xc,%esp
 98e:	50                   	push   %eax
 98f:	e8 c8 fe ff ff       	call   85c <free>
 994:	83 c4 10             	add    $0x10,%esp
  return freep;
 997:	a1 60 0d 00 00       	mov    0xd60,%eax
}
 99c:	c9                   	leave  
 99d:	c3                   	ret    

0000099e <malloc>:

void*
malloc(uint nbytes)
{
 99e:	55                   	push   %ebp
 99f:	89 e5                	mov    %esp,%ebp
 9a1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a4:	8b 45 08             	mov    0x8(%ebp),%eax
 9a7:	83 c0 07             	add    $0x7,%eax
 9aa:	c1 e8 03             	shr    $0x3,%eax
 9ad:	83 c0 01             	add    $0x1,%eax
 9b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9b3:	a1 60 0d 00 00       	mov    0xd60,%eax
 9b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9bf:	75 23                	jne    9e4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9c1:	c7 45 f0 58 0d 00 00 	movl   $0xd58,-0x10(%ebp)
 9c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cb:	a3 60 0d 00 00       	mov    %eax,0xd60
 9d0:	a1 60 0d 00 00       	mov    0xd60,%eax
 9d5:	a3 58 0d 00 00       	mov    %eax,0xd58
    base.s.size = 0;
 9da:	c7 05 5c 0d 00 00 00 	movl   $0x0,0xd5c
 9e1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e7:	8b 00                	mov    (%eax),%eax
 9e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ef:	8b 40 04             	mov    0x4(%eax),%eax
 9f2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9f5:	72 4d                	jb     a44 <malloc+0xa6>
      if(p->s.size == nunits)
 9f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fa:	8b 40 04             	mov    0x4(%eax),%eax
 9fd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a00:	75 0c                	jne    a0e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a05:	8b 10                	mov    (%eax),%edx
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	89 10                	mov    %edx,(%eax)
 a0c:	eb 26                	jmp    a34 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a11:	8b 40 04             	mov    0x4(%eax),%eax
 a14:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a17:	89 c2                	mov    %eax,%edx
 a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a22:	8b 40 04             	mov    0x4(%eax),%eax
 a25:	c1 e0 03             	shl    $0x3,%eax
 a28:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a31:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a37:	a3 60 0d 00 00       	mov    %eax,0xd60
      return (void*)(p + 1);
 a3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3f:	83 c0 08             	add    $0x8,%eax
 a42:	eb 3b                	jmp    a7f <malloc+0xe1>
    }
    if(p == freep)
 a44:	a1 60 0d 00 00       	mov    0xd60,%eax
 a49:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a4c:	75 1e                	jne    a6c <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a4e:	83 ec 0c             	sub    $0xc,%esp
 a51:	ff 75 ec             	pushl  -0x14(%ebp)
 a54:	e8 e5 fe ff ff       	call   93e <morecore>
 a59:	83 c4 10             	add    $0x10,%esp
 a5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a63:	75 07                	jne    a6c <malloc+0xce>
        return 0;
 a65:	b8 00 00 00 00       	mov    $0x0,%eax
 a6a:	eb 13                	jmp    a7f <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a75:	8b 00                	mov    (%eax),%eax
 a77:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a7a:	e9 6d ff ff ff       	jmp    9ec <malloc+0x4e>
}
 a7f:	c9                   	leave  
 a80:	c3                   	ret    
