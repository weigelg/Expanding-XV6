
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 69                	jmp    8b <wc+0x8b>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 58                	jmp    83 <wc+0x83>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 20 0e 00 00       	add    $0xe20,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 20 0e 00 00       	add    $0xe20,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	83 ec 08             	sub    $0x8,%esp
  53:	50                   	push   %eax
  54:	68 ec 0a 00 00       	push   $0xaec
  59:	e8 35 02 00 00       	call   293 <strchr>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	85 c0                	test   %eax,%eax
  63:	74 09                	je     6e <wc+0x6e>
        inword = 0;
  65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6c:	eb 11                	jmp    7f <wc+0x7f>
      else if(!inword){
  6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  72:	75 0b                	jne    7f <wc+0x7f>
        w++;
  74:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  78:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  86:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  89:	7c a0                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8b:	83 ec 04             	sub    $0x4,%esp
  8e:	68 00 02 00 00       	push   $0x200
  93:	68 20 0e 00 00       	push   $0xe20
  98:	ff 75 08             	pushl  0x8(%ebp)
  9b:	e8 f7 04 00 00       	call   597 <read>
  a0:	83 c4 10             	add    $0x10,%esp
  a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b4:	79 17                	jns    cd <wc+0xcd>
    printf(1, "wc: read error\n");
  b6:	83 ec 08             	sub    $0x8,%esp
  b9:	68 f2 0a 00 00       	push   $0xaf2
  be:	6a 01                	push   $0x1
  c0:	e8 71 06 00 00       	call   736 <printf>
  c5:	83 c4 10             	add    $0x10,%esp
    exit();
  c8:	e8 b2 04 00 00       	call   57f <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	ff 75 0c             	pushl  0xc(%ebp)
  d3:	ff 75 e8             	pushl  -0x18(%ebp)
  d6:	ff 75 ec             	pushl  -0x14(%ebp)
  d9:	ff 75 f0             	pushl  -0x10(%ebp)
  dc:	68 02 0b 00 00       	push   $0xb02
  e1:	6a 01                	push   $0x1
  e3:	e8 4e 06 00 00       	call   736 <printf>
  e8:	83 c4 20             	add    $0x20,%esp
}
  eb:	90                   	nop
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <main>:

int
main(int argc, char *argv[])
{
  ee:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  f2:	83 e4 f0             	and    $0xfffffff0,%esp
  f5:	ff 71 fc             	pushl  -0x4(%ecx)
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	53                   	push   %ebx
  fc:	51                   	push   %ecx
  fd:	83 ec 10             	sub    $0x10,%esp
 100:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
 102:	83 3b 01             	cmpl   $0x1,(%ebx)
 105:	7f 17                	jg     11e <main+0x30>
    wc(0, "");
 107:	83 ec 08             	sub    $0x8,%esp
 10a:	68 0f 0b 00 00       	push   $0xb0f
 10f:	6a 00                	push   $0x0
 111:	e8 ea fe ff ff       	call   0 <wc>
 116:	83 c4 10             	add    $0x10,%esp
    exit();
 119:	e8 61 04 00 00       	call   57f <exit>
  }

  for(i = 1; i < argc; i++){
 11e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 125:	e9 83 00 00 00       	jmp    1ad <main+0xbf>
    if((fd = open(argv[i], 0)) < 0){
 12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 12d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 134:	8b 43 04             	mov    0x4(%ebx),%eax
 137:	01 d0                	add    %edx,%eax
 139:	8b 00                	mov    (%eax),%eax
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	6a 00                	push   $0x0
 140:	50                   	push   %eax
 141:	e8 79 04 00 00       	call   5bf <open>
 146:	83 c4 10             	add    $0x10,%esp
 149:	89 45 f0             	mov    %eax,-0x10(%ebp)
 14c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 150:	79 29                	jns    17b <main+0x8d>
      printf(1, "wc: cannot open %s\n", argv[i]);
 152:	8b 45 f4             	mov    -0xc(%ebp),%eax
 155:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 15c:	8b 43 04             	mov    0x4(%ebx),%eax
 15f:	01 d0                	add    %edx,%eax
 161:	8b 00                	mov    (%eax),%eax
 163:	83 ec 04             	sub    $0x4,%esp
 166:	50                   	push   %eax
 167:	68 10 0b 00 00       	push   $0xb10
 16c:	6a 01                	push   $0x1
 16e:	e8 c3 05 00 00       	call   736 <printf>
 173:	83 c4 10             	add    $0x10,%esp
      exit();
 176:	e8 04 04 00 00       	call   57f <exit>
    }
    wc(fd, argv[i]);
 17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 185:	8b 43 04             	mov    0x4(%ebx),%eax
 188:	01 d0                	add    %edx,%eax
 18a:	8b 00                	mov    (%eax),%eax
 18c:	83 ec 08             	sub    $0x8,%esp
 18f:	50                   	push   %eax
 190:	ff 75 f0             	pushl  -0x10(%ebp)
 193:	e8 68 fe ff ff       	call   0 <wc>
 198:	83 c4 10             	add    $0x10,%esp
    close(fd);
 19b:	83 ec 0c             	sub    $0xc,%esp
 19e:	ff 75 f0             	pushl  -0x10(%ebp)
 1a1:	e8 01 04 00 00       	call   5a7 <close>
 1a6:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b0:	3b 03                	cmp    (%ebx),%eax
 1b2:	0f 8c 72 ff ff ff    	jl     12a <main+0x3c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1b8:	e8 c2 03 00 00       	call   57f <exit>

000001bd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	57                   	push   %edi
 1c1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c5:	8b 55 10             	mov    0x10(%ebp),%edx
 1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cb:	89 cb                	mov    %ecx,%ebx
 1cd:	89 df                	mov    %ebx,%edi
 1cf:	89 d1                	mov    %edx,%ecx
 1d1:	fc                   	cld    
 1d2:	f3 aa                	rep stos %al,%es:(%edi)
 1d4:	89 ca                	mov    %ecx,%edx
 1d6:	89 fb                	mov    %edi,%ebx
 1d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1db:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1de:	90                   	nop
 1df:	5b                   	pop    %ebx
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1ef:	90                   	nop
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 08             	mov    %edx,0x8(%ebp)
 1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 1fc:	8d 4a 01             	lea    0x1(%edx),%ecx
 1ff:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 202:	0f b6 12             	movzbl (%edx),%edx
 205:	88 10                	mov    %dl,(%eax)
 207:	0f b6 00             	movzbl (%eax),%eax
 20a:	84 c0                	test   %al,%al
 20c:	75 e2                	jne    1f0 <strcpy+0xd>
    ;
  return os;
 20e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 211:	c9                   	leave  
 212:	c3                   	ret    

00000213 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 216:	eb 08                	jmp    220 <strcmp+0xd>
    p++, q++;
 218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	0f b6 00             	movzbl (%eax),%eax
 226:	84 c0                	test   %al,%al
 228:	74 10                	je     23a <strcmp+0x27>
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 10             	movzbl (%eax),%edx
 230:	8b 45 0c             	mov    0xc(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	38 c2                	cmp    %al,%dl
 238:	74 de                	je     218 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	0f b6 d0             	movzbl %al,%edx
 243:	8b 45 0c             	mov    0xc(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	0f b6 c0             	movzbl %al,%eax
 24c:	29 c2                	sub    %eax,%edx
 24e:	89 d0                	mov    %edx,%eax
}
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25f:	eb 04                	jmp    265 <strlen+0x13>
 261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 265:	8b 55 fc             	mov    -0x4(%ebp),%edx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	01 d0                	add    %edx,%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	84 c0                	test   %al,%al
 272:	75 ed                	jne    261 <strlen+0xf>
    ;
  return n;
 274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <memset>:

void*
memset(void *dst, int c, uint n)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 27c:	8b 45 10             	mov    0x10(%ebp),%eax
 27f:	50                   	push   %eax
 280:	ff 75 0c             	pushl  0xc(%ebp)
 283:	ff 75 08             	pushl  0x8(%ebp)
 286:	e8 32 ff ff ff       	call   1bd <stosb>
 28b:	83 c4 0c             	add    $0xc,%esp
  return dst;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 291:	c9                   	leave  
 292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	83 ec 04             	sub    $0x4,%esp
 299:	8b 45 0c             	mov    0xc(%ebp),%eax
 29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	0f b6 00             	movzbl (%eax),%eax
 2a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	eb 13                	jmp    2c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	0f b6 00             	movzbl (%eax),%eax
 2bb:	84 c0                	test   %al,%al
 2bd:	75 e2                	jne    2a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d3:	eb 42                	jmp    317 <gets+0x51>
    cc = read(0, &c, 1);
 2d5:	83 ec 04             	sub    $0x4,%esp
 2d8:	6a 01                	push   $0x1
 2da:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2dd:	50                   	push   %eax
 2de:	6a 00                	push   $0x0
 2e0:	e8 b2 02 00 00       	call   597 <read>
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ef:	7e 33                	jle    324 <gets+0x5e>
      break;
    buf[i++] = c;
 2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2fa:	89 c2                	mov    %eax,%edx
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	01 c2                	add    %eax,%edx
 301:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 305:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 307:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30b:	3c 0a                	cmp    $0xa,%al
 30d:	74 16                	je     325 <gets+0x5f>
 30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 0e                	je     325 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 317:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 320:	7c b3                	jl     2d5 <gets+0xf>
 322:	eb 01                	jmp    325 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 324:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 325:	8b 55 f4             	mov    -0xc(%ebp),%edx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	01 d0                	add    %edx,%eax
 32d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 330:	8b 45 08             	mov    0x8(%ebp),%eax
}
 333:	c9                   	leave  
 334:	c3                   	ret    

00000335 <stat>:

int
stat(char *n, struct stat *st)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33b:	83 ec 08             	sub    $0x8,%esp
 33e:	6a 00                	push   $0x0
 340:	ff 75 08             	pushl  0x8(%ebp)
 343:	e8 77 02 00 00       	call   5bf <open>
 348:	83 c4 10             	add    $0x10,%esp
 34b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 34e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 352:	79 07                	jns    35b <stat+0x26>
    return -1;
 354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 359:	eb 25                	jmp    380 <stat+0x4b>
  r = fstat(fd, st);
 35b:	83 ec 08             	sub    $0x8,%esp
 35e:	ff 75 0c             	pushl  0xc(%ebp)
 361:	ff 75 f4             	pushl  -0xc(%ebp)
 364:	e8 6e 02 00 00       	call   5d7 <fstat>
 369:	83 c4 10             	add    $0x10,%esp
 36c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 36f:	83 ec 0c             	sub    $0xc,%esp
 372:	ff 75 f4             	pushl  -0xc(%ebp)
 375:	e8 2d 02 00 00       	call   5a7 <close>
 37a:	83 c4 10             	add    $0x10,%esp
  return r;
 37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 380:	c9                   	leave  
 381:	c3                   	ret    

00000382 <atoi>:

int
atoi(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 38f:	eb 04                	jmp    395 <atoi+0x13>
 391:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 395:	8b 45 08             	mov    0x8(%ebp),%eax
 398:	0f b6 00             	movzbl (%eax),%eax
 39b:	3c 20                	cmp    $0x20,%al
 39d:	74 f2                	je     391 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	0f b6 00             	movzbl (%eax),%eax
 3a5:	3c 2d                	cmp    $0x2d,%al
 3a7:	75 07                	jne    3b0 <atoi+0x2e>
 3a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ae:	eb 05                	jmp    3b5 <atoi+0x33>
 3b0:	b8 01 00 00 00       	mov    $0x1,%eax
 3b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	0f b6 00             	movzbl (%eax),%eax
 3be:	3c 2b                	cmp    $0x2b,%al
 3c0:	74 0a                	je     3cc <atoi+0x4a>
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	3c 2d                	cmp    $0x2d,%al
 3ca:	75 2b                	jne    3f7 <atoi+0x75>
    s++;
 3cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 3d0:	eb 25                	jmp    3f7 <atoi+0x75>
    n = n*10 + *s++ - '0';
 3d2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3d5:	89 d0                	mov    %edx,%eax
 3d7:	c1 e0 02             	shl    $0x2,%eax
 3da:	01 d0                	add    %edx,%eax
 3dc:	01 c0                	add    %eax,%eax
 3de:	89 c1                	mov    %eax,%ecx
 3e0:	8b 45 08             	mov    0x8(%ebp),%eax
 3e3:	8d 50 01             	lea    0x1(%eax),%edx
 3e6:	89 55 08             	mov    %edx,0x8(%ebp)
 3e9:	0f b6 00             	movzbl (%eax),%eax
 3ec:	0f be c0             	movsbl %al,%eax
 3ef:	01 c8                	add    %ecx,%eax
 3f1:	83 e8 30             	sub    $0x30,%eax
 3f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	0f b6 00             	movzbl (%eax),%eax
 3fd:	3c 2f                	cmp    $0x2f,%al
 3ff:	7e 0a                	jle    40b <atoi+0x89>
 401:	8b 45 08             	mov    0x8(%ebp),%eax
 404:	0f b6 00             	movzbl (%eax),%eax
 407:	3c 39                	cmp    $0x39,%al
 409:	7e c7                	jle    3d2 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 40b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 40e:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 412:	c9                   	leave  
 413:	c3                   	ret    

00000414 <atoo>:

int
atoo(const char *s)
{
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 41a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 421:	eb 04                	jmp    427 <atoo+0x13>
 423:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	0f b6 00             	movzbl (%eax),%eax
 42d:	3c 20                	cmp    $0x20,%al
 42f:	74 f2                	je     423 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 431:	8b 45 08             	mov    0x8(%ebp),%eax
 434:	0f b6 00             	movzbl (%eax),%eax
 437:	3c 2d                	cmp    $0x2d,%al
 439:	75 07                	jne    442 <atoo+0x2e>
 43b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 440:	eb 05                	jmp    447 <atoo+0x33>
 442:	b8 01 00 00 00       	mov    $0x1,%eax
 447:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 44a:	8b 45 08             	mov    0x8(%ebp),%eax
 44d:	0f b6 00             	movzbl (%eax),%eax
 450:	3c 2b                	cmp    $0x2b,%al
 452:	74 0a                	je     45e <atoo+0x4a>
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	0f b6 00             	movzbl (%eax),%eax
 45a:	3c 2d                	cmp    $0x2d,%al
 45c:	75 27                	jne    485 <atoo+0x71>
    s++;
 45e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 462:	eb 21                	jmp    485 <atoo+0x71>
    n = n*8 + *s++ - '0';
 464:	8b 45 fc             	mov    -0x4(%ebp),%eax
 467:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	8d 50 01             	lea    0x1(%eax),%edx
 474:	89 55 08             	mov    %edx,0x8(%ebp)
 477:	0f b6 00             	movzbl (%eax),%eax
 47a:	0f be c0             	movsbl %al,%eax
 47d:	01 c8                	add    %ecx,%eax
 47f:	83 e8 30             	sub    $0x30,%eax
 482:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 485:	8b 45 08             	mov    0x8(%ebp),%eax
 488:	0f b6 00             	movzbl (%eax),%eax
 48b:	3c 2f                	cmp    $0x2f,%al
 48d:	7e 0a                	jle    499 <atoo+0x85>
 48f:	8b 45 08             	mov    0x8(%ebp),%eax
 492:	0f b6 00             	movzbl (%eax),%eax
 495:	3c 37                	cmp    $0x37,%al
 497:	7e cb                	jle    464 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 499:	8b 45 f8             	mov    -0x8(%ebp),%eax
 49c:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 4a0:	c9                   	leave  
 4a1:	c3                   	ret    

000004a2 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4b4:	eb 17                	jmp    4cd <memmove+0x2b>
    *dst++ = *src++;
 4b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4b9:	8d 50 01             	lea    0x1(%eax),%edx
 4bc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4c2:	8d 4a 01             	lea    0x1(%edx),%ecx
 4c5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4c8:	0f b6 12             	movzbl (%edx),%edx
 4cb:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4cd:	8b 45 10             	mov    0x10(%ebp),%eax
 4d0:	8d 50 ff             	lea    -0x1(%eax),%edx
 4d3:	89 55 10             	mov    %edx,0x10(%ebp)
 4d6:	85 c0                	test   %eax,%eax
 4d8:	7f dc                	jg     4b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4da:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4dd:	c9                   	leave  
 4de:	c3                   	ret    

000004df <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 4e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4e8:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 4ed:	89 c8                	mov    %ecx,%eax
 4ef:	f7 e2                	mul    %edx
 4f1:	89 d0                	mov    %edx,%eax
 4f3:	c1 e8 06             	shr    $0x6,%eax
 4f6:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 4fc:	29 c1                	sub    %eax,%ecx
 4fe:	89 c8                	mov    %ecx,%eax
 500:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 50b:	f7 e2                	mul    %edx
 50d:	89 d0                	mov    %edx,%eax
 50f:	c1 e8 06             	shr    $0x6,%eax
 512:	83 ec 04             	sub    $0x4,%esp
 515:	50                   	push   %eax
 516:	68 24 0b 00 00       	push   $0xb24
 51b:	6a 01                	push   $0x1
 51d:	e8 14 02 00 00       	call   736 <printf>
 522:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 525:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 529:	7e 17                	jle    542 <zeropad+0x63>
    printf(1,"%d", miliseconds);
 52b:	83 ec 04             	sub    $0x4,%esp
 52e:	ff 75 f4             	pushl  -0xc(%ebp)
 531:	68 28 0b 00 00       	push   $0xb28
 536:	6a 01                	push   $0x1
 538:	e8 f9 01 00 00       	call   736 <printf>
 53d:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 540:	eb 32                	jmp    574 <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 542:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 546:	7e 17                	jle    55f <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 548:	83 ec 04             	sub    $0x4,%esp
 54b:	ff 75 f4             	pushl  -0xc(%ebp)
 54e:	68 2b 0b 00 00       	push   $0xb2b
 553:	6a 01                	push   $0x1
 555:	e8 dc 01 00 00       	call   736 <printf>
 55a:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 55d:	eb 15                	jmp    574 <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 55f:	83 ec 04             	sub    $0x4,%esp
 562:	ff 75 f4             	pushl  -0xc(%ebp)
 565:	68 2f 0b 00 00       	push   $0xb2f
 56a:	6a 01                	push   $0x1
 56c:	e8 c5 01 00 00       	call   736 <printf>
 571:	83 c4 10             	add    $0x10,%esp
};
 574:	90                   	nop
 575:	c9                   	leave  
 576:	c3                   	ret    

00000577 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 577:	b8 01 00 00 00       	mov    $0x1,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <exit>:
SYSCALL(exit)
 57f:	b8 02 00 00 00       	mov    $0x2,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <wait>:
SYSCALL(wait)
 587:	b8 03 00 00 00       	mov    $0x3,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <pipe>:
SYSCALL(pipe)
 58f:	b8 04 00 00 00       	mov    $0x4,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <read>:
SYSCALL(read)
 597:	b8 05 00 00 00       	mov    $0x5,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <write>:
SYSCALL(write)
 59f:	b8 10 00 00 00       	mov    $0x10,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <close>:
SYSCALL(close)
 5a7:	b8 15 00 00 00       	mov    $0x15,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <kill>:
SYSCALL(kill)
 5af:	b8 06 00 00 00       	mov    $0x6,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <exec>:
SYSCALL(exec)
 5b7:	b8 07 00 00 00       	mov    $0x7,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <open>:
SYSCALL(open)
 5bf:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <mknod>:
SYSCALL(mknod)
 5c7:	b8 11 00 00 00       	mov    $0x11,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <unlink>:
SYSCALL(unlink)
 5cf:	b8 12 00 00 00       	mov    $0x12,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <fstat>:
SYSCALL(fstat)
 5d7:	b8 08 00 00 00       	mov    $0x8,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <link>:
SYSCALL(link)
 5df:	b8 13 00 00 00       	mov    $0x13,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <mkdir>:
SYSCALL(mkdir)
 5e7:	b8 14 00 00 00       	mov    $0x14,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <chdir>:
SYSCALL(chdir)
 5ef:	b8 09 00 00 00       	mov    $0x9,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <dup>:
SYSCALL(dup)
 5f7:	b8 0a 00 00 00       	mov    $0xa,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <getpid>:
SYSCALL(getpid)
 5ff:	b8 0b 00 00 00       	mov    $0xb,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <sbrk>:
SYSCALL(sbrk)
 607:	b8 0c 00 00 00       	mov    $0xc,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <sleep>:
SYSCALL(sleep)
 60f:	b8 0d 00 00 00       	mov    $0xd,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <uptime>:
SYSCALL(uptime)
 617:	b8 0e 00 00 00       	mov    $0xe,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret    

0000061f <halt>:
SYSCALL(halt)
 61f:	b8 16 00 00 00       	mov    $0x16,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret    

00000627 <date>:

SYSCALL(date)
 627:	b8 17 00 00 00       	mov    $0x17,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret    

0000062f <getuid>:
SYSCALL(getuid)
 62f:	b8 18 00 00 00       	mov    $0x18,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <getgid>:
SYSCALL(getgid)
 637:	b8 19 00 00 00       	mov    $0x19,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <getppid>:
SYSCALL(getppid)
 63f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <setuid>:
SYSCALL(setuid)
 647:	b8 1b 00 00 00       	mov    $0x1b,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <setgid>:
SYSCALL(setgid)
 64f:	b8 1c 00 00 00       	mov    $0x1c,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <getprocs>:
SYSCALL(getprocs)
 657:	b8 1d 00 00 00       	mov    $0x1d,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 65f:	55                   	push   %ebp
 660:	89 e5                	mov    %esp,%ebp
 662:	83 ec 18             	sub    $0x18,%esp
 665:	8b 45 0c             	mov    0xc(%ebp),%eax
 668:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 66b:	83 ec 04             	sub    $0x4,%esp
 66e:	6a 01                	push   $0x1
 670:	8d 45 f4             	lea    -0xc(%ebp),%eax
 673:	50                   	push   %eax
 674:	ff 75 08             	pushl  0x8(%ebp)
 677:	e8 23 ff ff ff       	call   59f <write>
 67c:	83 c4 10             	add    $0x10,%esp
}
 67f:	90                   	nop
 680:	c9                   	leave  
 681:	c3                   	ret    

00000682 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 682:	55                   	push   %ebp
 683:	89 e5                	mov    %esp,%ebp
 685:	53                   	push   %ebx
 686:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 689:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 690:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 694:	74 17                	je     6ad <printint+0x2b>
 696:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 69a:	79 11                	jns    6ad <printint+0x2b>
    neg = 1;
 69c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a6:	f7 d8                	neg    %eax
 6a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6ab:	eb 06                	jmp    6b3 <printint+0x31>
  } else {
    x = xx;
 6ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6ba:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6bd:	8d 41 01             	lea    0x1(%ecx),%eax
 6c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6c3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c9:	ba 00 00 00 00       	mov    $0x0,%edx
 6ce:	f7 f3                	div    %ebx
 6d0:	89 d0                	mov    %edx,%eax
 6d2:	0f b6 80 e8 0d 00 00 	movzbl 0xde8(%eax),%eax
 6d9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6dd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e3:	ba 00 00 00 00       	mov    $0x0,%edx
 6e8:	f7 f3                	div    %ebx
 6ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6ed:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6f1:	75 c7                	jne    6ba <printint+0x38>
  if(neg)
 6f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6f7:	74 2d                	je     726 <printint+0xa4>
    buf[i++] = '-';
 6f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fc:	8d 50 01             	lea    0x1(%eax),%edx
 6ff:	89 55 f4             	mov    %edx,-0xc(%ebp)
 702:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 707:	eb 1d                	jmp    726 <printint+0xa4>
    putc(fd, buf[i]);
 709:	8d 55 dc             	lea    -0x24(%ebp),%edx
 70c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70f:	01 d0                	add    %edx,%eax
 711:	0f b6 00             	movzbl (%eax),%eax
 714:	0f be c0             	movsbl %al,%eax
 717:	83 ec 08             	sub    $0x8,%esp
 71a:	50                   	push   %eax
 71b:	ff 75 08             	pushl  0x8(%ebp)
 71e:	e8 3c ff ff ff       	call   65f <putc>
 723:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 726:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 72a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 72e:	79 d9                	jns    709 <printint+0x87>
    putc(fd, buf[i]);
}
 730:	90                   	nop
 731:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 734:	c9                   	leave  
 735:	c3                   	ret    

