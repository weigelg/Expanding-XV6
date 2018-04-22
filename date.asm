
_date:     file format elf32-i386


Disassembly of section .text:

00000000 <dayofweek>:
static char *days[] = {"Sun", "Mon", "Tue", "Wed",
  "Thu", "Fri", "Sat"};

int
dayofweek(int y, int m, int d)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
  return (d+=m<3?y--:y-2,23*m/9+d+4+y/4-y/100+y/400)%7;
   4:	83 7d 0c 02          	cmpl   $0x2,0xc(%ebp)
   8:	7f 0b                	jg     15 <dayofweek+0x15>
   a:	8b 45 08             	mov    0x8(%ebp),%eax
   d:	8d 50 ff             	lea    -0x1(%eax),%edx
  10:	89 55 08             	mov    %edx,0x8(%ebp)
  13:	eb 06                	jmp    1b <dayofweek+0x1b>
  15:	8b 45 08             	mov    0x8(%ebp),%eax
  18:	83 e8 02             	sub    $0x2,%eax
  1b:	01 45 10             	add    %eax,0x10(%ebp)
  1e:	8b 45 0c             	mov    0xc(%ebp),%eax
  21:	6b c8 17             	imul   $0x17,%eax,%ecx
  24:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
  29:	89 c8                	mov    %ecx,%eax
  2b:	f7 ea                	imul   %edx
  2d:	d1 fa                	sar    %edx
  2f:	89 c8                	mov    %ecx,%eax
  31:	c1 f8 1f             	sar    $0x1f,%eax
  34:	29 c2                	sub    %eax,%edx
  36:	8b 45 10             	mov    0x10(%ebp),%eax
  39:	01 d0                	add    %edx,%eax
  3b:	8d 48 04             	lea    0x4(%eax),%ecx
  3e:	8b 45 08             	mov    0x8(%ebp),%eax
  41:	8d 50 03             	lea    0x3(%eax),%edx
  44:	85 c0                	test   %eax,%eax
  46:	0f 48 c2             	cmovs  %edx,%eax
  49:	c1 f8 02             	sar    $0x2,%eax
  4c:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
  4f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  52:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  57:	89 c8                	mov    %ecx,%eax
  59:	f7 ea                	imul   %edx
  5b:	c1 fa 05             	sar    $0x5,%edx
  5e:	89 c8                	mov    %ecx,%eax
  60:	c1 f8 1f             	sar    $0x1f,%eax
  63:	29 c2                	sub    %eax,%edx
  65:	89 d0                	mov    %edx,%eax
  67:	29 c3                	sub    %eax,%ebx
  69:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6c:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  71:	89 c8                	mov    %ecx,%eax
  73:	f7 ea                	imul   %edx
  75:	c1 fa 07             	sar    $0x7,%edx
  78:	89 c8                	mov    %ecx,%eax
  7a:	c1 f8 1f             	sar    $0x1f,%eax
  7d:	29 c2                	sub    %eax,%edx
  7f:	89 d0                	mov    %edx,%eax
  81:	8d 0c 03             	lea    (%ebx,%eax,1),%ecx
  84:	ba 93 24 49 92       	mov    $0x92492493,%edx
  89:	89 c8                	mov    %ecx,%eax
  8b:	f7 ea                	imul   %edx
  8d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  90:	c1 f8 02             	sar    $0x2,%eax
  93:	89 c2                	mov    %eax,%edx
  95:	89 c8                	mov    %ecx,%eax
  97:	c1 f8 1f             	sar    $0x1f,%eax
  9a:	29 c2                	sub    %eax,%edx
  9c:	89 d0                	mov    %edx,%eax
  9e:	89 c2                	mov    %eax,%edx
  a0:	c1 e2 03             	shl    $0x3,%edx
  a3:	29 c2                	sub    %eax,%edx
  a5:	89 c8                	mov    %ecx,%eax
  a7:	29 d0                	sub    %edx,%eax
}
  a9:	5b                   	pop    %ebx
  aa:	5d                   	pop    %ebp
  ab:	c3                   	ret    

000000ac <main>:

