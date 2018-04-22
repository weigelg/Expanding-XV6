
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "uproc.h"
#define PMAX 64 // maximum number of rows to return
int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  int table_size;
  struct uproc * table;
  table = malloc(PMAX * sizeof(struct uproc));
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	68 00 17 00 00       	push   $0x1700
  1c:	e8 a1 09 00 00       	call   9c2 <malloc>
  21:	83 c4 10             	add    $0x10,%esp
  24:	89 45 e0             	mov    %eax,-0x20(%ebp)
  table_size = getprocs(PMAX, table);
  27:	83 ec 08             	sub    $0x8,%esp
  2a:	ff 75 e0             	pushl  -0x20(%ebp)
  2d:	6a 40                	push   $0x40
  2f:	e8 dc 05 00 00       	call   610 <getprocs>
  34:	83 c4 10             	add    $0x10,%esp
  37:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if (table_size >= 1){
  3a:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  3e:	0f 8e 0d 01 00 00    	jle    151 <main+0x151>
    int i;
    printf(1, "\nPID\tName\t\tUID\tGID\tPPID\tElapsed\t\tCPU\tState\tSize\n");
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 a8 0a 00 00       	push   $0xaa8
  4c:	6a 01                	push   $0x1
  4e:	e8 9c 06 00 00       	call   6ef <printf>
  53:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < table_size; ++i){
  56:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  5d:	e9 d3 00 00 00       	jmp    135 <main+0x135>
      printf(1, "%d\t%s\t\t%d\t%d\t%d\t", table[i].pid, table[i].name, table[i].uid, table[i].gid, table[i].ppid);
  62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  65:	6b d0 5c             	imul   $0x5c,%eax,%edx
  68:	8b 45 e0             	mov    -0x20(%ebp),%eax
  6b:	01 d0                	add    %edx,%eax
  6d:	8b 58 0c             	mov    0xc(%eax),%ebx
  70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  73:	6b d0 5c             	imul   $0x5c,%eax,%edx
  76:	8b 45 e0             	mov    -0x20(%ebp),%eax
  79:	01 d0                	add    %edx,%eax
  7b:	8b 48 08             	mov    0x8(%eax),%ecx
  7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  81:	6b d0 5c             	imul   $0x5c,%eax,%edx
  84:	8b 45 e0             	mov    -0x20(%ebp),%eax
  87:	01 d0                	add    %edx,%eax
  89:	8b 50 04             	mov    0x4(%eax),%edx
  8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8f:	6b f0 5c             	imul   $0x5c,%eax,%esi
  92:	8b 45 e0             	mov    -0x20(%ebp),%eax
  95:	01 f0                	add    %esi,%eax
  97:	8d 70 3c             	lea    0x3c(%eax),%esi
  9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  9d:	6b f8 5c             	imul   $0x5c,%eax,%edi
  a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  a3:	01 f8                	add    %edi,%eax
  a5:	8b 00                	mov    (%eax),%eax
  a7:	83 ec 04             	sub    $0x4,%esp
  aa:	53                   	push   %ebx
  ab:	51                   	push   %ecx
  ac:	52                   	push   %edx
  ad:	56                   	push   %esi
  ae:	50                   	push   %eax
  af:	68 d9 0a 00 00       	push   $0xad9
  b4:	6a 01                	push   $0x1
  b6:	e8 34 06 00 00       	call   6ef <printf>
  bb:	83 c4 20             	add    $0x20,%esp
      zeropad(table[i].elapsed_ticks);
  be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c1:	6b d0 5c             	imul   $0x5c,%eax,%edx
  c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c7:	01 d0                	add    %edx,%eax
  c9:	8b 40 10             	mov    0x10(%eax),%eax
  cc:	83 ec 0c             	sub    $0xc,%esp
  cf:	50                   	push   %eax
  d0:	e8 c3 03 00 00       	call   498 <zeropad>
  d5:	83 c4 10             	add    $0x10,%esp
      printf(1, "\t\t");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 ea 0a 00 00       	push   $0xaea
  e0:	6a 01                	push   $0x1
  e2:	e8 08 06 00 00       	call   6ef <printf>
  e7:	83 c4 10             	add    $0x10,%esp
      zeropad(table[i].CPU_total_ticks);
  ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  ed:	6b d0 5c             	imul   $0x5c,%eax,%edx
  f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  f3:	01 d0                	add    %edx,%eax
  f5:	8b 40 14             	mov    0x14(%eax),%eax
  f8:	83 ec 0c             	sub    $0xc,%esp
  fb:	50                   	push   %eax
  fc:	e8 97 03 00 00       	call   498 <zeropad>
 101:	83 c4 10             	add    $0x10,%esp
      printf(1, "\t%s\t%d\n", table[i].state, table[i].size);
 104:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 107:	6b d0 5c             	imul   $0x5c,%eax,%edx
 10a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 10d:	01 d0                	add    %edx,%eax
 10f:	8b 40 38             	mov    0x38(%eax),%eax
 112:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 115:	6b ca 5c             	imul   $0x5c,%edx,%ecx
 118:	8b 55 e0             	mov    -0x20(%ebp),%edx
 11b:	01 ca                	add    %ecx,%edx
 11d:	83 c2 18             	add    $0x18,%edx
 120:	50                   	push   %eax
 121:	52                   	push   %edx
 122:	68 ed 0a 00 00       	push   $0xaed
 127:	6a 01                	push   $0x1
 129:	e8 c1 05 00 00       	call   6ef <printf>
 12e:	83 c4 10             	add    $0x10,%esp
  table = malloc(PMAX * sizeof(struct uproc));
  table_size = getprocs(PMAX, table);
  if (table_size >= 1){
    int i;
    printf(1, "\nPID\tName\t\tUID\tGID\tPPID\tElapsed\t\tCPU\tState\tSize\n");
    for (i = 0; i < table_size; ++i){
 131:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 135:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 138:	3b 45 dc             	cmp    -0x24(%ebp),%eax
 13b:	0f 8c 21 ff ff ff    	jl     62 <main+0x62>
      zeropad(table[i].elapsed_ticks);
      printf(1, "\t\t");
      zeropad(table[i].CPU_total_ticks);
      printf(1, "\t%s\t%d\n", table[i].state, table[i].size);
    }
  free(table);
 141:	83 ec 0c             	sub    $0xc,%esp
 144:	ff 75 e0             	pushl  -0x20(%ebp)
 147:	e8 34 07 00 00       	call   880 <free>
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	eb 12                	jmp    163 <main+0x163>
  }
  else
    printf(2, "There was an error!\n");
 151:	83 ec 08             	sub    $0x8,%esp
 154:	68 f5 0a 00 00       	push   $0xaf5
 159:	6a 02                	push   $0x2
 15b:	e8 8f 05 00 00       	call   6ef <printf>
 160:	83 c4 10             	add    $0x10,%esp
  free(table);
 163:	83 ec 0c             	sub    $0xc,%esp
 166:	ff 75 e0             	pushl  -0x20(%ebp)
 169:	e8 12 07 00 00       	call   880 <free>
 16e:	83 c4 10             	add    $0x10,%esp
  exit();
 171:	e8 c2 03 00 00       	call   538 <exit>

00000176 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 176:	55                   	push   %ebp
 177:	89 e5                	mov    %esp,%ebp
 179:	57                   	push   %edi
 17a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 17b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17e:	8b 55 10             	mov    0x10(%ebp),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	89 cb                	mov    %ecx,%ebx
 186:	89 df                	mov    %ebx,%edi
 188:	89 d1                	mov    %edx,%ecx
 18a:	fc                   	cld    
 18b:	f3 aa                	rep stos %al,%es:(%edi)
 18d:	89 ca                	mov    %ecx,%edx
 18f:	89 fb                	mov    %edi,%ebx
 191:	89 5d 08             	mov    %ebx,0x8(%ebp)
 194:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 197:	90                   	nop
 198:	5b                   	pop    %ebx
 199:	5f                   	pop    %edi
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    

0000019c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1a2:	8b 45 08             	mov    0x8(%ebp),%eax
 1a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1a8:	90                   	nop
 1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ac:	8d 50 01             	lea    0x1(%eax),%edx
 1af:	89 55 08             	mov    %edx,0x8(%ebp)
 1b2:	8b 55 0c             	mov    0xc(%ebp),%edx
 1b5:	8d 4a 01             	lea    0x1(%edx),%ecx
 1b8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1bb:	0f b6 12             	movzbl (%edx),%edx
 1be:	88 10                	mov    %dl,(%eax)
 1c0:	0f b6 00             	movzbl (%eax),%eax
 1c3:	84 c0                	test   %al,%al
 1c5:	75 e2                	jne    1a9 <strcpy+0xd>
    ;
  return os;
 1c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    

000001cc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1cf:	eb 08                	jmp    1d9 <strcmp+0xd>
    p++, q++;
 1d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1d5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	0f b6 00             	movzbl (%eax),%eax
 1df:	84 c0                	test   %al,%al
 1e1:	74 10                	je     1f3 <strcmp+0x27>
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 10             	movzbl (%eax),%edx
 1e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ec:	0f b6 00             	movzbl (%eax),%eax
 1ef:	38 c2                	cmp    %al,%dl
 1f1:	74 de                	je     1d1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 00             	movzbl (%eax),%eax
 1f9:	0f b6 d0             	movzbl %al,%edx
 1fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	0f b6 c0             	movzbl %al,%eax
 205:	29 c2                	sub    %eax,%edx
 207:	89 d0                	mov    %edx,%eax
}
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    