00000736 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 736:	55                   	push   %ebp
 737:	89 e5                	mov    %esp,%ebp
 739:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 73c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 743:	8d 45 0c             	lea    0xc(%ebp),%eax
 746:	83 c0 04             	add    $0x4,%eax
 749:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 74c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 753:	e9 59 01 00 00       	jmp    8b1 <printf+0x17b>
    c = fmt[i] & 0xff;
 758:	8b 55 0c             	mov    0xc(%ebp),%edx
 75b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75e:	01 d0                	add    %edx,%eax
 760:	0f b6 00             	movzbl (%eax),%eax
 763:	0f be c0             	movsbl %al,%eax
 766:	25 ff 00 00 00       	and    $0xff,%eax
 76b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 76e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 772:	75 2c                	jne    7a0 <printf+0x6a>
      if(c == '%'){
 774:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 778:	75 0c                	jne    786 <printf+0x50>
        state = '%';
 77a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 781:	e9 27 01 00 00       	jmp    8ad <printf+0x177>
      } else {
        putc(fd, c);
 786:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 789:	0f be c0             	movsbl %al,%eax
 78c:	83 ec 08             	sub    $0x8,%esp
 78f:	50                   	push   %eax
 790:	ff 75 08             	pushl  0x8(%ebp)
 793:	e8 c7 fe ff ff       	call   65f <putc>
 798:	83 c4 10             	add    $0x10,%esp
 79b:	e9 0d 01 00 00       	jmp    8ad <printf+0x177>
      }
    } else if(state == '%'){
 7a0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7a4:	0f 85 03 01 00 00    	jne    8ad <printf+0x177>
      if(c == 'd'){
 7aa:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7ae:	75 1e                	jne    7ce <printf+0x98>
        printint(fd, *ap, 10, 1);
 7b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b3:	8b 00                	mov    (%eax),%eax
 7b5:	6a 01                	push   $0x1
 7b7:	6a 0a                	push   $0xa
 7b9:	50                   	push   %eax
 7ba:	ff 75 08             	pushl  0x8(%ebp)
 7bd:	e8 c0 fe ff ff       	call   682 <printint>
 7c2:	83 c4 10             	add    $0x10,%esp
        ap++;
 7c5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c9:	e9 d8 00 00 00       	jmp    8a6 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7ce:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7d2:	74 06                	je     7da <printf+0xa4>
 7d4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7d8:	75 1e                	jne    7f8 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7dd:	8b 00                	mov    (%eax),%eax
 7df:	6a 00                	push   $0x0
 7e1:	6a 10                	push   $0x10
 7e3:	50                   	push   %eax
 7e4:	ff 75 08             	pushl  0x8(%ebp)
 7e7:	e8 96 fe ff ff       	call   682 <printint>
 7ec:	83 c4 10             	add    $0x10,%esp
        ap++;
 7ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f3:	e9 ae 00 00 00       	jmp    8a6 <printf+0x170>
      } else if(c == 's'){
 7f8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7fc:	75 43                	jne    841 <printf+0x10b>
        s = (char*)*ap;
 7fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 806:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 80a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80e:	75 25                	jne    835 <printf+0xff>
          s = "(null)";
 810:	c7 45 f4 34 0b 00 00 	movl   $0xb34,-0xc(%ebp)
        while(*s != 0){
 817:	eb 1c                	jmp    835 <printf+0xff>
          putc(fd, *s);
 819:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81c:	0f b6 00             	movzbl (%eax),%eax
 81f:	0f be c0             	movsbl %al,%eax
 822:	83 ec 08             	sub    $0x8,%esp
 825:	50                   	push   %eax
 826:	ff 75 08             	pushl  0x8(%ebp)
 829:	e8 31 fe ff ff       	call   65f <putc>
 82e:	83 c4 10             	add    $0x10,%esp
          s++;
 831:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 835:	8b 45 f4             	mov    -0xc(%ebp),%eax
 838:	0f b6 00             	movzbl (%eax),%eax
 83b:	84 c0                	test   %al,%al
 83d:	75 da                	jne    819 <printf+0xe3>
 83f:	eb 65                	jmp    8a6 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 841:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 845:	75 1d                	jne    864 <printf+0x12e>
        putc(fd, *ap);
 847:	8b 45 e8             	mov    -0x18(%ebp),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	0f be c0             	movsbl %al,%eax
 84f:	83 ec 08             	sub    $0x8,%esp
 852:	50                   	push   %eax
 853:	ff 75 08             	pushl  0x8(%ebp)
 856:	e8 04 fe ff ff       	call   65f <putc>
 85b:	83 c4 10             	add    $0x10,%esp
        ap++;
 85e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 862:	eb 42                	jmp    8a6 <printf+0x170>
      } else if(c == '%'){
 864:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 868:	75 17                	jne    881 <printf+0x14b>
        putc(fd, c);
 86a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86d:	0f be c0             	movsbl %al,%eax
 870:	83 ec 08             	sub    $0x8,%esp
 873:	50                   	push   %eax
 874:	ff 75 08             	pushl  0x8(%ebp)
 877:	e8 e3 fd ff ff       	call   65f <putc>
 87c:	83 c4 10             	add    $0x10,%esp
 87f:	eb 25                	jmp    8a6 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 881:	83 ec 08             	sub    $0x8,%esp
 884:	6a 25                	push   $0x25
 886:	ff 75 08             	pushl  0x8(%ebp)
 889:	e8 d1 fd ff ff       	call   65f <putc>
 88e:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 891:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 894:	0f be c0             	movsbl %al,%eax
 897:	83 ec 08             	sub    $0x8,%esp
 89a:	50                   	push   %eax
 89b:	ff 75 08             	pushl  0x8(%ebp)
 89e:	e8 bc fd ff ff       	call   65f <putc>
 8a3:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8b1:	8b 55 0c             	mov    0xc(%ebp),%edx
 8b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b7:	01 d0                	add    %edx,%eax
 8b9:	0f b6 00             	movzbl (%eax),%eax
 8bc:	84 c0                	test   %al,%al
 8be:	0f 85 94 fe ff ff    	jne    758 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8c4:	90                   	nop
 8c5:	c9                   	leave  
 8c6:	c3                   	ret    

000008c7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c7:	55                   	push   %ebp
 8c8:	89 e5                	mov    %esp,%ebp
 8ca:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	83 e8 08             	sub    $0x8,%eax
 8d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d6:	a1 08 0e 00 00       	mov    0xe08,%eax
 8db:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8de:	eb 24                	jmp    904 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e3:	8b 00                	mov    (%eax),%eax
 8e5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e8:	77 12                	ja     8fc <free+0x35>
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f0:	77 24                	ja     916 <free+0x4f>
 8f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f5:	8b 00                	mov    (%eax),%eax
 8f7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8fa:	77 1a                	ja     916 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ff:	8b 00                	mov    (%eax),%eax
 901:	89 45 fc             	mov    %eax,-0x4(%ebp)
 904:	8b 45 f8             	mov    -0x8(%ebp),%eax
 907:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 90a:	76 d4                	jbe    8e0 <free+0x19>
 90c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90f:	8b 00                	mov    (%eax),%eax
 911:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 914:	76 ca                	jbe    8e0 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 916:	8b 45 f8             	mov    -0x8(%ebp),%eax
 919:	8b 40 04             	mov    0x4(%eax),%eax
 91c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 923:	8b 45 f8             	mov    -0x8(%ebp),%eax
 926:	01 c2                	add    %eax,%edx
 928:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92b:	8b 00                	mov    (%eax),%eax
 92d:	39 c2                	cmp    %eax,%edx
 92f:	75 24                	jne    955 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 931:	8b 45 f8             	mov    -0x8(%ebp),%eax
 934:	8b 50 04             	mov    0x4(%eax),%edx
 937:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93a:	8b 00                	mov    (%eax),%eax
 93c:	8b 40 04             	mov    0x4(%eax),%eax
 93f:	01 c2                	add    %eax,%edx
 941:	8b 45 f8             	mov    -0x8(%ebp),%eax
 944:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 947:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94a:	8b 00                	mov    (%eax),%eax
 94c:	8b 10                	mov    (%eax),%edx
 94e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 951:	89 10                	mov    %edx,(%eax)
 953:	eb 0a                	jmp    95f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 955:	8b 45 fc             	mov    -0x4(%ebp),%eax
 958:	8b 10                	mov    (%eax),%edx
 95a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 95f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 962:	8b 40 04             	mov    0x4(%eax),%eax
 965:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 96c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96f:	01 d0                	add    %edx,%eax
 971:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 974:	75 20                	jne    996 <free+0xcf>
    p->s.size += bp->s.size;
 976:	8b 45 fc             	mov    -0x4(%ebp),%eax
 979:	8b 50 04             	mov    0x4(%eax),%edx
 97c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97f:	8b 40 04             	mov    0x4(%eax),%eax
 982:	01 c2                	add    %eax,%edx
 984:	8b 45 fc             	mov    -0x4(%ebp),%eax
 987:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 98a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98d:	8b 10                	mov    (%eax),%edx
 98f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 992:	89 10                	mov    %edx,(%eax)
 994:	eb 08                	jmp    99e <free+0xd7>
  } else
    p->s.ptr = bp;
 996:	8b 45 fc             	mov    -0x4(%ebp),%eax
 999:	8b 55 f8             	mov    -0x8(%ebp),%edx
 99c:	89 10                	mov    %edx,(%eax)
  freep = p;
 99e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a1:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 9a6:	90                   	nop
 9a7:	c9                   	leave  
 9a8:	c3                   	ret    

000009a9 <morecore>:

static Header*
morecore(uint nu)
{
 9a9:	55                   	push   %ebp
 9aa:	89 e5                	mov    %esp,%ebp
 9ac:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9af:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9b6:	77 07                	ja     9bf <morecore+0x16>
    nu = 4096;
 9b8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9bf:	8b 45 08             	mov    0x8(%ebp),%eax
 9c2:	c1 e0 03             	shl    $0x3,%eax
 9c5:	83 ec 0c             	sub    $0xc,%esp
 9c8:	50                   	push   %eax
 9c9:	e8 39 fc ff ff       	call   607 <sbrk>
 9ce:	83 c4 10             	add    $0x10,%esp
 9d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9d4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9d8:	75 07                	jne    9e1 <morecore+0x38>
    return 0;
 9da:	b8 00 00 00 00       	mov    $0x0,%eax
 9df:	eb 26                	jmp    a07 <morecore+0x5e>
  hp = (Header*)p;
 9e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ea:	8b 55 08             	mov    0x8(%ebp),%edx
 9ed:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f3:	83 c0 08             	add    $0x8,%eax
 9f6:	83 ec 0c             	sub    $0xc,%esp
 9f9:	50                   	push   %eax
 9fa:	e8 c8 fe ff ff       	call   8c7 <free>
 9ff:	83 c4 10             	add    $0x10,%esp
  return freep;
 a02:	a1 08 0e 00 00       	mov    0xe08,%eax
}
 a07:	c9                   	leave  
 a08:	c3                   	ret    

00000a09 <malloc>:

void*
malloc(uint nbytes)
{
 a09:	55                   	push   %ebp
 a0a:	89 e5                	mov    %esp,%ebp
 a0c:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a0f:	8b 45 08             	mov    0x8(%ebp),%eax
 a12:	83 c0 07             	add    $0x7,%eax
 a15:	c1 e8 03             	shr    $0x3,%eax
 a18:	83 c0 01             	add    $0x1,%eax
 a1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a1e:	a1 08 0e 00 00       	mov    0xe08,%eax
 a23:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a2a:	75 23                	jne    a4f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a2c:	c7 45 f0 00 0e 00 00 	movl   $0xe00,-0x10(%ebp)
 a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a36:	a3 08 0e 00 00       	mov    %eax,0xe08
 a3b:	a1 08 0e 00 00       	mov    0xe08,%eax
 a40:	a3 00 0e 00 00       	mov    %eax,0xe00
    base.s.size = 0;
 a45:	c7 05 04 0e 00 00 00 	movl   $0x0,0xe04
 a4c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a52:	8b 00                	mov    (%eax),%eax
 a54:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	8b 40 04             	mov    0x4(%eax),%eax
 a5d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a60:	72 4d                	jb     aaf <malloc+0xa6>
      if(p->s.size == nunits)
 a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a65:	8b 40 04             	mov    0x4(%eax),%eax
 a68:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a6b:	75 0c                	jne    a79 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a70:	8b 10                	mov    (%eax),%edx
 a72:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a75:	89 10                	mov    %edx,(%eax)
 a77:	eb 26                	jmp    a9f <malloc+0x96>
      else {
        p->s.size -= nunits;
 a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7c:	8b 40 04             	mov    0x4(%eax),%eax
 a7f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a82:	89 c2                	mov    %eax,%edx
 a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a87:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8d:	8b 40 04             	mov    0x4(%eax),%eax
 a90:	c1 e0 03             	shl    $0x3,%eax
 a93:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a99:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a9c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa2:	a3 08 0e 00 00       	mov    %eax,0xe08
      return (void*)(p + 1);
 aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aaa:	83 c0 08             	add    $0x8,%eax
 aad:	eb 3b                	jmp    aea <malloc+0xe1>
    }
    if(p == freep)
 aaf:	a1 08 0e 00 00       	mov    0xe08,%eax
 ab4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ab7:	75 1e                	jne    ad7 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 ab9:	83 ec 0c             	sub    $0xc,%esp
 abc:	ff 75 ec             	pushl  -0x14(%ebp)
 abf:	e8 e5 fe ff ff       	call   9a9 <morecore>
 ac4:	83 c4 10             	add    $0x10,%esp
 ac7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ace:	75 07                	jne    ad7 <malloc+0xce>
        return 0;
 ad0:	b8 00 00 00 00       	mov    $0x0,%eax
 ad5:	eb 13                	jmp    aea <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ada:	89 45 f0             	mov    %eax,-0x10(%ebp)
 add:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae0:	8b 00                	mov    (%eax),%eax
 ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ae5:	e9 6d ff ff ff       	jmp    a57 <malloc+0x4e>
}
 aea:	c9                   	leave  
 aeb:	c3                   	ret    
