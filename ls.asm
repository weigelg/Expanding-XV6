
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	83 ec 0c             	sub    $0xc,%esp
   a:	ff 75 08             	pushl  0x8(%ebp)
   d:	e8 c9 03 00 00       	call   3db <strlen>
  12:	83 c4 10             	add    $0x10,%esp
  15:	89 c2                	mov    %eax,%edx
  17:	8b 45 08             	mov    0x8(%ebp),%eax
  1a:	01 d0                	add    %edx,%eax
  1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1f:	eb 04                	jmp    25 <fmtname+0x25>
  21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28:	3b 45 08             	cmp    0x8(%ebp),%eax
  2b:	72 0a                	jb     37 <fmtname+0x37>
  2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30:	0f b6 00             	movzbl (%eax),%eax
  33:	3c 2f                	cmp    $0x2f,%al
  35:	75 ea                	jne    21 <fmtname+0x21>
    ;
  p++;
  37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  3b:	83 ec 0c             	sub    $0xc,%esp
  3e:	ff 75 f4             	pushl  -0xc(%ebp)
  41:	e8 95 03 00 00       	call   3db <strlen>
  46:	83 c4 10             	add    $0x10,%esp
  49:	83 f8 0d             	cmp    $0xd,%eax
  4c:	76 05                	jbe    53 <fmtname+0x53>
    return p;
  4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  51:	eb 60                	jmp    b3 <fmtname+0xb3>
  memmove(buf, p, strlen(p));
  53:	83 ec 0c             	sub    $0xc,%esp
  56:	ff 75 f4             	pushl  -0xc(%ebp)
  59:	e8 7d 03 00 00       	call   3db <strlen>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	83 ec 04             	sub    $0x4,%esp
  64:	50                   	push   %eax
  65:	ff 75 f4             	pushl  -0xc(%ebp)
  68:	68 cc 0f 00 00       	push   $0xfcc
  6d:	e8 b9 05 00 00       	call   62b <memmove>
  72:	83 c4 10             	add    $0x10,%esp
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	ff 75 f4             	pushl  -0xc(%ebp)
  7b:	e8 5b 03 00 00       	call   3db <strlen>
  80:	83 c4 10             	add    $0x10,%esp
  83:	ba 0e 00 00 00       	mov    $0xe,%edx
  88:	89 d3                	mov    %edx,%ebx
  8a:	29 c3                	sub    %eax,%ebx
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	ff 75 f4             	pushl  -0xc(%ebp)
  92:	e8 44 03 00 00       	call   3db <strlen>
  97:	83 c4 10             	add    $0x10,%esp
  9a:	05 cc 0f 00 00       	add    $0xfcc,%eax
  9f:	83 ec 04             	sub    $0x4,%esp
  a2:	53                   	push   %ebx
  a3:	6a 20                	push   $0x20
  a5:	50                   	push   %eax
  a6:	e8 57 03 00 00       	call   402 <memset>
  ab:	83 c4 10             	add    $0x10,%esp
  return buf;
  ae:	b8 cc 0f 00 00       	mov    $0xfcc,%eax
}
  b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b6:	c9                   	leave  
  b7:	c3                   	ret    

000000b8 <ls>:

void
ls(char *path)
{
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	57                   	push   %edi
  bc:	56                   	push   %esi
  bd:	53                   	push   %ebx
  be:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  c4:	83 ec 08             	sub    $0x8,%esp
  c7:	6a 00                	push   $0x0
  c9:	ff 75 08             	pushl  0x8(%ebp)
  cc:	e8 77 06 00 00       	call   748 <open>
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  db:	79 1a                	jns    f7 <ls+0x3f>
    printf(2, "ls: cannot open %s\n", path);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 75 08             	pushl  0x8(%ebp)
  e3:	68 75 0c 00 00       	push   $0xc75
  e8:	6a 02                	push   $0x2
  ea:	e8 d0 07 00 00       	call   8bf <printf>
  ef:	83 c4 10             	add    $0x10,%esp
    return;
  f2:	e9 e3 01 00 00       	jmp    2da <ls+0x222>
  }
  
  if(fstat(fd, &st) < 0){
  f7:	83 ec 08             	sub    $0x8,%esp
  fa:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 100:	50                   	push   %eax
 101:	ff 75 e4             	pushl  -0x1c(%ebp)
 104:	e8 57 06 00 00       	call   760 <fstat>
 109:	83 c4 10             	add    $0x10,%esp
 10c:	85 c0                	test   %eax,%eax
 10e:	79 28                	jns    138 <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
 110:	83 ec 04             	sub    $0x4,%esp
 113:	ff 75 08             	pushl  0x8(%ebp)
 116:	68 89 0c 00 00       	push   $0xc89
 11b:	6a 02                	push   $0x2
 11d:	e8 9d 07 00 00       	call   8bf <printf>
 122:	83 c4 10             	add    $0x10,%esp
    close(fd);
 125:	83 ec 0c             	sub    $0xc,%esp
 128:	ff 75 e4             	pushl  -0x1c(%ebp)
 12b:	e8 00 06 00 00       	call   730 <close>
 130:	83 c4 10             	add    $0x10,%esp
    return;
 133:	e9 a2 01 00 00       	jmp    2da <ls+0x222>
  }
  
  switch(st.type){
 138:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 13f:	98                   	cwtl   
 140:	83 f8 01             	cmp    $0x1,%eax
 143:	74 48                	je     18d <ls+0xd5>
 145:	83 f8 02             	cmp    $0x2,%eax
 148:	0f 85 7e 01 00 00    	jne    2cc <ls+0x214>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 14e:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 154:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 161:	0f bf d8             	movswl %ax,%ebx
 164:	83 ec 0c             	sub    $0xc,%esp
 167:	ff 75 08             	pushl  0x8(%ebp)
 16a:	e8 91 fe ff ff       	call   0 <fmtname>
 16f:	83 c4 10             	add    $0x10,%esp
 172:	83 ec 08             	sub    $0x8,%esp
 175:	57                   	push   %edi
 176:	56                   	push   %esi
 177:	53                   	push   %ebx
 178:	50                   	push   %eax
 179:	68 9d 0c 00 00       	push   $0xc9d
 17e:	6a 01                	push   $0x1
 180:	e8 3a 07 00 00       	call   8bf <printf>
 185:	83 c4 20             	add    $0x20,%esp
    break;
 188:	e9 3f 01 00 00       	jmp    2cc <ls+0x214>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 18d:	83 ec 0c             	sub    $0xc,%esp
 190:	ff 75 08             	pushl  0x8(%ebp)
 193:	e8 43 02 00 00       	call   3db <strlen>
 198:	83 c4 10             	add    $0x10,%esp
 19b:	83 c0 10             	add    $0x10,%eax
 19e:	3d 00 02 00 00       	cmp    $0x200,%eax
 1a3:	76 17                	jbe    1bc <ls+0x104>
      printf(1, "ls: path too long\n");
 1a5:	83 ec 08             	sub    $0x8,%esp
 1a8:	68 aa 0c 00 00       	push   $0xcaa
 1ad:	6a 01                	push   $0x1
 1af:	e8 0b 07 00 00       	call   8bf <printf>
 1b4:	83 c4 10             	add    $0x10,%esp
      break;
 1b7:	e9 10 01 00 00       	jmp    2cc <ls+0x214>
    }
    strcpy(buf, path);
 1bc:	83 ec 08             	sub    $0x8,%esp
 1bf:	ff 75 08             	pushl  0x8(%ebp)
 1c2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1c8:	50                   	push   %eax
 1c9:	e8 9e 01 00 00       	call   36c <strcpy>
 1ce:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1da:	50                   	push   %eax
 1db:	e8 fb 01 00 00       	call   3db <strlen>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	89 c2                	mov    %eax,%edx
 1e5:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1eb:	01 d0                	add    %edx,%eax
 1ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
 1f9:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1fc:	e9 aa 00 00 00       	jmp    2ab <ls+0x1f3>
      if(de.inum == 0)
 201:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 208:	66 85 c0             	test   %ax,%ax
 20b:	75 05                	jne    212 <ls+0x15a>
        continue;
 20d:	e9 99 00 00 00       	jmp    2ab <ls+0x1f3>
      memmove(p, de.name, DIRSIZ);
 212:	83 ec 04             	sub    $0x4,%esp
 215:	6a 0e                	push   $0xe
 217:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 21d:	83 c0 02             	add    $0x2,%eax
 220:	50                   	push   %eax
 221:	ff 75 e0             	pushl  -0x20(%ebp)
 224:	e8 02 04 00 00       	call   62b <memmove>
 229:	83 c4 10             	add    $0x10,%esp
      p[DIRSIZ] = 0;
 22c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22f:	83 c0 0e             	add    $0xe,%eax
 232:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 235:	83 ec 08             	sub    $0x8,%esp
 238:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 23e:	50                   	push   %eax
 23f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 245:	50                   	push   %eax
 246:	e8 73 02 00 00       	call   4be <stat>
 24b:	83 c4 10             	add    $0x10,%esp
 24e:	85 c0                	test   %eax,%eax
 250:	79 1b                	jns    26d <ls+0x1b5>
        printf(1, "ls: cannot stat %s\n", buf);
 252:	83 ec 04             	sub    $0x4,%esp
 255:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 25b:	50                   	push   %eax
 25c:	68 89 0c 00 00       	push   $0xc89
 261:	6a 01                	push   $0x1
 263:	e8 57 06 00 00       	call   8bf <printf>
 268:	83 c4 10             	add    $0x10,%esp
        continue;
 26b:	eb 3e                	jmp    2ab <ls+0x1f3>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 26d:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 273:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 279:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 280:	0f bf d8             	movswl %ax,%ebx
 283:	83 ec 0c             	sub    $0xc,%esp
 286:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 28c:	50                   	push   %eax
 28d:	e8 6e fd ff ff       	call   0 <fmtname>
 292:	83 c4 10             	add    $0x10,%esp
 295:	83 ec 08             	sub    $0x8,%esp
 298:	57                   	push   %edi
 299:	56                   	push   %esi
 29a:	53                   	push   %ebx
 29b:	50                   	push   %eax
 29c:	68 9d 0c 00 00       	push   $0xc9d
 2a1:	6a 01                	push   $0x1
 2a3:	e8 17 06 00 00       	call   8bf <printf>
 2a8:	83 c4 20             	add    $0x20,%esp
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2ab:	83 ec 04             	sub    $0x4,%esp
 2ae:	6a 10                	push   $0x10
 2b0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2b6:	50                   	push   %eax
 2b7:	ff 75 e4             	pushl  -0x1c(%ebp)
 2ba:	e8 61 04 00 00       	call   720 <read>
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	83 f8 10             	cmp    $0x10,%eax
 2c5:	0f 84 36 ff ff ff    	je     201 <ls+0x149>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
 2cb:	90                   	nop
  }
  close(fd);
 2cc:	83 ec 0c             	sub    $0xc,%esp
 2cf:	ff 75 e4             	pushl  -0x1c(%ebp)
 2d2:	e8 59 04 00 00       	call   730 <close>
 2d7:	83 c4 10             	add    $0x10,%esp
}
 2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5f                   	pop    %edi
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret    

000002e2 <main>:

int
main(int argc, char *argv[])
{
 2e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2e6:	83 e4 f0             	and    $0xfffffff0,%esp
 2e9:	ff 71 fc             	pushl  -0x4(%ecx)
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	53                   	push   %ebx
 2f0:	51                   	push   %ecx
 2f1:	83 ec 10             	sub    $0x10,%esp
 2f4:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
 2f6:	83 3b 01             	cmpl   $0x1,(%ebx)
 2f9:	7f 15                	jg     310 <main+0x2e>
    ls(".");
 2fb:	83 ec 0c             	sub    $0xc,%esp
 2fe:	68 bd 0c 00 00       	push   $0xcbd
 303:	e8 b0 fd ff ff       	call   b8 <ls>
 308:	83 c4 10             	add    $0x10,%esp
    exit();
 30b:	e8 f8 03 00 00       	call   708 <exit>
  }
  for(i=1; i<argc; i++)
 310:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 317:	eb 21                	jmp    33a <main+0x58>
    ls(argv[i]);
 319:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 323:	8b 43 04             	mov    0x4(%ebx),%eax
 326:	01 d0                	add    %edx,%eax
 328:	8b 00                	mov    (%eax),%eax
 32a:	83 ec 0c             	sub    $0xc,%esp
 32d:	50                   	push   %eax
 32e:	e8 85 fd ff ff       	call   b8 <ls>
 333:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 336:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 33a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 33d:	3b 03                	cmp    (%ebx),%eax
 33f:	7c d8                	jl     319 <main+0x37>
    ls(argv[i]);
  exit();
 341:	e8 c2 03 00 00       	call   708 <exit>