0000020b <strlen>:

uint
strlen(char *s)
{
 20b:	55                   	push   %ebp
 20c:	89 e5                	mov    %esp,%ebp
 20e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 211:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 218:	eb 04                	jmp    21e <strlen+0x13>
 21a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 21e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	01 d0                	add    %edx,%eax
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	84 c0                	test   %al,%al
 22b:	75 ed                	jne    21a <strlen+0xf>
    ;
  return n;
 22d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 230:	c9                   	leave  
 231:	c3                   	ret    

00000232 <memset>:

void*
memset(void *dst, int c, uint n)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 235:	8b 45 10             	mov    0x10(%ebp),%eax
 238:	50                   	push   %eax
 239:	ff 75 0c             	pushl  0xc(%ebp)
 23c:	ff 75 08             	pushl  0x8(%ebp)
 23f:	e8 32 ff ff ff       	call   176 <stosb>
 244:	83 c4 0c             	add    $0xc,%esp
  return dst;
 247:	8b 45 08             	mov    0x8(%ebp),%eax
}
 24a:	c9                   	leave  
 24b:	c3                   	ret    

0000024c <strchr>:

char*
strchr(const char *s, char c)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	83 ec 04             	sub    $0x4,%esp
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 258:	eb 14                	jmp    26e <strchr+0x22>
    if(*s == c)
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	3a 45 fc             	cmp    -0x4(%ebp),%al
 263:	75 05                	jne    26a <strchr+0x1e>
      return (char*)s;
 265:	8b 45 08             	mov    0x8(%ebp),%eax
 268:	eb 13                	jmp    27d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 26a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 26e:	8b 45 08             	mov    0x8(%ebp),%eax
 271:	0f b6 00             	movzbl (%eax),%eax
 274:	84 c0                	test   %al,%al
 276:	75 e2                	jne    25a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 278:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27d:	c9                   	leave  
 27e:	c3                   	ret    

