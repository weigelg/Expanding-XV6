
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 b6 00 00 00       	jmp    c8 <grep+0xc8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 00 10 00 00       	add    $0x1000,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 4a                	jmp    76 <grep+0x76>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	83 ec 08             	sub    $0x8,%esp
  35:	ff 75 f0             	pushl  -0x10(%ebp)
  38:	ff 75 08             	pushl  0x8(%ebp)
  3b:	e8 9a 01 00 00       	call   1da <match>
  40:	83 c4 10             	add    $0x10,%esp
  43:	85 c0                	test   %eax,%eax
  45:	74 26                	je     6d <grep+0x6d>
        *q = '\n';
  47:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4a:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  50:	83 c0 01             	add    $0x1,%eax
  53:	89 c2                	mov    %eax,%edx
  55:	8b 45 f0             	mov    -0x10(%ebp),%eax
  58:	29 c2                	sub    %eax,%edx
  5a:	89 d0                	mov    %edx,%eax
  5c:	83 ec 04             	sub    $0x4,%esp
  5f:	50                   	push   %eax
  60:	ff 75 f0             	pushl  -0x10(%ebp)
  63:	6a 01                	push   $0x1
  65:	e8 ae 06 00 00       	call   718 <write>
  6a:	83 c4 10             	add    $0x10,%esp
      }
      p = q+1;
  6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  70:	83 c0 01             	add    $0x1,%eax
  73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
  76:	83 ec 08             	sub    $0x8,%esp
  79:	6a 0a                	push   $0xa
  7b:	ff 75 f0             	pushl  -0x10(%ebp)
  7e:	e8 89 03 00 00       	call   40c <strchr>
  83:	83 c4 10             	add    $0x10,%esp
  86:	89 45 e8             	mov    %eax,-0x18(%ebp)
  89:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  8d:	75 9d                	jne    2c <grep+0x2c>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
  8f:	81 7d f0 00 10 00 00 	cmpl   $0x1000,-0x10(%ebp)
  96:	75 07                	jne    9f <grep+0x9f>
      m = 0;
  98:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a3:	7e 23                	jle    c8 <grep+0xc8>
      m -= p - buf;
  a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  a8:	ba 00 10 00 00       	mov    $0x1000,%edx
  ad:	29 d0                	sub    %edx,%eax
  af:	29 45 f4             	sub    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  b2:	83 ec 04             	sub    $0x4,%esp
  b5:	ff 75 f4             	pushl  -0xc(%ebp)
  b8:	ff 75 f0             	pushl  -0x10(%ebp)
  bb:	68 00 10 00 00       	push   $0x1000
  c0:	e8 56 05 00 00       	call   61b <memmove>
  c5:	83 c4 10             	add    $0x10,%esp
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  cb:	ba ff 03 00 00       	mov    $0x3ff,%edx
  d0:	29 c2                	sub    %eax,%edx
  d2:	89 d0                	mov    %edx,%eax
  d4:	89 c2                	mov    %eax,%edx
  d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  d9:	05 00 10 00 00       	add    $0x1000,%eax
  de:	83 ec 04             	sub    $0x4,%esp
  e1:	52                   	push   %edx
  e2:	50                   	push   %eax
  e3:	ff 75 0c             	pushl  0xc(%ebp)
  e6:	e8 25 06 00 00       	call   710 <read>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  f5:	0f 8f 17 ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
  fb:	90                   	nop
  fc:	c9                   	leave  
  fd:	c3                   	ret    