00000346 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	57                   	push   %edi
 34a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34e:	8b 55 10             	mov    0x10(%ebp),%edx
 351:	8b 45 0c             	mov    0xc(%ebp),%eax
 354:	89 cb                	mov    %ecx,%ebx
 356:	89 df                	mov    %ebx,%edi
 358:	89 d1                	mov    %edx,%ecx
 35a:	fc                   	cld    
 35b:	f3 aa                	rep stos %al,%es:(%edi)
 35d:	89 ca                	mov    %ecx,%edx
 35f:	89 fb                	mov    %edi,%ebx
 361:	89 5d 08             	mov    %ebx,0x8(%ebp)
 364:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 367:	90                   	nop
 368:	5b                   	pop    %ebx
 369:	5f                   	pop    %edi
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    

0000036c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 378:	90                   	nop
 379:	8b 45 08             	mov    0x8(%ebp),%eax
 37c:	8d 50 01             	lea    0x1(%eax),%edx
 37f:	89 55 08             	mov    %edx,0x8(%ebp)
 382:	8b 55 0c             	mov    0xc(%ebp),%edx
 385:	8d 4a 01             	lea    0x1(%edx),%ecx
 388:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 38b:	0f b6 12             	movzbl (%edx),%edx
 38e:	88 10                	mov    %dl,(%eax)
 390:	0f b6 00             	movzbl (%eax),%eax
 393:	84 c0                	test   %al,%al
 395:	75 e2                	jne    379 <strcpy+0xd>
    ;
  return os;
 397:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 39a:	c9                   	leave  
 39b:	c3                   	ret    

0000039c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 39f:	eb 08                	jmp    3a9 <strcmp+0xd>
    p++, q++;
 3a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	84 c0                	test   %al,%al
 3b1:	74 10                	je     3c3 <strcmp+0x27>
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 10             	movzbl (%eax),%edx
 3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bc:	0f b6 00             	movzbl (%eax),%eax
 3bf:	38 c2                	cmp    %al,%dl
 3c1:	74 de                	je     3a1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	0f b6 00             	movzbl (%eax),%eax
 3c9:	0f b6 d0             	movzbl %al,%edx
 3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	0f b6 c0             	movzbl %al,%eax
 3d5:	29 c2                	sub    %eax,%edx
 3d7:	89 d0                	mov    %edx,%eax
}
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <strlen>:

uint
strlen(char *s)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3e8:	eb 04                	jmp    3ee <strlen+0x13>
 3ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	01 d0                	add    %edx,%eax
 3f6:	0f b6 00             	movzbl (%eax),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	75 ed                	jne    3ea <strlen+0xf>
    ;
  return n;
 3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <memset>:

void*
memset(void *dst, int c, uint n)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 405:	8b 45 10             	mov    0x10(%ebp),%eax
 408:	50                   	push   %eax
 409:	ff 75 0c             	pushl  0xc(%ebp)
 40c:	ff 75 08             	pushl  0x8(%ebp)
 40f:	e8 32 ff ff ff       	call   346 <stosb>
 414:	83 c4 0c             	add    $0xc,%esp
  return dst;
 417:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41a:	c9                   	leave  
 41b:	c3                   	ret    

0000041c <strchr>:

char*
strchr(const char *s, char c)
{
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	83 ec 04             	sub    $0x4,%esp
 422:	8b 45 0c             	mov    0xc(%ebp),%eax
 425:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 428:	eb 14                	jmp    43e <strchr+0x22>
    if(*s == c)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	0f b6 00             	movzbl (%eax),%eax
 430:	3a 45 fc             	cmp    -0x4(%ebp),%al
 433:	75 05                	jne    43a <strchr+0x1e>
      return (char*)s;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	eb 13                	jmp    44d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 43a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	0f b6 00             	movzbl (%eax),%eax
 444:	84 c0                	test   %al,%al
 446:	75 e2                	jne    42a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 448:	b8 00 00 00 00       	mov    $0x0,%eax
}
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <gets>:

char*
gets(char *buf, int max)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 455:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 45c:	eb 42                	jmp    4a0 <gets+0x51>
    cc = read(0, &c, 1);
 45e:	83 ec 04             	sub    $0x4,%esp
 461:	6a 01                	push   $0x1
 463:	8d 45 ef             	lea    -0x11(%ebp),%eax
 466:	50                   	push   %eax
 467:	6a 00                	push   $0x0
 469:	e8 b2 02 00 00       	call   720 <read>
 46e:	83 c4 10             	add    $0x10,%esp
 471:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 474:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 478:	7e 33                	jle    4ad <gets+0x5e>
      break;
    buf[i++] = c;
 47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47d:	8d 50 01             	lea    0x1(%eax),%edx
 480:	89 55 f4             	mov    %edx,-0xc(%ebp)
 483:	89 c2                	mov    %eax,%edx
 485:	8b 45 08             	mov    0x8(%ebp),%eax
 488:	01 c2                	add    %eax,%edx
 48a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 494:	3c 0a                	cmp    $0xa,%al
 496:	74 16                	je     4ae <gets+0x5f>
 498:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 49c:	3c 0d                	cmp    $0xd,%al
 49e:	74 0e                	je     4ae <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a3:	83 c0 01             	add    $0x1,%eax
 4a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4a9:	7c b3                	jl     45e <gets+0xf>
 4ab:	eb 01                	jmp    4ae <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4ad:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	01 d0                	add    %edx,%eax
 4b6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4bc:	c9                   	leave  
 4bd:	c3                   	ret    

000004be <stat>:

int
stat(char *n, struct stat *st)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c4:	83 ec 08             	sub    $0x8,%esp
 4c7:	6a 00                	push   $0x0
 4c9:	ff 75 08             	pushl  0x8(%ebp)
 4cc:	e8 77 02 00 00       	call   748 <open>
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4db:	79 07                	jns    4e4 <stat+0x26>
    return -1;
 4dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e2:	eb 25                	jmp    509 <stat+0x4b>
  r = fstat(fd, st);
 4e4:	83 ec 08             	sub    $0x8,%esp
 4e7:	ff 75 0c             	pushl  0xc(%ebp)
 4ea:	ff 75 f4             	pushl  -0xc(%ebp)
 4ed:	e8 6e 02 00 00       	call   760 <fstat>
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4f8:	83 ec 0c             	sub    $0xc,%esp
 4fb:	ff 75 f4             	pushl  -0xc(%ebp)
 4fe:	e8 2d 02 00 00       	call   730 <close>
 503:	83 c4 10             	add    $0x10,%esp
  return r;
 506:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <atoi>:

int
atoi(const char *s)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 511:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 518:	eb 04                	jmp    51e <atoi+0x13>
 51a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	0f b6 00             	movzbl (%eax),%eax
 524:	3c 20                	cmp    $0x20,%al
 526:	74 f2                	je     51a <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	0f b6 00             	movzbl (%eax),%eax
 52e:	3c 2d                	cmp    $0x2d,%al
 530:	75 07                	jne    539 <atoi+0x2e>
 532:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 537:	eb 05                	jmp    53e <atoi+0x33>
 539:	b8 01 00 00 00       	mov    $0x1,%eax
 53e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	0f b6 00             	movzbl (%eax),%eax
 547:	3c 2b                	cmp    $0x2b,%al
 549:	74 0a                	je     555 <atoi+0x4a>
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
 54e:	0f b6 00             	movzbl (%eax),%eax
 551:	3c 2d                	cmp    $0x2d,%al
 553:	75 2b                	jne    580 <atoi+0x75>
    s++;
 555:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 559:	eb 25                	jmp    580 <atoi+0x75>
    n = n*10 + *s++ - '0';
 55b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 55e:	89 d0                	mov    %edx,%eax
 560:	c1 e0 02             	shl    $0x2,%eax
 563:	01 d0                	add    %edx,%eax
 565:	01 c0                	add    %eax,%eax
 567:	89 c1                	mov    %eax,%ecx
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	8d 50 01             	lea    0x1(%eax),%edx
 56f:	89 55 08             	mov    %edx,0x8(%ebp)
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	0f be c0             	movsbl %al,%eax
 578:	01 c8                	add    %ecx,%eax
 57a:	83 e8 30             	sub    $0x30,%eax
 57d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	0f b6 00             	movzbl (%eax),%eax
 586:	3c 2f                	cmp    $0x2f,%al
 588:	7e 0a                	jle    594 <atoi+0x89>
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	0f b6 00             	movzbl (%eax),%eax
 590:	3c 39                	cmp    $0x39,%al
 592:	7e c7                	jle    55b <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 594:	8b 45 f8             	mov    -0x8(%ebp),%eax
 597:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 59b:	c9                   	leave  
 59c:	c3                   	ret    

0000059d <atoo>:

int
atoo(const char *s)
{
 59d:	55                   	push   %ebp
 59e:	89 e5                	mov    %esp,%ebp
 5a0:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 5a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 5aa:	eb 04                	jmp    5b0 <atoo+0x13>
 5ac:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	0f b6 00             	movzbl (%eax),%eax
 5b6:	3c 20                	cmp    $0x20,%al
 5b8:	74 f2                	je     5ac <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 5ba:	8b 45 08             	mov    0x8(%ebp),%eax
 5bd:	0f b6 00             	movzbl (%eax),%eax
 5c0:	3c 2d                	cmp    $0x2d,%al
 5c2:	75 07                	jne    5cb <atoo+0x2e>
 5c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5c9:	eb 05                	jmp    5d0 <atoo+0x33>
 5cb:	b8 01 00 00 00       	mov    $0x1,%eax
 5d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	0f b6 00             	movzbl (%eax),%eax
 5d9:	3c 2b                	cmp    $0x2b,%al
 5db:	74 0a                	je     5e7 <atoo+0x4a>
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	0f b6 00             	movzbl (%eax),%eax
 5e3:	3c 2d                	cmp    $0x2d,%al
 5e5:	75 27                	jne    60e <atoo+0x71>
    s++;
 5e7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 5eb:	eb 21                	jmp    60e <atoo+0x71>
    n = n*8 + *s++ - '0';
 5ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f0:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
 5fa:	8d 50 01             	lea    0x1(%eax),%edx
 5fd:	89 55 08             	mov    %edx,0x8(%ebp)
 600:	0f b6 00             	movzbl (%eax),%eax
 603:	0f be c0             	movsbl %al,%eax
 606:	01 c8                	add    %ecx,%eax
 608:	83 e8 30             	sub    $0x30,%eax
 60b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 60e:	8b 45 08             	mov    0x8(%ebp),%eax
 611:	0f b6 00             	movzbl (%eax),%eax
 614:	3c 2f                	cmp    $0x2f,%al
 616:	7e 0a                	jle    622 <atoo+0x85>
 618:	8b 45 08             	mov    0x8(%ebp),%eax
 61b:	0f b6 00             	movzbl (%eax),%eax
 61e:	3c 37                	cmp    $0x37,%al
 620:	7e cb                	jle    5ed <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 622:	8b 45 f8             	mov    -0x8(%ebp),%eax
 625:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 629:	c9                   	leave  
 62a:	c3                   	ret    

0000062b <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 631:	8b 45 08             	mov    0x8(%ebp),%eax
 634:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 637:	8b 45 0c             	mov    0xc(%ebp),%eax
 63a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 63d:	eb 17                	jmp    656 <memmove+0x2b>
    *dst++ = *src++;
 63f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 642:	8d 50 01             	lea    0x1(%eax),%edx
 645:	89 55 fc             	mov    %edx,-0x4(%ebp)
 648:	8b 55 f8             	mov    -0x8(%ebp),%edx
 64b:	8d 4a 01             	lea    0x1(%edx),%ecx
 64e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 651:	0f b6 12             	movzbl (%edx),%edx
 654:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 656:	8b 45 10             	mov    0x10(%ebp),%eax
 659:	8d 50 ff             	lea    -0x1(%eax),%edx
 65c:	89 55 10             	mov    %edx,0x10(%ebp)
 65f:	85 c0                	test   %eax,%eax
 661:	7f dc                	jg     63f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 663:	8b 45 08             	mov    0x8(%ebp),%eax
}
 666:	c9                   	leave  
 667:	c3                   	ret    