0000027f <gets>:

char*
gets(char *buf, int max)
{
 27f:	55                   	push   %ebp
 280:	89 e5                	mov    %esp,%ebp
 282:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 285:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 28c:	eb 42                	jmp    2d0 <gets+0x51>
    cc = read(0, &c, 1);
 28e:	83 ec 04             	sub    $0x4,%esp
 291:	6a 01                	push   $0x1
 293:	8d 45 ef             	lea    -0x11(%ebp),%eax
 296:	50                   	push   %eax
 297:	6a 00                	push   $0x0
 299:	e8 b2 02 00 00       	call   550 <read>
 29e:	83 c4 10             	add    $0x10,%esp
 2a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2a8:	7e 33                	jle    2dd <gets+0x5e>
      break;
    buf[i++] = c;
 2aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ad:	8d 50 01             	lea    0x1(%eax),%edx
 2b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2b3:	89 c2                	mov    %eax,%edx
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	01 c2                	add    %eax,%edx
 2ba:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2be:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2c4:	3c 0a                	cmp    $0xa,%al
 2c6:	74 16                	je     2de <gets+0x5f>
 2c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2cc:	3c 0d                	cmp    $0xd,%al
 2ce:	74 0e                	je     2de <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d3:	83 c0 01             	add    $0x1,%eax
 2d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2d9:	7c b3                	jl     28e <gets+0xf>
 2db:	eb 01                	jmp    2de <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2de:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	01 d0                	add    %edx,%eax
 2e6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ec:	c9                   	leave  
 2ed:	c3                   	ret    

000002ee <stat>:

int
stat(char *n, struct stat *st)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f4:	83 ec 08             	sub    $0x8,%esp
 2f7:	6a 00                	push   $0x0
 2f9:	ff 75 08             	pushl  0x8(%ebp)
 2fc:	e8 77 02 00 00       	call   578 <open>
 301:	83 c4 10             	add    $0x10,%esp
 304:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 307:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 30b:	79 07                	jns    314 <stat+0x26>
    return -1;
 30d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 312:	eb 25                	jmp    339 <stat+0x4b>
  r = fstat(fd, st);
 314:	83 ec 08             	sub    $0x8,%esp
 317:	ff 75 0c             	pushl  0xc(%ebp)
 31a:	ff 75 f4             	pushl  -0xc(%ebp)
 31d:	e8 6e 02 00 00       	call   590 <fstat>
 322:	83 c4 10             	add    $0x10,%esp
 325:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 328:	83 ec 0c             	sub    $0xc,%esp
 32b:	ff 75 f4             	pushl  -0xc(%ebp)
 32e:	e8 2d 02 00 00       	call   560 <close>
 333:	83 c4 10             	add    $0x10,%esp
  return r;
 336:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <atoi>:

int
atoi(const char *s)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 341:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 348:	eb 04                	jmp    34e <atoi+0x13>
 34a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 34e:	8b 45 08             	mov    0x8(%ebp),%eax
 351:	0f b6 00             	movzbl (%eax),%eax
 354:	3c 20                	cmp    $0x20,%al
 356:	74 f2                	je     34a <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 358:	8b 45 08             	mov    0x8(%ebp),%eax
 35b:	0f b6 00             	movzbl (%eax),%eax
 35e:	3c 2d                	cmp    $0x2d,%al
 360:	75 07                	jne    369 <atoi+0x2e>
 362:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 367:	eb 05                	jmp    36e <atoi+0x33>
 369:	b8 01 00 00 00       	mov    $0x1,%eax
 36e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	0f b6 00             	movzbl (%eax),%eax
 377:	3c 2b                	cmp    $0x2b,%al
 379:	74 0a                	je     385 <atoi+0x4a>
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	0f b6 00             	movzbl (%eax),%eax
 381:	3c 2d                	cmp    $0x2d,%al
 383:	75 2b                	jne    3b0 <atoi+0x75>
    s++;
 385:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 389:	eb 25                	jmp    3b0 <atoi+0x75>
    n = n*10 + *s++ - '0';
 38b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 38e:	89 d0                	mov    %edx,%eax
 390:	c1 e0 02             	shl    $0x2,%eax
 393:	01 d0                	add    %edx,%eax
 395:	01 c0                	add    %eax,%eax
 397:	89 c1                	mov    %eax,%ecx
 399:	8b 45 08             	mov    0x8(%ebp),%eax
 39c:	8d 50 01             	lea    0x1(%eax),%edx
 39f:	89 55 08             	mov    %edx,0x8(%ebp)
 3a2:	0f b6 00             	movzbl (%eax),%eax
 3a5:	0f be c0             	movsbl %al,%eax
 3a8:	01 c8                	add    %ecx,%eax
 3aa:	83 e8 30             	sub    $0x30,%eax
 3ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 3b0:	8b 45 08             	mov    0x8(%ebp),%eax
 3b3:	0f b6 00             	movzbl (%eax),%eax
 3b6:	3c 2f                	cmp    $0x2f,%al
 3b8:	7e 0a                	jle    3c4 <atoi+0x89>
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	0f b6 00             	movzbl (%eax),%eax
 3c0:	3c 39                	cmp    $0x39,%al
 3c2:	7e c7                	jle    38b <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 3c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3c7:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    

000003cd <atoo>:

int
atoo(const char *s)
{
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 3d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 3da:	eb 04                	jmp    3e0 <atoo+0x13>
 3dc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3e0:	8b 45 08             	mov    0x8(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	3c 20                	cmp    $0x20,%al
 3e8:	74 f2                	je     3dc <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 3ea:	8b 45 08             	mov    0x8(%ebp),%eax
 3ed:	0f b6 00             	movzbl (%eax),%eax
 3f0:	3c 2d                	cmp    $0x2d,%al
 3f2:	75 07                	jne    3fb <atoo+0x2e>
 3f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3f9:	eb 05                	jmp    400 <atoo+0x33>
 3fb:	b8 01 00 00 00       	mov    $0x1,%eax
 400:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	0f b6 00             	movzbl (%eax),%eax
 409:	3c 2b                	cmp    $0x2b,%al
 40b:	74 0a                	je     417 <atoo+0x4a>
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
 410:	0f b6 00             	movzbl (%eax),%eax
 413:	3c 2d                	cmp    $0x2d,%al
 415:	75 27                	jne    43e <atoo+0x71>
    s++;
 417:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 41b:	eb 21                	jmp    43e <atoo+0x71>
    n = n*8 + *s++ - '0';
 41d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 420:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	8d 50 01             	lea    0x1(%eax),%edx
 42d:	89 55 08             	mov    %edx,0x8(%ebp)
 430:	0f b6 00             	movzbl (%eax),%eax
 433:	0f be c0             	movsbl %al,%eax
 436:	01 c8                	add    %ecx,%eax
 438:	83 e8 30             	sub    $0x30,%eax
 43b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	0f b6 00             	movzbl (%eax),%eax
 444:	3c 2f                	cmp    $0x2f,%al
 446:	7e 0a                	jle    452 <atoo+0x85>
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3c 37                	cmp    $0x37,%al
 450:	7e cb                	jle    41d <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 452:	8b 45 f8             	mov    -0x8(%ebp),%eax
 455:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 459:	c9                   	leave  
 45a:	c3                   	ret    

0000045b <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 45b:	55                   	push   %ebp
 45c:	89 e5                	mov    %esp,%ebp
 45e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 467:	8b 45 0c             	mov    0xc(%ebp),%eax
 46a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 46d:	eb 17                	jmp    486 <memmove+0x2b>
    *dst++ = *src++;
 46f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 472:	8d 50 01             	lea    0x1(%eax),%edx
 475:	89 55 fc             	mov    %edx,-0x4(%ebp)
 478:	8b 55 f8             	mov    -0x8(%ebp),%edx
 47b:	8d 4a 01             	lea    0x1(%edx),%ecx
 47e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 481:	0f b6 12             	movzbl (%edx),%edx
 484:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 486:	8b 45 10             	mov    0x10(%ebp),%eax
 489:	8d 50 ff             	lea    -0x1(%eax),%edx
 48c:	89 55 10             	mov    %edx,0x10(%ebp)
 48f:	85 c0                	test   %eax,%eax
 491:	7f dc                	jg     46f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 493:	8b 45 08             	mov    0x8(%ebp),%eax
}
 496:	c9                   	leave  
 497:	c3                   	ret    

00000498 <zeropad>:

#ifdef CS333_P2
// helper function to output fractional numbers
void
zeropad(uint x)
{
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
 49b:	83 ec 18             	sub    $0x18,%esp
  int miliseconds;
  miliseconds = x % 1000;
 49e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4a1:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 4a6:	89 c8                	mov    %ecx,%eax
 4a8:	f7 e2                	mul    %edx
 4aa:	89 d0                	mov    %edx,%eax
 4ac:	c1 e8 06             	shr    $0x6,%eax
 4af:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
 4b5:	29 c1                	sub    %eax,%ecx
 4b7:	89 c8                	mov    %ecx,%eax
 4b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1,"%d.", x / 1000);
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 4c4:	f7 e2                	mul    %edx
 4c6:	89 d0                	mov    %edx,%eax
 4c8:	c1 e8 06             	shr    $0x6,%eax
 4cb:	83 ec 04             	sub    $0x4,%esp
 4ce:	50                   	push   %eax
 4cf:	68 0a 0b 00 00       	push   $0xb0a
 4d4:	6a 01                	push   $0x1
 4d6:	e8 14 02 00 00       	call   6ef <printf>
 4db:	83 c4 10             	add    $0x10,%esp
  if (miliseconds >= 100)
 4de:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
 4e2:	7e 17                	jle    4fb <zeropad+0x63>
    printf(1,"%d", miliseconds);
 4e4:	83 ec 04             	sub    $0x4,%esp
 4e7:	ff 75 f4             	pushl  -0xc(%ebp)
 4ea:	68 0e 0b 00 00       	push   $0xb0e
 4ef:	6a 01                	push   $0x1
 4f1:	e8 f9 01 00 00       	call   6ef <printf>
 4f6:	83 c4 10             	add    $0x10,%esp
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
};
 4f9:	eb 32                	jmp    52d <zeropad+0x95>
  int miliseconds;
  miliseconds = x % 1000;
  printf(1,"%d.", x / 1000);
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
 4fb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 4ff:	7e 17                	jle    518 <zeropad+0x80>
    printf(1,"0%d", miliseconds);
 501:	83 ec 04             	sub    $0x4,%esp
 504:	ff 75 f4             	pushl  -0xc(%ebp)
 507:	68 11 0b 00 00       	push   $0xb11
 50c:	6a 01                	push   $0x1
 50e:	e8 dc 01 00 00       	call   6ef <printf>
 513:	83 c4 10             	add    $0x10,%esp
  else
    printf(1, "00%d", miliseconds);
};
 516:	eb 15                	jmp    52d <zeropad+0x95>
  if (miliseconds >= 100)
    printf(1,"%d", miliseconds);
  else if (miliseconds >=10)
    printf(1,"0%d", miliseconds);
  else
    printf(1, "00%d", miliseconds);
 518:	83 ec 04             	sub    $0x4,%esp
 51b:	ff 75 f4             	pushl  -0xc(%ebp)
 51e:	68 15 0b 00 00       	push   $0xb15
 523:	6a 01                	push   $0x1
 525:	e8 c5 01 00 00       	call   6ef <printf>
 52a:	83 c4 10             	add    $0x10,%esp
};
 52d:	90                   	nop
 52e:	c9                   	leave  
 52f:	c3                   	ret    