000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 102:	83 e4 f0             	and    $0xfffffff0,%esp
 105:	ff 71 fc             	pushl  -0x4(%ecx)
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	53                   	push   %ebx
 10c:	51                   	push   %ecx
 10d:	83 ec 10             	sub    $0x10,%esp
 110:	89 cb                	mov    %ecx,%ebx
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
 112:	83 3b 01             	cmpl   $0x1,(%ebx)
 115:	7f 17                	jg     12e <main+0x30>
    printf(2, "usage: grep pattern [file ...]\n");
 117:	83 ec 08             	sub    $0x8,%esp
 11a:	68 68 0c 00 00       	push   $0xc68
 11f:	6a 02                	push   $0x2
 121:	e8 89 07 00 00       	call   8af <printf>
 126:	83 c4 10             	add    $0x10,%esp
    exit();
 129:	e8 ca 05 00 00       	call   6f8 <exit>
  }
  pattern = argv[1];
 12e:	8b 43 04             	mov    0x4(%ebx),%eax
 131:	8b 40 04             	mov    0x4(%eax),%eax
 134:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  if(argc <= 2){
 137:	83 3b 02             	cmpl   $0x2,(%ebx)
 13a:	7f 15                	jg     151 <main+0x53>
    grep(pattern, 0);
 13c:	83 ec 08             	sub    $0x8,%esp
 13f:	6a 00                	push   $0x0
 141:	ff 75 f0             	pushl  -0x10(%ebp)
 144:	e8 b7 fe ff ff       	call   0 <grep>
 149:	83 c4 10             	add    $0x10,%esp
    exit();
 14c:	e8 a7 05 00 00       	call   6f8 <exit>
  }

  for(i = 2; i < argc; i++){
 151:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
 158:	eb 74                	jmp    1ce <main+0xd0>
    if((fd = open(argv[i], 0)) < 0){
 15a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 164:	8b 43 04             	mov    0x4(%ebx),%eax
 167:	01 d0                	add    %edx,%eax
 169:	8b 00                	mov    (%eax),%eax
 16b:	83 ec 08             	sub    $0x8,%esp
 16e:	6a 00                	push   $0x0
 170:	50                   	push   %eax
 171:	e8 c2 05 00 00       	call   738 <open>
 176:	83 c4 10             	add    $0x10,%esp
 179:	89 45 ec             	mov    %eax,-0x14(%ebp)
 17c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 180:	79 29                	jns    1ab <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
 182:	8b 45 f4             	mov    -0xc(%ebp),%eax
 185:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 18c:	8b 43 04             	mov    0x4(%ebx),%eax
 18f:	01 d0                	add    %edx,%eax
 191:	8b 00                	mov    (%eax),%eax
 193:	83 ec 04             	sub    $0x4,%esp
 196:	50                   	push   %eax
 197:	68 88 0c 00 00       	push   $0xc88
 19c:	6a 01                	push   $0x1
 19e:	e8 0c 07 00 00       	call   8af <printf>
 1a3:	83 c4 10             	add    $0x10,%esp
      exit();
 1a6:	e8 4d 05 00 00       	call   6f8 <exit>
    }
    grep(pattern, fd);
 1ab:	83 ec 08             	sub    $0x8,%esp
 1ae:	ff 75 ec             	pushl  -0x14(%ebp)
 1b1:	ff 75 f0             	pushl  -0x10(%ebp)
 1b4:	e8 47 fe ff ff       	call   0 <grep>
 1b9:	83 c4 10             	add    $0x10,%esp
    close(fd);
 1bc:	83 ec 0c             	sub    $0xc,%esp
 1bf:	ff 75 ec             	pushl  -0x14(%ebp)
 1c2:	e8 59 05 00 00       	call   720 <close>
 1c7:	83 c4 10             	add    $0x10,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 1ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	3b 03                	cmp    (%ebx),%eax
 1d3:	7c 85                	jl     15a <main+0x5c>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
 1d5:	e8 1e 05 00 00       	call   6f8 <exit>

000001da <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1da:	55                   	push   %ebp
 1db:	89 e5                	mov    %esp,%ebp
 1dd:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '^')
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	0f b6 00             	movzbl (%eax),%eax
 1e6:	3c 5e                	cmp    $0x5e,%al
 1e8:	75 17                	jne    201 <match+0x27>
    return matchhere(re+1, text);
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	ff 75 0c             	pushl  0xc(%ebp)
 1f6:	50                   	push   %eax
 1f7:	e8 38 00 00 00       	call   234 <matchhere>
 1fc:	83 c4 10             	add    $0x10,%esp
 1ff:	eb 31                	jmp    232 <match+0x58>
  do{  // must look at empty string
    if(matchhere(re, text))
 201:	83 ec 08             	sub    $0x8,%esp
 204:	ff 75 0c             	pushl  0xc(%ebp)
 207:	ff 75 08             	pushl  0x8(%ebp)
 20a:	e8 25 00 00 00       	call   234 <matchhere>
 20f:	83 c4 10             	add    $0x10,%esp
 212:	85 c0                	test   %eax,%eax
 214:	74 07                	je     21d <match+0x43>
      return 1;
 216:	b8 01 00 00 00       	mov    $0x1,%eax
 21b:	eb 15                	jmp    232 <match+0x58>
  }while(*text++ != '\0');
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	8d 50 01             	lea    0x1(%eax),%edx
 223:	89 55 0c             	mov    %edx,0xc(%ebp)
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	84 c0                	test   %al,%al
 22b:	75 d4                	jne    201 <match+0x27>
  return 0;
 22d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 232:	c9                   	leave  
 233:	c3                   	ret    

00000234 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '\0')
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	84 c0                	test   %al,%al
 242:	75 0a                	jne    24e <matchhere+0x1a>
    return 1;
 244:	b8 01 00 00 00       	mov    $0x1,%eax
 249:	e9 99 00 00 00       	jmp    2e7 <matchhere+0xb3>
  if(re[1] == '*')
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	83 c0 01             	add    $0x1,%eax
 254:	0f b6 00             	movzbl (%eax),%eax
 257:	3c 2a                	cmp    $0x2a,%al
 259:	75 21                	jne    27c <matchhere+0x48>
    return matchstar(re[0], re+2, text);
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	8d 50 02             	lea    0x2(%eax),%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	0f be c0             	movsbl %al,%eax
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	ff 75 0c             	pushl  0xc(%ebp)
 270:	52                   	push   %edx
 271:	50                   	push   %eax
 272:	e8 72 00 00 00       	call   2e9 <matchstar>
 277:	83 c4 10             	add    $0x10,%esp
 27a:	eb 6b                	jmp    2e7 <matchhere+0xb3>
  if(re[0] == '$' && re[1] == '\0')
 27c:	8b 45 08             	mov    0x8(%ebp),%eax
 27f:	0f b6 00             	movzbl (%eax),%eax
 282:	3c 24                	cmp    $0x24,%al
 284:	75 1d                	jne    2a3 <matchhere+0x6f>
 286:	8b 45 08             	mov    0x8(%ebp),%eax
 289:	83 c0 01             	add    $0x1,%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	84 c0                	test   %al,%al
 291:	75 10                	jne    2a3 <matchhere+0x6f>
    return *text == '\0';
 293:	8b 45 0c             	mov    0xc(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	84 c0                	test   %al,%al
 29b:	0f 94 c0             	sete   %al
 29e:	0f b6 c0             	movzbl %al,%eax
 2a1:	eb 44                	jmp    2e7 <matchhere+0xb3>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	84 c0                	test   %al,%al
 2ab:	74 35                	je     2e2 <matchhere+0xae>
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
 2b0:	0f b6 00             	movzbl (%eax),%eax
 2b3:	3c 2e                	cmp    $0x2e,%al
 2b5:	74 10                	je     2c7 <matchhere+0x93>
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	38 c2                	cmp    %al,%dl
 2c5:	75 1b                	jne    2e2 <matchhere+0xae>
    return matchhere(re+1, text+1);
 2c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ca:	8d 50 01             	lea    0x1(%eax),%edx
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	83 c0 01             	add    $0x1,%eax
 2d3:	83 ec 08             	sub    $0x8,%esp
 2d6:	52                   	push   %edx
 2d7:	50                   	push   %eax
 2d8:	e8 57 ff ff ff       	call   234 <matchhere>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	eb 05                	jmp    2e7 <matchhere+0xb3>
  return 0;
 2e2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e7:	c9                   	leave  
 2e8:	c3                   	ret    

000002e9 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	83 ec 08             	sub    $0x8,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 2ef:	83 ec 08             	sub    $0x8,%esp
 2f2:	ff 75 10             	pushl  0x10(%ebp)
 2f5:	ff 75 0c             	pushl  0xc(%ebp)
 2f8:	e8 37 ff ff ff       	call   234 <matchhere>
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	74 07                	je     30b <matchstar+0x22>
      return 1;
 304:	b8 01 00 00 00       	mov    $0x1,%eax
 309:	eb 29                	jmp    334 <matchstar+0x4b>
  }while(*text!='\0' && (*text++==c || c=='.'));
 30b:	8b 45 10             	mov    0x10(%ebp),%eax
 30e:	0f b6 00             	movzbl (%eax),%eax
 311:	84 c0                	test   %al,%al
 313:	74 1a                	je     32f <matchstar+0x46>
 315:	8b 45 10             	mov    0x10(%ebp),%eax
 318:	8d 50 01             	lea    0x1(%eax),%edx
 31b:	89 55 10             	mov    %edx,0x10(%ebp)
 31e:	0f b6 00             	movzbl (%eax),%eax
 321:	0f be c0             	movsbl %al,%eax
 324:	3b 45 08             	cmp    0x8(%ebp),%eax
 327:	74 c6                	je     2ef <matchstar+0x6>
 329:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 32d:	74 c0                	je     2ef <matchstar+0x6>
  return 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 334:	c9                   	leave  
 335:	c3                   	ret    