00000668 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 668:	55                   	push   %ebp
 669:	89 e5                	mov    %esp,%ebp
 66b:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 66e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 671:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 676:	89 c8                	mov    %ecx,%eax
 678:	f7 e2                	mul    %edx
 67a:	89 d0                	mov    %edx,%eax
 67c:	c1 e8 06             	shr    $0x6,%eax
 67f:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 685:	29 c1                	sub    %eax,%ecx
 687:	89 c8                	mov    %ecx,%eax
 689:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 694:	f7 e2                	mul    %edx
 696:	89 d0                	mov    %edx,%eax
 698:	c1 e8 06             	shr    $0x6,%eax
 69b:	83 ec 04             	sub    $0x4,%esp
 69e:	50                   	push   %eax
 69f:	68 bf 0c 00 00       	push   $0xcbf
 6a4:	6a 01                	push   $0x1
 6a6:	e8 14 02 00 00       	call   8bf <printf>
 6ab:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 6ae:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 6b2:	7e 17                	jle    6cb <zeropad+0x63>
    printf(1,"%d", miliseconds);
 6b4:	83 ec 04             	sub    $0x4,%esp
 6b7:	ff 75 f4             	pushl  -0xc(%ebp)
 6ba:	68 c3 0c 00 00       	push   $0xcc3
 6bf:	6a 01                	push   $0x1
 6c1:	e8 f9 01 00 00       	call   8bf <printf>
 6c6:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 6c9:	eb 32                	jmp    6fd <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 6cb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 6cf:	7e 17                	jle    6e8 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 6d1:	83 ec 04             	sub    $0x4,%esp
 6d4:	ff 75 f4             	pushl  -0xc(%ebp)
 6d7:	68 c6 0c 00 00       	push   $0xcc6
 6dc:	6a 01                	push   $0x1
 6de:	e8 dc 01 00 00       	call   8bf <printf>
 6e3:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 6e6:	eb 15                	jmp    6fd <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 6e8:	83 ec 04             	sub    $0x4,%esp
 6eb:	ff 75 f4             	pushl  -0xc(%ebp)
 6ee:	68 ca 0c 00 00       	push   $0xcca
 6f3:	6a 01                	push   $0x1
 6f5:	e8 c5 01 00 00       	call   8bf <printf>
 6fa:	83 c4 10             	add    $0x10,%esp
};
 6fd:	90                   	nop
 6fe:	c9                   	leave  
 6ff:	c3                   	ret    

00000700 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 700:	b8 01 00 00 00       	mov    $0x1,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <exit>:
SYSCALL(exit)
 708:	b8 02 00 00 00       	mov    $0x2,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <wait>:
SYSCALL(wait)
 710:	b8 03 00 00 00       	mov    $0x3,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <pipe>:
SYSCALL(pipe)
 718:	b8 04 00 00 00       	mov    $0x4,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <read>:
SYSCALL(read)
 720:	b8 05 00 00 00       	mov    $0x5,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <write>:
SYSCALL(write)
 728:	b8 10 00 00 00       	mov    $0x10,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <close>:
SYSCALL(close)
 730:	b8 15 00 00 00       	mov    $0x15,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <kill>:
SYSCALL(kill)
 738:	b8 06 00 00 00       	mov    $0x6,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <exec>:
SYSCALL(exec)
 740:	b8 07 00 00 00       	mov    $0x7,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <open>:
SYSCALL(open)
 748:	b8 0f 00 00 00       	mov    $0xf,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <mknod>:
SYSCALL(mknod)
 750:	b8 11 00 00 00       	mov    $0x11,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <unlink>:
SYSCALL(unlink)
 758:	b8 12 00 00 00       	mov    $0x12,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <fstat>:
SYSCALL(fstat)
 760:	b8 08 00 00 00       	mov    $0x8,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <link>:
SYSCALL(link)
 768:	b8 13 00 00 00       	mov    $0x13,%eax
 76d:	cd 40                	int    $0x40
 76f:	c3                   	ret    

00000770 <mkdir>:
SYSCALL(mkdir)
 770:	b8 14 00 00 00       	mov    $0x14,%eax
 775:	cd 40                	int    $0x40
 777:	c3                   	ret    

00000778 <chdir>:
SYSCALL(chdir)
 778:	b8 09 00 00 00       	mov    $0x9,%eax
 77d:	cd 40                	int    $0x40
 77f:	c3                   	ret    

00000780 <dup>:
SYSCALL(dup)
 780:	b8 0a 00 00 00       	mov    $0xa,%eax
 785:	cd 40                	int    $0x40
 787:	c3                   	ret    

00000788 <getpid>:
SYSCALL(getpid)
 788:	b8 0b 00 00 00       	mov    $0xb,%eax
 78d:	cd 40                	int    $0x40
 78f:	c3                   	ret    

00000790 <sbrk>:
SYSCALL(sbrk)
 790:	b8 0c 00 00 00       	mov    $0xc,%eax
 795:	cd 40                	int    $0x40
 797:	c3                   	ret    

00000798 <sleep>:
SYSCALL(sleep)
 798:	b8 0d 00 00 00       	mov    $0xd,%eax
 79d:	cd 40                	int    $0x40
 79f:	c3                   	ret    

000007a0 <uptime>:
SYSCALL(uptime)
 7a0:	b8 0e 00 00 00       	mov    $0xe,%eax
 7a5:	cd 40                	int    $0x40
 7a7:	c3                   	ret    

000007a8 <halt>:
SYSCALL(halt)
 7a8:	b8 16 00 00 00       	mov    $0x16,%eax
 7ad:	cd 40                	int    $0x40
 7af:	c3                   	ret    

000007b0 <date>:

SYSCALL(date)
 7b0:	b8 17 00 00 00       	mov    $0x17,%eax
 7b5:	cd 40                	int    $0x40
 7b7:	c3                   	ret    

000007b8 <getuid>:
SYSCALL(getuid)
 7b8:	b8 18 00 00 00       	mov    $0x18,%eax
 7bd:	cd 40                	int    $0x40
 7bf:	c3                   	ret    