00000530 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 530:	b8 01 00 00 00       	mov    $0x1,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <exit>:
SYSCALL(exit)
 538:	b8 02 00 00 00       	mov    $0x2,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <wait>:
SYSCALL(wait)
 540:	b8 03 00 00 00       	mov    $0x3,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <pipe>:
SYSCALL(pipe)
 548:	b8 04 00 00 00       	mov    $0x4,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <read>:
SYSCALL(read)
 550:	b8 05 00 00 00       	mov    $0x5,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <write>:
SYSCALL(write)
 558:	b8 10 00 00 00       	mov    $0x10,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <close>:
SYSCALL(close)
 560:	b8 15 00 00 00       	mov    $0x15,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <kill>:
SYSCALL(kill)
 568:	b8 06 00 00 00       	mov    $0x6,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <exec>:
SYSCALL(exec)
 570:	b8 07 00 00 00       	mov    $0x7,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <open>:
SYSCALL(open)
 578:	b8 0f 00 00 00       	mov    $0xf,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <mknod>:
SYSCALL(mknod)
 580:	b8 11 00 00 00       	mov    $0x11,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <unlink>:
SYSCALL(unlink)
 588:	b8 12 00 00 00       	mov    $0x12,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <fstat>:
SYSCALL(fstat)
 590:	b8 08 00 00 00       	mov    $0x8,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <link>:
SYSCALL(link)
 598:	b8 13 00 00 00       	mov    $0x13,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <mkdir>:
SYSCALL(mkdir)
 5a0:	b8 14 00 00 00       	mov    $0x14,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <chdir>:
SYSCALL(chdir)
 5a8:	b8 09 00 00 00       	mov    $0x9,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <dup>:
SYSCALL(dup)
 5b0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <getpid>:
SYSCALL(getpid)
 5b8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <sbrk>:
SYSCALL(sbrk)
 5c0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <sleep>:
SYSCALL(sleep)
 5c8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <uptime>:
SYSCALL(uptime)
 5d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <halt>:
SYSCALL(halt)
 5d8:	b8 16 00 00 00       	mov    $0x16,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <date>:

SYSCALL(date)
 5e0:	b8 17 00 00 00       	mov    $0x17,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <getuid>:
SYSCALL(getuid)
 5e8:	b8 18 00 00 00       	mov    $0x18,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <getgid>:
SYSCALL(getgid)
 5f0:	b8 19 00 00 00       	mov    $0x19,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <getppid>:
SYSCALL(getppid)
 5f8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <setuid>:
SYSCALL(setuid)
 600:	b8 1b 00 00 00       	mov    $0x1b,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <setgid>:
SYSCALL(setgid)
 608:	b8 1c 00 00 00       	mov    $0x1c,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <getprocs>:
SYSCALL(getprocs)
 610:	b8 1d 00 00 00       	mov    $0x1d,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 618:	55                   	push   %ebp
 619:	89 e5                	mov    %esp,%ebp
 61b:	83 ec 18             	sub    $0x18,%esp
 61e:	8b 45 0c             	mov    0xc(%ebp),%eax
 621:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 624:	83 ec 04             	sub    $0x4,%esp
 627:	6a 01                	push   $0x1
 629:	8d 45 f4             	lea    -0xc(%ebp),%eax
 62c:	50                   	push   %eax
 62d:	ff 75 08             	pushl  0x8(%ebp)
 630:	e8 23 ff ff ff       	call   558 <write>
 635:	83 c4 10             	add    $0x10,%esp
}
 638:	90                   	nop
 639:	c9                   	leave  
 63a:	c3                   	ret    