00000336 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	57                   	push   %edi
 33a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 33b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 33e:	8b 55 10             	mov    0x10(%ebp),%edx
 341:	8b 45 0c             	mov    0xc(%ebp),%eax
 344:	89 cb                	mov    %ecx,%ebx
 346:	89 df                	mov    %ebx,%edi
 348:	89 d1                	mov    %edx,%ecx
 34a:	fc                   	cld    
 34b:	f3 aa                	rep stos %al,%es:(%edi)
 34d:	89 ca                	mov    %ecx,%edx
 34f:	89 fb                	mov    %edi,%ebx
 351:	89 5d 08             	mov    %ebx,0x8(%ebp)
 354:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 357:	90                   	nop
 358:	5b                   	pop    %ebx
 359:	5f                   	pop    %edi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 368:	90                   	nop
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	8d 50 01             	lea    0x1(%eax),%edx
 36f:	89 55 08             	mov    %edx,0x8(%ebp)
 372:	8b 55 0c             	mov    0xc(%ebp),%edx
 375:	8d 4a 01             	lea    0x1(%edx),%ecx
 378:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	88 10                	mov    %dl,(%eax)
 380:	0f b6 00             	movzbl (%eax),%eax
 383:	84 c0                	test   %al,%al
 385:	75 e2                	jne    369 <strcpy+0xd>
    ;
  return os;
 387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 38a:	c9                   	leave  
 38b:	c3                   	ret    

0000038c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 38f:	eb 08                	jmp    399 <strcmp+0xd>
    p++, q++;
 391:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 395:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 399:	8b 45 08             	mov    0x8(%ebp),%eax
 39c:	0f b6 00             	movzbl (%eax),%eax
 39f:	84 c0                	test   %al,%al
 3a1:	74 10                	je     3b3 <strcmp+0x27>
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	0f b6 10             	movzbl (%eax),%edx
 3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	38 c2                	cmp    %al,%dl
 3b1:	74 de                	je     391 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	0f b6 d0             	movzbl %al,%edx
 3bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bf:	0f b6 00             	movzbl (%eax),%eax
 3c2:	0f b6 c0             	movzbl %al,%eax
 3c5:	29 c2                	sub    %eax,%edx
 3c7:	89 d0                	mov    %edx,%eax
}
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <strlen>:

uint
strlen(char *s)
{
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3d8:	eb 04                	jmp    3de <strlen+0x13>
 3da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3de:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	01 d0                	add    %edx,%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	84 c0                	test   %al,%al
 3eb:	75 ed                	jne    3da <strlen+0xf>
    ;
  return n;
 3ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 3f5:	8b 45 10             	mov    0x10(%ebp),%eax
 3f8:	50                   	push   %eax
 3f9:	ff 75 0c             	pushl  0xc(%ebp)
 3fc:	ff 75 08             	pushl  0x8(%ebp)
 3ff:	e8 32 ff ff ff       	call   336 <stosb>
 404:	83 c4 0c             	add    $0xc,%esp
  return dst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <strchr>:

char*
strchr(const char *s, char c)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	83 ec 04             	sub    $0x4,%esp
 412:	8b 45 0c             	mov    0xc(%ebp),%eax
 415:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 418:	eb 14                	jmp    42e <strchr+0x22>
    if(*s == c)
 41a:	8b 45 08             	mov    0x8(%ebp),%eax
 41d:	0f b6 00             	movzbl (%eax),%eax
 420:	3a 45 fc             	cmp    -0x4(%ebp),%al
 423:	75 05                	jne    42a <strchr+0x1e>
      return (char*)s;
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	eb 13                	jmp    43d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 42a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	0f b6 00             	movzbl (%eax),%eax
 434:	84 c0                	test   %al,%al
 436:	75 e2                	jne    41a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 438:	b8 00 00 00 00       	mov    $0x0,%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <gets>:

char*
gets(char *buf, int max)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 44c:	eb 42                	jmp    490 <gets+0x51>
    cc = read(0, &c, 1);
 44e:	83 ec 04             	sub    $0x4,%esp
 451:	6a 01                	push   $0x1
 453:	8d 45 ef             	lea    -0x11(%ebp),%eax
 456:	50                   	push   %eax
 457:	6a 00                	push   $0x0
 459:	e8 b2 02 00 00       	call   710 <read>
 45e:	83 c4 10             	add    $0x10,%esp
 461:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 464:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 468:	7e 33                	jle    49d <gets+0x5e>
      break;
    buf[i++] = c;
 46a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46d:	8d 50 01             	lea    0x1(%eax),%edx
 470:	89 55 f4             	mov    %edx,-0xc(%ebp)
 473:	89 c2                	mov    %eax,%edx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	01 c2                	add    %eax,%edx
 47a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 47e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 480:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 484:	3c 0a                	cmp    $0xa,%al
 486:	74 16                	je     49e <gets+0x5f>
 488:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48c:	3c 0d                	cmp    $0xd,%al
 48e:	74 0e                	je     49e <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 493:	83 c0 01             	add    $0x1,%eax
 496:	3b 45 0c             	cmp    0xc(%ebp),%eax
 499:	7c b3                	jl     44e <gets+0xf>
 49b:	eb 01                	jmp    49e <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 49d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 49e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	01 d0                	add    %edx,%eax
 4a6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <stat>:

int
stat(char *n, struct stat *st)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b4:	83 ec 08             	sub    $0x8,%esp
 4b7:	6a 00                	push   $0x0
 4b9:	ff 75 08             	pushl  0x8(%ebp)
 4bc:	e8 77 02 00 00       	call   738 <open>
 4c1:	83 c4 10             	add    $0x10,%esp
 4c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cb:	79 07                	jns    4d4 <stat+0x26>
    return -1;
 4cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4d2:	eb 25                	jmp    4f9 <stat+0x4b>
  r = fstat(fd, st);
 4d4:	83 ec 08             	sub    $0x8,%esp
 4d7:	ff 75 0c             	pushl  0xc(%ebp)
 4da:	ff 75 f4             	pushl  -0xc(%ebp)
 4dd:	e8 6e 02 00 00       	call   750 <fstat>
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4e8:	83 ec 0c             	sub    $0xc,%esp
 4eb:	ff 75 f4             	pushl  -0xc(%ebp)
 4ee:	e8 2d 02 00 00       	call   720 <close>
 4f3:	83 c4 10             	add    $0x10,%esp
  return r;
 4f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4f9:	c9                   	leave  
 4fa:	c3                   	ret    

000004fb <atoi>:

int
atoi(const char *s)
{
 4fb:	55                   	push   %ebp
 4fc:	89 e5                	mov    %esp,%ebp
 4fe:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 501:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 508:	eb 04                	jmp    50e <atoi+0x13>
 50a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 50e:	8b 45 08             	mov    0x8(%ebp),%eax
 511:	0f b6 00             	movzbl (%eax),%eax
 514:	3c 20                	cmp    $0x20,%al
 516:	74 f2                	je     50a <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	0f b6 00             	movzbl (%eax),%eax
 51e:	3c 2d                	cmp    $0x2d,%al
 520:	75 07                	jne    529 <atoi+0x2e>
 522:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 527:	eb 05                	jmp    52e <atoi+0x33>
 529:	b8 01 00 00 00       	mov    $0x1,%eax
 52e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 531:	8b 45 08             	mov    0x8(%ebp),%eax
 534:	0f b6 00             	movzbl (%eax),%eax
 537:	3c 2b                	cmp    $0x2b,%al
 539:	74 0a                	je     545 <atoi+0x4a>
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	0f b6 00             	movzbl (%eax),%eax
 541:	3c 2d                	cmp    $0x2d,%al
 543:	75 2b                	jne    570 <atoi+0x75>
    s++;
 545:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 549:	eb 25                	jmp    570 <atoi+0x75>
    n = n*10 + *s++ - '0';
 54b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 54e:	89 d0                	mov    %edx,%eax
 550:	c1 e0 02             	shl    $0x2,%eax
 553:	01 d0                	add    %edx,%eax
 555:	01 c0                	add    %eax,%eax
 557:	89 c1                	mov    %eax,%ecx
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	8d 50 01             	lea    0x1(%eax),%edx
 55f:	89 55 08             	mov    %edx,0x8(%ebp)
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	01 c8                	add    %ecx,%eax
 56a:	83 e8 30             	sub    $0x30,%eax
 56d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	0f b6 00             	movzbl (%eax),%eax
 576:	3c 2f                	cmp    $0x2f,%al
 578:	7e 0a                	jle    584 <atoi+0x89>
 57a:	8b 45 08             	mov    0x8(%ebp),%eax
 57d:	0f b6 00             	movzbl (%eax),%eax
 580:	3c 39                	cmp    $0x39,%al
 582:	7e c7                	jle    54b <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 584:	8b 45 f8             	mov    -0x8(%ebp),%eax
 587:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 58b:	c9                   	leave  
 58c:	c3                   	ret    

0000058d <atoo>:

int
atoo(const char *s)
{
 58d:	55                   	push   %ebp
 58e:	89 e5                	mov    %esp,%ebp
 590:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 593:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 59a:	eb 04                	jmp    5a0 <atoo+0x13>
 59c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 5a0:	8b 45 08             	mov    0x8(%ebp),%eax
 5a3:	0f b6 00             	movzbl (%eax),%eax
 5a6:	3c 20                	cmp    $0x20,%al
 5a8:	74 f2                	je     59c <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	0f b6 00             	movzbl (%eax),%eax
 5b0:	3c 2d                	cmp    $0x2d,%al
 5b2:	75 07                	jne    5bb <atoo+0x2e>
 5b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5b9:	eb 05                	jmp    5c0 <atoo+0x33>
 5bb:	b8 01 00 00 00       	mov    $0x1,%eax
 5c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	0f b6 00             	movzbl (%eax),%eax
 5c9:	3c 2b                	cmp    $0x2b,%al
 5cb:	74 0a                	je     5d7 <atoo+0x4a>
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	0f b6 00             	movzbl (%eax),%eax
 5d3:	3c 2d                	cmp    $0x2d,%al
 5d5:	75 27                	jne    5fe <atoo+0x71>
    s++;
 5d7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 5db:	eb 21                	jmp    5fe <atoo+0x71>
    n = n*8 + *s++ - '0';
 5dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e0:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	8d 50 01             	lea    0x1(%eax),%edx
 5ed:	89 55 08             	mov    %edx,0x8(%ebp)
 5f0:	0f b6 00             	movzbl (%eax),%eax
 5f3:	0f be c0             	movsbl %al,%eax
 5f6:	01 c8                	add    %ecx,%eax
 5f8:	83 e8 30             	sub    $0x30,%eax
 5fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	0f b6 00             	movzbl (%eax),%eax
 604:	3c 2f                	cmp    $0x2f,%al
 606:	7e 0a                	jle    612 <atoo+0x85>
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	0f b6 00             	movzbl (%eax),%eax
 60e:	3c 37                	cmp    $0x37,%al
 610:	7e cb                	jle    5dd <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 612:	8b 45 f8             	mov    -0x8(%ebp),%eax
 615:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 619:	c9                   	leave  
 61a:	c3                   	ret    

0000061b <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 627:	8b 45 0c             	mov    0xc(%ebp),%eax
 62a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 62d:	eb 17                	jmp    646 <memmove+0x2b>
    *dst++ = *src++;
 62f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 632:	8d 50 01             	lea    0x1(%eax),%edx
 635:	89 55 fc             	mov    %edx,-0x4(%ebp)
 638:	8b 55 f8             	mov    -0x8(%ebp),%edx
 63b:	8d 4a 01             	lea    0x1(%edx),%ecx
 63e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 641:	0f b6 12             	movzbl (%edx),%edx
 644:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 646:	8b 45 10             	mov    0x10(%ebp),%eax
 649:	8d 50 ff             	lea    -0x1(%eax),%edx
 64c:	89 55 10             	mov    %edx,0x10(%ebp)
 64f:	85 c0                	test   %eax,%eax
 651:	7f dc                	jg     62f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 653:	8b 45 08             	mov    0x8(%ebp),%eax
}
 656:	c9                   	leave  
 657:	c3                   	ret    

00000658 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 658:	55                   	push   %ebp
 659:	89 e5                	mov    %esp,%ebp
 65b:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 65e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 661:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 666:	89 c8                	mov    %ecx,%eax
 668:	f7 e2                	mul    %edx
 66a:	89 d0                	mov    %edx,%eax
 66c:	c1 e8 06             	shr    $0x6,%eax
 66f:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 675:	29 c1                	sub    %eax,%ecx
 677:	89 c8                	mov    %ecx,%eax
 679:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 684:	f7 e2                	mul    %edx
 686:	89 d0                	mov    %edx,%eax
 688:	c1 e8 06             	shr    $0x6,%eax
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	50                   	push   %eax
 68f:	68 9e 0c 00 00       	push   $0xc9e
 694:	6a 01                	push   $0x1
 696:	e8 14 02 00 00       	call   8af <printf>
 69b:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 69e:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 6a2:	7e 17                	jle    6bb <zeropad+0x63>
    printf(1,"%d", miliseconds);
 6a4:	83 ec 04             	sub    $0x4,%esp
 6a7:	ff 75 f4             	pushl  -0xc(%ebp)
 6aa:	68 a2 0c 00 00       	push   $0xca2
 6af:	6a 01                	push   $0x1
 6b1:	e8 f9 01 00 00       	call   8af <printf>
 6b6:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 6b9:	eb 32                	jmp    6ed <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 6bb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 6bf:	7e 17                	jle    6d8 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 6c1:	83 ec 04             	sub    $0x4,%esp
 6c4:	ff 75 f4             	pushl  -0xc(%ebp)
 6c7:	68 a5 0c 00 00       	push   $0xca5
 6cc:	6a 01                	push   $0x1
 6ce:	e8 dc 01 00 00       	call   8af <printf>
 6d3:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 6d6:	eb 15                	jmp    6ed <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 6d8:	83 ec 04             	sub    $0x4,%esp
 6db:	ff 75 f4             	pushl  -0xc(%ebp)
 6de:	68 a9 0c 00 00       	push   $0xca9
 6e3:	6a 01                	push   $0x1
 6e5:	e8 c5 01 00 00       	call   8af <printf>
 6ea:	83 c4 10             	add    $0x10,%esp
};
 6ed:	90                   	nop
 6ee:	c9                   	leave  
 6ef:	c3                   	ret    

000006f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6f0:	b8 01 00 00 00       	mov    $0x1,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <exit>:
SYSCALL(exit)
 6f8:	b8 02 00 00 00       	mov    $0x2,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <wait>:
SYSCALL(wait)
 700:	b8 03 00 00 00       	mov    $0x3,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <pipe>:
SYSCALL(pipe)
 708:	b8 04 00 00 00       	mov    $0x4,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <read>:
SYSCALL(read)
 710:	b8 05 00 00 00       	mov    $0x5,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <write>:
SYSCALL(write)
 718:	b8 10 00 00 00       	mov    $0x10,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <close>:
SYSCALL(close)
 720:	b8 15 00 00 00       	mov    $0x15,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <kill>:
SYSCALL(kill)
 728:	b8 06 00 00 00       	mov    $0x6,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <exec>:
SYSCALL(exec)
 730:	b8 07 00 00 00       	mov    $0x7,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <open>:
SYSCALL(open)
 738:	b8 0f 00 00 00       	mov    $0xf,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <mknod>:
SYSCALL(mknod)
 740:	b8 11 00 00 00       	mov    $0x11,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <unlink>:
SYSCALL(unlink)
 748:	b8 12 00 00 00       	mov    $0x12,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <fstat>:
SYSCALL(fstat)
 750:	b8 08 00 00 00       	mov    $0x8,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <link>:
SYSCALL(link)
 758:	b8 13 00 00 00       	mov    $0x13,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <mkdir>:
SYSCALL(mkdir)
 760:	b8 14 00 00 00       	mov    $0x14,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <chdir>:
SYSCALL(chdir)
 768:	b8 09 00 00 00       	mov    $0x9,%eax
 76d:	cd 40                	int    $0x40
 76f:	c3                   	ret    

00000770 <dup>:
SYSCALL(dup)
 770:	b8 0a 00 00 00       	mov    $0xa,%eax
 775:	cd 40                	int    $0x40
 777:	c3                   	ret    

00000778 <getpid>:
SYSCALL(getpid)
 778:	b8 0b 00 00 00       	mov    $0xb,%eax
 77d:	cd 40                	int    $0x40
 77f:	c3                   	ret    

00000780 <sbrk>:
SYSCALL(sbrk)
 780:	b8 0c 00 00 00       	mov    $0xc,%eax
 785:	cd 40                	int    $0x40
 787:	c3                   	ret    

00000788 <sleep>:
SYSCALL(sleep)
 788:	b8 0d 00 00 00       	mov    $0xd,%eax
 78d:	cd 40                	int    $0x40
 78f:	c3                   	ret    

00000790 <uptime>:
SYSCALL(uptime)
 790:	b8 0e 00 00 00       	mov    $0xe,%eax
 795:	cd 40                	int    $0x40
 797:	c3                   	ret    

00000798 <halt>:
SYSCALL(halt)
 798:	b8 16 00 00 00       	mov    $0x16,%eax
 79d:	cd 40                	int    $0x40
 79f:	c3                   	ret    

000007a0 <date>:

SYSCALL(date)
 7a0:	b8 17 00 00 00       	mov    $0x17,%eax
 7a5:	cd 40                	int    $0x40
 7a7:	c3                   	ret    

000007a8 <getuid>:
SYSCALL(getuid)
 7a8:	b8 18 00 00 00       	mov    $0x18,%eax
 7ad:	cd 40                	int    $0x40
 7af:	c3                   	ret    

000007b0 <getgid>:
SYSCALL(getgid)
 7b0:	b8 19 00 00 00       	mov    $0x19,%eax
 7b5:	cd 40                	int    $0x40
 7b7:	c3                   	ret    

000007b8 <getppid>:
SYSCALL(getppid)
 7b8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 7bd:	cd 40                	int    $0x40
 7bf:	c3                   	ret    

000007c0 <setuid>:
SYSCALL(setuid)
 7c0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 7c5:	cd 40                	int    $0x40
 7c7:	c3                   	ret    

000007c8 <setgid>:
SYSCALL(setgid)
 7c8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 7cd:	cd 40                	int    $0x40
 7cf:	c3                   	ret    

000007d0 <getprocs>:
SYSCALL(getprocs)
 7d0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 7d5:	cd 40                	int    $0x40
 7d7:	c3                   	ret    

000007d8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7d8:	55                   	push   %ebp
 7d9:	89 e5                	mov    %esp,%ebp
 7db:	83 ec 18             	sub    $0x18,%esp
 7de:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7e4:	83 ec 04             	sub    $0x4,%esp
 7e7:	6a 01                	push   $0x1
 7e9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7ec:	50                   	push   %eax
 7ed:	ff 75 08             	pushl  0x8(%ebp)
 7f0:	e8 23 ff ff ff       	call   718 <write>
 7f5:	83 c4 10             	add    $0x10,%esp
}
 7f8:	90                   	nop
 7f9:	c9                   	leave  
 7fa:	c3                   	ret    