000007c0 <getgid>:
SYSCALL(getgid)
 7c0:	b8 19 00 00 00       	mov    $0x19,%eax
 7c5:	cd 40                	int    $0x40
 7c7:	c3                   	ret    

000007c8 <getppid>:
SYSCALL(getppid)
 7c8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 7cd:	cd 40                	int    $0x40
 7cf:	c3                   	ret    

000007d0 <setuid>:
SYSCALL(setuid)
 7d0:	b8 1b 00 00 00       	mov    $0x1b,%eax
 7d5:	cd 40                	int    $0x40
 7d7:	c3                   	ret    

000007d8 <setgid>:
SYSCALL(setgid)
 7d8:	b8 1c 00 00 00       	mov    $0x1c,%eax
 7dd:	cd 40                	int    $0x40
 7df:	c3                   	ret    

000007e0 <getprocs>:
SYSCALL(getprocs)
 7e0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 7e5:	cd 40                	int    $0x40
 7e7:	c3                   	ret    

000007e8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7e8:	55                   	push   %ebp
 7e9:	89 e5                	mov    %esp,%ebp
 7eb:	83 ec 18             	sub    $0x18,%esp
 7ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7f4:	83 ec 04             	sub    $0x4,%esp
 7f7:	6a 01                	push   $0x1
 7f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7fc:	50                   	push   %eax
 7fd:	ff 75 08             	pushl  0x8(%ebp)
 800:	e8 23 ff ff ff       	call   728 <write>
 805:	83 c4 10             	add    $0x10,%esp
}
 808:	90                   	nop
 809:	c9                   	leave  
 80a:	c3                   	ret    

0000080b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 80b:	55                   	push   %ebp
 80c:	89 e5                	mov    %esp,%ebp
 80e:	53                   	push   %ebx
 80f:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 812:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 819:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 81d:	74 17                	je     836 <printint+0x2b>
 81f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 823:	79 11                	jns    836 <printint+0x2b>
    neg = 1;
 825:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 82c:	8b 45 0c             	mov    0xc(%ebp),%eax
 82f:	f7 d8                	neg    %eax
 831:	89 45 ec             	mov    %eax,-0x14(%ebp)
 834:	eb 06                	jmp    83c <printint+0x31>
  } else {
    x = xx;
 836:	8b 45 0c             	mov    0xc(%ebp),%eax
 839:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 83c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 843:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 846:	8d 41 01             	lea    0x1(%ecx),%eax
 849:	89 45 f4             	mov    %eax,-0xc(%ebp)
 84c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 84f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 852:	ba 00 00 00 00       	mov    $0x0,%edx
 857:	f7 f3                	div    %ebx
 859:	89 d0                	mov    %edx,%eax
 85b:	0f b6 80 b8 0f 00 00 	movzbl 0xfb8(%eax),%eax
 862:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 866:	8b 5d 10             	mov    0x10(%ebp),%ebx
 869:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86c:	ba 00 00 00 00       	mov    $0x0,%edx
 871:	f7 f3                	div    %ebx
 873:	89 45 ec             	mov    %eax,-0x14(%ebp)
 876:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 87a:	75 c7                	jne    843 <printint+0x38>
  if(neg)
 87c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 880:	74 2d                	je     8af <printint+0xa4>
    buf[i++] = '-';
 882:	8b 45 f4             	mov    -0xc(%ebp),%eax
 885:	8d 50 01             	lea    0x1(%eax),%edx
 888:	89 55 f4             	mov    %edx,-0xc(%ebp)
 88b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 890:	eb 1d                	jmp    8af <printint+0xa4>
    putc(fd, buf[i]);
 892:	8d 55 dc             	lea    -0x24(%ebp),%edx
 895:	8b 45 f4             	mov    -0xc(%ebp),%eax
 898:	01 d0                	add    %edx,%eax
 89a:	0f b6 00             	movzbl (%eax),%eax
 89d:	0f be c0             	movsbl %al,%eax
 8a0:	83 ec 08             	sub    $0x8,%esp
 8a3:	50                   	push   %eax
 8a4:	ff 75 08             	pushl  0x8(%ebp)
 8a7:	e8 3c ff ff ff       	call   7e8 <putc>
 8ac:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 8af:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 8b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8b7:	79 d9                	jns    892 <printint+0x87>
    putc(fd, buf[i]);
}
 8b9:	90                   	nop
 8ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8bd:	c9                   	leave  
 8be:	c3                   	ret    