int
main(int argc, char *argv[])
{
  ac:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  b0:	83 e4 f0             	and    $0xfffffff0,%esp
  b3:	ff 71 fc             	pushl  -0x4(%ecx)
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	51                   	push   %ecx
  ba:	83 ec 24             	sub    $0x24,%esp
  int day;
  struct rtcdate r;

  if (date(&r)) {
  bd:	83 ec 0c             	sub    $0xc,%esp
  c0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	e8 7e 05 00 00       	call   647 <date>
  c9:	83 c4 10             	add    $0x10,%esp
  cc:	85 c0                	test   %eax,%eax
  ce:	74 1b                	je     eb <main+0x3f>
    printf(2,"Error: date call failed. %s at line %d\n",
  d0:	6a 1c                	push   $0x1c
  d2:	68 5d 0b 00 00       	push   $0xb5d
  d7:	68 64 0b 00 00       	push   $0xb64
  dc:	6a 02                	push   $0x2
  de:	e8 73 06 00 00       	call   756 <printf>
  e3:	83 c4 10             	add    $0x10,%esp
	__FILE__, __LINE__);
    exit();
  e6:	e8 b4 04 00 00       	call   59f <exit>
  }

  day = dayofweek(r.year, r.month, r.day);
  eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  ee:	89 c1                	mov    %eax,%ecx
  f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  f3:	89 c2                	mov    %eax,%edx
  f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  f8:	83 ec 04             	sub    $0x4,%esp
  fb:	51                   	push   %ecx
  fc:	52                   	push   %edx
  fd:	50                   	push   %eax
  fe:	e8 fd fe ff ff       	call   0 <dayofweek>
 103:	83 c4 10             	add    $0x10,%esp
 106:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "%s %s %d", days[day], months[r.month], r.day);
 109:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 10c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 10f:	8b 14 85 80 0e 00 00 	mov    0xe80(,%eax,4),%edx
 116:	8b 45 f4             	mov    -0xc(%ebp),%eax
 119:	8b 04 85 b4 0e 00 00 	mov    0xeb4(,%eax,4),%eax
 120:	83 ec 0c             	sub    $0xc,%esp
 123:	51                   	push   %ecx
 124:	52                   	push   %edx
 125:	50                   	push   %eax
 126:	68 8c 0b 00 00       	push   $0xb8c
 12b:	6a 01                	push   $0x1
 12d:	e8 24 06 00 00       	call   756 <printf>
 132:	83 c4 20             	add    $0x20,%esp
  printf(1, " ");
 135:	83 ec 08             	sub    $0x8,%esp
 138:	68 95 0b 00 00       	push   $0xb95
 13d:	6a 01                	push   $0x1
 13f:	e8 12 06 00 00       	call   756 <printf>
 144:	83 c4 10             	add    $0x10,%esp
  if (r.hour < 10) printf(1, "0");
 147:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 14a:	83 f8 09             	cmp    $0x9,%eax
 14d:	77 12                	ja     161 <main+0xb5>
 14f:	83 ec 08             	sub    $0x8,%esp
 152:	68 97 0b 00 00       	push   $0xb97
 157:	6a 01                	push   $0x1
 159:	e8 f8 05 00 00       	call   756 <printf>
 15e:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d:", r.hour);
 161:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 164:	83 ec 04             	sub    $0x4,%esp
 167:	50                   	push   %eax
 168:	68 99 0b 00 00       	push   $0xb99
 16d:	6a 01                	push   $0x1
 16f:	e8 e2 05 00 00       	call   756 <printf>
 174:	83 c4 10             	add    $0x10,%esp
  if (r.minute < 10) printf(1, "0");
 177:	8b 45 e0             	mov    -0x20(%ebp),%eax
 17a:	83 f8 09             	cmp    $0x9,%eax
 17d:	77 12                	ja     191 <main+0xe5>
 17f:	83 ec 08             	sub    $0x8,%esp
 182:	68 97 0b 00 00       	push   $0xb97
 187:	6a 01                	push   $0x1
 189:	e8 c8 05 00 00       	call   756 <printf>
 18e:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d:", r.minute);
 191:	8b 45 e0             	mov    -0x20(%ebp),%eax
 194:	83 ec 04             	sub    $0x4,%esp
 197:	50                   	push   %eax
 198:	68 99 0b 00 00       	push   $0xb99
 19d:	6a 01                	push   $0x1
 19f:	e8 b2 05 00 00       	call   756 <printf>
 1a4:	83 c4 10             	add    $0x10,%esp
  if (r.second < 10) printf(1, "0");
 1a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
 1aa:	83 f8 09             	cmp    $0x9,%eax
 1ad:	77 12                	ja     1c1 <main+0x115>
 1af:	83 ec 08             	sub    $0x8,%esp
 1b2:	68 97 0b 00 00       	push   $0xb97
 1b7:	6a 01                	push   $0x1
 1b9:	e8 98 05 00 00       	call   756 <printf>
 1be:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d UTC %d\n", r.second, r.year);
 1c1:	8b 55 f0             	mov    -0x10(%ebp),%edx
 1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
 1c7:	52                   	push   %edx
 1c8:	50                   	push   %eax
 1c9:	68 9d 0b 00 00       	push   $0xb9d
 1ce:	6a 01                	push   $0x1
 1d0:	e8 81 05 00 00       	call   756 <printf>
 1d5:	83 c4 10             	add    $0x10,%esp

  exit();
 1d8:	e8 c2 03 00 00       	call   59f <exit>

000001dd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	57                   	push   %edi
 1e1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e5:	8b 55 10             	mov    0x10(%ebp),%edx
 1e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1eb:	89 cb                	mov    %ecx,%ebx
 1ed:	89 df                	mov    %ebx,%edi
 1ef:	89 d1                	mov    %edx,%ecx
 1f1:	fc                   	cld    
 1f2:	f3 aa                	rep stos %al,%es:(%edi)
 1f4:	89 ca                	mov    %ecx,%edx
 1f6:	89 fb                	mov    %edi,%ebx
 1f8:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1fb:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fe:	90                   	nop
 1ff:	5b                   	pop    %ebx
 200:	5f                   	pop    %edi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20f:	90                   	nop
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	89 55 08             	mov    %edx,0x8(%ebp)
 219:	8b 55 0c             	mov    0xc(%ebp),%edx
 21c:	8d 4a 01             	lea    0x1(%edx),%ecx
 21f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 222:	0f b6 12             	movzbl (%edx),%edx
 225:	88 10                	mov    %dl,(%eax)
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	84 c0                	test   %al,%al
 22c:	75 e2                	jne    210 <strcpy+0xd>
    ;
  return os;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 236:	eb 08                	jmp    240 <strcmp+0xd>
    p++, q++;
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	0f b6 00             	movzbl (%eax),%eax
 246:	84 c0                	test   %al,%al
 248:	74 10                	je     25a <strcmp+0x27>
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 10             	movzbl (%eax),%edx
 250:	8b 45 0c             	mov    0xc(%ebp),%eax
 253:	0f b6 00             	movzbl (%eax),%eax
 256:	38 c2                	cmp    %al,%dl
 258:	74 de                	je     238 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	0f b6 d0             	movzbl %al,%edx
 263:	8b 45 0c             	mov    0xc(%ebp),%eax
 266:	0f b6 00             	movzbl (%eax),%eax
 269:	0f b6 c0             	movzbl %al,%eax
 26c:	29 c2                	sub    %eax,%edx
 26e:	89 d0                	mov    %edx,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strlen>:

uint
strlen(char *s)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 278:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27f:	eb 04                	jmp    285 <strlen+0x13>
 281:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 285:	8b 55 fc             	mov    -0x4(%ebp),%edx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	01 d0                	add    %edx,%eax
 28d:	0f b6 00             	movzbl (%eax),%eax
 290:	84 c0                	test   %al,%al
 292:	75 ed                	jne    281 <strlen+0xf>
    ;
  return n;
 294:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 297:	c9                   	leave  
 298:	c3                   	ret    

00000299 <memset>:

void*
memset(void *dst, int c, uint n)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 29c:	8b 45 10             	mov    0x10(%ebp),%eax
 29f:	50                   	push   %eax
 2a0:	ff 75 0c             	pushl  0xc(%ebp)
 2a3:	ff 75 08             	pushl  0x8(%ebp)
 2a6:	e8 32 ff ff ff       	call   1dd <stosb>
 2ab:	83 c4 0c             	add    $0xc,%esp
  return dst;
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b1:	c9                   	leave  
 2b2:	c3                   	ret    

000002b3 <strchr>:

char*
strchr(const char *s, char c)
{
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	83 ec 04             	sub    $0x4,%esp
 2b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bc:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2bf:	eb 14                	jmp    2d5 <strchr+0x22>
    if(*s == c)
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
 2c4:	0f b6 00             	movzbl (%eax),%eax
 2c7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2ca:	75 05                	jne    2d1 <strchr+0x1e>
      return (char*)s;
 2cc:	8b 45 08             	mov    0x8(%ebp),%eax
 2cf:	eb 13                	jmp    2e4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	0f b6 00             	movzbl (%eax),%eax
 2db:	84 c0                	test   %al,%al
 2dd:	75 e2                	jne    2c1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e4:	c9                   	leave  
 2e5:	c3                   	ret    

000002e6 <gets>:

char*
gets(char *buf, int max)
{
 2e6:	55                   	push   %ebp
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f3:	eb 42                	jmp    337 <gets+0x51>
    cc = read(0, &c, 1);
 2f5:	83 ec 04             	sub    $0x4,%esp
 2f8:	6a 01                	push   $0x1
 2fa:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2fd:	50                   	push   %eax
 2fe:	6a 00                	push   $0x0
 300:	e8 b2 02 00 00       	call   5b7 <read>
 305:	83 c4 10             	add    $0x10,%esp
 308:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 30b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 30f:	7e 33                	jle    344 <gets+0x5e>
      break;
    buf[i++] = c;
 311:	8b 45 f4             	mov    -0xc(%ebp),%eax
 314:	8d 50 01             	lea    0x1(%eax),%edx
 317:	89 55 f4             	mov    %edx,-0xc(%ebp)
 31a:	89 c2                	mov    %eax,%edx
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
 31f:	01 c2                	add    %eax,%edx
 321:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 325:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 327:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 32b:	3c 0a                	cmp    $0xa,%al
 32d:	74 16                	je     345 <gets+0x5f>
 32f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 333:	3c 0d                	cmp    $0xd,%al
 335:	74 0e                	je     345 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 337:	8b 45 f4             	mov    -0xc(%ebp),%eax
 33a:	83 c0 01             	add    $0x1,%eax
 33d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 340:	7c b3                	jl     2f5 <gets+0xf>
 342:	eb 01                	jmp    345 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 344:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 345:	8b 55 f4             	mov    -0xc(%ebp),%edx
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	01 d0                	add    %edx,%eax
 34d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 350:	8b 45 08             	mov    0x8(%ebp),%eax
}
 353:	c9                   	leave  
 354:	c3                   	ret    

00000355 <stat>:

int
stat(char *n, struct stat *st)
{
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
 358:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 35b:	83 ec 08             	sub    $0x8,%esp
 35e:	6a 00                	push   $0x0
 360:	ff 75 08             	pushl  0x8(%ebp)
 363:	e8 77 02 00 00       	call   5df <open>
 368:	83 c4 10             	add    $0x10,%esp
 36b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 36e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 372:	79 07                	jns    37b <stat+0x26>
    return -1;
 374:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 379:	eb 25                	jmp    3a0 <stat+0x4b>
  r = fstat(fd, st);
 37b:	83 ec 08             	sub    $0x8,%esp
 37e:	ff 75 0c             	pushl  0xc(%ebp)
 381:	ff 75 f4             	pushl  -0xc(%ebp)
 384:	e8 6e 02 00 00       	call   5f7 <fstat>
 389:	83 c4 10             	add    $0x10,%esp
 38c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 38f:	83 ec 0c             	sub    $0xc,%esp
 392:	ff 75 f4             	pushl  -0xc(%ebp)
 395:	e8 2d 02 00 00       	call   5c7 <close>
 39a:	83 c4 10             	add    $0x10,%esp
  return r;
 39d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3a0:	c9                   	leave  
 3a1:	c3                   	ret    

000003a2 <atoi>:

int
atoi(const char *s)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 3a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 3af:	eb 04                	jmp    3b5 <atoi+0x13>
 3b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	0f b6 00             	movzbl (%eax),%eax
 3bb:	3c 20                	cmp    $0x20,%al
 3bd:	74 f2                	je     3b1 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	0f b6 00             	movzbl (%eax),%eax
 3c5:	3c 2d                	cmp    $0x2d,%al
 3c7:	75 07                	jne    3d0 <atoi+0x2e>
 3c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ce:	eb 05                	jmp    3d5 <atoi+0x33>
 3d0:	b8 01 00 00 00       	mov    $0x1,%eax
 3d5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
 3db:	0f b6 00             	movzbl (%eax),%eax
 3de:	3c 2b                	cmp    $0x2b,%al
 3e0:	74 0a                	je     3ec <atoi+0x4a>
 3e2:	8b 45 08             	mov    0x8(%ebp),%eax
 3e5:	0f b6 00             	movzbl (%eax),%eax
 3e8:	3c 2d                	cmp    $0x2d,%al
 3ea:	75 2b                	jne    417 <atoi+0x75>
    s++;
 3ec:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 3f0:	eb 25                	jmp    417 <atoi+0x75>
    n = n*10 + *s++ - '0';
 3f2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f5:	89 d0                	mov    %edx,%eax
 3f7:	c1 e0 02             	shl    $0x2,%eax
 3fa:	01 d0                	add    %edx,%eax
 3fc:	01 c0                	add    %eax,%eax
 3fe:	89 c1                	mov    %eax,%ecx
 400:	8b 45 08             	mov    0x8(%ebp),%eax
 403:	8d 50 01             	lea    0x1(%eax),%edx
 406:	89 55 08             	mov    %edx,0x8(%ebp)
 409:	0f b6 00             	movzbl (%eax),%eax
 40c:	0f be c0             	movsbl %al,%eax
 40f:	01 c8                	add    %ecx,%eax
 411:	83 e8 30             	sub    $0x30,%eax
 414:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	0f b6 00             	movzbl (%eax),%eax
 41d:	3c 2f                	cmp    $0x2f,%al
 41f:	7e 0a                	jle    42b <atoi+0x89>
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	0f b6 00             	movzbl (%eax),%eax
 427:	3c 39                	cmp    $0x39,%al
 429:	7e c7                	jle    3f2 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 42b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 42e:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 432:	c9                   	leave  
 433:	c3                   	ret    

00000434 <atoo>:

int
atoo(const char *s)
{
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 43a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 441:	eb 04                	jmp    447 <atoo+0x13>
 443:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	0f b6 00             	movzbl (%eax),%eax
 44d:	3c 20                	cmp    $0x20,%al
 44f:	74 f2                	je     443 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 451:	8b 45 08             	mov    0x8(%ebp),%eax
 454:	0f b6 00             	movzbl (%eax),%eax
 457:	3c 2d                	cmp    $0x2d,%al
 459:	75 07                	jne    462 <atoo+0x2e>
 45b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 460:	eb 05                	jmp    467 <atoo+0x33>
 462:	b8 01 00 00 00       	mov    $0x1,%eax
 467:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	0f b6 00             	movzbl (%eax),%eax
 470:	3c 2b                	cmp    $0x2b,%al
 472:	74 0a                	je     47e <atoo+0x4a>
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	0f b6 00             	movzbl (%eax),%eax
 47a:	3c 2d                	cmp    $0x2d,%al
 47c:	75 27                	jne    4a5 <atoo+0x71>
    s++;
 47e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 482:	eb 21                	jmp    4a5 <atoo+0x71>
    n = n*8 + *s++ - '0';
 484:	8b 45 fc             	mov    -0x4(%ebp),%eax
 487:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	8d 50 01             	lea    0x1(%eax),%edx
 494:	89 55 08             	mov    %edx,0x8(%ebp)
 497:	0f b6 00             	movzbl (%eax),%eax
 49a:	0f be c0             	movsbl %al,%eax
 49d:	01 c8                	add    %ecx,%eax
 49f:	83 e8 30             	sub    $0x30,%eax
 4a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	0f b6 00             	movzbl (%eax),%eax
 4ab:	3c 2f                	cmp    $0x2f,%al
 4ad:	7e 0a                	jle    4b9 <atoo+0x85>
 4af:	8b 45 08             	mov    0x8(%ebp),%eax
 4b2:	0f b6 00             	movzbl (%eax),%eax
 4b5:	3c 37                	cmp    $0x37,%al
 4b7:	7e cb                	jle    484 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 4b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 4bc:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 4c0:	c9                   	leave  
 4c1:	c3                   	ret    

000004c2 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 4c2:	55                   	push   %ebp
 4c3:	89 e5                	mov    %esp,%ebp
 4c5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4d4:	eb 17                	jmp    4ed <memmove+0x2b>
    *dst++ = *src++;
 4d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4d9:	8d 50 01             	lea    0x1(%eax),%edx
 4dc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4df:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4e2:	8d 4a 01             	lea    0x1(%edx),%ecx
 4e5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4e8:	0f b6 12             	movzbl (%edx),%edx
 4eb:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ed:	8b 45 10             	mov    0x10(%ebp),%eax
 4f0:	8d 50 ff             	lea    -0x1(%eax),%edx
 4f3:	89 55 10             	mov    %edx,0x10(%ebp)
 4f6:	85 c0                	test   %eax,%eax
 4f8:	7f dc                	jg     4d6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4fd:	c9                   	leave  
 4fe:	c3                   	ret    

000004ff <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 4ff:	55                   	push   %ebp
 500:	89 e5                	mov    %esp,%ebp
 502:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 505:	8b 4d 08             	mov    0x8(%ebp),%ecx
 508:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 50d:	89 c8                	mov    %ecx,%eax
 50f:	f7 e2                	mul    %edx
 511:	89 d0                	mov    %edx,%eax
 513:	c1 e8 06             	shr    $0x6,%eax
 516:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 51c:	29 c1                	sub    %eax,%ecx
 51e:	89 c8                	mov    %ecx,%eax
 520:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 52b:	f7 e2                	mul    %edx
 52d:	89 d0                	mov    %edx,%eax
 52f:	c1 e8 06             	shr    $0x6,%eax
 532:	83 ec 04             	sub    $0x4,%esp
 535:	50                   	push   %eax
 536:	68 a8 0b 00 00       	push   $0xba8
 53b:	6a 01                	push   $0x1
 53d:	e8 14 02 00 00       	call   756 <printf>
 542:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 545:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 549:	7e 17                	jle    562 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 54b:	83 ec 04             	sub    $0x4,%esp
 54e:	ff 75 f4             	pushl  -0xc(%ebp)
 551:	68 ac 0b 00 00       	push   $0xbac
 556:	6a 01                	push   $0x1
 558:	e8 f9 01 00 00       	call   756 <printf>
 55d:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 560:	eb 32                	jmp    594 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 562:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 566:	7e 17                	jle    57f <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 568:	83 ec 04             	sub    $0x4,%esp
 56b:	ff 75 f4             	pushl  -0xc(%ebp)
 56e:	68 af 0b 00 00       	push   $0xbaf
 573:	6a 01                	push   $0x1
 575:	e8 dc 01 00 00       	call   756 <printf>
 57a:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 57d:	eb 15                	jmp    594 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 57f:	83 ec 04             	sub    $0x4,%esp
 582:	ff 75 f4             	pushl  -0xc(%ebp)
 585:	68 b3 0b 00 00       	push   $0xbb3
 58a:	6a 01                	push   $0x1
 58c:	e8 c5 01 00 00       	call   756 <printf>
 591:	83 c4 10             	add    $0x10,%esp
};
 594:	90                   	nop
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 597:	b8 01 00 00 00       	mov    $0x1,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <exit>:
SYSCALL(exit)
 59f:	b8 02 00 00 00       	mov    $0x2,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <wait>:
SYSCALL(wait)
 5a7:	b8 03 00 00 00       	mov    $0x3,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <pipe>:
SYSCALL(pipe)
 5af:	b8 04 00 00 00       	mov    $0x4,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <read>:
SYSCALL(read)
 5b7:	b8 05 00 00 00       	mov    $0x5,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <write>:
SYSCALL(write)
 5bf:	b8 10 00 00 00       	mov    $0x10,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <close>:
SYSCALL(close)
 5c7:	b8 15 00 00 00       	mov    $0x15,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <kill>:
SYSCALL(kill)
 5cf:	b8 06 00 00 00       	mov    $0x6,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <exec>:
SYSCALL(exec)
 5d7:	b8 07 00 00 00       	mov    $0x7,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <open>:
SYSCALL(open)
 5df:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <mknod>:
SYSCALL(mknod)
 5e7:	b8 11 00 00 00       	mov    $0x11,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <unlink>:
SYSCALL(unlink)
 5ef:	b8 12 00 00 00       	mov    $0x12,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <fstat>:
SYSCALL(fstat)
 5f7:	b8 08 00 00 00       	mov    $0x8,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <link>:
SYSCALL(link)
 5ff:	b8 13 00 00 00       	mov    $0x13,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <mkdir>:
SYSCALL(mkdir)
 607:	b8 14 00 00 00       	mov    $0x14,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <chdir>:
SYSCALL(chdir)
 60f:	b8 09 00 00 00       	mov    $0x9,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <dup>:
SYSCALL(dup)
 617:	b8 0a 00 00 00       	mov    $0xa,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret    

0000061f <getpid>:
SYSCALL(getpid)
 61f:	b8 0b 00 00 00       	mov    $0xb,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret    

00000627 <sbrk>:
SYSCALL(sbrk)
 627:	b8 0c 00 00 00       	mov    $0xc,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret    

0000062f <sleep>:
SYSCALL(sleep)
 62f:	b8 0d 00 00 00       	mov    $0xd,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <uptime>:
SYSCALL(uptime)
 637:	b8 0e 00 00 00       	mov    $0xe,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <halt>:
SYSCALL(halt)
 63f:	b8 16 00 00 00       	mov    $0x16,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <date>:

SYSCALL(date)
 647:	b8 17 00 00 00       	mov    $0x17,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <getuid>:
SYSCALL(getuid)
 64f:	b8 18 00 00 00       	mov    $0x18,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <getgid>:
SYSCALL(getgid)
 657:	b8 19 00 00 00       	mov    $0x19,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <getppid>:
SYSCALL(getppid)
 65f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <setuid>:
SYSCALL(setuid)
 667:	b8 1b 00 00 00       	mov    $0x1b,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <setgid>:
SYSCALL(setgid)
 66f:	b8 1c 00 00 00       	mov    $0x1c,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret    

00000677 <getprocs>:
SYSCALL(getprocs)
 677:	b8 1d 00 00 00       	mov    $0x1d,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret    

0000067f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 67f:	55                   	push   %ebp
 680:	89 e5                	mov    %esp,%ebp
 682:	83 ec 18             	sub    $0x18,%esp
 685:	8b 45 0c             	mov    0xc(%ebp),%eax
 688:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	6a 01                	push   $0x1
 690:	8d 45 f4             	lea    -0xc(%ebp),%eax
 693:	50                   	push   %eax
 694:	ff 75 08             	pushl  0x8(%ebp)
 697:	e8 23 ff ff ff       	call   5bf <write>
 69c:	83 c4 10             	add    $0x10,%esp
}
 69f:	90                   	nop
 6a0:	c9                   	leave  
 6a1:	c3                   	ret    

000006a2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6a2:	55                   	push   %ebp
 6a3:	89 e5                	mov    %esp,%ebp
 6a5:	53                   	push   %ebx
 6a6:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6a9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6b0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6b4:	74 17                	je     6cd <printint+0x2b>
 6b6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6ba:	79 11                	jns    6cd <printint+0x2b>
    neg = 1;
 6bc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c6:	f7 d8                	neg    %eax
 6c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6cb:	eb 06                	jmp    6d3 <printint+0x31>
  } else {
    x = xx;
 6cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6da:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6dd:	8d 41 01             	lea    0x1(%ecx),%eax
 6e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6e3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e9:	ba 00 00 00 00       	mov    $0x0,%edx
 6ee:	f7 f3                	div    %ebx
 6f0:	89 d0                	mov    %edx,%eax
 6f2:	0f b6 80 d0 0e 00 00 	movzbl 0xed0(%eax),%eax
 6f9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6fd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 700:	8b 45 ec             	mov    -0x14(%ebp),%eax
 703:	ba 00 00 00 00       	mov    $0x0,%edx
 708:	f7 f3                	div    %ebx
 70a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 70d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 711:	75 c7                	jne    6da <printint+0x38>
  if(neg)
 713:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 717:	74 2d                	je     746 <printint+0xa4>
    buf[i++] = '-';
 719:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71c:	8d 50 01             	lea    0x1(%eax),%edx
 71f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 722:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 727:	eb 1d                	jmp    746 <printint+0xa4>
    putc(fd, buf[i]);
 729:	8d 55 dc             	lea    -0x24(%ebp),%edx
 72c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72f:	01 d0                	add    %edx,%eax
 731:	0f b6 00             	movzbl (%eax),%eax
 734:	0f be c0             	movsbl %al,%eax
 737:	83 ec 08             	sub    $0x8,%esp
 73a:	50                   	push   %eax
 73b:	ff 75 08             	pushl  0x8(%ebp)
 73e:	e8 3c ff ff ff       	call   67f <putc>
 743:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 746:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 74a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 74e:	79 d9                	jns    729 <printint+0x87>
    putc(fd, buf[i]);
}
 750:	90                   	nop
 751:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 754:	c9                   	leave  
 755:	c3                   	ret    