0000063b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	53                   	push   %ebx
 63f:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 642:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 649:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 64d:	74 17                	je     666 <printint+0x2b>
 64f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 653:	79 11                	jns    666 <printint+0x2b>
    neg = 1;
 655:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 65c:	8b 45 0c             	mov    0xc(%ebp),%eax
 65f:	f7 d8                	neg    %eax
 661:	89 45 ec             	mov    %eax,-0x14(%ebp)
 664:	eb 06                	jmp    66c <printint+0x31>
  } else {
    x = xx;
 666:	8b 45 0c             	mov    0xc(%ebp),%eax
 669:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 66c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 673:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 676:	8d 41 01             	lea    0x1(%ecx),%eax
 679:	89 45 f4             	mov    %eax,-0xc(%ebp)
 67c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 67f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 682:	ba 00 00 00 00       	mov    $0x0,%edx
 687:	f7 f3                	div    %ebx
 689:	89 d0                	mov    %edx,%eax
 68b:	0f b6 80 b8 0d 00 00 	movzbl 0xdb8(%eax),%eax
 692:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 696:	8b 5d 10             	mov    0x10(%ebp),%ebx
 699:	8b 45 ec             	mov    -0x14(%ebp),%eax
 69c:	ba 00 00 00 00       	mov    $0x0,%edx
 6a1:	f7 f3                	div    %ebx
 6a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6aa:	75 c7                	jne    673 <printint+0x38>
  if(neg)
 6ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6b0:	74 2d                	je     6df <printint+0xa4>
    buf[i++] = '-';
 6b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b5:	8d 50 01             	lea    0x1(%eax),%edx
 6b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6bb:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6c0:	eb 1d                	jmp    6df <printint+0xa4>
    putc(fd, buf[i]);
 6c2:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c8:	01 d0                	add    %edx,%eax
 6ca:	0f b6 00             	movzbl (%eax),%eax
 6cd:	0f be c0             	movsbl %al,%eax
 6d0:	83 ec 08             	sub    $0x8,%esp
 6d3:	50                   	push   %eax
 6d4:	ff 75 08             	pushl  0x8(%ebp)
 6d7:	e8 3c ff ff ff       	call   618 <putc>
 6dc:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6df:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6e7:	79 d9                	jns    6c2 <printint+0x87>
    putc(fd, buf[i]);
}
 6e9:	90                   	nop
 6ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ed:	c9                   	leave  
 6ee:	c3                   	ret    