000007fb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	53                   	push   %ebx
 7ff:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 802:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 809:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 80d:	74 17                	je     826 <printint+0x2b>
 80f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 813:	79 11                	jns    826 <printint+0x2b>
    neg = 1;
 815:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 81c:	8b 45 0c             	mov    0xc(%ebp),%eax
 81f:	f7 d8                	neg    %eax
 821:	89 45 ec             	mov    %eax,-0x14(%ebp)
 824:	eb 06                	jmp    82c <printint+0x31>
  } else {
    x = xx;
 826:	8b 45 0c             	mov    0xc(%ebp),%eax
 829:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 82c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 833:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 836:	8d 41 01             	lea    0x1(%ecx),%eax
 839:	89 45 f4             	mov    %eax,-0xc(%ebp)
 83c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 83f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 842:	ba 00 00 00 00       	mov    $0x0,%edx
 847:	f7 f3                	div    %ebx
 849:	89 d0                	mov    %edx,%eax
 84b:	0f b6 80 c4 0f 00 00 	movzbl 0xfc4(%eax),%eax
 852:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 856:	8b 5d 10             	mov    0x10(%ebp),%ebx
 859:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85c:	ba 00 00 00 00       	mov    $0x0,%edx
 861:	f7 f3                	div    %ebx
 863:	89 45 ec             	mov    %eax,-0x14(%ebp)
 866:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 86a:	75 c7                	jne    833 <printint+0x38>
  if(neg)
 86c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 870:	74 2d                	je     89f <printint+0xa4>
    buf[i++] = '-';
 872:	8b 45 f4             	mov    -0xc(%ebp),%eax
 875:	8d 50 01             	lea    0x1(%eax),%edx
 878:	89 55 f4             	mov    %edx,-0xc(%ebp)
 87b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 880:	eb 1d                	jmp    89f <printint+0xa4>
    putc(fd, buf[i]);
 882:	8d 55 dc             	lea    -0x24(%ebp),%edx
 885:	8b 45 f4             	mov    -0xc(%ebp),%eax
 888:	01 d0                	add    %edx,%eax
 88a:	0f b6 00             	movzbl (%eax),%eax
 88d:	0f be c0             	movsbl %al,%eax
 890:	83 ec 08             	sub    $0x8,%esp
 893:	50                   	push   %eax
 894:	ff 75 08             	pushl  0x8(%ebp)
 897:	e8 3c ff ff ff       	call   7d8 <putc>
 89c:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 89f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 8a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8a7:	79 d9                	jns    882 <printint+0x87>
    putc(fd, buf[i]);
}
 8a9:	90                   	nop
 8aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ad:	c9                   	leave  
 8ae:	c3                   	ret    