000008bf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8bf:	55                   	push   %ebp
 8c0:	89 e5                	mov    %esp,%ebp
 8c2:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 8cc:	8d 45 0c             	lea    0xc(%ebp),%eax
 8cf:	83 c0 04             	add    $0x4,%eax
 8d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 8d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8dc:	e9 59 01 00 00       	jmp    a3a <printf+0x17b>
    c = fmt[i] & 0xff;
 8e1:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e7:	01 d0                	add    %edx,%eax
 8e9:	0f b6 00             	movzbl (%eax),%eax
 8ec:	0f be c0             	movsbl %al,%eax
 8ef:	25 ff 00 00 00       	and    $0xff,%eax
 8f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8fb:	75 2c                	jne    929 <printf+0x6a>
      if(c == '%'){
 8fd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 901:	75 0c                	jne    90f <printf+0x50>
        state = '%';
 903:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 90a:	e9 27 01 00 00       	jmp    a36 <printf+0x177>
      } else {
        putc(fd, c);
 90f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 912:	0f be c0             	movsbl %al,%eax
 915:	83 ec 08             	sub    $0x8,%esp
 918:	50                   	push   %eax
 919:	ff 75 08             	pushl  0x8(%ebp)
 91c:	e8 c7 fe ff ff       	call   7e8 <putc>
 921:	83 c4 10             	add    $0x10,%esp
 924:	e9 0d 01 00 00       	jmp    a36 <printf+0x177>
      }
    } else if(state == '%'){
 929:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 92d:	0f 85 03 01 00 00    	jne    a36 <printf+0x177>
      if(c == 'd'){
 933:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 937:	75 1e                	jne    957 <printf+0x98>
        printint(fd, *ap, 10, 1);
 939:	8b 45 e8             	mov    -0x18(%ebp),%eax
 93c:	8b 00                	mov    (%eax),%eax
 93e:	6a 01                	push   $0x1
 940:	6a 0a                	push   $0xa
 942:	50                   	push   %eax
 943:	ff 75 08             	pushl  0x8(%ebp)
 946:	e8 c0 fe ff ff       	call   80b <printint>
 94b:	83 c4 10             	add    $0x10,%esp
        ap++;
 94e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 952:	e9 d8 00 00 00       	jmp    a2f <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 957:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 95b:	74 06                	je     963 <printf+0xa4>
 95d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 961:	75 1e                	jne    981 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 963:	8b 45 e8             	mov    -0x18(%ebp),%eax
 966:	8b 00                	mov    (%eax),%eax
 968:	6a 00                	push   $0x0
 96a:	6a 10                	push   $0x10
 96c:	50                   	push   %eax
 96d:	ff 75 08             	pushl  0x8(%ebp)
 970:	e8 96 fe ff ff       	call   80b <printint>
 975:	83 c4 10             	add    $0x10,%esp
        ap++;
 978:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 97c:	e9 ae 00 00 00       	jmp    a2f <printf+0x170>
      } else if(c == 's'){
 981:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 985:	75 43                	jne    9ca <printf+0x10b>
        s = (char*)*ap;
 987:	8b 45 e8             	mov    -0x18(%ebp),%eax
 98a:	8b 00                	mov    (%eax),%eax
 98c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 98f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 993:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 997:	75 25                	jne    9be <printf+0xff>
          s = "(null)";
 999:	c7 45 f4 cf 0c 00 00 	movl   $0xccf,-0xc(%ebp)
        while(*s != 0){
 9a0:	eb 1c                	jmp    9be <printf+0xff>
          putc(fd, *s);
 9a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a5:	0f b6 00             	movzbl (%eax),%eax
 9a8:	0f be c0             	movsbl %al,%eax
 9ab:	83 ec 08             	sub    $0x8,%esp
 9ae:	50                   	push   %eax
 9af:	ff 75 08             	pushl  0x8(%ebp)
 9b2:	e8 31 fe ff ff       	call   7e8 <putc>
 9b7:	83 c4 10             	add    $0x10,%esp
          s++;
 9ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c1:	0f b6 00             	movzbl (%eax),%eax
 9c4:	84 c0                	test   %al,%al
 9c6:	75 da                	jne    9a2 <printf+0xe3>
 9c8:	eb 65                	jmp    a2f <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ca:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9ce:	75 1d                	jne    9ed <printf+0x12e>
        putc(fd, *ap);
 9d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9d3:	8b 00                	mov    (%eax),%eax
 9d5:	0f be c0             	movsbl %al,%eax
 9d8:	83 ec 08             	sub    $0x8,%esp
 9db:	50                   	push   %eax
 9dc:	ff 75 08             	pushl  0x8(%ebp)
 9df:	e8 04 fe ff ff       	call   7e8 <putc>
 9e4:	83 c4 10             	add    $0x10,%esp
        ap++;
 9e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9eb:	eb 42                	jmp    a2f <printf+0x170>
      } else if(c == '%'){
 9ed:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9f1:	75 17                	jne    a0a <printf+0x14b>
        putc(fd, c);
 9f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9f6:	0f be c0             	movsbl %al,%eax
 9f9:	83 ec 08             	sub    $0x8,%esp
 9fc:	50                   	push   %eax
 9fd:	ff 75 08             	pushl  0x8(%ebp)
 a00:	e8 e3 fd ff ff       	call   7e8 <putc>
 a05:	83 c4 10             	add    $0x10,%esp
 a08:	eb 25                	jmp    a2f <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a0a:	83 ec 08             	sub    $0x8,%esp
 a0d:	6a 25                	push   $0x25
 a0f:	ff 75 08             	pushl  0x8(%ebp)
 a12:	e8 d1 fd ff ff       	call   7e8 <putc>
 a17:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 a1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a1d:	0f be c0             	movsbl %al,%eax
 a20:	83 ec 08             	sub    $0x8,%esp
 a23:	50                   	push   %eax
 a24:	ff 75 08             	pushl  0x8(%ebp)
 a27:	e8 bc fd ff ff       	call   7e8 <putc>
 a2c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 a2f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a36:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a3a:	8b 55 0c             	mov    0xc(%ebp),%edx
 a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a40:	01 d0                	add    %edx,%eax
 a42:	0f b6 00             	movzbl (%eax),%eax
 a45:	84 c0                	test   %al,%al
 a47:	0f 85 94 fe ff ff    	jne    8e1 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a4d:	90                   	nop
 a4e:	c9                   	leave  
 a4f:	c3                   	ret    

00000a50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a56:	8b 45 08             	mov    0x8(%ebp),%eax
 a59:	83 e8 08             	sub    $0x8,%eax
 a5c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a5f:	a1 e4 0f 00 00       	mov    0xfe4,%eax
 a64:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a67:	eb 24                	jmp    a8d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a69:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6c:	8b 00                	mov    (%eax),%eax
 a6e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a71:	77 12                	ja     a85 <free+0x35>
 a73:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a76:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a79:	77 24                	ja     a9f <free+0x4f>
 a7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7e:	8b 00                	mov    (%eax),%eax
 a80:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a83:	77 1a                	ja     a9f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a85:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a88:	8b 00                	mov    (%eax),%eax
 a8a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a8d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a90:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a93:	76 d4                	jbe    a69 <free+0x19>
 a95:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a98:	8b 00                	mov    (%eax),%eax
 a9a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a9d:	76 ca                	jbe    a69 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a9f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa2:	8b 40 04             	mov    0x4(%eax),%eax
 aa5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 aac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aaf:	01 c2                	add    %eax,%edx
 ab1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab4:	8b 00                	mov    (%eax),%eax
 ab6:	39 c2                	cmp    %eax,%edx
 ab8:	75 24                	jne    ade <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 aba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 abd:	8b 50 04             	mov    0x4(%eax),%edx
 ac0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac3:	8b 00                	mov    (%eax),%eax
 ac5:	8b 40 04             	mov    0x4(%eax),%eax
 ac8:	01 c2                	add    %eax,%edx
 aca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 acd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 ad0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad3:	8b 00                	mov    (%eax),%eax
 ad5:	8b 10                	mov    (%eax),%edx
 ad7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ada:	89 10                	mov    %edx,(%eax)
 adc:	eb 0a                	jmp    ae8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 ade:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae1:	8b 10                	mov    (%eax),%edx
 ae3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ae8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aeb:	8b 40 04             	mov    0x4(%eax),%eax
 aee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 af5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af8:	01 d0                	add    %edx,%eax
 afa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 afd:	75 20                	jne    b1f <free+0xcf>
    p->s.size += bp->s.size;
 aff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b02:	8b 50 04             	mov    0x4(%eax),%edx
 b05:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b08:	8b 40 04             	mov    0x4(%eax),%eax
 b0b:	01 c2                	add    %eax,%edx
 b0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b10:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b13:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b16:	8b 10                	mov    (%eax),%edx
 b18:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b1b:	89 10                	mov    %edx,(%eax)
 b1d:	eb 08                	jmp    b27 <free+0xd7>
  } else
    p->s.ptr = bp;
 b1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b22:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b25:	89 10                	mov    %edx,(%eax)
  freep = p;
 b27:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b2a:	a3 e4 0f 00 00       	mov    %eax,0xfe4
}
 b2f:	90                   	nop
 b30:	c9                   	leave  
 b31:	c3                   	ret    

00000b32 <morecore>:

static Header*
morecore(uint nu)
{
 b32:	55                   	push   %ebp
 b33:	89 e5                	mov    %esp,%ebp
 b35:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b38:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b3f:	77 07                	ja     b48 <morecore+0x16>
    nu = 4096;
 b41:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b48:	8b 45 08             	mov    0x8(%ebp),%eax
 b4b:	c1 e0 03             	shl    $0x3,%eax
 b4e:	83 ec 0c             	sub    $0xc,%esp
 b51:	50                   	push   %eax
 b52:	e8 39 fc ff ff       	call   790 <sbrk>
 b57:	83 c4 10             	add    $0x10,%esp
 b5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b5d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b61:	75 07                	jne    b6a <morecore+0x38>
    return 0;
 b63:	b8 00 00 00 00       	mov    $0x0,%eax
 b68:	eb 26                	jmp    b90 <morecore+0x5e>
  hp = (Header*)p;
 b6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b70:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b73:	8b 55 08             	mov    0x8(%ebp),%edx
 b76:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b79:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b7c:	83 c0 08             	add    $0x8,%eax
 b7f:	83 ec 0c             	sub    $0xc,%esp
 b82:	50                   	push   %eax
 b83:	e8 c8 fe ff ff       	call   a50 <free>
 b88:	83 c4 10             	add    $0x10,%esp
  return freep;
 b8b:	a1 e4 0f 00 00       	mov    0xfe4,%eax
}
 b90:	c9                   	leave  
 b91:	c3                   	ret    

00000b92 <malloc>:

void*
malloc(uint nbytes)
{
 b92:	55                   	push   %ebp
 b93:	89 e5                	mov    %esp,%ebp
 b95:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b98:	8b 45 08             	mov    0x8(%ebp),%eax
 b9b:	83 c0 07             	add    $0x7,%eax
 b9e:	c1 e8 03             	shr    $0x3,%eax
 ba1:	83 c0 01             	add    $0x1,%eax
 ba4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 ba7:	a1 e4 0f 00 00       	mov    0xfe4,%eax
 bac:	89 45 f0             	mov    %eax,-0x10(%ebp)
 baf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bb3:	75 23                	jne    bd8 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 bb5:	c7 45 f0 dc 0f 00 00 	movl   $0xfdc,-0x10(%ebp)
 bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bbf:	a3 e4 0f 00 00       	mov    %eax,0xfe4
 bc4:	a1 e4 0f 00 00       	mov    0xfe4,%eax
 bc9:	a3 dc 0f 00 00       	mov    %eax,0xfdc
    base.s.size = 0;
 bce:	c7 05 e0 0f 00 00 00 	movl   $0x0,0xfe0
 bd5:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bdb:	8b 00                	mov    (%eax),%eax
 bdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 be0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be3:	8b 40 04             	mov    0x4(%eax),%eax
 be6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 be9:	72 4d                	jb     c38 <malloc+0xa6>
      if(p->s.size == nunits)
 beb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bee:	8b 40 04             	mov    0x4(%eax),%eax
 bf1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bf4:	75 0c                	jne    c02 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf9:	8b 10                	mov    (%eax),%edx
 bfb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bfe:	89 10                	mov    %edx,(%eax)
 c00:	eb 26                	jmp    c28 <malloc+0x96>
      else {
        p->s.size -= nunits;
 c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c05:	8b 40 04             	mov    0x4(%eax),%eax
 c08:	2b 45 ec             	sub    -0x14(%ebp),%eax
 c0b:	89 c2                	mov    %eax,%edx
 c0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c10:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c16:	8b 40 04             	mov    0x4(%eax),%eax
 c19:	c1 e0 03             	shl    $0x3,%eax
 c1c:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c22:	8b 55 ec             	mov    -0x14(%ebp),%edx
 c25:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 c28:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c2b:	a3 e4 0f 00 00       	mov    %eax,0xfe4
      return (void*)(p + 1);
 c30:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c33:	83 c0 08             	add    $0x8,%eax
 c36:	eb 3b                	jmp    c73 <malloc+0xe1>
    }
    if(p == freep)
 c38:	a1 e4 0f 00 00       	mov    0xfe4,%eax
 c3d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c40:	75 1e                	jne    c60 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 c42:	83 ec 0c             	sub    $0xc,%esp
 c45:	ff 75 ec             	pushl  -0x14(%ebp)
 c48:	e8 e5 fe ff ff       	call   b32 <morecore>
 c4d:	83 c4 10             	add    $0x10,%esp
 c50:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c53:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c57:	75 07                	jne    c60 <malloc+0xce>
        return 0;
 c59:	b8 00 00 00 00       	mov    $0x0,%eax
 c5e:	eb 13                	jmp    c73 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c63:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c69:	8b 00                	mov    (%eax),%eax
 c6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 c6e:	e9 6d ff ff ff       	jmp    be0 <malloc+0x4e>
}
 c73:	c9                   	leave  
 c74:	c3                   	ret    