000006ef <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6ef:	55                   	push   %ebp
 6f0:	89 e5                	mov    %esp,%ebp
 6f2:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6fc:	8d 45 0c             	lea    0xc(%ebp),%eax
 6ff:	83 c0 04             	add    $0x4,%eax
 702:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 705:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 70c:	e9 59 01 00 00       	jmp    86a <printf+0x17b>
    c = fmt[i] & 0xff;
 711:	8b 55 0c             	mov    0xc(%ebp),%edx
 714:	8b 45 f0             	mov    -0x10(%ebp),%eax
 717:	01 d0                	add    %edx,%eax
 719:	0f b6 00             	movzbl (%eax),%eax
 71c:	0f be c0             	movsbl %al,%eax
 71f:	25 ff 00 00 00       	and    $0xff,%eax
 724:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 727:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 72b:	75 2c                	jne    759 <printf+0x6a>
      if(c == '%'){
 72d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 731:	75 0c                	jne    73f <printf+0x50>
        state = '%';
 733:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 73a:	e9 27 01 00 00       	jmp    866 <printf+0x177>
      } else {
        putc(fd, c);
 73f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 742:	0f be c0             	movsbl %al,%eax
 745:	83 ec 08             	sub    $0x8,%esp
 748:	50                   	push   %eax
 749:	ff 75 08             	pushl  0x8(%ebp)
 74c:	e8 c7 fe ff ff       	call   618 <putc>
 751:	83 c4 10             	add    $0x10,%esp
 754:	e9 0d 01 00 00       	jmp    866 <printf+0x177>
      }
    } else if(state == '%'){
 759:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 75d:	0f 85 03 01 00 00    	jne    866 <printf+0x177>
      if(c == 'd'){
 763:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 767:	75 1e                	jne    787 <printf+0x98>
        printint(fd, *ap, 10, 1);
 769:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76c:	8b 00                	mov    (%eax),%eax
 76e:	6a 01                	push   $0x1
 770:	6a 0a                	push   $0xa
 772:	50                   	push   %eax
 773:	ff 75 08             	pushl  0x8(%ebp)
 776:	e8 c0 fe ff ff       	call   63b <printint>
 77b:	83 c4 10             	add    $0x10,%esp
        ap++;
 77e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 782:	e9 d8 00 00 00       	jmp    85f <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 787:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 78b:	74 06                	je     793 <printf+0xa4>
 78d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 791:	75 1e                	jne    7b1 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 793:	8b 45 e8             	mov    -0x18(%ebp),%eax
 796:	8b 00                	mov    (%eax),%eax
 798:	6a 00                	push   $0x0
 79a:	6a 10                	push   $0x10
 79c:	50                   	push   %eax
 79d:	ff 75 08             	pushl  0x8(%ebp)
 7a0:	e8 96 fe ff ff       	call   63b <printint>
 7a5:	83 c4 10             	add    $0x10,%esp
        ap++;
 7a8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ac:	e9 ae 00 00 00       	jmp    85f <printf+0x170>
      } else if(c == 's'){
 7b1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7b5:	75 43                	jne    7fa <printf+0x10b>
        s = (char*)*ap;
 7b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7c7:	75 25                	jne    7ee <printf+0xff>
          s = "(null)";
 7c9:	c7 45 f4 1a 0b 00 00 	movl   $0xb1a,-0xc(%ebp)
        while(*s != 0){
 7d0:	eb 1c                	jmp    7ee <printf+0xff>
          putc(fd, *s);
 7d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d5:	0f b6 00             	movzbl (%eax),%eax
 7d8:	0f be c0             	movsbl %al,%eax
 7db:	83 ec 08             	sub    $0x8,%esp
 7de:	50                   	push   %eax
 7df:	ff 75 08             	pushl  0x8(%ebp)
 7e2:	e8 31 fe ff ff       	call   618 <putc>
 7e7:	83 c4 10             	add    $0x10,%esp
          s++;
 7ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	0f b6 00             	movzbl (%eax),%eax
 7f4:	84 c0                	test   %al,%al
 7f6:	75 da                	jne    7d2 <printf+0xe3>
 7f8:	eb 65                	jmp    85f <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7fa:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7fe:	75 1d                	jne    81d <printf+0x12e>
        putc(fd, *ap);
 800:	8b 45 e8             	mov    -0x18(%ebp),%eax
 803:	8b 00                	mov    (%eax),%eax
 805:	0f be c0             	movsbl %al,%eax
 808:	83 ec 08             	sub    $0x8,%esp
 80b:	50                   	push   %eax
 80c:	ff 75 08             	pushl  0x8(%ebp)
 80f:	e8 04 fe ff ff       	call   618 <putc>
 814:	83 c4 10             	add    $0x10,%esp
        ap++;
 817:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 81b:	eb 42                	jmp    85f <printf+0x170>
      } else if(c == '%'){
 81d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 821:	75 17                	jne    83a <printf+0x14b>
        putc(fd, c);
 823:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 826:	0f be c0             	movsbl %al,%eax
 829:	83 ec 08             	sub    $0x8,%esp
 82c:	50                   	push   %eax
 82d:	ff 75 08             	pushl  0x8(%ebp)
 830:	e8 e3 fd ff ff       	call   618 <putc>
 835:	83 c4 10             	add    $0x10,%esp
 838:	eb 25                	jmp    85f <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 83a:	83 ec 08             	sub    $0x8,%esp
 83d:	6a 25                	push   $0x25
 83f:	ff 75 08             	pushl  0x8(%ebp)
 842:	e8 d1 fd ff ff       	call   618 <putc>
 847:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 84a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 84d:	0f be c0             	movsbl %al,%eax
 850:	83 ec 08             	sub    $0x8,%esp
 853:	50                   	push   %eax
 854:	ff 75 08             	pushl  0x8(%ebp)
 857:	e8 bc fd ff ff       	call   618 <putc>
 85c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 85f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 866:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 86a:	8b 55 0c             	mov    0xc(%ebp),%edx
 86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 870:	01 d0                	add    %edx,%eax
 872:	0f b6 00             	movzbl (%eax),%eax
 875:	84 c0                	test   %al,%al
 877:	0f 85 94 fe ff ff    	jne    711 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 87d:	90                   	nop
 87e:	c9                   	leave  
 87f:	c3                   	ret    

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 886:	8b 45 08             	mov    0x8(%ebp),%eax
 889:	83 e8 08             	sub    $0x8,%eax
 88c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88f:	a1 d4 0d 00 00       	mov    0xdd4,%eax
 894:	89 45 fc             	mov    %eax,-0x4(%ebp)
 897:	eb 24                	jmp    8bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89c:	8b 00                	mov    (%eax),%eax
 89e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a1:	77 12                	ja     8b5 <free+0x35>
 8a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a9:	77 24                	ja     8cf <free+0x4f>
 8ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ae:	8b 00                	mov    (%eax),%eax
 8b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b3:	77 1a                	ja     8cf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c3:	76 d4                	jbe    899 <free+0x19>
 8c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c8:	8b 00                	mov    (%eax),%eax
 8ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8cd:	76 ca                	jbe    899 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 8cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d2:	8b 40 04             	mov    0x4(%eax),%eax
 8d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8df:	01 c2                	add    %eax,%edx
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 00                	mov    (%eax),%eax
 8e6:	39 c2                	cmp    %eax,%edx
 8e8:	75 24                	jne    90e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	8b 50 04             	mov    0x4(%eax),%edx
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	8b 00                	mov    (%eax),%eax
 8f5:	8b 40 04             	mov    0x4(%eax),%eax
 8f8:	01 c2                	add    %eax,%edx
 8fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	8b 00                	mov    (%eax),%eax
 905:	8b 10                	mov    (%eax),%edx
 907:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90a:	89 10                	mov    %edx,(%eax)
 90c:	eb 0a                	jmp    918 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 90e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 911:	8b 10                	mov    (%eax),%edx
 913:	8b 45 f8             	mov    -0x8(%ebp),%eax
 916:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 918:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91b:	8b 40 04             	mov    0x4(%eax),%eax
 91e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 925:	8b 45 fc             	mov    -0x4(%ebp),%eax
 928:	01 d0                	add    %edx,%eax
 92a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 92d:	75 20                	jne    94f <free+0xcf>
    p->s.size += bp->s.size;
 92f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 932:	8b 50 04             	mov    0x4(%eax),%edx
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	8b 40 04             	mov    0x4(%eax),%eax
 93b:	01 c2                	add    %eax,%edx
 93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 940:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 943:	8b 45 f8             	mov    -0x8(%ebp),%eax
 946:	8b 10                	mov    (%eax),%edx
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	89 10                	mov    %edx,(%eax)
 94d:	eb 08                	jmp    957 <free+0xd7>
  } else
    p->s.ptr = bp;
 94f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 952:	8b 55 f8             	mov    -0x8(%ebp),%edx
 955:	89 10                	mov    %edx,(%eax)
  freep = p;
 957:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95a:	a3 d4 0d 00 00       	mov    %eax,0xdd4
}
 95f:	90                   	nop
 960:	c9                   	leave  
 961:	c3                   	ret    

00000962 <morecore>:

static Header*
morecore(uint nu)
{
 962:	55                   	push   %ebp
 963:	89 e5                	mov    %esp,%ebp
 965:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 968:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 96f:	77 07                	ja     978 <morecore+0x16>
    nu = 4096;
 971:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 978:	8b 45 08             	mov    0x8(%ebp),%eax
 97b:	c1 e0 03             	shl    $0x3,%eax
 97e:	83 ec 0c             	sub    $0xc,%esp
 981:	50                   	push   %eax
 982:	e8 39 fc ff ff       	call   5c0 <sbrk>
 987:	83 c4 10             	add    $0x10,%esp
 98a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 98d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 991:	75 07                	jne    99a <morecore+0x38>
    return 0;
 993:	b8 00 00 00 00       	mov    $0x0,%eax
 998:	eb 26                	jmp    9c0 <morecore+0x5e>
  hp = (Header*)p;
 99a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a3:	8b 55 08             	mov    0x8(%ebp),%edx
 9a6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ac:	83 c0 08             	add    $0x8,%eax
 9af:	83 ec 0c             	sub    $0xc,%esp
 9b2:	50                   	push   %eax
 9b3:	e8 c8 fe ff ff       	call   880 <free>
 9b8:	83 c4 10             	add    $0x10,%esp
  return freep;
 9bb:	a1 d4 0d 00 00       	mov    0xdd4,%eax
}
 9c0:	c9                   	leave  
 9c1:	c3                   	ret    

000009c2 <malloc>:

void*
malloc(uint nbytes)
{
 9c2:	55                   	push   %ebp
 9c3:	89 e5                	mov    %esp,%ebp
 9c5:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c8:	8b 45 08             	mov    0x8(%ebp),%eax
 9cb:	83 c0 07             	add    $0x7,%eax
 9ce:	c1 e8 03             	shr    $0x3,%eax
 9d1:	83 c0 01             	add    $0x1,%eax
 9d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9d7:	a1 d4 0d 00 00       	mov    0xdd4,%eax
 9dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9e3:	75 23                	jne    a08 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9e5:	c7 45 f0 cc 0d 00 00 	movl   $0xdcc,-0x10(%ebp)
 9ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ef:	a3 d4 0d 00 00       	mov    %eax,0xdd4
 9f4:	a1 d4 0d 00 00       	mov    0xdd4,%eax
 9f9:	a3 cc 0d 00 00       	mov    %eax,0xdcc
    base.s.size = 0;
 9fe:	c7 05 d0 0d 00 00 00 	movl   $0x0,0xdd0
 a05:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a08:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0b:	8b 00                	mov    (%eax),%eax
 a0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a10:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a13:	8b 40 04             	mov    0x4(%eax),%eax
 a16:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a19:	72 4d                	jb     a68 <malloc+0xa6>
      if(p->s.size == nunits)
 a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1e:	8b 40 04             	mov    0x4(%eax),%eax
 a21:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a24:	75 0c                	jne    a32 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a29:	8b 10                	mov    (%eax),%edx
 a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2e:	89 10                	mov    %edx,(%eax)
 a30:	eb 26                	jmp    a58 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a35:	8b 40 04             	mov    0x4(%eax),%eax
 a38:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a3b:	89 c2                	mov    %eax,%edx
 a3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a40:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a46:	8b 40 04             	mov    0x4(%eax),%eax
 a49:	c1 e0 03             	shl    $0x3,%eax
 a4c:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a52:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a55:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5b:	a3 d4 0d 00 00       	mov    %eax,0xdd4
      return (void*)(p + 1);
 a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a63:	83 c0 08             	add    $0x8,%eax
 a66:	eb 3b                	jmp    aa3 <malloc+0xe1>
    }
    if(p == freep)
 a68:	a1 d4 0d 00 00       	mov    0xdd4,%eax
 a6d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a70:	75 1e                	jne    a90 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a72:	83 ec 0c             	sub    $0xc,%esp
 a75:	ff 75 ec             	pushl  -0x14(%ebp)
 a78:	e8 e5 fe ff ff       	call   962 <morecore>
 a7d:	83 c4 10             	add    $0x10,%esp
 a80:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a83:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a87:	75 07                	jne    a90 <malloc+0xce>
        return 0;
 a89:	b8 00 00 00 00       	mov    $0x0,%eax
 a8e:	eb 13                	jmp    aa3 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a93:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a99:	8b 00                	mov    (%eax),%eax
 a9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a9e:	e9 6d ff ff ff       	jmp    a10 <malloc+0x4e>
}
 aa3:	c9                   	leave  
 aa4:	c3                   	ret    