000008af <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8af:	55                   	push   %ebp
 8b0:	89 e5                	mov    %esp,%ebp
 8b2:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 8bc:	8d 45 0c             	lea    0xc(%ebp),%eax
 8bf:	83 c0 04             	add    $0x4,%eax
 8c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 8c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8cc:	e9 59 01 00 00       	jmp    a2a <printf+0x17b>
    c = fmt[i] & 0xff;
 8d1:	8b 55 0c             	mov    0xc(%ebp),%edx
 8d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d7:	01 d0                	add    %edx,%eax
 8d9:	0f b6 00             	movzbl (%eax),%eax
 8dc:	0f be c0             	movsbl %al,%eax
 8df:	25 ff 00 00 00       	and    $0xff,%eax
 8e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8eb:	75 2c                	jne    919 <printf+0x6a>
      if(c == '%'){
 8ed:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8f1:	75 0c                	jne    8ff <printf+0x50>
        state = '%';
 8f3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8fa:	e9 27 01 00 00       	jmp    a26 <printf+0x177>
      } else {
        putc(fd, c);
 8ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 902:	0f be c0             	movsbl %al,%eax
 905:	83 ec 08             	sub    $0x8,%esp
 908:	50                   	push   %eax
 909:	ff 75 08             	pushl  0x8(%ebp)
 90c:	e8 c7 fe ff ff       	call   7d8 <putc>
 911:	83 c4 10             	add    $0x10,%esp
 914:	e9 0d 01 00 00       	jmp    a26 <printf+0x177>
      }
    } else if(state == '%'){
 919:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 91d:	0f 85 03 01 00 00    	jne    a26 <printf+0x177>
      if(c == 'd'){
 923:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 927:	75 1e                	jne    947 <printf+0x98>
        printint(fd, *ap, 10, 1);
 929:	8b 45 e8             	mov    -0x18(%ebp),%eax
 92c:	8b 00                	mov    (%eax),%eax
 92e:	6a 01                	push   $0x1
 930:	6a 0a                	push   $0xa
 932:	50                   	push   %eax
 933:	ff 75 08             	pushl  0x8(%ebp)
 936:	e8 c0 fe ff ff       	call   7fb <printint>
 93b:	83 c4 10             	add    $0x10,%esp
        ap++;
 93e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 942:	e9 d8 00 00 00       	jmp    a1f <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 947:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 94b:	74 06                	je     953 <printf+0xa4>
 94d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 951:	75 1e                	jne    971 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 953:	8b 45 e8             	mov    -0x18(%ebp),%eax
 956:	8b 00                	mov    (%eax),%eax
 958:	6a 00                	push   $0x0
 95a:	6a 10                	push   $0x10
 95c:	50                   	push   %eax
 95d:	ff 75 08             	pushl  0x8(%ebp)
 960:	e8 96 fe ff ff       	call   7fb <printint>
 965:	83 c4 10             	add    $0x10,%esp
        ap++;
 968:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 96c:	e9 ae 00 00 00       	jmp    a1f <printf+0x170>
      } else if(c == 's'){
 971:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 975:	75 43                	jne    9ba <printf+0x10b>
        s = (char*)*ap;
 977:	8b 45 e8             	mov    -0x18(%ebp),%eax
 97a:	8b 00                	mov    (%eax),%eax
 97c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 97f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 983:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 987:	75 25                	jne    9ae <printf+0xff>
          s = "(null)";
 989:	c7 45 f4 ae 0c 00 00 	movl   $0xcae,-0xc(%ebp)
        while(*s != 0){
 990:	eb 1c                	jmp    9ae <printf+0xff>
          putc(fd, *s);
 992:	8b 45 f4             	mov    -0xc(%ebp),%eax
 995:	0f b6 00             	movzbl (%eax),%eax
 998:	0f be c0             	movsbl %al,%eax
 99b:	83 ec 08             	sub    $0x8,%esp
 99e:	50                   	push   %eax
 99f:	ff 75 08             	pushl  0x8(%ebp)
 9a2:	e8 31 fe ff ff       	call   7d8 <putc>
 9a7:	83 c4 10             	add    $0x10,%esp
          s++;
 9aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b1:	0f b6 00             	movzbl (%eax),%eax
 9b4:	84 c0                	test   %al,%al
 9b6:	75 da                	jne    992 <printf+0xe3>
 9b8:	eb 65                	jmp    a1f <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ba:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9be:	75 1d                	jne    9dd <printf+0x12e>
        putc(fd, *ap);
 9c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9c3:	8b 00                	mov    (%eax),%eax
 9c5:	0f be c0             	movsbl %al,%eax
 9c8:	83 ec 08             	sub    $0x8,%esp
 9cb:	50                   	push   %eax
 9cc:	ff 75 08             	pushl  0x8(%ebp)
 9cf:	e8 04 fe ff ff       	call   7d8 <putc>
 9d4:	83 c4 10             	add    $0x10,%esp
        ap++;
 9d7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9db:	eb 42                	jmp    a1f <printf+0x170>
      } else if(c == '%'){
 9dd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9e1:	75 17                	jne    9fa <printf+0x14b>
        putc(fd, c);
 9e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9e6:	0f be c0             	movsbl %al,%eax
 9e9:	83 ec 08             	sub    $0x8,%esp
 9ec:	50                   	push   %eax
 9ed:	ff 75 08             	pushl  0x8(%ebp)
 9f0:	e8 e3 fd ff ff       	call   7d8 <putc>
 9f5:	83 c4 10             	add    $0x10,%esp
 9f8:	eb 25                	jmp    a1f <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9fa:	83 ec 08             	sub    $0x8,%esp
 9fd:	6a 25                	push   $0x25
 9ff:	ff 75 08             	pushl  0x8(%ebp)
 a02:	e8 d1 fd ff ff       	call   7d8 <putc>
 a07:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 a0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a0d:	0f be c0             	movsbl %al,%eax
 a10:	83 ec 08             	sub    $0x8,%esp
 a13:	50                   	push   %eax
 a14:	ff 75 08             	pushl  0x8(%ebp)
 a17:	e8 bc fd ff ff       	call   7d8 <putc>
 a1c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a1f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a26:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a2a:	8b 55 0c             	mov    0xc(%ebp),%edx
 a2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a30:	01 d0                	add    %edx,%eax
 a32:	0f b6 00             	movzbl (%eax),%eax
 a35:	84 c0                	test   %al,%al
 a37:	0f 85 94 fe ff ff    	jne    8d1 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a3d:	90                   	nop
 a3e:	c9                   	leave  
 a3f:	c3                   	ret    

00000a40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a46:	8b 45 08             	mov    0x8(%ebp),%eax
 a49:	83 e8 08             	sub    $0x8,%eax
 a4c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4f:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 a54:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a57:	eb 24                	jmp    a7d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a59:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5c:	8b 00                	mov    (%eax),%eax
 a5e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a61:	77 12                	ja     a75 <free+0x35>
 a63:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a66:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a69:	77 24                	ja     a8f <free+0x4f>
 a6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6e:	8b 00                	mov    (%eax),%eax
 a70:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a73:	77 1a                	ja     a8f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a75:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a78:	8b 00                	mov    (%eax),%eax
 a7a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a80:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a83:	76 d4                	jbe    a59 <free+0x19>
 a85:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a88:	8b 00                	mov    (%eax),%eax
 a8a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a8d:	76 ca                	jbe    a59 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a92:	8b 40 04             	mov    0x4(%eax),%eax
 a95:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9f:	01 c2                	add    %eax,%edx
 aa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa4:	8b 00                	mov    (%eax),%eax
 aa6:	39 c2                	cmp    %eax,%edx
 aa8:	75 24                	jne    ace <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 aaa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aad:	8b 50 04             	mov    0x4(%eax),%edx
 ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab3:	8b 00                	mov    (%eax),%eax
 ab5:	8b 40 04             	mov    0x4(%eax),%eax
 ab8:	01 c2                	add    %eax,%edx
 aba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 abd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 ac0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac3:	8b 00                	mov    (%eax),%eax
 ac5:	8b 10                	mov    (%eax),%edx
 ac7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aca:	89 10                	mov    %edx,(%eax)
 acc:	eb 0a                	jmp    ad8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 ace:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad1:	8b 10                	mov    (%eax),%edx
 ad3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ad8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 adb:	8b 40 04             	mov    0x4(%eax),%eax
 ade:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ae5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae8:	01 d0                	add    %edx,%eax
 aea:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aed:	75 20                	jne    b0f <free+0xcf>
    p->s.size += bp->s.size;
 aef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af2:	8b 50 04             	mov    0x4(%eax),%edx
 af5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 af8:	8b 40 04             	mov    0x4(%eax),%eax
 afb:	01 c2                	add    %eax,%edx
 afd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b00:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b03:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b06:	8b 10                	mov    (%eax),%edx
 b08:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b0b:	89 10                	mov    %edx,(%eax)
 b0d:	eb 08                	jmp    b17 <free+0xd7>
  } else
    p->s.ptr = bp;
 b0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b12:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b15:	89 10                	mov    %edx,(%eax)
  freep = p;
 b17:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b1a:	a3 e8 0f 00 00       	mov    %eax,0xfe8
}
 b1f:	90                   	nop
 b20:	c9                   	leave  
 b21:	c3                   	ret    

00000b22 <morecore>:

static Header*
morecore(uint nu)
{
 b22:	55                   	push   %ebp
 b23:	89 e5                	mov    %esp,%ebp
 b25:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b28:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b2f:	77 07                	ja     b38 <morecore+0x16>
    nu = 4096;
 b31:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b38:	8b 45 08             	mov    0x8(%ebp),%eax
 b3b:	c1 e0 03             	shl    $0x3,%eax
 b3e:	83 ec 0c             	sub    $0xc,%esp
 b41:	50                   	push   %eax
 b42:	e8 39 fc ff ff       	call   780 <sbrk>
 b47:	83 c4 10             	add    $0x10,%esp
 b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b4d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b51:	75 07                	jne    b5a <morecore+0x38>
    return 0;
 b53:	b8 00 00 00 00       	mov    $0x0,%eax
 b58:	eb 26                	jmp    b80 <morecore+0x5e>
  hp = (Header*)p;
 b5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b60:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b63:	8b 55 08             	mov    0x8(%ebp),%edx
 b66:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b6c:	83 c0 08             	add    $0x8,%eax
 b6f:	83 ec 0c             	sub    $0xc,%esp
 b72:	50                   	push   %eax
 b73:	e8 c8 fe ff ff       	call   a40 <free>
 b78:	83 c4 10             	add    $0x10,%esp
  return freep;
 b7b:	a1 e8 0f 00 00       	mov    0xfe8,%eax
}
 b80:	c9                   	leave  
 b81:	c3                   	ret    

00000b82 <malloc>:

void*
malloc(uint nbytes)
{
 b82:	55                   	push   %ebp
 b83:	89 e5                	mov    %esp,%ebp
 b85:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b88:	8b 45 08             	mov    0x8(%ebp),%eax
 b8b:	83 c0 07             	add    $0x7,%eax
 b8e:	c1 e8 03             	shr    $0x3,%eax
 b91:	83 c0 01             	add    $0x1,%eax
 b94:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b97:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 b9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b9f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ba3:	75 23                	jne    bc8 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 ba5:	c7 45 f0 e0 0f 00 00 	movl   $0xfe0,-0x10(%ebp)
 bac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 baf:	a3 e8 0f 00 00       	mov    %eax,0xfe8
 bb4:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 bb9:	a3 e0 0f 00 00       	mov    %eax,0xfe0
    base.s.size = 0;
 bbe:	c7 05 e4 0f 00 00 00 	movl   $0x0,0xfe4
 bc5:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bcb:	8b 00                	mov    (%eax),%eax
 bcd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd3:	8b 40 04             	mov    0x4(%eax),%eax
 bd6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bd9:	72 4d                	jb     c28 <malloc+0xa6>
      if(p->s.size == nunits)
 bdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bde:	8b 40 04             	mov    0x4(%eax),%eax
 be1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 be4:	75 0c                	jne    bf2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 be6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be9:	8b 10                	mov    (%eax),%edx
 beb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bee:	89 10                	mov    %edx,(%eax)
 bf0:	eb 26                	jmp    c18 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf5:	8b 40 04             	mov    0x4(%eax),%eax
 bf8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bfb:	89 c2                	mov    %eax,%edx
 bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c00:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 c03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c06:	8b 40 04             	mov    0x4(%eax),%eax
 c09:	c1 e0 03             	shl    $0x3,%eax
 c0c:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c12:	8b 55 ec             	mov    -0x14(%ebp),%edx
 c15:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 c18:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c1b:	a3 e8 0f 00 00       	mov    %eax,0xfe8
      return (void*)(p + 1);
 c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c23:	83 c0 08             	add    $0x8,%eax
 c26:	eb 3b                	jmp    c63 <malloc+0xe1>
    }
    if(p == freep)
 c28:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 c2d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c30:	75 1e                	jne    c50 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 c32:	83 ec 0c             	sub    $0xc,%esp
 c35:	ff 75 ec             	pushl  -0x14(%ebp)
 c38:	e8 e5 fe ff ff       	call   b22 <morecore>
 c3d:	83 c4 10             	add    $0x10,%esp
 c40:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c43:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c47:	75 07                	jne    c50 <malloc+0xce>
        return 0;
 c49:	b8 00 00 00 00       	mov    $0x0,%eax
 c4e:	eb 13                	jmp    c63 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c50:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c53:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c59:	8b 00                	mov    (%eax),%eax
 c5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 c5e:	e9 6d ff ff ff       	jmp    bd0 <malloc+0x4e>
}
 c63:	c9                   	leave  
 c64:	c3                   	ret    