00000756 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 756:	55                   	push   %ebp
 757:	89 e5                	mov    %esp,%ebp
 759:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 75c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 763:	8d 45 0c             	lea    0xc(%ebp),%eax
 766:	83 c0 04             	add    $0x4,%eax
 769:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 76c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 773:	e9 59 01 00 00       	jmp    8d1 <printf+0x17b>
    c = fmt[i] & 0xff;
 778:	8b 55 0c             	mov    0xc(%ebp),%edx
 77b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77e:	01 d0                	add    %edx,%eax
 780:	0f b6 00             	movzbl (%eax),%eax
 783:	0f be c0             	movsbl %al,%eax
 786:	25 ff 00 00 00       	and    $0xff,%eax
 78b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 78e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 792:	75 2c                	jne    7c0 <printf+0x6a>
      if(c == '%'){
 794:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 798:	75 0c                	jne    7a6 <printf+0x50>
        state = '%';
 79a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7a1:	e9 27 01 00 00       	jmp    8cd <printf+0x177>
      } else {
        putc(fd, c);
 7a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a9:	0f be c0             	movsbl %al,%eax
 7ac:	83 ec 08             	sub    $0x8,%esp
 7af:	50                   	push   %eax
 7b0:	ff 75 08             	pushl  0x8(%ebp)
 7b3:	e8 c7 fe ff ff       	call   67f <putc>
 7b8:	83 c4 10             	add    $0x10,%esp
 7bb:	e9 0d 01 00 00       	jmp    8cd <printf+0x177>
      }
    } else if(state == '%'){
 7c0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7c4:	0f 85 03 01 00 00    	jne    8cd <printf+0x177>
      if(c == 'd'){
 7ca:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7ce:	75 1e                	jne    7ee <printf+0x98>
        printint(fd, *ap, 10, 1);
 7d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	6a 01                	push   $0x1
 7d7:	6a 0a                	push   $0xa
 7d9:	50                   	push   %eax
 7da:	ff 75 08             	pushl  0x8(%ebp)
 7dd:	e8 c0 fe ff ff       	call   6a2 <printint>
 7e2:	83 c4 10             	add    $0x10,%esp
        ap++;
 7e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e9:	e9 d8 00 00 00       	jmp    8c6 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7ee:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7f2:	74 06                	je     7fa <printf+0xa4>
 7f4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7f8:	75 1e                	jne    818 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7fd:	8b 00                	mov    (%eax),%eax
 7ff:	6a 00                	push   $0x0
 801:	6a 10                	push   $0x10
 803:	50                   	push   %eax
 804:	ff 75 08             	pushl  0x8(%ebp)
 807:	e8 96 fe ff ff       	call   6a2 <printint>
 80c:	83 c4 10             	add    $0x10,%esp
        ap++;
 80f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 813:	e9 ae 00 00 00       	jmp    8c6 <printf+0x170>
      } else if(c == 's'){
 818:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 81c:	75 43                	jne    861 <printf+0x10b>
        s = (char*)*ap;
 81e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 821:	8b 00                	mov    (%eax),%eax
 823:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 826:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 82a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 82e:	75 25                	jne    855 <printf+0xff>
          s = "(null)";
 830:	c7 45 f4 b8 0b 00 00 	movl   $0xbb8,-0xc(%ebp)
        while(*s != 0){
 837:	eb 1c                	jmp    855 <printf+0xff>
          putc(fd, *s);
 839:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83c:	0f b6 00             	movzbl (%eax),%eax
 83f:	0f be c0             	movsbl %al,%eax
 842:	83 ec 08             	sub    $0x8,%esp
 845:	50                   	push   %eax
 846:	ff 75 08             	pushl  0x8(%ebp)
 849:	e8 31 fe ff ff       	call   67f <putc>
 84e:	83 c4 10             	add    $0x10,%esp
          s++;
 851:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 855:	8b 45 f4             	mov    -0xc(%ebp),%eax
 858:	0f b6 00             	movzbl (%eax),%eax
 85b:	84 c0                	test   %al,%al
 85d:	75 da                	jne    839 <printf+0xe3>
 85f:	eb 65                	jmp    8c6 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 861:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 865:	75 1d                	jne    884 <printf+0x12e>
        putc(fd, *ap);
 867:	8b 45 e8             	mov    -0x18(%ebp),%eax
 86a:	8b 00                	mov    (%eax),%eax
 86c:	0f be c0             	movsbl %al,%eax
 86f:	83 ec 08             	sub    $0x8,%esp
 872:	50                   	push   %eax
 873:	ff 75 08             	pushl  0x8(%ebp)
 876:	e8 04 fe ff ff       	call   67f <putc>
 87b:	83 c4 10             	add    $0x10,%esp
        ap++;
 87e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 882:	eb 42                	jmp    8c6 <printf+0x170>
      } else if(c == '%'){
 884:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 888:	75 17                	jne    8a1 <printf+0x14b>
        putc(fd, c);
 88a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88d:	0f be c0             	movsbl %al,%eax
 890:	83 ec 08             	sub    $0x8,%esp
 893:	50                   	push   %eax
 894:	ff 75 08             	pushl  0x8(%ebp)
 897:	e8 e3 fd ff ff       	call   67f <putc>
 89c:	83 c4 10             	add    $0x10,%esp
 89f:	eb 25                	jmp    8c6 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8a1:	83 ec 08             	sub    $0x8,%esp
 8a4:	6a 25                	push   $0x25
 8a6:	ff 75 08             	pushl  0x8(%ebp)
 8a9:	e8 d1 fd ff ff       	call   67f <putc>
 8ae:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 8b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8b4:	0f be c0             	movsbl %al,%eax
 8b7:	83 ec 08             	sub    $0x8,%esp
 8ba:	50                   	push   %eax
 8bb:	ff 75 08             	pushl  0x8(%ebp)
 8be:	e8 bc fd ff ff       	call   67f <putc>
 8c3:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8c6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8cd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8d1:	8b 55 0c             	mov    0xc(%ebp),%edx
 8d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d7:	01 d0                	add    %edx,%eax
 8d9:	0f b6 00             	movzbl (%eax),%eax
 8dc:	84 c0                	test   %al,%al
 8de:	0f 85 94 fe ff ff    	jne    778 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8e4:	90                   	nop
 8e5:	c9                   	leave  
 8e6:	c3                   	ret    

000008e7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8e7:	55                   	push   %ebp
 8e8:	89 e5                	mov    %esp,%ebp
 8ea:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8ed:	8b 45 08             	mov    0x8(%ebp),%eax
 8f0:	83 e8 08             	sub    $0x8,%eax
 8f3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f6:	a1 ec 0e 00 00       	mov    0xeec,%eax
 8fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8fe:	eb 24                	jmp    924 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	8b 00                	mov    (%eax),%eax
 905:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 908:	77 12                	ja     91c <free+0x35>
 90a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 910:	77 24                	ja     936 <free+0x4f>
 912:	8b 45 fc             	mov    -0x4(%ebp),%eax
 915:	8b 00                	mov    (%eax),%eax
 917:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 91a:	77 1a                	ja     936 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91f:	8b 00                	mov    (%eax),%eax
 921:	89 45 fc             	mov    %eax,-0x4(%ebp)
 924:	8b 45 f8             	mov    -0x8(%ebp),%eax
 927:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 92a:	76 d4                	jbe    900 <free+0x19>
 92c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 934:	76 ca                	jbe    900 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 936:	8b 45 f8             	mov    -0x8(%ebp),%eax
 939:	8b 40 04             	mov    0x4(%eax),%eax
 93c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 943:	8b 45 f8             	mov    -0x8(%ebp),%eax
 946:	01 c2                	add    %eax,%edx
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	8b 00                	mov    (%eax),%eax
 94d:	39 c2                	cmp    %eax,%edx
 94f:	75 24                	jne    975 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 951:	8b 45 f8             	mov    -0x8(%ebp),%eax
 954:	8b 50 04             	mov    0x4(%eax),%edx
 957:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95a:	8b 00                	mov    (%eax),%eax
 95c:	8b 40 04             	mov    0x4(%eax),%eax
 95f:	01 c2                	add    %eax,%edx
 961:	8b 45 f8             	mov    -0x8(%ebp),%eax
 964:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 967:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96a:	8b 00                	mov    (%eax),%eax
 96c:	8b 10                	mov    (%eax),%edx
 96e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 971:	89 10                	mov    %edx,(%eax)
 973:	eb 0a                	jmp    97f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 975:	8b 45 fc             	mov    -0x4(%ebp),%eax
 978:	8b 10                	mov    (%eax),%edx
 97a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 97f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 982:	8b 40 04             	mov    0x4(%eax),%eax
 985:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 98c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98f:	01 d0                	add    %edx,%eax
 991:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 994:	75 20                	jne    9b6 <free+0xcf>
    p->s.size += bp->s.size;
 996:	8b 45 fc             	mov    -0x4(%ebp),%eax
 999:	8b 50 04             	mov    0x4(%eax),%edx
 99c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99f:	8b 40 04             	mov    0x4(%eax),%eax
 9a2:	01 c2                	add    %eax,%edx
 9a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ad:	8b 10                	mov    (%eax),%edx
 9af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b2:	89 10                	mov    %edx,(%eax)
 9b4:	eb 08                	jmp    9be <free+0xd7>
  } else
    p->s.ptr = bp;
 9b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9bc:	89 10                	mov    %edx,(%eax)
  freep = p;
 9be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c1:	a3 ec 0e 00 00       	mov    %eax,0xeec
}
 9c6:	90                   	nop
 9c7:	c9                   	leave  
 9c8:	c3                   	ret    

000009c9 <morecore>:

static Header*
morecore(uint nu)
{
 9c9:	55                   	push   %ebp
 9ca:	89 e5                	mov    %esp,%ebp
 9cc:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9cf:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9d6:	77 07                	ja     9df <morecore+0x16>
    nu = 4096;
 9d8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9df:	8b 45 08             	mov    0x8(%ebp),%eax
 9e2:	c1 e0 03             	shl    $0x3,%eax
 9e5:	83 ec 0c             	sub    $0xc,%esp
 9e8:	50                   	push   %eax
 9e9:	e8 39 fc ff ff       	call   627 <sbrk>
 9ee:	83 c4 10             	add    $0x10,%esp
 9f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9f4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9f8:	75 07                	jne    a01 <morecore+0x38>
    return 0;
 9fa:	b8 00 00 00 00       	mov    $0x0,%eax
 9ff:	eb 26                	jmp    a27 <morecore+0x5e>
  hp = (Header*)p;
 a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a04:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	8b 55 08             	mov    0x8(%ebp),%edx
 a0d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a10:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a13:	83 c0 08             	add    $0x8,%eax
 a16:	83 ec 0c             	sub    $0xc,%esp
 a19:	50                   	push   %eax
 a1a:	e8 c8 fe ff ff       	call   8e7 <free>
 a1f:	83 c4 10             	add    $0x10,%esp
  return freep;
 a22:	a1 ec 0e 00 00       	mov    0xeec,%eax
}
 a27:	c9                   	leave  
 a28:	c3                   	ret    

00000a29 <malloc>:

void*
malloc(uint nbytes)
{
 a29:	55                   	push   %ebp
 a2a:	89 e5                	mov    %esp,%ebp
 a2c:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a2f:	8b 45 08             	mov    0x8(%ebp),%eax
 a32:	83 c0 07             	add    $0x7,%eax
 a35:	c1 e8 03             	shr    $0x3,%eax
 a38:	83 c0 01             	add    $0x1,%eax
 a3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a3e:	a1 ec 0e 00 00       	mov    0xeec,%eax
 a43:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a46:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a4a:	75 23                	jne    a6f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a4c:	c7 45 f0 e4 0e 00 00 	movl   $0xee4,-0x10(%ebp)
 a53:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a56:	a3 ec 0e 00 00       	mov    %eax,0xeec
 a5b:	a1 ec 0e 00 00       	mov    0xeec,%eax
 a60:	a3 e4 0e 00 00       	mov    %eax,0xee4
    base.s.size = 0;
 a65:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 a6c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a72:	8b 00                	mov    (%eax),%eax
 a74:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7a:	8b 40 04             	mov    0x4(%eax),%eax
 a7d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a80:	72 4d                	jb     acf <malloc+0xa6>
      if(p->s.size == nunits)
 a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a85:	8b 40 04             	mov    0x4(%eax),%eax
 a88:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a8b:	75 0c                	jne    a99 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a90:	8b 10                	mov    (%eax),%edx
 a92:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a95:	89 10                	mov    %edx,(%eax)
 a97:	eb 26                	jmp    abf <malloc+0x96>
      else {
        p->s.size -= nunits;
 a99:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9c:	8b 40 04             	mov    0x4(%eax),%eax
 a9f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 aa2:	89 c2                	mov    %eax,%edx
 aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aad:	8b 40 04             	mov    0x4(%eax),%eax
 ab0:	c1 e0 03             	shl    $0x3,%eax
 ab3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab9:	8b 55 ec             	mov    -0x14(%ebp),%edx
 abc:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 abf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac2:	a3 ec 0e 00 00       	mov    %eax,0xeec
      return (void*)(p + 1);
 ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aca:	83 c0 08             	add    $0x8,%eax
 acd:	eb 3b                	jmp    b0a <malloc+0xe1>
    }
    if(p == freep)
 acf:	a1 ec 0e 00 00       	mov    0xeec,%eax
 ad4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ad7:	75 1e                	jne    af7 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 ad9:	83 ec 0c             	sub    $0xc,%esp
 adc:	ff 75 ec             	pushl  -0x14(%ebp)
 adf:	e8 e5 fe ff ff       	call   9c9 <morecore>
 ae4:	83 c4 10             	add    $0x10,%esp
 ae7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 aee:	75 07                	jne    af7 <malloc+0xce>
        return 0;
 af0:	b8 00 00 00 00       	mov    $0x0,%eax
 af5:	eb 13                	jmp    b0a <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b00:	8b 00                	mov    (%eax),%eax
 b02:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b05:	e9 6d ff ff ff       	jmp    a77 <malloc+0x4e>
}
 b0a:	c9                   	leave  
 b0b:	c3                   	ret    
