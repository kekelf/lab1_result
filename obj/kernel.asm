
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

void
kern_init(void){
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 9b 2d 00 00       	call   102dc7 <memset>

    cons_init();                // init the console
  10002c:	e8 44 15 00 00       	call   101575 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 35 10 00 	movl   $0x1035e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 35 10 00 	movl   $0x1035fc,(%esp)
  100046:	e8 21 02 00 00       	call   10026c <cprintf>

    print_kerninfo();
  10004b:	e8 c2 08 00 00       	call   100912 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8b 00 00 00       	call   1000e0 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 34 2a 00 00       	call   102a8e <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 4d 16 00 00       	call   1016ac <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 ab 17 00 00       	call   10180f <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 ff 0c 00 00       	call   100d68 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 79 17 00 00       	call   1017e7 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 6d 01 00 00       	call   1001e0 <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 bf 0c 00 00       	call   100d56 <mon_backtrace>
}
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	55                   	push   %ebp
  10009a:	89 e5                	mov    %esp,%ebp
  10009c:	53                   	push   %ebx
  10009d:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a0:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a6:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ac:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000b0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000b4:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b8:	89 04 24             	mov    %eax,(%esp)
  1000bb:	e8 b5 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c0:	83 c4 14             	add    $0x14,%esp
  1000c3:	5b                   	pop    %ebx
  1000c4:	5d                   	pop    %ebp
  1000c5:	c3                   	ret    

001000c6 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c6:	55                   	push   %ebp
  1000c7:	89 e5                	mov    %esp,%ebp
  1000c9:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000cc:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d6:	89 04 24             	mov    %eax,(%esp)
  1000d9:	e8 bb ff ff ff       	call   100099 <grade_backtrace1>
}
  1000de:	c9                   	leave  
  1000df:	c3                   	ret    

001000e0 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e0:	55                   	push   %ebp
  1000e1:	89 e5                	mov    %esp,%ebp
  1000e3:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e6:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000eb:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f2:	ff 
  1000f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fe:	e8 c3 ff ff ff       	call   1000c6 <grade_backtrace0>
}
  100103:	c9                   	leave  
  100104:	c3                   	ret    

00100105 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100105:	55                   	push   %ebp
  100106:	89 e5                	mov    %esp,%ebp
  100108:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010b:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010e:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100111:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100114:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100117:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011b:	0f b7 c0             	movzwl %ax,%eax
  10011e:	83 e0 03             	and    $0x3,%eax
  100121:	89 c2                	mov    %eax,%edx
  100123:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100128:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100130:	c7 04 24 01 36 10 00 	movl   $0x103601,(%esp)
  100137:	e8 30 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100140:	0f b7 d0             	movzwl %ax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 0f 36 10 00 	movl   $0x10360f,(%esp)
  100157:	e8 10 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	0f b7 d0             	movzwl %ax,%edx
  100163:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100168:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100170:	c7 04 24 1d 36 10 00 	movl   $0x10361d,(%esp)
  100177:	e8 f0 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100180:	0f b7 d0             	movzwl %ax,%edx
  100183:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100188:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100190:	c7 04 24 2b 36 10 00 	movl   $0x10362b,(%esp)
  100197:	e8 d0 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019c:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a0:	0f b7 d0             	movzwl %ax,%edx
  1001a3:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a8:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b0:	c7 04 24 39 36 10 00 	movl   $0x103639,(%esp)
  1001b7:	e8 b0 00 00 00       	call   10026c <cprintf>
    round ++;
  1001bc:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001c1:	83 c0 01             	add    $0x1,%eax
  1001c4:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c9:	c9                   	leave  
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001ce:	83 ec 08             	sub    $0x8,%esp
  1001d1:	cd 78                	int    $0x78
  1001d3:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001d5:	5d                   	pop    %ebp
  1001d6:	c3                   	ret    

001001d7 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d7:	55                   	push   %ebp
  1001d8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile (
  1001da:	cd 79                	int    $0x79
  1001dc:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001e0:	55                   	push   %ebp
  1001e1:	89 e5                	mov    %esp,%ebp
  1001e3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e6:	e8 1a ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001eb:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  1001f2:	e8 75 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_user();
  1001f7:	e8 cf ff ff ff       	call   1001cb <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fc:	e8 04 ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  100201:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100208:	e8 5f 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_kernel();
  10020d:	e8 c5 ff ff ff       	call   1001d7 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100212:	e8 ee fe ff ff       	call   100105 <lab1_print_cur_status>
}
  100217:	c9                   	leave  
  100218:	c3                   	ret    

00100219 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100219:	55                   	push   %ebp
  10021a:	89 e5                	mov    %esp,%ebp
  10021c:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021f:	8b 45 08             	mov    0x8(%ebp),%eax
  100222:	89 04 24             	mov    %eax,(%esp)
  100225:	e8 77 13 00 00       	call   1015a1 <cons_putc>
    (*cnt) ++;
  10022a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022d:	8b 00                	mov    (%eax),%eax
  10022f:	8d 50 01             	lea    0x1(%eax),%edx
  100232:	8b 45 0c             	mov    0xc(%ebp),%eax
  100235:	89 10                	mov    %edx,(%eax)
}
  100237:	c9                   	leave  
  100238:	c3                   	ret    

00100239 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100246:	8b 45 0c             	mov    0xc(%ebp),%eax
  100249:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024d:	8b 45 08             	mov    0x8(%ebp),%eax
  100250:	89 44 24 08          	mov    %eax,0x8(%esp)
  100254:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100257:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025b:	c7 04 24 19 02 10 00 	movl   $0x100219,(%esp)
  100262:	e8 b2 2e 00 00       	call   103119 <vprintfmt>
    return cnt;
  100267:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026a:	c9                   	leave  
  10026b:	c3                   	ret    

0010026c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100272:	8d 45 0c             	lea    0xc(%ebp),%eax
  100275:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027f:	8b 45 08             	mov    0x8(%ebp),%eax
  100282:	89 04 24             	mov    %eax,(%esp)
  100285:	e8 af ff ff ff       	call   100239 <vcprintf>
  10028a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100298:	8b 45 08             	mov    0x8(%ebp),%eax
  10029b:	89 04 24             	mov    %eax,(%esp)
  10029e:	e8 fe 12 00 00       	call   1015a1 <cons_putc>
}
  1002a3:	c9                   	leave  
  1002a4:	c3                   	ret    

001002a5 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a5:	55                   	push   %ebp
  1002a6:	89 e5                	mov    %esp,%ebp
  1002a8:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b2:	eb 13                	jmp    1002c7 <cputs+0x22>
        cputch(c, &cnt);
  1002b4:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b8:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bb:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002bf:	89 04 24             	mov    %eax,(%esp)
  1002c2:	e8 52 ff ff ff       	call   100219 <cputch>
    while ((c = *str ++) != '\0') {
  1002c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ca:	8d 50 01             	lea    0x1(%eax),%edx
  1002cd:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d0:	0f b6 00             	movzbl (%eax),%eax
  1002d3:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d6:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002da:	75 d8                	jne    1002b4 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002dc:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002ea:	e8 2a ff ff ff       	call   100219 <cputch>
    return cnt;
  1002ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f2:	c9                   	leave  
  1002f3:	c3                   	ret    

001002f4 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f4:	55                   	push   %ebp
  1002f5:	89 e5                	mov    %esp,%ebp
  1002f7:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fa:	e8 cb 12 00 00       	call   1015ca <cons_getc>
  1002ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100302:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100306:	74 f2                	je     1002fa <getchar+0x6>
        /* do nothing */;
    return c;
  100308:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030b:	c9                   	leave  
  10030c:	c3                   	ret    

0010030d <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030d:	55                   	push   %ebp
  10030e:	89 e5                	mov    %esp,%ebp
  100310:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100313:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100317:	74 13                	je     10032c <readline+0x1f>
        cprintf("%s", prompt);
  100319:	8b 45 08             	mov    0x8(%ebp),%eax
  10031c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100320:	c7 04 24 87 36 10 00 	movl   $0x103687,(%esp)
  100327:	e8 40 ff ff ff       	call   10026c <cprintf>
    }
    int i = 0, c;
  10032c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100333:	e8 bc ff ff ff       	call   1002f4 <getchar>
  100338:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10033f:	79 07                	jns    100348 <readline+0x3b>
            return NULL;
  100341:	b8 00 00 00 00       	mov    $0x0,%eax
  100346:	eb 79                	jmp    1003c1 <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100348:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034c:	7e 28                	jle    100376 <readline+0x69>
  10034e:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100355:	7f 1f                	jg     100376 <readline+0x69>
            cputchar(c);
  100357:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035a:	89 04 24             	mov    %eax,(%esp)
  10035d:	e8 30 ff ff ff       	call   100292 <cputchar>
            buf[i ++] = c;
  100362:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100365:	8d 50 01             	lea    0x1(%eax),%edx
  100368:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036e:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100374:	eb 46                	jmp    1003bc <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100376:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037a:	75 17                	jne    100393 <readline+0x86>
  10037c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100380:	7e 11                	jle    100393 <readline+0x86>
            cputchar(c);
  100382:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100385:	89 04 24             	mov    %eax,(%esp)
  100388:	e8 05 ff ff ff       	call   100292 <cputchar>
            i --;
  10038d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100391:	eb 29                	jmp    1003bc <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  100393:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100397:	74 06                	je     10039f <readline+0x92>
  100399:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039d:	75 1d                	jne    1003bc <readline+0xaf>
            cputchar(c);
  10039f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a2:	89 04 24             	mov    %eax,(%esp)
  1003a5:	e8 e8 fe ff ff       	call   100292 <cputchar>
            buf[i] = '\0';
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ad:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003ba:	eb 05                	jmp    1003c1 <readline+0xb4>
        }
    }
  1003bc:	e9 72 ff ff ff       	jmp    100333 <readline+0x26>
}
  1003c1:	c9                   	leave  
  1003c2:	c3                   	ret    

001003c3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c3:	55                   	push   %ebp
  1003c4:	89 e5                	mov    %esp,%ebp
  1003c6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ce:	85 c0                	test   %eax,%eax
  1003d0:	74 02                	je     1003d4 <__panic+0x11>
        goto panic_dead;
  1003d2:	eb 48                	jmp    10041c <__panic+0x59>
    }
    is_panic = 1;
  1003d4:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003db:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003de:	8d 45 14             	lea    0x14(%ebp),%eax
  1003e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f2:	c7 04 24 8a 36 10 00 	movl   $0x10368a,(%esp)
  1003f9:	e8 6e fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  1003fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100401:	89 44 24 04          	mov    %eax,0x4(%esp)
  100405:	8b 45 10             	mov    0x10(%ebp),%eax
  100408:	89 04 24             	mov    %eax,(%esp)
  10040b:	e8 29 fe ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100410:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  100417:	e8 50 fe ff ff       	call   10026c <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  10041c:	e8 cc 13 00 00       	call   1017ed <intr_disable>
    while (1) {
        kmonitor(NULL);
  100421:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100428:	e8 5a 08 00 00       	call   100c87 <kmonitor>
    }
  10042d:	eb f2                	jmp    100421 <__panic+0x5e>

0010042f <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  10042f:	55                   	push   %ebp
  100430:	89 e5                	mov    %esp,%ebp
  100432:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100435:	8d 45 14             	lea    0x14(%ebp),%eax
  100438:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10043b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10043e:	89 44 24 08          	mov    %eax,0x8(%esp)
  100442:	8b 45 08             	mov    0x8(%ebp),%eax
  100445:	89 44 24 04          	mov    %eax,0x4(%esp)
  100449:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100450:	e8 17 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  100455:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100458:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045c:	8b 45 10             	mov    0x10(%ebp),%eax
  10045f:	89 04 24             	mov    %eax,(%esp)
  100462:	e8 d2 fd ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100467:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  10046e:	e8 f9 fd ff ff       	call   10026c <cprintf>
    va_end(ap);
}
  100473:	c9                   	leave  
  100474:	c3                   	ret    

00100475 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100475:	55                   	push   %ebp
  100476:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100478:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  10047d:	5d                   	pop    %ebp
  10047e:	c3                   	ret    

0010047f <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  10047f:	55                   	push   %ebp
  100480:	89 e5                	mov    %esp,%ebp
  100482:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100485:	8b 45 0c             	mov    0xc(%ebp),%eax
  100488:	8b 00                	mov    (%eax),%eax
  10048a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10048d:	8b 45 10             	mov    0x10(%ebp),%eax
  100490:	8b 00                	mov    (%eax),%eax
  100492:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10049c:	e9 d2 00 00 00       	jmp    100573 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1004a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004a7:	01 d0                	add    %edx,%eax
  1004a9:	89 c2                	mov    %eax,%edx
  1004ab:	c1 ea 1f             	shr    $0x1f,%edx
  1004ae:	01 d0                	add    %edx,%eax
  1004b0:	d1 f8                	sar    %eax
  1004b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004b8:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004bb:	eb 04                	jmp    1004c1 <stab_binsearch+0x42>
            m --;
  1004bd:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c7:	7c 1f                	jl     1004e8 <stab_binsearch+0x69>
  1004c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004cc:	89 d0                	mov    %edx,%eax
  1004ce:	01 c0                	add    %eax,%eax
  1004d0:	01 d0                	add    %edx,%eax
  1004d2:	c1 e0 02             	shl    $0x2,%eax
  1004d5:	89 c2                	mov    %eax,%edx
  1004d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1004da:	01 d0                	add    %edx,%eax
  1004dc:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004e0:	0f b6 c0             	movzbl %al,%eax
  1004e3:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004e6:	75 d5                	jne    1004bd <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004ee:	7d 0b                	jge    1004fb <stab_binsearch+0x7c>
            l = true_m + 1;
  1004f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004f3:	83 c0 01             	add    $0x1,%eax
  1004f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004f9:	eb 78                	jmp    100573 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004fb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100502:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100505:	89 d0                	mov    %edx,%eax
  100507:	01 c0                	add    %eax,%eax
  100509:	01 d0                	add    %edx,%eax
  10050b:	c1 e0 02             	shl    $0x2,%eax
  10050e:	89 c2                	mov    %eax,%edx
  100510:	8b 45 08             	mov    0x8(%ebp),%eax
  100513:	01 d0                	add    %edx,%eax
  100515:	8b 40 08             	mov    0x8(%eax),%eax
  100518:	3b 45 18             	cmp    0x18(%ebp),%eax
  10051b:	73 13                	jae    100530 <stab_binsearch+0xb1>
            *region_left = m;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100523:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100525:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100528:	83 c0 01             	add    $0x1,%eax
  10052b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10052e:	eb 43                	jmp    100573 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100530:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100533:	89 d0                	mov    %edx,%eax
  100535:	01 c0                	add    %eax,%eax
  100537:	01 d0                	add    %edx,%eax
  100539:	c1 e0 02             	shl    $0x2,%eax
  10053c:	89 c2                	mov    %eax,%edx
  10053e:	8b 45 08             	mov    0x8(%ebp),%eax
  100541:	01 d0                	add    %edx,%eax
  100543:	8b 40 08             	mov    0x8(%eax),%eax
  100546:	3b 45 18             	cmp    0x18(%ebp),%eax
  100549:	76 16                	jbe    100561 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10054b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054e:	8d 50 ff             	lea    -0x1(%eax),%edx
  100551:	8b 45 10             	mov    0x10(%ebp),%eax
  100554:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100556:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100559:	83 e8 01             	sub    $0x1,%eax
  10055c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10055f:	eb 12                	jmp    100573 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100561:	8b 45 0c             	mov    0xc(%ebp),%eax
  100564:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100567:	89 10                	mov    %edx,(%eax)
            l = m;
  100569:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10056c:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10056f:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  100573:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100576:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100579:	0f 8e 22 ff ff ff    	jle    1004a1 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  10057f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100583:	75 0f                	jne    100594 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  100585:	8b 45 0c             	mov    0xc(%ebp),%eax
  100588:	8b 00                	mov    (%eax),%eax
  10058a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10058d:	8b 45 10             	mov    0x10(%ebp),%eax
  100590:	89 10                	mov    %edx,(%eax)
  100592:	eb 3f                	jmp    1005d3 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  100594:	8b 45 10             	mov    0x10(%ebp),%eax
  100597:	8b 00                	mov    (%eax),%eax
  100599:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  10059c:	eb 04                	jmp    1005a2 <stab_binsearch+0x123>
  10059e:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1005a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005a5:	8b 00                	mov    (%eax),%eax
  1005a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005aa:	7d 1f                	jge    1005cb <stab_binsearch+0x14c>
  1005ac:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005af:	89 d0                	mov    %edx,%eax
  1005b1:	01 c0                	add    %eax,%eax
  1005b3:	01 d0                	add    %edx,%eax
  1005b5:	c1 e0 02             	shl    $0x2,%eax
  1005b8:	89 c2                	mov    %eax,%edx
  1005ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1005bd:	01 d0                	add    %edx,%eax
  1005bf:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005c3:	0f b6 c0             	movzbl %al,%eax
  1005c6:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005c9:	75 d3                	jne    10059e <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ce:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005d1:	89 10                	mov    %edx,(%eax)
    }
}
  1005d3:	c9                   	leave  
  1005d4:	c3                   	ret    

001005d5 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005d5:	55                   	push   %ebp
  1005d6:	89 e5                	mov    %esp,%ebp
  1005d8:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005de:	c7 00 c8 36 10 00    	movl   $0x1036c8,(%eax)
    info->eip_line = 0;
  1005e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f1:	c7 40 08 c8 36 10 00 	movl   $0x1036c8,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fb:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100602:	8b 45 0c             	mov    0xc(%ebp),%eax
  100605:	8b 55 08             	mov    0x8(%ebp),%edx
  100608:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10060b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10060e:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100615:	c7 45 f4 ec 3e 10 00 	movl   $0x103eec,-0xc(%ebp)
    stab_end = __STAB_END__;
  10061c:	c7 45 f0 f8 b6 10 00 	movl   $0x10b6f8,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100623:	c7 45 ec f9 b6 10 00 	movl   $0x10b6f9,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10062a:	c7 45 e8 08 d7 10 00 	movl   $0x10d708,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100631:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100634:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100637:	76 0d                	jbe    100646 <debuginfo_eip+0x71>
  100639:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063c:	83 e8 01             	sub    $0x1,%eax
  10063f:	0f b6 00             	movzbl (%eax),%eax
  100642:	84 c0                	test   %al,%al
  100644:	74 0a                	je     100650 <debuginfo_eip+0x7b>
        return -1;
  100646:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10064b:	e9 c0 02 00 00       	jmp    100910 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100650:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100657:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10065a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10065d:	29 c2                	sub    %eax,%edx
  10065f:	89 d0                	mov    %edx,%eax
  100661:	c1 f8 02             	sar    $0x2,%eax
  100664:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10066a:	83 e8 01             	sub    $0x1,%eax
  10066d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100670:	8b 45 08             	mov    0x8(%ebp),%eax
  100673:	89 44 24 10          	mov    %eax,0x10(%esp)
  100677:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  10067e:	00 
  10067f:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100682:	89 44 24 08          	mov    %eax,0x8(%esp)
  100686:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100689:	89 44 24 04          	mov    %eax,0x4(%esp)
  10068d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100690:	89 04 24             	mov    %eax,(%esp)
  100693:	e8 e7 fd ff ff       	call   10047f <stab_binsearch>
    if (lfile == 0)
  100698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10069b:	85 c0                	test   %eax,%eax
  10069d:	75 0a                	jne    1006a9 <debuginfo_eip+0xd4>
        return -1;
  10069f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006a4:	e9 67 02 00 00       	jmp    100910 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006af:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bc:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006c3:	00 
  1006c4:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006c7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006cb:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006ce:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d5:	89 04 24             	mov    %eax,(%esp)
  1006d8:	e8 a2 fd ff ff       	call   10047f <stab_binsearch>

    if (lfun <= rfun) {
  1006dd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006e3:	39 c2                	cmp    %eax,%edx
  1006e5:	7f 7c                	jg     100763 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ea:	89 c2                	mov    %eax,%edx
  1006ec:	89 d0                	mov    %edx,%eax
  1006ee:	01 c0                	add    %eax,%eax
  1006f0:	01 d0                	add    %edx,%eax
  1006f2:	c1 e0 02             	shl    $0x2,%eax
  1006f5:	89 c2                	mov    %eax,%edx
  1006f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006fa:	01 d0                	add    %edx,%eax
  1006fc:	8b 10                	mov    (%eax),%edx
  1006fe:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100701:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100704:	29 c1                	sub    %eax,%ecx
  100706:	89 c8                	mov    %ecx,%eax
  100708:	39 c2                	cmp    %eax,%edx
  10070a:	73 22                	jae    10072e <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10070c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10070f:	89 c2                	mov    %eax,%edx
  100711:	89 d0                	mov    %edx,%eax
  100713:	01 c0                	add    %eax,%eax
  100715:	01 d0                	add    %edx,%eax
  100717:	c1 e0 02             	shl    $0x2,%eax
  10071a:	89 c2                	mov    %eax,%edx
  10071c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071f:	01 d0                	add    %edx,%eax
  100721:	8b 10                	mov    (%eax),%edx
  100723:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100726:	01 c2                	add    %eax,%edx
  100728:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10072e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100731:	89 c2                	mov    %eax,%edx
  100733:	89 d0                	mov    %edx,%eax
  100735:	01 c0                	add    %eax,%eax
  100737:	01 d0                	add    %edx,%eax
  100739:	c1 e0 02             	shl    $0x2,%eax
  10073c:	89 c2                	mov    %eax,%edx
  10073e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100741:	01 d0                	add    %edx,%eax
  100743:	8b 50 08             	mov    0x8(%eax),%edx
  100746:	8b 45 0c             	mov    0xc(%ebp),%eax
  100749:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10074c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074f:	8b 40 10             	mov    0x10(%eax),%eax
  100752:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100755:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100758:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10075b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10075e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100761:	eb 15                	jmp    100778 <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100763:	8b 45 0c             	mov    0xc(%ebp),%eax
  100766:	8b 55 08             	mov    0x8(%ebp),%edx
  100769:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  10076c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10076f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100772:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100775:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100778:	8b 45 0c             	mov    0xc(%ebp),%eax
  10077b:	8b 40 08             	mov    0x8(%eax),%eax
  10077e:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  100785:	00 
  100786:	89 04 24             	mov    %eax,(%esp)
  100789:	e8 ad 24 00 00       	call   102c3b <strfind>
  10078e:	89 c2                	mov    %eax,%edx
  100790:	8b 45 0c             	mov    0xc(%ebp),%eax
  100793:	8b 40 08             	mov    0x8(%eax),%eax
  100796:	29 c2                	sub    %eax,%edx
  100798:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079b:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  10079e:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007a5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ac:	00 
  1007ad:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007b4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007b7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007be:	89 04 24             	mov    %eax,(%esp)
  1007c1:	e8 b9 fc ff ff       	call   10047f <stab_binsearch>
    if (lline <= rline) {
  1007c6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007c9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007cc:	39 c2                	cmp    %eax,%edx
  1007ce:	7f 24                	jg     1007f4 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  1007d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d3:	89 c2                	mov    %eax,%edx
  1007d5:	89 d0                	mov    %edx,%eax
  1007d7:	01 c0                	add    %eax,%eax
  1007d9:	01 d0                	add    %edx,%eax
  1007db:	c1 e0 02             	shl    $0x2,%eax
  1007de:	89 c2                	mov    %eax,%edx
  1007e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e3:	01 d0                	add    %edx,%eax
  1007e5:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007e9:	0f b7 d0             	movzwl %ax,%edx
  1007ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ef:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f2:	eb 13                	jmp    100807 <debuginfo_eip+0x232>
        return -1;
  1007f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007f9:	e9 12 01 00 00       	jmp    100910 <debuginfo_eip+0x33b>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100801:	83 e8 01             	sub    $0x1,%eax
  100804:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100807:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10080d:	39 c2                	cmp    %eax,%edx
  10080f:	7c 56                	jl     100867 <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100811:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100814:	89 c2                	mov    %eax,%edx
  100816:	89 d0                	mov    %edx,%eax
  100818:	01 c0                	add    %eax,%eax
  10081a:	01 d0                	add    %edx,%eax
  10081c:	c1 e0 02             	shl    $0x2,%eax
  10081f:	89 c2                	mov    %eax,%edx
  100821:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100824:	01 d0                	add    %edx,%eax
  100826:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082a:	3c 84                	cmp    $0x84,%al
  10082c:	74 39                	je     100867 <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10082e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100831:	89 c2                	mov    %eax,%edx
  100833:	89 d0                	mov    %edx,%eax
  100835:	01 c0                	add    %eax,%eax
  100837:	01 d0                	add    %edx,%eax
  100839:	c1 e0 02             	shl    $0x2,%eax
  10083c:	89 c2                	mov    %eax,%edx
  10083e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100841:	01 d0                	add    %edx,%eax
  100843:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100847:	3c 64                	cmp    $0x64,%al
  100849:	75 b3                	jne    1007fe <debuginfo_eip+0x229>
  10084b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	89 d0                	mov    %edx,%eax
  100852:	01 c0                	add    %eax,%eax
  100854:	01 d0                	add    %edx,%eax
  100856:	c1 e0 02             	shl    $0x2,%eax
  100859:	89 c2                	mov    %eax,%edx
  10085b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10085e:	01 d0                	add    %edx,%eax
  100860:	8b 40 08             	mov    0x8(%eax),%eax
  100863:	85 c0                	test   %eax,%eax
  100865:	74 97                	je     1007fe <debuginfo_eip+0x229>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100867:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10086d:	39 c2                	cmp    %eax,%edx
  10086f:	7c 46                	jl     1008b7 <debuginfo_eip+0x2e2>
  100871:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100874:	89 c2                	mov    %eax,%edx
  100876:	89 d0                	mov    %edx,%eax
  100878:	01 c0                	add    %eax,%eax
  10087a:	01 d0                	add    %edx,%eax
  10087c:	c1 e0 02             	shl    $0x2,%eax
  10087f:	89 c2                	mov    %eax,%edx
  100881:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100884:	01 d0                	add    %edx,%eax
  100886:	8b 10                	mov    (%eax),%edx
  100888:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10088e:	29 c1                	sub    %eax,%ecx
  100890:	89 c8                	mov    %ecx,%eax
  100892:	39 c2                	cmp    %eax,%edx
  100894:	73 21                	jae    1008b7 <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100896:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100899:	89 c2                	mov    %eax,%edx
  10089b:	89 d0                	mov    %edx,%eax
  10089d:	01 c0                	add    %eax,%eax
  10089f:	01 d0                	add    %edx,%eax
  1008a1:	c1 e0 02             	shl    $0x2,%eax
  1008a4:	89 c2                	mov    %eax,%edx
  1008a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008a9:	01 d0                	add    %edx,%eax
  1008ab:	8b 10                	mov    (%eax),%edx
  1008ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b0:	01 c2                	add    %eax,%edx
  1008b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b5:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008b7:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008bd:	39 c2                	cmp    %eax,%edx
  1008bf:	7d 4a                	jge    10090b <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1008c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c4:	83 c0 01             	add    $0x1,%eax
  1008c7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008ca:	eb 18                	jmp    1008e4 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008cf:	8b 40 14             	mov    0x14(%eax),%eax
  1008d2:	8d 50 01             	lea    0x1(%eax),%edx
  1008d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d8:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008de:	83 c0 01             	add    $0x1,%eax
  1008e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008ea:	39 c2                	cmp    %eax,%edx
  1008ec:	7d 1d                	jge    10090b <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f1:	89 c2                	mov    %eax,%edx
  1008f3:	89 d0                	mov    %edx,%eax
  1008f5:	01 c0                	add    %eax,%eax
  1008f7:	01 d0                	add    %edx,%eax
  1008f9:	c1 e0 02             	shl    $0x2,%eax
  1008fc:	89 c2                	mov    %eax,%edx
  1008fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100901:	01 d0                	add    %edx,%eax
  100903:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100907:	3c a0                	cmp    $0xa0,%al
  100909:	74 c1                	je     1008cc <debuginfo_eip+0x2f7>
        }
    }
    return 0;
  10090b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100910:	c9                   	leave  
  100911:	c3                   	ret    

00100912 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100918:	c7 04 24 d2 36 10 00 	movl   $0x1036d2,(%esp)
  10091f:	e8 48 f9 ff ff       	call   10026c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100924:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092b:	00 
  10092c:	c7 04 24 eb 36 10 00 	movl   $0x1036eb,(%esp)
  100933:	e8 34 f9 ff ff       	call   10026c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100938:	c7 44 24 04 d1 35 10 	movl   $0x1035d1,0x4(%esp)
  10093f:	00 
  100940:	c7 04 24 03 37 10 00 	movl   $0x103703,(%esp)
  100947:	e8 20 f9 ff ff       	call   10026c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100953:	00 
  100954:	c7 04 24 1b 37 10 00 	movl   $0x10371b,(%esp)
  10095b:	e8 0c f9 ff ff       	call   10026c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100960:	c7 44 24 04 80 fd 10 	movl   $0x10fd80,0x4(%esp)
  100967:	00 
  100968:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  10096f:	e8 f8 f8 ff ff       	call   10026c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100974:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  100979:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100984:	29 c2                	sub    %eax,%edx
  100986:	89 d0                	mov    %edx,%eax
  100988:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098e:	85 c0                	test   %eax,%eax
  100990:	0f 48 c2             	cmovs  %edx,%eax
  100993:	c1 f8 0a             	sar    $0xa,%eax
  100996:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099a:	c7 04 24 4c 37 10 00 	movl   $0x10374c,(%esp)
  1009a1:	e8 c6 f8 ff ff       	call   10026c <cprintf>
}
  1009a6:	c9                   	leave  
  1009a7:	c3                   	ret    

001009a8 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a8:	55                   	push   %ebp
  1009a9:	89 e5                	mov    %esp,%ebp
  1009ab:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b1:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bb:	89 04 24             	mov    %eax,(%esp)
  1009be:	e8 12 fc ff ff       	call   1005d5 <debuginfo_eip>
  1009c3:	85 c0                	test   %eax,%eax
  1009c5:	74 15                	je     1009dc <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 76 37 10 00 	movl   $0x103776,(%esp)
  1009d5:	e8 92 f8 ff ff       	call   10026c <cprintf>
  1009da:	eb 6d                	jmp    100a49 <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e3:	eb 1c                	jmp    100a01 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009eb:	01 d0                	add    %edx,%eax
  1009ed:	0f b6 00             	movzbl (%eax),%eax
  1009f0:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009f9:	01 ca                	add    %ecx,%edx
  1009fb:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a04:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100a07:	7f dc                	jg     1009e5 <print_debuginfo+0x3d>
        }
        fnname[j] = '\0';
  100a09:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a12:	01 d0                	add    %edx,%eax
  100a14:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a1a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1d:	89 d1                	mov    %edx,%ecx
  100a1f:	29 c1                	sub    %eax,%ecx
  100a21:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a27:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a31:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a35:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3d:	c7 04 24 92 37 10 00 	movl   $0x103792,(%esp)
  100a44:	e8 23 f8 ff ff       	call   10026c <cprintf>
    }
}
  100a49:	c9                   	leave  
  100a4a:	c3                   	ret    

00100a4b <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4b:	55                   	push   %ebp
  100a4c:	89 e5                	mov    %esp,%ebp
  100a4e:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a51:	8b 45 04             	mov    0x4(%ebp),%eax
  100a54:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a57:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5a:	c9                   	leave  
  100a5b:	c3                   	ret    

00100a5c <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a62:	89 e8                	mov    %ebp,%eax
  100a64:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a67:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100a6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a6d:	e8 d9 ff ff ff       	call   100a4b <read_eip>
  100a72:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7c:	e9 88 00 00 00       	jmp    100b09 <print_stackframe+0xad>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  100a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a84:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a8f:	c7 04 24 a4 37 10 00 	movl   $0x1037a4,(%esp)
  100a96:	e8 d1 f7 ff ff       	call   10026c <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2;
  100a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a9e:	83 c0 08             	add    $0x8,%eax
  100aa1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100aa4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aab:	eb 25                	jmp    100ad2 <print_stackframe+0x76>
            cprintf("0x%08x ", args[j]);
  100aad:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ab0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ab7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100aba:	01 d0                	add    %edx,%eax
  100abc:	8b 00                	mov    (%eax),%eax
  100abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac2:	c7 04 24 c0 37 10 00 	movl   $0x1037c0,(%esp)
  100ac9:	e8 9e f7 ff ff       	call   10026c <cprintf>
        for (j = 0; j < 4; j ++) {
  100ace:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100ad2:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100ad6:	7e d5                	jle    100aad <print_stackframe+0x51>
        }
        cprintf("\n");
  100ad8:	c7 04 24 c8 37 10 00 	movl   $0x1037c8,(%esp)
  100adf:	e8 88 f7 ff ff       	call   10026c <cprintf>
        print_debuginfo(eip - 1);
  100ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ae7:	83 e8 01             	sub    $0x1,%eax
  100aea:	89 04 24             	mov    %eax,(%esp)
  100aed:	e8 b6 fe ff ff       	call   1009a8 <print_debuginfo>
        eip = ((uint32_t *)ebp)[1];
  100af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af5:	83 c0 04             	add    $0x4,%eax
  100af8:	8b 00                	mov    (%eax),%eax
  100afa:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b00:	8b 00                	mov    (%eax),%eax
  100b02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100b05:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100b09:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b0d:	74 0a                	je     100b19 <print_stackframe+0xbd>
  100b0f:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b13:	0f 8e 68 ff ff ff    	jle    100a81 <print_stackframe+0x25>
    }
}
  100b19:	c9                   	leave  
  100b1a:	c3                   	ret    

00100b1b <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b1b:	55                   	push   %ebp
  100b1c:	89 e5                	mov    %esp,%ebp
  100b1e:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b28:	eb 0c                	jmp    100b36 <parse+0x1b>
            *buf ++ = '\0';
  100b2a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2d:	8d 50 01             	lea    0x1(%eax),%edx
  100b30:	89 55 08             	mov    %edx,0x8(%ebp)
  100b33:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b36:	8b 45 08             	mov    0x8(%ebp),%eax
  100b39:	0f b6 00             	movzbl (%eax),%eax
  100b3c:	84 c0                	test   %al,%al
  100b3e:	74 1d                	je     100b5d <parse+0x42>
  100b40:	8b 45 08             	mov    0x8(%ebp),%eax
  100b43:	0f b6 00             	movzbl (%eax),%eax
  100b46:	0f be c0             	movsbl %al,%eax
  100b49:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b4d:	c7 04 24 4c 38 10 00 	movl   $0x10384c,(%esp)
  100b54:	e8 af 20 00 00       	call   102c08 <strchr>
  100b59:	85 c0                	test   %eax,%eax
  100b5b:	75 cd                	jne    100b2a <parse+0xf>
        }
        if (*buf == '\0') {
  100b5d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b60:	0f b6 00             	movzbl (%eax),%eax
  100b63:	84 c0                	test   %al,%al
  100b65:	75 02                	jne    100b69 <parse+0x4e>
            break;
  100b67:	eb 67                	jmp    100bd0 <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b69:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b6d:	75 14                	jne    100b83 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b6f:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b76:	00 
  100b77:	c7 04 24 51 38 10 00 	movl   $0x103851,(%esp)
  100b7e:	e8 e9 f6 ff ff       	call   10026c <cprintf>
        }
        argv[argc ++] = buf;
  100b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b86:	8d 50 01             	lea    0x1(%eax),%edx
  100b89:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b8c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b93:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b96:	01 c2                	add    %eax,%edx
  100b98:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9b:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b9d:	eb 04                	jmp    100ba3 <parse+0x88>
            buf ++;
  100b9f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba6:	0f b6 00             	movzbl (%eax),%eax
  100ba9:	84 c0                	test   %al,%al
  100bab:	74 1d                	je     100bca <parse+0xaf>
  100bad:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb0:	0f b6 00             	movzbl (%eax),%eax
  100bb3:	0f be c0             	movsbl %al,%eax
  100bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bba:	c7 04 24 4c 38 10 00 	movl   $0x10384c,(%esp)
  100bc1:	e8 42 20 00 00       	call   102c08 <strchr>
  100bc6:	85 c0                	test   %eax,%eax
  100bc8:	74 d5                	je     100b9f <parse+0x84>
        }
    }
  100bca:	90                   	nop
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bcb:	e9 66 ff ff ff       	jmp    100b36 <parse+0x1b>
    return argc;
  100bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bd3:	c9                   	leave  
  100bd4:	c3                   	ret    

00100bd5 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bd5:	55                   	push   %ebp
  100bd6:	89 e5                	mov    %esp,%ebp
  100bd8:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bdb:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bde:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	89 04 24             	mov    %eax,(%esp)
  100be8:	e8 2e ff ff ff       	call   100b1b <parse>
  100bed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bf0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bf4:	75 0a                	jne    100c00 <runcmd+0x2b>
        return 0;
  100bf6:	b8 00 00 00 00       	mov    $0x0,%eax
  100bfb:	e9 85 00 00 00       	jmp    100c85 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c07:	eb 5c                	jmp    100c65 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c09:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c0f:	89 d0                	mov    %edx,%eax
  100c11:	01 c0                	add    %eax,%eax
  100c13:	01 d0                	add    %edx,%eax
  100c15:	c1 e0 02             	shl    $0x2,%eax
  100c18:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c1d:	8b 00                	mov    (%eax),%eax
  100c1f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c23:	89 04 24             	mov    %eax,(%esp)
  100c26:	e8 3e 1f 00 00       	call   102b69 <strcmp>
  100c2b:	85 c0                	test   %eax,%eax
  100c2d:	75 32                	jne    100c61 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c2f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c32:	89 d0                	mov    %edx,%eax
  100c34:	01 c0                	add    %eax,%eax
  100c36:	01 d0                	add    %edx,%eax
  100c38:	c1 e0 02             	shl    $0x2,%eax
  100c3b:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c40:	8b 40 08             	mov    0x8(%eax),%eax
  100c43:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100c46:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100c49:	8b 55 0c             	mov    0xc(%ebp),%edx
  100c4c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100c50:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100c53:	83 c2 04             	add    $0x4,%edx
  100c56:	89 54 24 04          	mov    %edx,0x4(%esp)
  100c5a:	89 0c 24             	mov    %ecx,(%esp)
  100c5d:	ff d0                	call   *%eax
  100c5f:	eb 24                	jmp    100c85 <runcmd+0xb0>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c68:	83 f8 02             	cmp    $0x2,%eax
  100c6b:	76 9c                	jbe    100c09 <runcmd+0x34>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c6d:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c70:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c74:	c7 04 24 6f 38 10 00 	movl   $0x10386f,(%esp)
  100c7b:	e8 ec f5 ff ff       	call   10026c <cprintf>
    return 0;
  100c80:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c85:	c9                   	leave  
  100c86:	c3                   	ret    

00100c87 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c87:	55                   	push   %ebp
  100c88:	89 e5                	mov    %esp,%ebp
  100c8a:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c8d:	c7 04 24 88 38 10 00 	movl   $0x103888,(%esp)
  100c94:	e8 d3 f5 ff ff       	call   10026c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c99:	c7 04 24 b0 38 10 00 	movl   $0x1038b0,(%esp)
  100ca0:	e8 c7 f5 ff ff       	call   10026c <cprintf>

    if (tf != NULL) {
  100ca5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ca9:	74 0b                	je     100cb6 <kmonitor+0x2f>
        print_trapframe(tf);
  100cab:	8b 45 08             	mov    0x8(%ebp),%eax
  100cae:	89 04 24             	mov    %eax,(%esp)
  100cb1:	e8 11 0d 00 00       	call   1019c7 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cb6:	c7 04 24 d5 38 10 00 	movl   $0x1038d5,(%esp)
  100cbd:	e8 4b f6 ff ff       	call   10030d <readline>
  100cc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cc5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cc9:	74 18                	je     100ce3 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cce:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd5:	89 04 24             	mov    %eax,(%esp)
  100cd8:	e8 f8 fe ff ff       	call   100bd5 <runcmd>
  100cdd:	85 c0                	test   %eax,%eax
  100cdf:	79 02                	jns    100ce3 <kmonitor+0x5c>
                break;
  100ce1:	eb 02                	jmp    100ce5 <kmonitor+0x5e>
            }
        }
    }
  100ce3:	eb d1                	jmp    100cb6 <kmonitor+0x2f>
}
  100ce5:	c9                   	leave  
  100ce6:	c3                   	ret    

00100ce7 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ce7:	55                   	push   %ebp
  100ce8:	89 e5                	mov    %esp,%ebp
  100cea:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ced:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cf4:	eb 3f                	jmp    100d35 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cf6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cf9:	89 d0                	mov    %edx,%eax
  100cfb:	01 c0                	add    %eax,%eax
  100cfd:	01 d0                	add    %edx,%eax
  100cff:	c1 e0 02             	shl    $0x2,%eax
  100d02:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d07:	8b 48 04             	mov    0x4(%eax),%ecx
  100d0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d0d:	89 d0                	mov    %edx,%eax
  100d0f:	01 c0                	add    %eax,%eax
  100d11:	01 d0                	add    %edx,%eax
  100d13:	c1 e0 02             	shl    $0x2,%eax
  100d16:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d1b:	8b 00                	mov    (%eax),%eax
  100d1d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d21:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d25:	c7 04 24 d9 38 10 00 	movl   $0x1038d9,(%esp)
  100d2c:	e8 3b f5 ff ff       	call   10026c <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d31:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d38:	83 f8 02             	cmp    $0x2,%eax
  100d3b:	76 b9                	jbe    100cf6 <mon_help+0xf>
    }
    return 0;
  100d3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d42:	c9                   	leave  
  100d43:	c3                   	ret    

00100d44 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d44:	55                   	push   %ebp
  100d45:	89 e5                	mov    %esp,%ebp
  100d47:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d4a:	e8 c3 fb ff ff       	call   100912 <print_kerninfo>
    return 0;
  100d4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d54:	c9                   	leave  
  100d55:	c3                   	ret    

00100d56 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d56:	55                   	push   %ebp
  100d57:	89 e5                	mov    %esp,%ebp
  100d59:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d5c:	e8 fb fc ff ff       	call   100a5c <print_stackframe>
    return 0;
  100d61:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d66:	c9                   	leave  
  100d67:	c3                   	ret    

00100d68 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d68:	55                   	push   %ebp
  100d69:	89 e5                	mov    %esp,%ebp
  100d6b:	83 ec 28             	sub    $0x28,%esp
  100d6e:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d74:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d78:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d7c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d80:	ee                   	out    %al,(%dx)
  100d81:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d87:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d8b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d8f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d93:	ee                   	out    %al,(%dx)
  100d94:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d9a:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d9e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100da2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100da6:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100da7:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100dae:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db1:	c7 04 24 e2 38 10 00 	movl   $0x1038e2,(%esp)
  100db8:	e8 af f4 ff ff       	call   10026c <cprintf>
    pic_enable(IRQ_TIMER);
  100dbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dc4:	e8 b5 08 00 00       	call   10167e <pic_enable>
}
  100dc9:	c9                   	leave  
  100dca:	c3                   	ret    

00100dcb <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dcb:	55                   	push   %ebp
  100dcc:	89 e5                	mov    %esp,%ebp
  100dce:	83 ec 10             	sub    $0x10,%esp
  100dd1:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100ddb:	89 c2                	mov    %eax,%edx
  100ddd:	ec                   	in     (%dx),%al
  100dde:	88 45 fd             	mov    %al,-0x3(%ebp)
  100de1:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100de7:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100deb:	89 c2                	mov    %eax,%edx
  100ded:	ec                   	in     (%dx),%al
  100dee:	88 45 f9             	mov    %al,-0x7(%ebp)
  100df1:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100df7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dfb:	89 c2                	mov    %eax,%edx
  100dfd:	ec                   	in     (%dx),%al
  100dfe:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e01:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100e07:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e0b:	89 c2                	mov    %eax,%edx
  100e0d:	ec                   	in     (%dx),%al
  100e0e:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e11:	c9                   	leave  
  100e12:	c3                   	ret    

00100e13 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e13:	55                   	push   %ebp
  100e14:	89 e5                	mov    %esp,%ebp
  100e16:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e19:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e23:	0f b7 00             	movzwl (%eax),%eax
  100e26:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2d:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e32:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e35:	0f b7 00             	movzwl (%eax),%eax
  100e38:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e3c:	74 12                	je     100e50 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e3e:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e45:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e4c:	b4 03 
  100e4e:	eb 13                	jmp    100e63 <cga_init+0x50>
    } else {
        *cp = was;
  100e50:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e53:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e57:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e5a:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e61:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e63:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6a:	0f b7 c0             	movzwl %ax,%eax
  100e6d:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e71:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e75:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e79:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e7d:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e7e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e85:	83 c0 01             	add    $0x1,%eax
  100e88:	0f b7 c0             	movzwl %ax,%eax
  100e8b:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e8f:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e93:	89 c2                	mov    %eax,%edx
  100e95:	ec                   	in     (%dx),%al
  100e96:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e99:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e9d:	0f b6 c0             	movzbl %al,%eax
  100ea0:	c1 e0 08             	shl    $0x8,%eax
  100ea3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea6:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ead:	0f b7 c0             	movzwl %ax,%eax
  100eb0:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100eb4:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb8:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ebc:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ec0:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100ec1:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec8:	83 c0 01             	add    $0x1,%eax
  100ecb:	0f b7 c0             	movzwl %ax,%eax
  100ece:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed2:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ed6:	89 c2                	mov    %eax,%edx
  100ed8:	ec                   	in     (%dx),%al
  100ed9:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100edc:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ee0:	0f b6 c0             	movzbl %al,%eax
  100ee3:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ee6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee9:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ef7:	c9                   	leave  
  100ef8:	c3                   	ret    

00100ef9 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ef9:	55                   	push   %ebp
  100efa:	89 e5                	mov    %esp,%ebp
  100efc:	83 ec 48             	sub    $0x48,%esp
  100eff:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f05:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f09:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f0d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f11:	ee                   	out    %al,(%dx)
  100f12:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f18:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f1c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f20:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f24:	ee                   	out    %al,(%dx)
  100f25:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f2b:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f2f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f33:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f37:	ee                   	out    %al,(%dx)
  100f38:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f3e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f42:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f46:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f4a:	ee                   	out    %al,(%dx)
  100f4b:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f51:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f55:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f59:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f5d:	ee                   	out    %al,(%dx)
  100f5e:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f64:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f68:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f6c:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f70:	ee                   	out    %al,(%dx)
  100f71:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f77:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f7b:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f7f:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f83:	ee                   	out    %al,(%dx)
  100f84:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8a:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f8e:	89 c2                	mov    %eax,%edx
  100f90:	ec                   	in     (%dx),%al
  100f91:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f94:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f98:	3c ff                	cmp    $0xff,%al
  100f9a:	0f 95 c0             	setne  %al
  100f9d:	0f b6 c0             	movzbl %al,%eax
  100fa0:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa5:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fab:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100faf:	89 c2                	mov    %eax,%edx
  100fb1:	ec                   	in     (%dx),%al
  100fb2:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fb5:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fbb:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fbf:	89 c2                	mov    %eax,%edx
  100fc1:	ec                   	in     (%dx),%al
  100fc2:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fc5:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fca:	85 c0                	test   %eax,%eax
  100fcc:	74 0c                	je     100fda <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fce:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fd5:	e8 a4 06 00 00       	call   10167e <pic_enable>
    }
}
  100fda:	c9                   	leave  
  100fdb:	c3                   	ret    

00100fdc <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fdc:	55                   	push   %ebp
  100fdd:	89 e5                	mov    %esp,%ebp
  100fdf:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe9:	eb 09                	jmp    100ff4 <lpt_putc_sub+0x18>
        delay();
  100feb:	e8 db fd ff ff       	call   100dcb <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100ff4:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ffa:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ffe:	89 c2                	mov    %eax,%edx
  101000:	ec                   	in     (%dx),%al
  101001:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101004:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101008:	84 c0                	test   %al,%al
  10100a:	78 09                	js     101015 <lpt_putc_sub+0x39>
  10100c:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101013:	7e d6                	jle    100feb <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  101015:	8b 45 08             	mov    0x8(%ebp),%eax
  101018:	0f b6 c0             	movzbl %al,%eax
  10101b:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101021:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101024:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101028:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10102c:	ee                   	out    %al,(%dx)
  10102d:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101033:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101037:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10103b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10103f:	ee                   	out    %al,(%dx)
  101040:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101046:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  10104a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10104e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101052:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101053:	c9                   	leave  
  101054:	c3                   	ret    

00101055 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101055:	55                   	push   %ebp
  101056:	89 e5                	mov    %esp,%ebp
  101058:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10105b:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10105f:	74 0d                	je     10106e <lpt_putc+0x19>
        lpt_putc_sub(c);
  101061:	8b 45 08             	mov    0x8(%ebp),%eax
  101064:	89 04 24             	mov    %eax,(%esp)
  101067:	e8 70 ff ff ff       	call   100fdc <lpt_putc_sub>
  10106c:	eb 24                	jmp    101092 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  10106e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101075:	e8 62 ff ff ff       	call   100fdc <lpt_putc_sub>
        lpt_putc_sub(' ');
  10107a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101081:	e8 56 ff ff ff       	call   100fdc <lpt_putc_sub>
        lpt_putc_sub('\b');
  101086:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10108d:	e8 4a ff ff ff       	call   100fdc <lpt_putc_sub>
    }
}
  101092:	c9                   	leave  
  101093:	c3                   	ret    

00101094 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101094:	55                   	push   %ebp
  101095:	89 e5                	mov    %esp,%ebp
  101097:	53                   	push   %ebx
  101098:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10109b:	8b 45 08             	mov    0x8(%ebp),%eax
  10109e:	b0 00                	mov    $0x0,%al
  1010a0:	85 c0                	test   %eax,%eax
  1010a2:	75 07                	jne    1010ab <cga_putc+0x17>
        c |= 0x0700;
  1010a4:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ae:	0f b6 c0             	movzbl %al,%eax
  1010b1:	83 f8 0a             	cmp    $0xa,%eax
  1010b4:	74 4c                	je     101102 <cga_putc+0x6e>
  1010b6:	83 f8 0d             	cmp    $0xd,%eax
  1010b9:	74 57                	je     101112 <cga_putc+0x7e>
  1010bb:	83 f8 08             	cmp    $0x8,%eax
  1010be:	0f 85 88 00 00 00    	jne    10114c <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010c4:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010cb:	66 85 c0             	test   %ax,%ax
  1010ce:	74 30                	je     101100 <cga_putc+0x6c>
            crt_pos --;
  1010d0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d7:	83 e8 01             	sub    $0x1,%eax
  1010da:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010e0:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e5:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010ec:	0f b7 d2             	movzwl %dx,%edx
  1010ef:	01 d2                	add    %edx,%edx
  1010f1:	01 c2                	add    %eax,%edx
  1010f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f6:	b0 00                	mov    $0x0,%al
  1010f8:	83 c8 20             	or     $0x20,%eax
  1010fb:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010fe:	eb 72                	jmp    101172 <cga_putc+0xde>
  101100:	eb 70                	jmp    101172 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  101102:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101109:	83 c0 50             	add    $0x50,%eax
  10110c:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101112:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101119:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101120:	0f b7 c1             	movzwl %cx,%eax
  101123:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101129:	c1 e8 10             	shr    $0x10,%eax
  10112c:	89 c2                	mov    %eax,%edx
  10112e:	66 c1 ea 06          	shr    $0x6,%dx
  101132:	89 d0                	mov    %edx,%eax
  101134:	c1 e0 02             	shl    $0x2,%eax
  101137:	01 d0                	add    %edx,%eax
  101139:	c1 e0 04             	shl    $0x4,%eax
  10113c:	29 c1                	sub    %eax,%ecx
  10113e:	89 ca                	mov    %ecx,%edx
  101140:	89 d8                	mov    %ebx,%eax
  101142:	29 d0                	sub    %edx,%eax
  101144:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10114a:	eb 26                	jmp    101172 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10114c:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101152:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101159:	8d 50 01             	lea    0x1(%eax),%edx
  10115c:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101163:	0f b7 c0             	movzwl %ax,%eax
  101166:	01 c0                	add    %eax,%eax
  101168:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10116b:	8b 45 08             	mov    0x8(%ebp),%eax
  10116e:	66 89 02             	mov    %ax,(%edx)
        break;
  101171:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101172:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101179:	66 3d cf 07          	cmp    $0x7cf,%ax
  10117d:	76 5b                	jbe    1011da <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10117f:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101184:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10118a:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118f:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101196:	00 
  101197:	89 54 24 04          	mov    %edx,0x4(%esp)
  10119b:	89 04 24             	mov    %eax,(%esp)
  10119e:	e8 63 1c 00 00       	call   102e06 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a3:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011aa:	eb 15                	jmp    1011c1 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011ac:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011b4:	01 d2                	add    %edx,%edx
  1011b6:	01 d0                	add    %edx,%eax
  1011b8:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011c1:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011c8:	7e e2                	jle    1011ac <cga_putc+0x118>
        }
        crt_pos -= CRT_COLS;
  1011ca:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011d1:	83 e8 50             	sub    $0x50,%eax
  1011d4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011da:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011e1:	0f b7 c0             	movzwl %ax,%eax
  1011e4:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011e8:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011ec:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011f0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011f4:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011fc:	66 c1 e8 08          	shr    $0x8,%ax
  101200:	0f b6 c0             	movzbl %al,%eax
  101203:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10120a:	83 c2 01             	add    $0x1,%edx
  10120d:	0f b7 d2             	movzwl %dx,%edx
  101210:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101214:	88 45 ed             	mov    %al,-0x13(%ebp)
  101217:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10121b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10121f:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101220:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101227:	0f b7 c0             	movzwl %ax,%eax
  10122a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  10122e:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101232:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101236:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10123a:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10123b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101242:	0f b6 c0             	movzbl %al,%eax
  101245:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10124c:	83 c2 01             	add    $0x1,%edx
  10124f:	0f b7 d2             	movzwl %dx,%edx
  101252:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101256:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101259:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10125d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101261:	ee                   	out    %al,(%dx)
}
  101262:	83 c4 34             	add    $0x34,%esp
  101265:	5b                   	pop    %ebx
  101266:	5d                   	pop    %ebp
  101267:	c3                   	ret    

00101268 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101268:	55                   	push   %ebp
  101269:	89 e5                	mov    %esp,%ebp
  10126b:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10126e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101275:	eb 09                	jmp    101280 <serial_putc_sub+0x18>
        delay();
  101277:	e8 4f fb ff ff       	call   100dcb <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10127c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101280:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101286:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10128a:	89 c2                	mov    %eax,%edx
  10128c:	ec                   	in     (%dx),%al
  10128d:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101290:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101294:	0f b6 c0             	movzbl %al,%eax
  101297:	83 e0 20             	and    $0x20,%eax
  10129a:	85 c0                	test   %eax,%eax
  10129c:	75 09                	jne    1012a7 <serial_putc_sub+0x3f>
  10129e:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012a5:	7e d0                	jle    101277 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012aa:	0f b6 c0             	movzbl %al,%eax
  1012ad:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012b3:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012ba:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012be:	ee                   	out    %al,(%dx)
}
  1012bf:	c9                   	leave  
  1012c0:	c3                   	ret    

001012c1 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012c1:	55                   	push   %ebp
  1012c2:	89 e5                	mov    %esp,%ebp
  1012c4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012c7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012cb:	74 0d                	je     1012da <serial_putc+0x19>
        serial_putc_sub(c);
  1012cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d0:	89 04 24             	mov    %eax,(%esp)
  1012d3:	e8 90 ff ff ff       	call   101268 <serial_putc_sub>
  1012d8:	eb 24                	jmp    1012fe <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012da:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e1:	e8 82 ff ff ff       	call   101268 <serial_putc_sub>
        serial_putc_sub(' ');
  1012e6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012ed:	e8 76 ff ff ff       	call   101268 <serial_putc_sub>
        serial_putc_sub('\b');
  1012f2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f9:	e8 6a ff ff ff       	call   101268 <serial_putc_sub>
    }
}
  1012fe:	c9                   	leave  
  1012ff:	c3                   	ret    

00101300 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101300:	55                   	push   %ebp
  101301:	89 e5                	mov    %esp,%ebp
  101303:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101306:	eb 33                	jmp    10133b <cons_intr+0x3b>
        if (c != 0) {
  101308:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10130c:	74 2d                	je     10133b <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10130e:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101313:	8d 50 01             	lea    0x1(%eax),%edx
  101316:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10131c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10131f:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101325:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10132a:	3d 00 02 00 00       	cmp    $0x200,%eax
  10132f:	75 0a                	jne    10133b <cons_intr+0x3b>
                cons.wpos = 0;
  101331:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101338:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10133b:	8b 45 08             	mov    0x8(%ebp),%eax
  10133e:	ff d0                	call   *%eax
  101340:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101343:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101347:	75 bf                	jne    101308 <cons_intr+0x8>
            }
        }
    }
}
  101349:	c9                   	leave  
  10134a:	c3                   	ret    

0010134b <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10134b:	55                   	push   %ebp
  10134c:	89 e5                	mov    %esp,%ebp
  10134e:	83 ec 10             	sub    $0x10,%esp
  101351:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101357:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10135b:	89 c2                	mov    %eax,%edx
  10135d:	ec                   	in     (%dx),%al
  10135e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101361:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101365:	0f b6 c0             	movzbl %al,%eax
  101368:	83 e0 01             	and    $0x1,%eax
  10136b:	85 c0                	test   %eax,%eax
  10136d:	75 07                	jne    101376 <serial_proc_data+0x2b>
        return -1;
  10136f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101374:	eb 2a                	jmp    1013a0 <serial_proc_data+0x55>
  101376:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101380:	89 c2                	mov    %eax,%edx
  101382:	ec                   	in     (%dx),%al
  101383:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101386:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10138a:	0f b6 c0             	movzbl %al,%eax
  10138d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101390:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101394:	75 07                	jne    10139d <serial_proc_data+0x52>
        c = '\b';
  101396:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10139d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013a0:	c9                   	leave  
  1013a1:	c3                   	ret    

001013a2 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013a2:	55                   	push   %ebp
  1013a3:	89 e5                	mov    %esp,%ebp
  1013a5:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013a8:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013ad:	85 c0                	test   %eax,%eax
  1013af:	74 0c                	je     1013bd <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013b1:	c7 04 24 4b 13 10 00 	movl   $0x10134b,(%esp)
  1013b8:	e8 43 ff ff ff       	call   101300 <cons_intr>
    }
}
  1013bd:	c9                   	leave  
  1013be:	c3                   	ret    

001013bf <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013bf:	55                   	push   %ebp
  1013c0:	89 e5                	mov    %esp,%ebp
  1013c2:	83 ec 38             	sub    $0x38,%esp
  1013c5:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013cb:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013cf:	89 c2                	mov    %eax,%edx
  1013d1:	ec                   	in     (%dx),%al
  1013d2:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013d5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d9:	0f b6 c0             	movzbl %al,%eax
  1013dc:	83 e0 01             	and    $0x1,%eax
  1013df:	85 c0                	test   %eax,%eax
  1013e1:	75 0a                	jne    1013ed <kbd_proc_data+0x2e>
        return -1;
  1013e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e8:	e9 59 01 00 00       	jmp    101546 <kbd_proc_data+0x187>
  1013ed:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f3:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013f7:	89 c2                	mov    %eax,%edx
  1013f9:	ec                   	in     (%dx),%al
  1013fa:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013fd:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101401:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101404:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101408:	75 17                	jne    101421 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  10140a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140f:	83 c8 40             	or     $0x40,%eax
  101412:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101417:	b8 00 00 00 00       	mov    $0x0,%eax
  10141c:	e9 25 01 00 00       	jmp    101546 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101421:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101425:	84 c0                	test   %al,%al
  101427:	79 47                	jns    101470 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101429:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142e:	83 e0 40             	and    $0x40,%eax
  101431:	85 c0                	test   %eax,%eax
  101433:	75 09                	jne    10143e <kbd_proc_data+0x7f>
  101435:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101439:	83 e0 7f             	and    $0x7f,%eax
  10143c:	eb 04                	jmp    101442 <kbd_proc_data+0x83>
  10143e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101442:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101445:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101449:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101450:	83 c8 40             	or     $0x40,%eax
  101453:	0f b6 c0             	movzbl %al,%eax
  101456:	f7 d0                	not    %eax
  101458:	89 c2                	mov    %eax,%edx
  10145a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145f:	21 d0                	and    %edx,%eax
  101461:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101466:	b8 00 00 00 00       	mov    $0x0,%eax
  10146b:	e9 d6 00 00 00       	jmp    101546 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101470:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101475:	83 e0 40             	and    $0x40,%eax
  101478:	85 c0                	test   %eax,%eax
  10147a:	74 11                	je     10148d <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10147c:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101480:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101485:	83 e0 bf             	and    $0xffffffbf,%eax
  101488:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10148d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101491:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101498:	0f b6 d0             	movzbl %al,%edx
  10149b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a0:	09 d0                	or     %edx,%eax
  1014a2:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014a7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ab:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014b2:	0f b6 d0             	movzbl %al,%edx
  1014b5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ba:	31 d0                	xor    %edx,%eax
  1014bc:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014c1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c6:	83 e0 03             	and    $0x3,%eax
  1014c9:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014d0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014d4:	01 d0                	add    %edx,%eax
  1014d6:	0f b6 00             	movzbl (%eax),%eax
  1014d9:	0f b6 c0             	movzbl %al,%eax
  1014dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014df:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e4:	83 e0 08             	and    $0x8,%eax
  1014e7:	85 c0                	test   %eax,%eax
  1014e9:	74 22                	je     10150d <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014eb:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014ef:	7e 0c                	jle    1014fd <kbd_proc_data+0x13e>
  1014f1:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014f5:	7f 06                	jg     1014fd <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014f7:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014fb:	eb 10                	jmp    10150d <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014fd:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101501:	7e 0a                	jle    10150d <kbd_proc_data+0x14e>
  101503:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101507:	7f 04                	jg     10150d <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  101509:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10150d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101512:	f7 d0                	not    %eax
  101514:	83 e0 06             	and    $0x6,%eax
  101517:	85 c0                	test   %eax,%eax
  101519:	75 28                	jne    101543 <kbd_proc_data+0x184>
  10151b:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101522:	75 1f                	jne    101543 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  101524:	c7 04 24 fd 38 10 00 	movl   $0x1038fd,(%esp)
  10152b:	e8 3c ed ff ff       	call   10026c <cprintf>
  101530:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101536:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10153a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  10153e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101542:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101543:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101546:	c9                   	leave  
  101547:	c3                   	ret    

00101548 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101548:	55                   	push   %ebp
  101549:	89 e5                	mov    %esp,%ebp
  10154b:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10154e:	c7 04 24 bf 13 10 00 	movl   $0x1013bf,(%esp)
  101555:	e8 a6 fd ff ff       	call   101300 <cons_intr>
}
  10155a:	c9                   	leave  
  10155b:	c3                   	ret    

0010155c <kbd_init>:

static void
kbd_init(void) {
  10155c:	55                   	push   %ebp
  10155d:	89 e5                	mov    %esp,%ebp
  10155f:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101562:	e8 e1 ff ff ff       	call   101548 <kbd_intr>
    pic_enable(IRQ_KBD);
  101567:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10156e:	e8 0b 01 00 00       	call   10167e <pic_enable>
}
  101573:	c9                   	leave  
  101574:	c3                   	ret    

00101575 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101575:	55                   	push   %ebp
  101576:	89 e5                	mov    %esp,%ebp
  101578:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10157b:	e8 93 f8 ff ff       	call   100e13 <cga_init>
    serial_init();
  101580:	e8 74 f9 ff ff       	call   100ef9 <serial_init>
    kbd_init();
  101585:	e8 d2 ff ff ff       	call   10155c <kbd_init>
    if (!serial_exists) {
  10158a:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10158f:	85 c0                	test   %eax,%eax
  101591:	75 0c                	jne    10159f <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101593:	c7 04 24 09 39 10 00 	movl   $0x103909,(%esp)
  10159a:	e8 cd ec ff ff       	call   10026c <cprintf>
    }
}
  10159f:	c9                   	leave  
  1015a0:	c3                   	ret    

001015a1 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015a1:	55                   	push   %ebp
  1015a2:	89 e5                	mov    %esp,%ebp
  1015a4:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1015aa:	89 04 24             	mov    %eax,(%esp)
  1015ad:	e8 a3 fa ff ff       	call   101055 <lpt_putc>
    cga_putc(c);
  1015b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b5:	89 04 24             	mov    %eax,(%esp)
  1015b8:	e8 d7 fa ff ff       	call   101094 <cga_putc>
    serial_putc(c);
  1015bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c0:	89 04 24             	mov    %eax,(%esp)
  1015c3:	e8 f9 fc ff ff       	call   1012c1 <serial_putc>
}
  1015c8:	c9                   	leave  
  1015c9:	c3                   	ret    

001015ca <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015ca:	55                   	push   %ebp
  1015cb:	89 e5                	mov    %esp,%ebp
  1015cd:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015d0:	e8 cd fd ff ff       	call   1013a2 <serial_intr>
    kbd_intr();
  1015d5:	e8 6e ff ff ff       	call   101548 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015da:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015e0:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015e5:	39 c2                	cmp    %eax,%edx
  1015e7:	74 36                	je     10161f <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015e9:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015ee:	8d 50 01             	lea    0x1(%eax),%edx
  1015f1:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015f7:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015fe:	0f b6 c0             	movzbl %al,%eax
  101601:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101604:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101609:	3d 00 02 00 00       	cmp    $0x200,%eax
  10160e:	75 0a                	jne    10161a <cons_getc+0x50>
            cons.rpos = 0;
  101610:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101617:	00 00 00 
        }
        return c;
  10161a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10161d:	eb 05                	jmp    101624 <cons_getc+0x5a>
    }
    return 0;
  10161f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101624:	c9                   	leave  
  101625:	c3                   	ret    

00101626 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101626:	55                   	push   %ebp
  101627:	89 e5                	mov    %esp,%ebp
  101629:	83 ec 14             	sub    $0x14,%esp
  10162c:	8b 45 08             	mov    0x8(%ebp),%eax
  10162f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101633:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101637:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10163d:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101642:	85 c0                	test   %eax,%eax
  101644:	74 36                	je     10167c <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101646:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164a:	0f b6 c0             	movzbl %al,%eax
  10164d:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101653:	88 45 fd             	mov    %al,-0x3(%ebp)
  101656:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10165a:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10165e:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10165f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101663:	66 c1 e8 08          	shr    $0x8,%ax
  101667:	0f b6 c0             	movzbl %al,%eax
  10166a:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101670:	88 45 f9             	mov    %al,-0x7(%ebp)
  101673:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101677:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167b:	ee                   	out    %al,(%dx)
    }
}
  10167c:	c9                   	leave  
  10167d:	c3                   	ret    

0010167e <pic_enable>:

void
pic_enable(unsigned int irq) {
  10167e:	55                   	push   %ebp
  10167f:	89 e5                	mov    %esp,%ebp
  101681:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101684:	8b 45 08             	mov    0x8(%ebp),%eax
  101687:	ba 01 00 00 00       	mov    $0x1,%edx
  10168c:	89 c1                	mov    %eax,%ecx
  10168e:	d3 e2                	shl    %cl,%edx
  101690:	89 d0                	mov    %edx,%eax
  101692:	f7 d0                	not    %eax
  101694:	89 c2                	mov    %eax,%edx
  101696:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10169d:	21 d0                	and    %edx,%eax
  10169f:	0f b7 c0             	movzwl %ax,%eax
  1016a2:	89 04 24             	mov    %eax,(%esp)
  1016a5:	e8 7c ff ff ff       	call   101626 <pic_setmask>
}
  1016aa:	c9                   	leave  
  1016ab:	c3                   	ret    

001016ac <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016ac:	55                   	push   %ebp
  1016ad:	89 e5                	mov    %esp,%ebp
  1016af:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b2:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016b9:	00 00 00 
  1016bc:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c2:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016c6:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016ca:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016ce:	ee                   	out    %al,(%dx)
  1016cf:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016d5:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016d9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016dd:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e1:	ee                   	out    %al,(%dx)
  1016e2:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016e8:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016ec:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016f0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016f4:	ee                   	out    %al,(%dx)
  1016f5:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016fb:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016ff:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101703:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101707:	ee                   	out    %al,(%dx)
  101708:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10170e:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101712:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101716:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10171a:	ee                   	out    %al,(%dx)
  10171b:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101721:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101725:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101729:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10172d:	ee                   	out    %al,(%dx)
  10172e:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101734:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  101738:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10173c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101740:	ee                   	out    %al,(%dx)
  101741:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101747:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10174b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10174f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101753:	ee                   	out    %al,(%dx)
  101754:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10175a:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  10175e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101762:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101766:	ee                   	out    %al,(%dx)
  101767:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10176d:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101771:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101775:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101779:	ee                   	out    %al,(%dx)
  10177a:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101780:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101784:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101788:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10178c:	ee                   	out    %al,(%dx)
  10178d:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101793:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101797:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10179b:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10179f:	ee                   	out    %al,(%dx)
  1017a0:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017a6:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017aa:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017ae:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b2:	ee                   	out    %al,(%dx)
  1017b3:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017b9:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017bd:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c1:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c5:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017cd:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017d1:	74 12                	je     1017e5 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017d3:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017da:	0f b7 c0             	movzwl %ax,%eax
  1017dd:	89 04 24             	mov    %eax,(%esp)
  1017e0:	e8 41 fe ff ff       	call   101626 <pic_setmask>
    }
}
  1017e5:	c9                   	leave  
  1017e6:	c3                   	ret    

001017e7 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017e7:	55                   	push   %ebp
  1017e8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017ea:	fb                   	sti    
    sti();
}
  1017eb:	5d                   	pop    %ebp
  1017ec:	c3                   	ret    

001017ed <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017ed:	55                   	push   %ebp
  1017ee:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017f0:	fa                   	cli    
    cli();
}
  1017f1:	5d                   	pop    %ebp
  1017f2:	c3                   	ret    

001017f3 <print_ticks>:
#include <console.h>
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100

static void print_ticks() {
  1017f3:	55                   	push   %ebp
  1017f4:	89 e5                	mov    %esp,%ebp
  1017f6:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017f9:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101800:	00 
  101801:	c7 04 24 40 39 10 00 	movl   $0x103940,(%esp)
  101808:	e8 5f ea ff ff       	call   10026c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10180d:	c9                   	leave  
  10180e:	c3                   	ret    

0010180f <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10180f:	55                   	push   %ebp
  101810:	89 e5                	mov    %esp,%ebp
  101812:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101815:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10181c:	e9 c3 00 00 00       	jmp    1018e4 <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101821:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101824:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10182b:	89 c2                	mov    %eax,%edx
  10182d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101830:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101837:	00 
  101838:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183b:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101842:	00 08 00 
  101845:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101848:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10184f:	00 
  101850:	83 e2 e0             	and    $0xffffffe0,%edx
  101853:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10185a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185d:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101864:	00 
  101865:	83 e2 1f             	and    $0x1f,%edx
  101868:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10186f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101872:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101879:	00 
  10187a:	83 e2 f0             	and    $0xfffffff0,%edx
  10187d:	83 ca 0e             	or     $0xe,%edx
  101880:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101887:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188a:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101891:	00 
  101892:	83 e2 ef             	and    $0xffffffef,%edx
  101895:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10189c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189f:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a6:	00 
  1018a7:	83 e2 9f             	and    $0xffffff9f,%edx
  1018aa:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b4:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018bb:	00 
  1018bc:	83 ca 80             	or     $0xffffff80,%edx
  1018bf:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c9:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018d0:	c1 e8 10             	shr    $0x10,%eax
  1018d3:	89 c2                	mov    %eax,%edx
  1018d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d8:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018df:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  1018e0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e7:	3d ff 00 00 00       	cmp    $0xff,%eax
  1018ec:	0f 86 2f ff ff ff    	jbe    101821 <idt_init+0x12>
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  1018f2:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1018f7:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  1018fd:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101904:	08 00 
  101906:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10190d:	83 e0 e0             	and    $0xffffffe0,%eax
  101910:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101915:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10191c:	83 e0 1f             	and    $0x1f,%eax
  10191f:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101924:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10192b:	83 e0 f0             	and    $0xfffffff0,%eax
  10192e:	83 c8 0e             	or     $0xe,%eax
  101931:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101936:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10193d:	83 e0 ef             	and    $0xffffffef,%eax
  101940:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101945:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10194c:	83 c8 60             	or     $0x60,%eax
  10194f:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101954:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10195b:	83 c8 80             	or     $0xffffff80,%eax
  10195e:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101963:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101968:	c1 e8 10             	shr    $0x10,%eax
  10196b:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101971:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101978:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10197b:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    lidt(&idt_pd);
}
  10197e:	c9                   	leave  
  10197f:	c3                   	ret    

00101980 <trapname>:

static const char *
trapname(int trapno) {
  101980:	55                   	push   %ebp
  101981:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101983:	8b 45 08             	mov    0x8(%ebp),%eax
  101986:	83 f8 13             	cmp    $0x13,%eax
  101989:	77 0c                	ja     101997 <trapname+0x17>
        return excnames[trapno];
  10198b:	8b 45 08             	mov    0x8(%ebp),%eax
  10198e:	8b 04 85 a0 3c 10 00 	mov    0x103ca0(,%eax,4),%eax
  101995:	eb 18                	jmp    1019af <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101997:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10199b:	7e 0d                	jle    1019aa <trapname+0x2a>
  10199d:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019a1:	7f 07                	jg     1019aa <trapname+0x2a>
        return "Hardware Interrupt";
  1019a3:	b8 4a 39 10 00       	mov    $0x10394a,%eax
  1019a8:	eb 05                	jmp    1019af <trapname+0x2f>
    }
    return "(unknown trap)";
  1019aa:	b8 5d 39 10 00       	mov    $0x10395d,%eax
}
  1019af:	5d                   	pop    %ebp
  1019b0:	c3                   	ret    

001019b1 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019b1:	55                   	push   %ebp
  1019b2:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b7:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019bb:	66 83 f8 08          	cmp    $0x8,%ax
  1019bf:	0f 94 c0             	sete   %al
  1019c2:	0f b6 c0             	movzbl %al,%eax
}
  1019c5:	5d                   	pop    %ebp
  1019c6:	c3                   	ret    

001019c7 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019c7:	55                   	push   %ebp
  1019c8:	89 e5                	mov    %esp,%ebp
  1019ca:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019d4:	c7 04 24 9e 39 10 00 	movl   $0x10399e,(%esp)
  1019db:	e8 8c e8 ff ff       	call   10026c <cprintf>
    print_regs(&tf->tf_regs);
  1019e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e3:	89 04 24             	mov    %eax,(%esp)
  1019e6:	e8 a1 01 00 00       	call   101b8c <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ee:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019f2:	0f b7 c0             	movzwl %ax,%eax
  1019f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f9:	c7 04 24 af 39 10 00 	movl   $0x1039af,(%esp)
  101a00:	e8 67 e8 ff ff       	call   10026c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a05:	8b 45 08             	mov    0x8(%ebp),%eax
  101a08:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a0c:	0f b7 c0             	movzwl %ax,%eax
  101a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a13:	c7 04 24 c2 39 10 00 	movl   $0x1039c2,(%esp)
  101a1a:	e8 4d e8 ff ff       	call   10026c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a1f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a22:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a26:	0f b7 c0             	movzwl %ax,%eax
  101a29:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a2d:	c7 04 24 d5 39 10 00 	movl   $0x1039d5,(%esp)
  101a34:	e8 33 e8 ff ff       	call   10026c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a39:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3c:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a40:	0f b7 c0             	movzwl %ax,%eax
  101a43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a47:	c7 04 24 e8 39 10 00 	movl   $0x1039e8,(%esp)
  101a4e:	e8 19 e8 ff ff       	call   10026c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a53:	8b 45 08             	mov    0x8(%ebp),%eax
  101a56:	8b 40 30             	mov    0x30(%eax),%eax
  101a59:	89 04 24             	mov    %eax,(%esp)
  101a5c:	e8 1f ff ff ff       	call   101980 <trapname>
  101a61:	8b 55 08             	mov    0x8(%ebp),%edx
  101a64:	8b 52 30             	mov    0x30(%edx),%edx
  101a67:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a6b:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a6f:	c7 04 24 fb 39 10 00 	movl   $0x1039fb,(%esp)
  101a76:	e8 f1 e7 ff ff       	call   10026c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7e:	8b 40 34             	mov    0x34(%eax),%eax
  101a81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a85:	c7 04 24 0d 3a 10 00 	movl   $0x103a0d,(%esp)
  101a8c:	e8 db e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a91:	8b 45 08             	mov    0x8(%ebp),%eax
  101a94:	8b 40 38             	mov    0x38(%eax),%eax
  101a97:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a9b:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  101aa2:	e8 c5 e7 ff ff       	call   10026c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101aa7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aaa:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aae:	0f b7 c0             	movzwl %ax,%eax
  101ab1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ab5:	c7 04 24 2b 3a 10 00 	movl   $0x103a2b,(%esp)
  101abc:	e8 ab e7 ff ff       	call   10026c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac4:	8b 40 40             	mov    0x40(%eax),%eax
  101ac7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101acb:	c7 04 24 3e 3a 10 00 	movl   $0x103a3e,(%esp)
  101ad2:	e8 95 e7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ad7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ade:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101ae5:	eb 3e                	jmp    101b25 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ae7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aea:	8b 50 40             	mov    0x40(%eax),%edx
  101aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101af0:	21 d0                	and    %edx,%eax
  101af2:	85 c0                	test   %eax,%eax
  101af4:	74 28                	je     101b1e <print_trapframe+0x157>
  101af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101af9:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b00:	85 c0                	test   %eax,%eax
  101b02:	74 1a                	je     101b1e <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101b04:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b07:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b0e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b12:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101b19:	e8 4e e7 ff ff       	call   10026c <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b1e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b22:	d1 65 f0             	shll   -0x10(%ebp)
  101b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b28:	83 f8 17             	cmp    $0x17,%eax
  101b2b:	76 ba                	jbe    101ae7 <print_trapframe+0x120>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b30:	8b 40 40             	mov    0x40(%eax),%eax
  101b33:	25 00 30 00 00       	and    $0x3000,%eax
  101b38:	c1 e8 0c             	shr    $0xc,%eax
  101b3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b3f:	c7 04 24 51 3a 10 00 	movl   $0x103a51,(%esp)
  101b46:	e8 21 e7 ff ff       	call   10026c <cprintf>

    if (!trap_in_kernel(tf)) {
  101b4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4e:	89 04 24             	mov    %eax,(%esp)
  101b51:	e8 5b fe ff ff       	call   1019b1 <trap_in_kernel>
  101b56:	85 c0                	test   %eax,%eax
  101b58:	75 30                	jne    101b8a <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5d:	8b 40 44             	mov    0x44(%eax),%eax
  101b60:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b64:	c7 04 24 5a 3a 10 00 	movl   $0x103a5a,(%esp)
  101b6b:	e8 fc e6 ff ff       	call   10026c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b70:	8b 45 08             	mov    0x8(%ebp),%eax
  101b73:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b77:	0f b7 c0             	movzwl %ax,%eax
  101b7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b7e:	c7 04 24 69 3a 10 00 	movl   $0x103a69,(%esp)
  101b85:	e8 e2 e6 ff ff       	call   10026c <cprintf>
    }
}
  101b8a:	c9                   	leave  
  101b8b:	c3                   	ret    

00101b8c <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b8c:	55                   	push   %ebp
  101b8d:	89 e5                	mov    %esp,%ebp
  101b8f:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b92:	8b 45 08             	mov    0x8(%ebp),%eax
  101b95:	8b 00                	mov    (%eax),%eax
  101b97:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9b:	c7 04 24 7c 3a 10 00 	movl   $0x103a7c,(%esp)
  101ba2:	e8 c5 e6 ff ff       	call   10026c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  101baa:	8b 40 04             	mov    0x4(%eax),%eax
  101bad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb1:	c7 04 24 8b 3a 10 00 	movl   $0x103a8b,(%esp)
  101bb8:	e8 af e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc0:	8b 40 08             	mov    0x8(%eax),%eax
  101bc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc7:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101bce:	e8 99 e6 ff ff       	call   10026c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd6:	8b 40 0c             	mov    0xc(%eax),%eax
  101bd9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bdd:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101be4:	e8 83 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101be9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bec:	8b 40 10             	mov    0x10(%eax),%eax
  101bef:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf3:	c7 04 24 b8 3a 10 00 	movl   $0x103ab8,(%esp)
  101bfa:	e8 6d e6 ff ff       	call   10026c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101bff:	8b 45 08             	mov    0x8(%ebp),%eax
  101c02:	8b 40 14             	mov    0x14(%eax),%eax
  101c05:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c09:	c7 04 24 c7 3a 10 00 	movl   $0x103ac7,(%esp)
  101c10:	e8 57 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c15:	8b 45 08             	mov    0x8(%ebp),%eax
  101c18:	8b 40 18             	mov    0x18(%eax),%eax
  101c1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1f:	c7 04 24 d6 3a 10 00 	movl   $0x103ad6,(%esp)
  101c26:	e8 41 e6 ff ff       	call   10026c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c2b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c2e:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c31:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c35:	c7 04 24 e5 3a 10 00 	movl   $0x103ae5,(%esp)
  101c3c:	e8 2b e6 ff ff       	call   10026c <cprintf>
}
  101c41:	c9                   	leave  
  101c42:	c3                   	ret    

00101c43 <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c43:	55                   	push   %ebp
  101c44:	89 e5                	mov    %esp,%ebp
  101c46:	57                   	push   %edi
  101c47:	56                   	push   %esi
  101c48:	53                   	push   %ebx
  101c49:	83 ec 2c             	sub    $0x2c,%esp
    char c;

    switch (tf->tf_trapno) {
  101c4c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4f:	8b 40 30             	mov    0x30(%eax),%eax
  101c52:	83 f8 2f             	cmp    $0x2f,%eax
  101c55:	77 21                	ja     101c78 <trap_dispatch+0x35>
  101c57:	83 f8 2e             	cmp    $0x2e,%eax
  101c5a:	0f 83 4b 02 00 00    	jae    101eab <trap_dispatch+0x268>
  101c60:	83 f8 21             	cmp    $0x21,%eax
  101c63:	0f 84 8a 00 00 00    	je     101cf3 <trap_dispatch+0xb0>
  101c69:	83 f8 24             	cmp    $0x24,%eax
  101c6c:	74 5c                	je     101cca <trap_dispatch+0x87>
  101c6e:	83 f8 20             	cmp    $0x20,%eax
  101c71:	74 1c                	je     101c8f <trap_dispatch+0x4c>
  101c73:	e9 fb 01 00 00       	jmp    101e73 <trap_dispatch+0x230>
  101c78:	83 f8 78             	cmp    $0x78,%eax
  101c7b:	0f 84 9b 00 00 00    	je     101d1c <trap_dispatch+0xd9>
  101c81:	83 f8 79             	cmp    $0x79,%eax
  101c84:	0f 84 70 01 00 00    	je     101dfa <trap_dispatch+0x1b7>
  101c8a:	e9 e4 01 00 00       	jmp    101e73 <trap_dispatch+0x230>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101c8f:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c94:	83 c0 01             	add    $0x1,%eax
  101c97:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks % TICK_NUM == 0) {
  101c9c:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101ca2:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101ca7:	89 c8                	mov    %ecx,%eax
  101ca9:	f7 e2                	mul    %edx
  101cab:	89 d0                	mov    %edx,%eax
  101cad:	c1 e8 05             	shr    $0x5,%eax
  101cb0:	6b c0 64             	imul   $0x64,%eax,%eax
  101cb3:	29 c1                	sub    %eax,%ecx
  101cb5:	89 c8                	mov    %ecx,%eax
  101cb7:	85 c0                	test   %eax,%eax
  101cb9:	75 0a                	jne    101cc5 <trap_dispatch+0x82>
            print_ticks();
  101cbb:	e8 33 fb ff ff       	call   1017f3 <print_ticks>
        }
        break;
  101cc0:	e9 e7 01 00 00       	jmp    101eac <trap_dispatch+0x269>
  101cc5:	e9 e2 01 00 00       	jmp    101eac <trap_dispatch+0x269>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cca:	e8 fb f8 ff ff       	call   1015ca <cons_getc>
  101ccf:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cd2:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101cd6:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101cda:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cde:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ce2:	c7 04 24 f4 3a 10 00 	movl   $0x103af4,(%esp)
  101ce9:	e8 7e e5 ff ff       	call   10026c <cprintf>
        break;
  101cee:	e9 b9 01 00 00       	jmp    101eac <trap_dispatch+0x269>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cf3:	e8 d2 f8 ff ff       	call   1015ca <cons_getc>
  101cf8:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101cfb:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101cff:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d03:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d07:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d0b:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101d12:	e8 55 e5 ff ff       	call   10026c <cprintf>
        break;
  101d17:	e9 90 01 00 00       	jmp    101eac <trap_dispatch+0x269>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101d1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101d1f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d23:	66 83 f8 1b          	cmp    $0x1b,%ax
  101d27:	0f 84 c8 00 00 00    	je     101df5 <trap_dispatch+0x1b2>
            switchk2u = *tf;
  101d2d:	8b 55 08             	mov    0x8(%ebp),%edx
  101d30:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101d35:	bb 4c 00 00 00       	mov    $0x4c,%ebx
  101d3a:	89 c1                	mov    %eax,%ecx
  101d3c:	83 e1 01             	and    $0x1,%ecx
  101d3f:	85 c9                	test   %ecx,%ecx
  101d41:	74 0e                	je     101d51 <trap_dispatch+0x10e>
  101d43:	0f b6 0a             	movzbl (%edx),%ecx
  101d46:	88 08                	mov    %cl,(%eax)
  101d48:	83 c0 01             	add    $0x1,%eax
  101d4b:	83 c2 01             	add    $0x1,%edx
  101d4e:	83 eb 01             	sub    $0x1,%ebx
  101d51:	89 c1                	mov    %eax,%ecx
  101d53:	83 e1 02             	and    $0x2,%ecx
  101d56:	85 c9                	test   %ecx,%ecx
  101d58:	74 0f                	je     101d69 <trap_dispatch+0x126>
  101d5a:	0f b7 0a             	movzwl (%edx),%ecx
  101d5d:	66 89 08             	mov    %cx,(%eax)
  101d60:	83 c0 02             	add    $0x2,%eax
  101d63:	83 c2 02             	add    $0x2,%edx
  101d66:	83 eb 02             	sub    $0x2,%ebx
  101d69:	89 d9                	mov    %ebx,%ecx
  101d6b:	c1 e9 02             	shr    $0x2,%ecx
  101d6e:	89 c7                	mov    %eax,%edi
  101d70:	89 d6                	mov    %edx,%esi
  101d72:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101d74:	89 f2                	mov    %esi,%edx
  101d76:	89 f8                	mov    %edi,%eax
  101d78:	b9 00 00 00 00       	mov    $0x0,%ecx
  101d7d:	89 de                	mov    %ebx,%esi
  101d7f:	83 e6 02             	and    $0x2,%esi
  101d82:	85 f6                	test   %esi,%esi
  101d84:	74 0b                	je     101d91 <trap_dispatch+0x14e>
  101d86:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
  101d8a:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
  101d8e:	83 c1 02             	add    $0x2,%ecx
  101d91:	83 e3 01             	and    $0x1,%ebx
  101d94:	85 db                	test   %ebx,%ebx
  101d96:	74 07                	je     101d9f <trap_dispatch+0x15c>
  101d98:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
  101d9c:	88 14 08             	mov    %dl,(%eax,%ecx,1)
            switchk2u.tf_cs = USER_CS;
  101d9f:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101da6:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101da8:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101daf:	23 00 
  101db1:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101db8:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101dbe:	0f b7 05 48 f9 10 00 	movzwl 0x10f948,%eax
  101dc5:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101dcb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dce:	83 c0 44             	add    $0x44,%eax
  101dd1:	a3 64 f9 10 00       	mov    %eax,0x10f964
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101dd6:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101ddb:	80 cc 30             	or     $0x30,%ah
  101dde:	a3 60 f9 10 00       	mov    %eax,0x10f960
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101de3:	8b 45 08             	mov    0x8(%ebp),%eax
  101de6:	8d 50 fc             	lea    -0x4(%eax),%edx
  101de9:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101dee:	89 02                	mov    %eax,(%edx)
        }
        break;
  101df0:	e9 b7 00 00 00       	jmp    101eac <trap_dispatch+0x269>
  101df5:	e9 b2 00 00 00       	jmp    101eac <trap_dispatch+0x269>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101dfa:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfd:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e01:	66 83 f8 08          	cmp    $0x8,%ax
  101e05:	74 6a                	je     101e71 <trap_dispatch+0x22e>
            tf->tf_cs = KERNEL_CS;
  101e07:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0a:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101e10:	8b 45 08             	mov    0x8(%ebp),%eax
  101e13:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e19:	8b 45 08             	mov    0x8(%ebp),%eax
  101e1c:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e20:	8b 45 08             	mov    0x8(%ebp),%eax
  101e23:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101e27:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2a:	8b 40 40             	mov    0x40(%eax),%eax
  101e2d:	80 e4 cf             	and    $0xcf,%ah
  101e30:	89 c2                	mov    %eax,%edx
  101e32:	8b 45 08             	mov    0x8(%ebp),%eax
  101e35:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101e38:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3b:	8b 40 44             	mov    0x44(%eax),%eax
  101e3e:	83 e8 44             	sub    $0x44,%eax
  101e41:	a3 6c f9 10 00       	mov    %eax,0x10f96c
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101e46:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e4b:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101e52:	00 
  101e53:	8b 55 08             	mov    0x8(%ebp),%edx
  101e56:	89 54 24 04          	mov    %edx,0x4(%esp)
  101e5a:	89 04 24             	mov    %eax,(%esp)
  101e5d:	e8 a4 0f 00 00       	call   102e06 <memmove>
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101e62:	8b 45 08             	mov    0x8(%ebp),%eax
  101e65:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e68:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e6d:	89 02                	mov    %eax,(%edx)
        }
        break;
  101e6f:	eb 3b                	jmp    101eac <trap_dispatch+0x269>
  101e71:	eb 39                	jmp    101eac <trap_dispatch+0x269>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e73:	8b 45 08             	mov    0x8(%ebp),%eax
  101e76:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e7a:	0f b7 c0             	movzwl %ax,%eax
  101e7d:	83 e0 03             	and    $0x3,%eax
  101e80:	85 c0                	test   %eax,%eax
  101e82:	75 28                	jne    101eac <trap_dispatch+0x269>
            print_trapframe(tf);
  101e84:	8b 45 08             	mov    0x8(%ebp),%eax
  101e87:	89 04 24             	mov    %eax,(%esp)
  101e8a:	e8 38 fb ff ff       	call   1019c7 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e8f:	c7 44 24 08 15 3b 10 	movl   $0x103b15,0x8(%esp)
  101e96:	00 
  101e97:	c7 44 24 04 d2 00 00 	movl   $0xd2,0x4(%esp)
  101e9e:	00 
  101e9f:	c7 04 24 31 3b 10 00 	movl   $0x103b31,(%esp)
  101ea6:	e8 18 e5 ff ff       	call   1003c3 <__panic>
        break;
  101eab:	90                   	nop
        }
    }
}
  101eac:	83 c4 2c             	add    $0x2c,%esp
  101eaf:	5b                   	pop    %ebx
  101eb0:	5e                   	pop    %esi
  101eb1:	5f                   	pop    %edi
  101eb2:	5d                   	pop    %ebp
  101eb3:	c3                   	ret    

00101eb4 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101eb4:	55                   	push   %ebp
  101eb5:	89 e5                	mov    %esp,%ebp
  101eb7:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101eba:	8b 45 08             	mov    0x8(%ebp),%eax
  101ebd:	89 04 24             	mov    %eax,(%esp)
  101ec0:	e8 7e fd ff ff       	call   101c43 <trap_dispatch>
}
  101ec5:	c9                   	leave  
  101ec6:	c3                   	ret    

00101ec7 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ec7:	6a 00                	push   $0x0
  pushl $0
  101ec9:	6a 00                	push   $0x0
  jmp __alltraps
  101ecb:	e9 67 0a 00 00       	jmp    102937 <__alltraps>

00101ed0 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ed0:	6a 00                	push   $0x0
  pushl $1
  101ed2:	6a 01                	push   $0x1
  jmp __alltraps
  101ed4:	e9 5e 0a 00 00       	jmp    102937 <__alltraps>

00101ed9 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ed9:	6a 00                	push   $0x0
  pushl $2
  101edb:	6a 02                	push   $0x2
  jmp __alltraps
  101edd:	e9 55 0a 00 00       	jmp    102937 <__alltraps>

00101ee2 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ee2:	6a 00                	push   $0x0
  pushl $3
  101ee4:	6a 03                	push   $0x3
  jmp __alltraps
  101ee6:	e9 4c 0a 00 00       	jmp    102937 <__alltraps>

00101eeb <vector4>:
.globl vector4
vector4:
  pushl $0
  101eeb:	6a 00                	push   $0x0
  pushl $4
  101eed:	6a 04                	push   $0x4
  jmp __alltraps
  101eef:	e9 43 0a 00 00       	jmp    102937 <__alltraps>

00101ef4 <vector5>:
.globl vector5
vector5:
  pushl $0
  101ef4:	6a 00                	push   $0x0
  pushl $5
  101ef6:	6a 05                	push   $0x5
  jmp __alltraps
  101ef8:	e9 3a 0a 00 00       	jmp    102937 <__alltraps>

00101efd <vector6>:
.globl vector6
vector6:
  pushl $0
  101efd:	6a 00                	push   $0x0
  pushl $6
  101eff:	6a 06                	push   $0x6
  jmp __alltraps
  101f01:	e9 31 0a 00 00       	jmp    102937 <__alltraps>

00101f06 <vector7>:
.globl vector7
vector7:
  pushl $0
  101f06:	6a 00                	push   $0x0
  pushl $7
  101f08:	6a 07                	push   $0x7
  jmp __alltraps
  101f0a:	e9 28 0a 00 00       	jmp    102937 <__alltraps>

00101f0f <vector8>:
.globl vector8
vector8:
  pushl $8
  101f0f:	6a 08                	push   $0x8
  jmp __alltraps
  101f11:	e9 21 0a 00 00       	jmp    102937 <__alltraps>

00101f16 <vector9>:
.globl vector9
vector9:
  pushl $9
  101f16:	6a 09                	push   $0x9
  jmp __alltraps
  101f18:	e9 1a 0a 00 00       	jmp    102937 <__alltraps>

00101f1d <vector10>:
.globl vector10
vector10:
  pushl $10
  101f1d:	6a 0a                	push   $0xa
  jmp __alltraps
  101f1f:	e9 13 0a 00 00       	jmp    102937 <__alltraps>

00101f24 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f24:	6a 0b                	push   $0xb
  jmp __alltraps
  101f26:	e9 0c 0a 00 00       	jmp    102937 <__alltraps>

00101f2b <vector12>:
.globl vector12
vector12:
  pushl $12
  101f2b:	6a 0c                	push   $0xc
  jmp __alltraps
  101f2d:	e9 05 0a 00 00       	jmp    102937 <__alltraps>

00101f32 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f32:	6a 0d                	push   $0xd
  jmp __alltraps
  101f34:	e9 fe 09 00 00       	jmp    102937 <__alltraps>

00101f39 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f39:	6a 0e                	push   $0xe
  jmp __alltraps
  101f3b:	e9 f7 09 00 00       	jmp    102937 <__alltraps>

00101f40 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f40:	6a 00                	push   $0x0
  pushl $15
  101f42:	6a 0f                	push   $0xf
  jmp __alltraps
  101f44:	e9 ee 09 00 00       	jmp    102937 <__alltraps>

00101f49 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f49:	6a 00                	push   $0x0
  pushl $16
  101f4b:	6a 10                	push   $0x10
  jmp __alltraps
  101f4d:	e9 e5 09 00 00       	jmp    102937 <__alltraps>

00101f52 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f52:	6a 11                	push   $0x11
  jmp __alltraps
  101f54:	e9 de 09 00 00       	jmp    102937 <__alltraps>

00101f59 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $18
  101f5b:	6a 12                	push   $0x12
  jmp __alltraps
  101f5d:	e9 d5 09 00 00       	jmp    102937 <__alltraps>

00101f62 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $19
  101f64:	6a 13                	push   $0x13
  jmp __alltraps
  101f66:	e9 cc 09 00 00       	jmp    102937 <__alltraps>

00101f6b <vector20>:
.globl vector20
vector20:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $20
  101f6d:	6a 14                	push   $0x14
  jmp __alltraps
  101f6f:	e9 c3 09 00 00       	jmp    102937 <__alltraps>

00101f74 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $21
  101f76:	6a 15                	push   $0x15
  jmp __alltraps
  101f78:	e9 ba 09 00 00       	jmp    102937 <__alltraps>

00101f7d <vector22>:
.globl vector22
vector22:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $22
  101f7f:	6a 16                	push   $0x16
  jmp __alltraps
  101f81:	e9 b1 09 00 00       	jmp    102937 <__alltraps>

00101f86 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $23
  101f88:	6a 17                	push   $0x17
  jmp __alltraps
  101f8a:	e9 a8 09 00 00       	jmp    102937 <__alltraps>

00101f8f <vector24>:
.globl vector24
vector24:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $24
  101f91:	6a 18                	push   $0x18
  jmp __alltraps
  101f93:	e9 9f 09 00 00       	jmp    102937 <__alltraps>

00101f98 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $25
  101f9a:	6a 19                	push   $0x19
  jmp __alltraps
  101f9c:	e9 96 09 00 00       	jmp    102937 <__alltraps>

00101fa1 <vector26>:
.globl vector26
vector26:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $26
  101fa3:	6a 1a                	push   $0x1a
  jmp __alltraps
  101fa5:	e9 8d 09 00 00       	jmp    102937 <__alltraps>

00101faa <vector27>:
.globl vector27
vector27:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $27
  101fac:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fae:	e9 84 09 00 00       	jmp    102937 <__alltraps>

00101fb3 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $28
  101fb5:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fb7:	e9 7b 09 00 00       	jmp    102937 <__alltraps>

00101fbc <vector29>:
.globl vector29
vector29:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $29
  101fbe:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fc0:	e9 72 09 00 00       	jmp    102937 <__alltraps>

00101fc5 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $30
  101fc7:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fc9:	e9 69 09 00 00       	jmp    102937 <__alltraps>

00101fce <vector31>:
.globl vector31
vector31:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $31
  101fd0:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fd2:	e9 60 09 00 00       	jmp    102937 <__alltraps>

00101fd7 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $32
  101fd9:	6a 20                	push   $0x20
  jmp __alltraps
  101fdb:	e9 57 09 00 00       	jmp    102937 <__alltraps>

00101fe0 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $33
  101fe2:	6a 21                	push   $0x21
  jmp __alltraps
  101fe4:	e9 4e 09 00 00       	jmp    102937 <__alltraps>

00101fe9 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $34
  101feb:	6a 22                	push   $0x22
  jmp __alltraps
  101fed:	e9 45 09 00 00       	jmp    102937 <__alltraps>

00101ff2 <vector35>:
.globl vector35
vector35:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $35
  101ff4:	6a 23                	push   $0x23
  jmp __alltraps
  101ff6:	e9 3c 09 00 00       	jmp    102937 <__alltraps>

00101ffb <vector36>:
.globl vector36
vector36:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $36
  101ffd:	6a 24                	push   $0x24
  jmp __alltraps
  101fff:	e9 33 09 00 00       	jmp    102937 <__alltraps>

00102004 <vector37>:
.globl vector37
vector37:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $37
  102006:	6a 25                	push   $0x25
  jmp __alltraps
  102008:	e9 2a 09 00 00       	jmp    102937 <__alltraps>

0010200d <vector38>:
.globl vector38
vector38:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $38
  10200f:	6a 26                	push   $0x26
  jmp __alltraps
  102011:	e9 21 09 00 00       	jmp    102937 <__alltraps>

00102016 <vector39>:
.globl vector39
vector39:
  pushl $0
  102016:	6a 00                	push   $0x0
  pushl $39
  102018:	6a 27                	push   $0x27
  jmp __alltraps
  10201a:	e9 18 09 00 00       	jmp    102937 <__alltraps>

0010201f <vector40>:
.globl vector40
vector40:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $40
  102021:	6a 28                	push   $0x28
  jmp __alltraps
  102023:	e9 0f 09 00 00       	jmp    102937 <__alltraps>

00102028 <vector41>:
.globl vector41
vector41:
  pushl $0
  102028:	6a 00                	push   $0x0
  pushl $41
  10202a:	6a 29                	push   $0x29
  jmp __alltraps
  10202c:	e9 06 09 00 00       	jmp    102937 <__alltraps>

00102031 <vector42>:
.globl vector42
vector42:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $42
  102033:	6a 2a                	push   $0x2a
  jmp __alltraps
  102035:	e9 fd 08 00 00       	jmp    102937 <__alltraps>

0010203a <vector43>:
.globl vector43
vector43:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $43
  10203c:	6a 2b                	push   $0x2b
  jmp __alltraps
  10203e:	e9 f4 08 00 00       	jmp    102937 <__alltraps>

00102043 <vector44>:
.globl vector44
vector44:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $44
  102045:	6a 2c                	push   $0x2c
  jmp __alltraps
  102047:	e9 eb 08 00 00       	jmp    102937 <__alltraps>

0010204c <vector45>:
.globl vector45
vector45:
  pushl $0
  10204c:	6a 00                	push   $0x0
  pushl $45
  10204e:	6a 2d                	push   $0x2d
  jmp __alltraps
  102050:	e9 e2 08 00 00       	jmp    102937 <__alltraps>

00102055 <vector46>:
.globl vector46
vector46:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $46
  102057:	6a 2e                	push   $0x2e
  jmp __alltraps
  102059:	e9 d9 08 00 00       	jmp    102937 <__alltraps>

0010205e <vector47>:
.globl vector47
vector47:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $47
  102060:	6a 2f                	push   $0x2f
  jmp __alltraps
  102062:	e9 d0 08 00 00       	jmp    102937 <__alltraps>

00102067 <vector48>:
.globl vector48
vector48:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $48
  102069:	6a 30                	push   $0x30
  jmp __alltraps
  10206b:	e9 c7 08 00 00       	jmp    102937 <__alltraps>

00102070 <vector49>:
.globl vector49
vector49:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $49
  102072:	6a 31                	push   $0x31
  jmp __alltraps
  102074:	e9 be 08 00 00       	jmp    102937 <__alltraps>

00102079 <vector50>:
.globl vector50
vector50:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $50
  10207b:	6a 32                	push   $0x32
  jmp __alltraps
  10207d:	e9 b5 08 00 00       	jmp    102937 <__alltraps>

00102082 <vector51>:
.globl vector51
vector51:
  pushl $0
  102082:	6a 00                	push   $0x0
  pushl $51
  102084:	6a 33                	push   $0x33
  jmp __alltraps
  102086:	e9 ac 08 00 00       	jmp    102937 <__alltraps>

0010208b <vector52>:
.globl vector52
vector52:
  pushl $0
  10208b:	6a 00                	push   $0x0
  pushl $52
  10208d:	6a 34                	push   $0x34
  jmp __alltraps
  10208f:	e9 a3 08 00 00       	jmp    102937 <__alltraps>

00102094 <vector53>:
.globl vector53
vector53:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $53
  102096:	6a 35                	push   $0x35
  jmp __alltraps
  102098:	e9 9a 08 00 00       	jmp    102937 <__alltraps>

0010209d <vector54>:
.globl vector54
vector54:
  pushl $0
  10209d:	6a 00                	push   $0x0
  pushl $54
  10209f:	6a 36                	push   $0x36
  jmp __alltraps
  1020a1:	e9 91 08 00 00       	jmp    102937 <__alltraps>

001020a6 <vector55>:
.globl vector55
vector55:
  pushl $0
  1020a6:	6a 00                	push   $0x0
  pushl $55
  1020a8:	6a 37                	push   $0x37
  jmp __alltraps
  1020aa:	e9 88 08 00 00       	jmp    102937 <__alltraps>

001020af <vector56>:
.globl vector56
vector56:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $56
  1020b1:	6a 38                	push   $0x38
  jmp __alltraps
  1020b3:	e9 7f 08 00 00       	jmp    102937 <__alltraps>

001020b8 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $57
  1020ba:	6a 39                	push   $0x39
  jmp __alltraps
  1020bc:	e9 76 08 00 00       	jmp    102937 <__alltraps>

001020c1 <vector58>:
.globl vector58
vector58:
  pushl $0
  1020c1:	6a 00                	push   $0x0
  pushl $58
  1020c3:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020c5:	e9 6d 08 00 00       	jmp    102937 <__alltraps>

001020ca <vector59>:
.globl vector59
vector59:
  pushl $0
  1020ca:	6a 00                	push   $0x0
  pushl $59
  1020cc:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020ce:	e9 64 08 00 00       	jmp    102937 <__alltraps>

001020d3 <vector60>:
.globl vector60
vector60:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $60
  1020d5:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020d7:	e9 5b 08 00 00       	jmp    102937 <__alltraps>

001020dc <vector61>:
.globl vector61
vector61:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $61
  1020de:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020e0:	e9 52 08 00 00       	jmp    102937 <__alltraps>

001020e5 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020e5:	6a 00                	push   $0x0
  pushl $62
  1020e7:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020e9:	e9 49 08 00 00       	jmp    102937 <__alltraps>

001020ee <vector63>:
.globl vector63
vector63:
  pushl $0
  1020ee:	6a 00                	push   $0x0
  pushl $63
  1020f0:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020f2:	e9 40 08 00 00       	jmp    102937 <__alltraps>

001020f7 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $64
  1020f9:	6a 40                	push   $0x40
  jmp __alltraps
  1020fb:	e9 37 08 00 00       	jmp    102937 <__alltraps>

00102100 <vector65>:
.globl vector65
vector65:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $65
  102102:	6a 41                	push   $0x41
  jmp __alltraps
  102104:	e9 2e 08 00 00       	jmp    102937 <__alltraps>

00102109 <vector66>:
.globl vector66
vector66:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $66
  10210b:	6a 42                	push   $0x42
  jmp __alltraps
  10210d:	e9 25 08 00 00       	jmp    102937 <__alltraps>

00102112 <vector67>:
.globl vector67
vector67:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $67
  102114:	6a 43                	push   $0x43
  jmp __alltraps
  102116:	e9 1c 08 00 00       	jmp    102937 <__alltraps>

0010211b <vector68>:
.globl vector68
vector68:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $68
  10211d:	6a 44                	push   $0x44
  jmp __alltraps
  10211f:	e9 13 08 00 00       	jmp    102937 <__alltraps>

00102124 <vector69>:
.globl vector69
vector69:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $69
  102126:	6a 45                	push   $0x45
  jmp __alltraps
  102128:	e9 0a 08 00 00       	jmp    102937 <__alltraps>

0010212d <vector70>:
.globl vector70
vector70:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $70
  10212f:	6a 46                	push   $0x46
  jmp __alltraps
  102131:	e9 01 08 00 00       	jmp    102937 <__alltraps>

00102136 <vector71>:
.globl vector71
vector71:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $71
  102138:	6a 47                	push   $0x47
  jmp __alltraps
  10213a:	e9 f8 07 00 00       	jmp    102937 <__alltraps>

0010213f <vector72>:
.globl vector72
vector72:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $72
  102141:	6a 48                	push   $0x48
  jmp __alltraps
  102143:	e9 ef 07 00 00       	jmp    102937 <__alltraps>

00102148 <vector73>:
.globl vector73
vector73:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $73
  10214a:	6a 49                	push   $0x49
  jmp __alltraps
  10214c:	e9 e6 07 00 00       	jmp    102937 <__alltraps>

00102151 <vector74>:
.globl vector74
vector74:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $74
  102153:	6a 4a                	push   $0x4a
  jmp __alltraps
  102155:	e9 dd 07 00 00       	jmp    102937 <__alltraps>

0010215a <vector75>:
.globl vector75
vector75:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $75
  10215c:	6a 4b                	push   $0x4b
  jmp __alltraps
  10215e:	e9 d4 07 00 00       	jmp    102937 <__alltraps>

00102163 <vector76>:
.globl vector76
vector76:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $76
  102165:	6a 4c                	push   $0x4c
  jmp __alltraps
  102167:	e9 cb 07 00 00       	jmp    102937 <__alltraps>

0010216c <vector77>:
.globl vector77
vector77:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $77
  10216e:	6a 4d                	push   $0x4d
  jmp __alltraps
  102170:	e9 c2 07 00 00       	jmp    102937 <__alltraps>

00102175 <vector78>:
.globl vector78
vector78:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $78
  102177:	6a 4e                	push   $0x4e
  jmp __alltraps
  102179:	e9 b9 07 00 00       	jmp    102937 <__alltraps>

0010217e <vector79>:
.globl vector79
vector79:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $79
  102180:	6a 4f                	push   $0x4f
  jmp __alltraps
  102182:	e9 b0 07 00 00       	jmp    102937 <__alltraps>

00102187 <vector80>:
.globl vector80
vector80:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $80
  102189:	6a 50                	push   $0x50
  jmp __alltraps
  10218b:	e9 a7 07 00 00       	jmp    102937 <__alltraps>

00102190 <vector81>:
.globl vector81
vector81:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $81
  102192:	6a 51                	push   $0x51
  jmp __alltraps
  102194:	e9 9e 07 00 00       	jmp    102937 <__alltraps>

00102199 <vector82>:
.globl vector82
vector82:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $82
  10219b:	6a 52                	push   $0x52
  jmp __alltraps
  10219d:	e9 95 07 00 00       	jmp    102937 <__alltraps>

001021a2 <vector83>:
.globl vector83
vector83:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $83
  1021a4:	6a 53                	push   $0x53
  jmp __alltraps
  1021a6:	e9 8c 07 00 00       	jmp    102937 <__alltraps>

001021ab <vector84>:
.globl vector84
vector84:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $84
  1021ad:	6a 54                	push   $0x54
  jmp __alltraps
  1021af:	e9 83 07 00 00       	jmp    102937 <__alltraps>

001021b4 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $85
  1021b6:	6a 55                	push   $0x55
  jmp __alltraps
  1021b8:	e9 7a 07 00 00       	jmp    102937 <__alltraps>

001021bd <vector86>:
.globl vector86
vector86:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $86
  1021bf:	6a 56                	push   $0x56
  jmp __alltraps
  1021c1:	e9 71 07 00 00       	jmp    102937 <__alltraps>

001021c6 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $87
  1021c8:	6a 57                	push   $0x57
  jmp __alltraps
  1021ca:	e9 68 07 00 00       	jmp    102937 <__alltraps>

001021cf <vector88>:
.globl vector88
vector88:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $88
  1021d1:	6a 58                	push   $0x58
  jmp __alltraps
  1021d3:	e9 5f 07 00 00       	jmp    102937 <__alltraps>

001021d8 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $89
  1021da:	6a 59                	push   $0x59
  jmp __alltraps
  1021dc:	e9 56 07 00 00       	jmp    102937 <__alltraps>

001021e1 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $90
  1021e3:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021e5:	e9 4d 07 00 00       	jmp    102937 <__alltraps>

001021ea <vector91>:
.globl vector91
vector91:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $91
  1021ec:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021ee:	e9 44 07 00 00       	jmp    102937 <__alltraps>

001021f3 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $92
  1021f5:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021f7:	e9 3b 07 00 00       	jmp    102937 <__alltraps>

001021fc <vector93>:
.globl vector93
vector93:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $93
  1021fe:	6a 5d                	push   $0x5d
  jmp __alltraps
  102200:	e9 32 07 00 00       	jmp    102937 <__alltraps>

00102205 <vector94>:
.globl vector94
vector94:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $94
  102207:	6a 5e                	push   $0x5e
  jmp __alltraps
  102209:	e9 29 07 00 00       	jmp    102937 <__alltraps>

0010220e <vector95>:
.globl vector95
vector95:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $95
  102210:	6a 5f                	push   $0x5f
  jmp __alltraps
  102212:	e9 20 07 00 00       	jmp    102937 <__alltraps>

00102217 <vector96>:
.globl vector96
vector96:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $96
  102219:	6a 60                	push   $0x60
  jmp __alltraps
  10221b:	e9 17 07 00 00       	jmp    102937 <__alltraps>

00102220 <vector97>:
.globl vector97
vector97:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $97
  102222:	6a 61                	push   $0x61
  jmp __alltraps
  102224:	e9 0e 07 00 00       	jmp    102937 <__alltraps>

00102229 <vector98>:
.globl vector98
vector98:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $98
  10222b:	6a 62                	push   $0x62
  jmp __alltraps
  10222d:	e9 05 07 00 00       	jmp    102937 <__alltraps>

00102232 <vector99>:
.globl vector99
vector99:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $99
  102234:	6a 63                	push   $0x63
  jmp __alltraps
  102236:	e9 fc 06 00 00       	jmp    102937 <__alltraps>

0010223b <vector100>:
.globl vector100
vector100:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $100
  10223d:	6a 64                	push   $0x64
  jmp __alltraps
  10223f:	e9 f3 06 00 00       	jmp    102937 <__alltraps>

00102244 <vector101>:
.globl vector101
vector101:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $101
  102246:	6a 65                	push   $0x65
  jmp __alltraps
  102248:	e9 ea 06 00 00       	jmp    102937 <__alltraps>

0010224d <vector102>:
.globl vector102
vector102:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $102
  10224f:	6a 66                	push   $0x66
  jmp __alltraps
  102251:	e9 e1 06 00 00       	jmp    102937 <__alltraps>

00102256 <vector103>:
.globl vector103
vector103:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $103
  102258:	6a 67                	push   $0x67
  jmp __alltraps
  10225a:	e9 d8 06 00 00       	jmp    102937 <__alltraps>

0010225f <vector104>:
.globl vector104
vector104:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $104
  102261:	6a 68                	push   $0x68
  jmp __alltraps
  102263:	e9 cf 06 00 00       	jmp    102937 <__alltraps>

00102268 <vector105>:
.globl vector105
vector105:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $105
  10226a:	6a 69                	push   $0x69
  jmp __alltraps
  10226c:	e9 c6 06 00 00       	jmp    102937 <__alltraps>

00102271 <vector106>:
.globl vector106
vector106:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $106
  102273:	6a 6a                	push   $0x6a
  jmp __alltraps
  102275:	e9 bd 06 00 00       	jmp    102937 <__alltraps>

0010227a <vector107>:
.globl vector107
vector107:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $107
  10227c:	6a 6b                	push   $0x6b
  jmp __alltraps
  10227e:	e9 b4 06 00 00       	jmp    102937 <__alltraps>

00102283 <vector108>:
.globl vector108
vector108:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $108
  102285:	6a 6c                	push   $0x6c
  jmp __alltraps
  102287:	e9 ab 06 00 00       	jmp    102937 <__alltraps>

0010228c <vector109>:
.globl vector109
vector109:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $109
  10228e:	6a 6d                	push   $0x6d
  jmp __alltraps
  102290:	e9 a2 06 00 00       	jmp    102937 <__alltraps>

00102295 <vector110>:
.globl vector110
vector110:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $110
  102297:	6a 6e                	push   $0x6e
  jmp __alltraps
  102299:	e9 99 06 00 00       	jmp    102937 <__alltraps>

0010229e <vector111>:
.globl vector111
vector111:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $111
  1022a0:	6a 6f                	push   $0x6f
  jmp __alltraps
  1022a2:	e9 90 06 00 00       	jmp    102937 <__alltraps>

001022a7 <vector112>:
.globl vector112
vector112:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $112
  1022a9:	6a 70                	push   $0x70
  jmp __alltraps
  1022ab:	e9 87 06 00 00       	jmp    102937 <__alltraps>

001022b0 <vector113>:
.globl vector113
vector113:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $113
  1022b2:	6a 71                	push   $0x71
  jmp __alltraps
  1022b4:	e9 7e 06 00 00       	jmp    102937 <__alltraps>

001022b9 <vector114>:
.globl vector114
vector114:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $114
  1022bb:	6a 72                	push   $0x72
  jmp __alltraps
  1022bd:	e9 75 06 00 00       	jmp    102937 <__alltraps>

001022c2 <vector115>:
.globl vector115
vector115:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $115
  1022c4:	6a 73                	push   $0x73
  jmp __alltraps
  1022c6:	e9 6c 06 00 00       	jmp    102937 <__alltraps>

001022cb <vector116>:
.globl vector116
vector116:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $116
  1022cd:	6a 74                	push   $0x74
  jmp __alltraps
  1022cf:	e9 63 06 00 00       	jmp    102937 <__alltraps>

001022d4 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $117
  1022d6:	6a 75                	push   $0x75
  jmp __alltraps
  1022d8:	e9 5a 06 00 00       	jmp    102937 <__alltraps>

001022dd <vector118>:
.globl vector118
vector118:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $118
  1022df:	6a 76                	push   $0x76
  jmp __alltraps
  1022e1:	e9 51 06 00 00       	jmp    102937 <__alltraps>

001022e6 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $119
  1022e8:	6a 77                	push   $0x77
  jmp __alltraps
  1022ea:	e9 48 06 00 00       	jmp    102937 <__alltraps>

001022ef <vector120>:
.globl vector120
vector120:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $120
  1022f1:	6a 78                	push   $0x78
  jmp __alltraps
  1022f3:	e9 3f 06 00 00       	jmp    102937 <__alltraps>

001022f8 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $121
  1022fa:	6a 79                	push   $0x79
  jmp __alltraps
  1022fc:	e9 36 06 00 00       	jmp    102937 <__alltraps>

00102301 <vector122>:
.globl vector122
vector122:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $122
  102303:	6a 7a                	push   $0x7a
  jmp __alltraps
  102305:	e9 2d 06 00 00       	jmp    102937 <__alltraps>

0010230a <vector123>:
.globl vector123
vector123:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $123
  10230c:	6a 7b                	push   $0x7b
  jmp __alltraps
  10230e:	e9 24 06 00 00       	jmp    102937 <__alltraps>

00102313 <vector124>:
.globl vector124
vector124:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $124
  102315:	6a 7c                	push   $0x7c
  jmp __alltraps
  102317:	e9 1b 06 00 00       	jmp    102937 <__alltraps>

0010231c <vector125>:
.globl vector125
vector125:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $125
  10231e:	6a 7d                	push   $0x7d
  jmp __alltraps
  102320:	e9 12 06 00 00       	jmp    102937 <__alltraps>

00102325 <vector126>:
.globl vector126
vector126:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $126
  102327:	6a 7e                	push   $0x7e
  jmp __alltraps
  102329:	e9 09 06 00 00       	jmp    102937 <__alltraps>

0010232e <vector127>:
.globl vector127
vector127:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $127
  102330:	6a 7f                	push   $0x7f
  jmp __alltraps
  102332:	e9 00 06 00 00       	jmp    102937 <__alltraps>

00102337 <vector128>:
.globl vector128
vector128:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $128
  102339:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10233e:	e9 f4 05 00 00       	jmp    102937 <__alltraps>

00102343 <vector129>:
.globl vector129
vector129:
  pushl $0
  102343:	6a 00                	push   $0x0
  pushl $129
  102345:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10234a:	e9 e8 05 00 00       	jmp    102937 <__alltraps>

0010234f <vector130>:
.globl vector130
vector130:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $130
  102351:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102356:	e9 dc 05 00 00       	jmp    102937 <__alltraps>

0010235b <vector131>:
.globl vector131
vector131:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $131
  10235d:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102362:	e9 d0 05 00 00       	jmp    102937 <__alltraps>

00102367 <vector132>:
.globl vector132
vector132:
  pushl $0
  102367:	6a 00                	push   $0x0
  pushl $132
  102369:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10236e:	e9 c4 05 00 00       	jmp    102937 <__alltraps>

00102373 <vector133>:
.globl vector133
vector133:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $133
  102375:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10237a:	e9 b8 05 00 00       	jmp    102937 <__alltraps>

0010237f <vector134>:
.globl vector134
vector134:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $134
  102381:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102386:	e9 ac 05 00 00       	jmp    102937 <__alltraps>

0010238b <vector135>:
.globl vector135
vector135:
  pushl $0
  10238b:	6a 00                	push   $0x0
  pushl $135
  10238d:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102392:	e9 a0 05 00 00       	jmp    102937 <__alltraps>

00102397 <vector136>:
.globl vector136
vector136:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $136
  102399:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10239e:	e9 94 05 00 00       	jmp    102937 <__alltraps>

001023a3 <vector137>:
.globl vector137
vector137:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $137
  1023a5:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023aa:	e9 88 05 00 00       	jmp    102937 <__alltraps>

001023af <vector138>:
.globl vector138
vector138:
  pushl $0
  1023af:	6a 00                	push   $0x0
  pushl $138
  1023b1:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023b6:	e9 7c 05 00 00       	jmp    102937 <__alltraps>

001023bb <vector139>:
.globl vector139
vector139:
  pushl $0
  1023bb:	6a 00                	push   $0x0
  pushl $139
  1023bd:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023c2:	e9 70 05 00 00       	jmp    102937 <__alltraps>

001023c7 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $140
  1023c9:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023ce:	e9 64 05 00 00       	jmp    102937 <__alltraps>

001023d3 <vector141>:
.globl vector141
vector141:
  pushl $0
  1023d3:	6a 00                	push   $0x0
  pushl $141
  1023d5:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023da:	e9 58 05 00 00       	jmp    102937 <__alltraps>

001023df <vector142>:
.globl vector142
vector142:
  pushl $0
  1023df:	6a 00                	push   $0x0
  pushl $142
  1023e1:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023e6:	e9 4c 05 00 00       	jmp    102937 <__alltraps>

001023eb <vector143>:
.globl vector143
vector143:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $143
  1023ed:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023f2:	e9 40 05 00 00       	jmp    102937 <__alltraps>

001023f7 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023f7:	6a 00                	push   $0x0
  pushl $144
  1023f9:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023fe:	e9 34 05 00 00       	jmp    102937 <__alltraps>

00102403 <vector145>:
.globl vector145
vector145:
  pushl $0
  102403:	6a 00                	push   $0x0
  pushl $145
  102405:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10240a:	e9 28 05 00 00       	jmp    102937 <__alltraps>

0010240f <vector146>:
.globl vector146
vector146:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $146
  102411:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102416:	e9 1c 05 00 00       	jmp    102937 <__alltraps>

0010241b <vector147>:
.globl vector147
vector147:
  pushl $0
  10241b:	6a 00                	push   $0x0
  pushl $147
  10241d:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102422:	e9 10 05 00 00       	jmp    102937 <__alltraps>

00102427 <vector148>:
.globl vector148
vector148:
  pushl $0
  102427:	6a 00                	push   $0x0
  pushl $148
  102429:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10242e:	e9 04 05 00 00       	jmp    102937 <__alltraps>

00102433 <vector149>:
.globl vector149
vector149:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $149
  102435:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10243a:	e9 f8 04 00 00       	jmp    102937 <__alltraps>

0010243f <vector150>:
.globl vector150
vector150:
  pushl $0
  10243f:	6a 00                	push   $0x0
  pushl $150
  102441:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102446:	e9 ec 04 00 00       	jmp    102937 <__alltraps>

0010244b <vector151>:
.globl vector151
vector151:
  pushl $0
  10244b:	6a 00                	push   $0x0
  pushl $151
  10244d:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102452:	e9 e0 04 00 00       	jmp    102937 <__alltraps>

00102457 <vector152>:
.globl vector152
vector152:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $152
  102459:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10245e:	e9 d4 04 00 00       	jmp    102937 <__alltraps>

00102463 <vector153>:
.globl vector153
vector153:
  pushl $0
  102463:	6a 00                	push   $0x0
  pushl $153
  102465:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10246a:	e9 c8 04 00 00       	jmp    102937 <__alltraps>

0010246f <vector154>:
.globl vector154
vector154:
  pushl $0
  10246f:	6a 00                	push   $0x0
  pushl $154
  102471:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102476:	e9 bc 04 00 00       	jmp    102937 <__alltraps>

0010247b <vector155>:
.globl vector155
vector155:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $155
  10247d:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102482:	e9 b0 04 00 00       	jmp    102937 <__alltraps>

00102487 <vector156>:
.globl vector156
vector156:
  pushl $0
  102487:	6a 00                	push   $0x0
  pushl $156
  102489:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10248e:	e9 a4 04 00 00       	jmp    102937 <__alltraps>

00102493 <vector157>:
.globl vector157
vector157:
  pushl $0
  102493:	6a 00                	push   $0x0
  pushl $157
  102495:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10249a:	e9 98 04 00 00       	jmp    102937 <__alltraps>

0010249f <vector158>:
.globl vector158
vector158:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $158
  1024a1:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024a6:	e9 8c 04 00 00       	jmp    102937 <__alltraps>

001024ab <vector159>:
.globl vector159
vector159:
  pushl $0
  1024ab:	6a 00                	push   $0x0
  pushl $159
  1024ad:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024b2:	e9 80 04 00 00       	jmp    102937 <__alltraps>

001024b7 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024b7:	6a 00                	push   $0x0
  pushl $160
  1024b9:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024be:	e9 74 04 00 00       	jmp    102937 <__alltraps>

001024c3 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $161
  1024c5:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024ca:	e9 68 04 00 00       	jmp    102937 <__alltraps>

001024cf <vector162>:
.globl vector162
vector162:
  pushl $0
  1024cf:	6a 00                	push   $0x0
  pushl $162
  1024d1:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024d6:	e9 5c 04 00 00       	jmp    102937 <__alltraps>

001024db <vector163>:
.globl vector163
vector163:
  pushl $0
  1024db:	6a 00                	push   $0x0
  pushl $163
  1024dd:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024e2:	e9 50 04 00 00       	jmp    102937 <__alltraps>

001024e7 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $164
  1024e9:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024ee:	e9 44 04 00 00       	jmp    102937 <__alltraps>

001024f3 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024f3:	6a 00                	push   $0x0
  pushl $165
  1024f5:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024fa:	e9 38 04 00 00       	jmp    102937 <__alltraps>

001024ff <vector166>:
.globl vector166
vector166:
  pushl $0
  1024ff:	6a 00                	push   $0x0
  pushl $166
  102501:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102506:	e9 2c 04 00 00       	jmp    102937 <__alltraps>

0010250b <vector167>:
.globl vector167
vector167:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $167
  10250d:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102512:	e9 20 04 00 00       	jmp    102937 <__alltraps>

00102517 <vector168>:
.globl vector168
vector168:
  pushl $0
  102517:	6a 00                	push   $0x0
  pushl $168
  102519:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10251e:	e9 14 04 00 00       	jmp    102937 <__alltraps>

00102523 <vector169>:
.globl vector169
vector169:
  pushl $0
  102523:	6a 00                	push   $0x0
  pushl $169
  102525:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10252a:	e9 08 04 00 00       	jmp    102937 <__alltraps>

0010252f <vector170>:
.globl vector170
vector170:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $170
  102531:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102536:	e9 fc 03 00 00       	jmp    102937 <__alltraps>

0010253b <vector171>:
.globl vector171
vector171:
  pushl $0
  10253b:	6a 00                	push   $0x0
  pushl $171
  10253d:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102542:	e9 f0 03 00 00       	jmp    102937 <__alltraps>

00102547 <vector172>:
.globl vector172
vector172:
  pushl $0
  102547:	6a 00                	push   $0x0
  pushl $172
  102549:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10254e:	e9 e4 03 00 00       	jmp    102937 <__alltraps>

00102553 <vector173>:
.globl vector173
vector173:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $173
  102555:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10255a:	e9 d8 03 00 00       	jmp    102937 <__alltraps>

0010255f <vector174>:
.globl vector174
vector174:
  pushl $0
  10255f:	6a 00                	push   $0x0
  pushl $174
  102561:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102566:	e9 cc 03 00 00       	jmp    102937 <__alltraps>

0010256b <vector175>:
.globl vector175
vector175:
  pushl $0
  10256b:	6a 00                	push   $0x0
  pushl $175
  10256d:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102572:	e9 c0 03 00 00       	jmp    102937 <__alltraps>

00102577 <vector176>:
.globl vector176
vector176:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $176
  102579:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10257e:	e9 b4 03 00 00       	jmp    102937 <__alltraps>

00102583 <vector177>:
.globl vector177
vector177:
  pushl $0
  102583:	6a 00                	push   $0x0
  pushl $177
  102585:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10258a:	e9 a8 03 00 00       	jmp    102937 <__alltraps>

0010258f <vector178>:
.globl vector178
vector178:
  pushl $0
  10258f:	6a 00                	push   $0x0
  pushl $178
  102591:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102596:	e9 9c 03 00 00       	jmp    102937 <__alltraps>

0010259b <vector179>:
.globl vector179
vector179:
  pushl $0
  10259b:	6a 00                	push   $0x0
  pushl $179
  10259d:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1025a2:	e9 90 03 00 00       	jmp    102937 <__alltraps>

001025a7 <vector180>:
.globl vector180
vector180:
  pushl $0
  1025a7:	6a 00                	push   $0x0
  pushl $180
  1025a9:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025ae:	e9 84 03 00 00       	jmp    102937 <__alltraps>

001025b3 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025b3:	6a 00                	push   $0x0
  pushl $181
  1025b5:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025ba:	e9 78 03 00 00       	jmp    102937 <__alltraps>

001025bf <vector182>:
.globl vector182
vector182:
  pushl $0
  1025bf:	6a 00                	push   $0x0
  pushl $182
  1025c1:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025c6:	e9 6c 03 00 00       	jmp    102937 <__alltraps>

001025cb <vector183>:
.globl vector183
vector183:
  pushl $0
  1025cb:	6a 00                	push   $0x0
  pushl $183
  1025cd:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025d2:	e9 60 03 00 00       	jmp    102937 <__alltraps>

001025d7 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025d7:	6a 00                	push   $0x0
  pushl $184
  1025d9:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025de:	e9 54 03 00 00       	jmp    102937 <__alltraps>

001025e3 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025e3:	6a 00                	push   $0x0
  pushl $185
  1025e5:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025ea:	e9 48 03 00 00       	jmp    102937 <__alltraps>

001025ef <vector186>:
.globl vector186
vector186:
  pushl $0
  1025ef:	6a 00                	push   $0x0
  pushl $186
  1025f1:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025f6:	e9 3c 03 00 00       	jmp    102937 <__alltraps>

001025fb <vector187>:
.globl vector187
vector187:
  pushl $0
  1025fb:	6a 00                	push   $0x0
  pushl $187
  1025fd:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102602:	e9 30 03 00 00       	jmp    102937 <__alltraps>

00102607 <vector188>:
.globl vector188
vector188:
  pushl $0
  102607:	6a 00                	push   $0x0
  pushl $188
  102609:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10260e:	e9 24 03 00 00       	jmp    102937 <__alltraps>

00102613 <vector189>:
.globl vector189
vector189:
  pushl $0
  102613:	6a 00                	push   $0x0
  pushl $189
  102615:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10261a:	e9 18 03 00 00       	jmp    102937 <__alltraps>

0010261f <vector190>:
.globl vector190
vector190:
  pushl $0
  10261f:	6a 00                	push   $0x0
  pushl $190
  102621:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102626:	e9 0c 03 00 00       	jmp    102937 <__alltraps>

0010262b <vector191>:
.globl vector191
vector191:
  pushl $0
  10262b:	6a 00                	push   $0x0
  pushl $191
  10262d:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102632:	e9 00 03 00 00       	jmp    102937 <__alltraps>

00102637 <vector192>:
.globl vector192
vector192:
  pushl $0
  102637:	6a 00                	push   $0x0
  pushl $192
  102639:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10263e:	e9 f4 02 00 00       	jmp    102937 <__alltraps>

00102643 <vector193>:
.globl vector193
vector193:
  pushl $0
  102643:	6a 00                	push   $0x0
  pushl $193
  102645:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10264a:	e9 e8 02 00 00       	jmp    102937 <__alltraps>

0010264f <vector194>:
.globl vector194
vector194:
  pushl $0
  10264f:	6a 00                	push   $0x0
  pushl $194
  102651:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102656:	e9 dc 02 00 00       	jmp    102937 <__alltraps>

0010265b <vector195>:
.globl vector195
vector195:
  pushl $0
  10265b:	6a 00                	push   $0x0
  pushl $195
  10265d:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102662:	e9 d0 02 00 00       	jmp    102937 <__alltraps>

00102667 <vector196>:
.globl vector196
vector196:
  pushl $0
  102667:	6a 00                	push   $0x0
  pushl $196
  102669:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10266e:	e9 c4 02 00 00       	jmp    102937 <__alltraps>

00102673 <vector197>:
.globl vector197
vector197:
  pushl $0
  102673:	6a 00                	push   $0x0
  pushl $197
  102675:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10267a:	e9 b8 02 00 00       	jmp    102937 <__alltraps>

0010267f <vector198>:
.globl vector198
vector198:
  pushl $0
  10267f:	6a 00                	push   $0x0
  pushl $198
  102681:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102686:	e9 ac 02 00 00       	jmp    102937 <__alltraps>

0010268b <vector199>:
.globl vector199
vector199:
  pushl $0
  10268b:	6a 00                	push   $0x0
  pushl $199
  10268d:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102692:	e9 a0 02 00 00       	jmp    102937 <__alltraps>

00102697 <vector200>:
.globl vector200
vector200:
  pushl $0
  102697:	6a 00                	push   $0x0
  pushl $200
  102699:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10269e:	e9 94 02 00 00       	jmp    102937 <__alltraps>

001026a3 <vector201>:
.globl vector201
vector201:
  pushl $0
  1026a3:	6a 00                	push   $0x0
  pushl $201
  1026a5:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026aa:	e9 88 02 00 00       	jmp    102937 <__alltraps>

001026af <vector202>:
.globl vector202
vector202:
  pushl $0
  1026af:	6a 00                	push   $0x0
  pushl $202
  1026b1:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026b6:	e9 7c 02 00 00       	jmp    102937 <__alltraps>

001026bb <vector203>:
.globl vector203
vector203:
  pushl $0
  1026bb:	6a 00                	push   $0x0
  pushl $203
  1026bd:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026c2:	e9 70 02 00 00       	jmp    102937 <__alltraps>

001026c7 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026c7:	6a 00                	push   $0x0
  pushl $204
  1026c9:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026ce:	e9 64 02 00 00       	jmp    102937 <__alltraps>

001026d3 <vector205>:
.globl vector205
vector205:
  pushl $0
  1026d3:	6a 00                	push   $0x0
  pushl $205
  1026d5:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026da:	e9 58 02 00 00       	jmp    102937 <__alltraps>

001026df <vector206>:
.globl vector206
vector206:
  pushl $0
  1026df:	6a 00                	push   $0x0
  pushl $206
  1026e1:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026e6:	e9 4c 02 00 00       	jmp    102937 <__alltraps>

001026eb <vector207>:
.globl vector207
vector207:
  pushl $0
  1026eb:	6a 00                	push   $0x0
  pushl $207
  1026ed:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026f2:	e9 40 02 00 00       	jmp    102937 <__alltraps>

001026f7 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026f7:	6a 00                	push   $0x0
  pushl $208
  1026f9:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026fe:	e9 34 02 00 00       	jmp    102937 <__alltraps>

00102703 <vector209>:
.globl vector209
vector209:
  pushl $0
  102703:	6a 00                	push   $0x0
  pushl $209
  102705:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10270a:	e9 28 02 00 00       	jmp    102937 <__alltraps>

0010270f <vector210>:
.globl vector210
vector210:
  pushl $0
  10270f:	6a 00                	push   $0x0
  pushl $210
  102711:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102716:	e9 1c 02 00 00       	jmp    102937 <__alltraps>

0010271b <vector211>:
.globl vector211
vector211:
  pushl $0
  10271b:	6a 00                	push   $0x0
  pushl $211
  10271d:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102722:	e9 10 02 00 00       	jmp    102937 <__alltraps>

00102727 <vector212>:
.globl vector212
vector212:
  pushl $0
  102727:	6a 00                	push   $0x0
  pushl $212
  102729:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10272e:	e9 04 02 00 00       	jmp    102937 <__alltraps>

00102733 <vector213>:
.globl vector213
vector213:
  pushl $0
  102733:	6a 00                	push   $0x0
  pushl $213
  102735:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10273a:	e9 f8 01 00 00       	jmp    102937 <__alltraps>

0010273f <vector214>:
.globl vector214
vector214:
  pushl $0
  10273f:	6a 00                	push   $0x0
  pushl $214
  102741:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102746:	e9 ec 01 00 00       	jmp    102937 <__alltraps>

0010274b <vector215>:
.globl vector215
vector215:
  pushl $0
  10274b:	6a 00                	push   $0x0
  pushl $215
  10274d:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102752:	e9 e0 01 00 00       	jmp    102937 <__alltraps>

00102757 <vector216>:
.globl vector216
vector216:
  pushl $0
  102757:	6a 00                	push   $0x0
  pushl $216
  102759:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10275e:	e9 d4 01 00 00       	jmp    102937 <__alltraps>

00102763 <vector217>:
.globl vector217
vector217:
  pushl $0
  102763:	6a 00                	push   $0x0
  pushl $217
  102765:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10276a:	e9 c8 01 00 00       	jmp    102937 <__alltraps>

0010276f <vector218>:
.globl vector218
vector218:
  pushl $0
  10276f:	6a 00                	push   $0x0
  pushl $218
  102771:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102776:	e9 bc 01 00 00       	jmp    102937 <__alltraps>

0010277b <vector219>:
.globl vector219
vector219:
  pushl $0
  10277b:	6a 00                	push   $0x0
  pushl $219
  10277d:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102782:	e9 b0 01 00 00       	jmp    102937 <__alltraps>

00102787 <vector220>:
.globl vector220
vector220:
  pushl $0
  102787:	6a 00                	push   $0x0
  pushl $220
  102789:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10278e:	e9 a4 01 00 00       	jmp    102937 <__alltraps>

00102793 <vector221>:
.globl vector221
vector221:
  pushl $0
  102793:	6a 00                	push   $0x0
  pushl $221
  102795:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10279a:	e9 98 01 00 00       	jmp    102937 <__alltraps>

0010279f <vector222>:
.globl vector222
vector222:
  pushl $0
  10279f:	6a 00                	push   $0x0
  pushl $222
  1027a1:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027a6:	e9 8c 01 00 00       	jmp    102937 <__alltraps>

001027ab <vector223>:
.globl vector223
vector223:
  pushl $0
  1027ab:	6a 00                	push   $0x0
  pushl $223
  1027ad:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027b2:	e9 80 01 00 00       	jmp    102937 <__alltraps>

001027b7 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027b7:	6a 00                	push   $0x0
  pushl $224
  1027b9:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027be:	e9 74 01 00 00       	jmp    102937 <__alltraps>

001027c3 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027c3:	6a 00                	push   $0x0
  pushl $225
  1027c5:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027ca:	e9 68 01 00 00       	jmp    102937 <__alltraps>

001027cf <vector226>:
.globl vector226
vector226:
  pushl $0
  1027cf:	6a 00                	push   $0x0
  pushl $226
  1027d1:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027d6:	e9 5c 01 00 00       	jmp    102937 <__alltraps>

001027db <vector227>:
.globl vector227
vector227:
  pushl $0
  1027db:	6a 00                	push   $0x0
  pushl $227
  1027dd:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027e2:	e9 50 01 00 00       	jmp    102937 <__alltraps>

001027e7 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027e7:	6a 00                	push   $0x0
  pushl $228
  1027e9:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027ee:	e9 44 01 00 00       	jmp    102937 <__alltraps>

001027f3 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027f3:	6a 00                	push   $0x0
  pushl $229
  1027f5:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027fa:	e9 38 01 00 00       	jmp    102937 <__alltraps>

001027ff <vector230>:
.globl vector230
vector230:
  pushl $0
  1027ff:	6a 00                	push   $0x0
  pushl $230
  102801:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102806:	e9 2c 01 00 00       	jmp    102937 <__alltraps>

0010280b <vector231>:
.globl vector231
vector231:
  pushl $0
  10280b:	6a 00                	push   $0x0
  pushl $231
  10280d:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102812:	e9 20 01 00 00       	jmp    102937 <__alltraps>

00102817 <vector232>:
.globl vector232
vector232:
  pushl $0
  102817:	6a 00                	push   $0x0
  pushl $232
  102819:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10281e:	e9 14 01 00 00       	jmp    102937 <__alltraps>

00102823 <vector233>:
.globl vector233
vector233:
  pushl $0
  102823:	6a 00                	push   $0x0
  pushl $233
  102825:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10282a:	e9 08 01 00 00       	jmp    102937 <__alltraps>

0010282f <vector234>:
.globl vector234
vector234:
  pushl $0
  10282f:	6a 00                	push   $0x0
  pushl $234
  102831:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102836:	e9 fc 00 00 00       	jmp    102937 <__alltraps>

0010283b <vector235>:
.globl vector235
vector235:
  pushl $0
  10283b:	6a 00                	push   $0x0
  pushl $235
  10283d:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102842:	e9 f0 00 00 00       	jmp    102937 <__alltraps>

00102847 <vector236>:
.globl vector236
vector236:
  pushl $0
  102847:	6a 00                	push   $0x0
  pushl $236
  102849:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10284e:	e9 e4 00 00 00       	jmp    102937 <__alltraps>

00102853 <vector237>:
.globl vector237
vector237:
  pushl $0
  102853:	6a 00                	push   $0x0
  pushl $237
  102855:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10285a:	e9 d8 00 00 00       	jmp    102937 <__alltraps>

0010285f <vector238>:
.globl vector238
vector238:
  pushl $0
  10285f:	6a 00                	push   $0x0
  pushl $238
  102861:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102866:	e9 cc 00 00 00       	jmp    102937 <__alltraps>

0010286b <vector239>:
.globl vector239
vector239:
  pushl $0
  10286b:	6a 00                	push   $0x0
  pushl $239
  10286d:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102872:	e9 c0 00 00 00       	jmp    102937 <__alltraps>

00102877 <vector240>:
.globl vector240
vector240:
  pushl $0
  102877:	6a 00                	push   $0x0
  pushl $240
  102879:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10287e:	e9 b4 00 00 00       	jmp    102937 <__alltraps>

00102883 <vector241>:
.globl vector241
vector241:
  pushl $0
  102883:	6a 00                	push   $0x0
  pushl $241
  102885:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10288a:	e9 a8 00 00 00       	jmp    102937 <__alltraps>

0010288f <vector242>:
.globl vector242
vector242:
  pushl $0
  10288f:	6a 00                	push   $0x0
  pushl $242
  102891:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102896:	e9 9c 00 00 00       	jmp    102937 <__alltraps>

0010289b <vector243>:
.globl vector243
vector243:
  pushl $0
  10289b:	6a 00                	push   $0x0
  pushl $243
  10289d:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1028a2:	e9 90 00 00 00       	jmp    102937 <__alltraps>

001028a7 <vector244>:
.globl vector244
vector244:
  pushl $0
  1028a7:	6a 00                	push   $0x0
  pushl $244
  1028a9:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028ae:	e9 84 00 00 00       	jmp    102937 <__alltraps>

001028b3 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028b3:	6a 00                	push   $0x0
  pushl $245
  1028b5:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028ba:	e9 78 00 00 00       	jmp    102937 <__alltraps>

001028bf <vector246>:
.globl vector246
vector246:
  pushl $0
  1028bf:	6a 00                	push   $0x0
  pushl $246
  1028c1:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028c6:	e9 6c 00 00 00       	jmp    102937 <__alltraps>

001028cb <vector247>:
.globl vector247
vector247:
  pushl $0
  1028cb:	6a 00                	push   $0x0
  pushl $247
  1028cd:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028d2:	e9 60 00 00 00       	jmp    102937 <__alltraps>

001028d7 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028d7:	6a 00                	push   $0x0
  pushl $248
  1028d9:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028de:	e9 54 00 00 00       	jmp    102937 <__alltraps>

001028e3 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028e3:	6a 00                	push   $0x0
  pushl $249
  1028e5:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028ea:	e9 48 00 00 00       	jmp    102937 <__alltraps>

001028ef <vector250>:
.globl vector250
vector250:
  pushl $0
  1028ef:	6a 00                	push   $0x0
  pushl $250
  1028f1:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028f6:	e9 3c 00 00 00       	jmp    102937 <__alltraps>

001028fb <vector251>:
.globl vector251
vector251:
  pushl $0
  1028fb:	6a 00                	push   $0x0
  pushl $251
  1028fd:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102902:	e9 30 00 00 00       	jmp    102937 <__alltraps>

00102907 <vector252>:
.globl vector252
vector252:
  pushl $0
  102907:	6a 00                	push   $0x0
  pushl $252
  102909:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10290e:	e9 24 00 00 00       	jmp    102937 <__alltraps>

00102913 <vector253>:
.globl vector253
vector253:
  pushl $0
  102913:	6a 00                	push   $0x0
  pushl $253
  102915:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10291a:	e9 18 00 00 00       	jmp    102937 <__alltraps>

0010291f <vector254>:
.globl vector254
vector254:
  pushl $0
  10291f:	6a 00                	push   $0x0
  pushl $254
  102921:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102926:	e9 0c 00 00 00       	jmp    102937 <__alltraps>

0010292b <vector255>:
.globl vector255
vector255:
  pushl $0
  10292b:	6a 00                	push   $0x0
  pushl $255
  10292d:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102932:	e9 00 00 00 00       	jmp    102937 <__alltraps>

00102937 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102937:	1e                   	push   %ds
    pushl %es
  102938:	06                   	push   %es
    pushl %fs
  102939:	0f a0                	push   %fs
    pushl %gs
  10293b:	0f a8                	push   %gs
    pushal
  10293d:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10293e:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102943:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102945:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102947:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102948:	e8 67 f5 ff ff       	call   101eb4 <trap>

    # pop the pushed stack pointer
    popl %esp
  10294d:	5c                   	pop    %esp

0010294e <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10294e:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10294f:	0f a9                	pop    %gs
    popl %fs
  102951:	0f a1                	pop    %fs
    popl %es
  102953:	07                   	pop    %es
    popl %ds
  102954:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102955:	83 c4 08             	add    $0x8,%esp
    iret
  102958:	cf                   	iret   

00102959 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102959:	55                   	push   %ebp
  10295a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10295c:	8b 45 08             	mov    0x8(%ebp),%eax
  10295f:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102962:	b8 23 00 00 00       	mov    $0x23,%eax
  102967:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102969:	b8 23 00 00 00       	mov    $0x23,%eax
  10296e:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102970:	b8 10 00 00 00       	mov    $0x10,%eax
  102975:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102977:	b8 10 00 00 00       	mov    $0x10,%eax
  10297c:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10297e:	b8 10 00 00 00       	mov    $0x10,%eax
  102983:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102985:	ea 8c 29 10 00 08 00 	ljmp   $0x8,$0x10298c
}
  10298c:	5d                   	pop    %ebp
  10298d:	c3                   	ret    

0010298e <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10298e:	55                   	push   %ebp
  10298f:	89 e5                	mov    %esp,%ebp
  102991:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102994:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102999:	05 00 04 00 00       	add    $0x400,%eax
  10299e:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1029a3:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1029aa:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029ac:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1029b3:	68 00 
  1029b5:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029ba:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1029c0:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029c5:	c1 e8 10             	shr    $0x10,%eax
  1029c8:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1029cd:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029d4:	83 e0 f0             	and    $0xfffffff0,%eax
  1029d7:	83 c8 09             	or     $0x9,%eax
  1029da:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029df:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029e6:	83 c8 10             	or     $0x10,%eax
  1029e9:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029ee:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029f5:	83 e0 9f             	and    $0xffffff9f,%eax
  1029f8:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029fd:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a04:	83 c8 80             	or     $0xffffff80,%eax
  102a07:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a0c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a13:	83 e0 f0             	and    $0xfffffff0,%eax
  102a16:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a1b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a22:	83 e0 ef             	and    $0xffffffef,%eax
  102a25:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a2a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a31:	83 e0 df             	and    $0xffffffdf,%eax
  102a34:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a39:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a40:	83 c8 40             	or     $0x40,%eax
  102a43:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a48:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a4f:	83 e0 7f             	and    $0x7f,%eax
  102a52:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a57:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a5c:	c1 e8 18             	shr    $0x18,%eax
  102a5f:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a64:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a6b:	83 e0 ef             	and    $0xffffffef,%eax
  102a6e:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a73:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102a7a:	e8 da fe ff ff       	call   102959 <lgdt>
  102a7f:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a85:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a89:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a8c:	c9                   	leave  
  102a8d:	c3                   	ret    

00102a8e <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a8e:	55                   	push   %ebp
  102a8f:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a91:	e8 f8 fe ff ff       	call   10298e <gdt_init>
}
  102a96:	5d                   	pop    %ebp
  102a97:	c3                   	ret    

00102a98 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a98:	55                   	push   %ebp
  102a99:	89 e5                	mov    %esp,%ebp
  102a9b:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a9e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102aa5:	eb 04                	jmp    102aab <strlen+0x13>
        cnt ++;
  102aa7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102aab:	8b 45 08             	mov    0x8(%ebp),%eax
  102aae:	8d 50 01             	lea    0x1(%eax),%edx
  102ab1:	89 55 08             	mov    %edx,0x8(%ebp)
  102ab4:	0f b6 00             	movzbl (%eax),%eax
  102ab7:	84 c0                	test   %al,%al
  102ab9:	75 ec                	jne    102aa7 <strlen+0xf>
    }
    return cnt;
  102abb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102abe:	c9                   	leave  
  102abf:	c3                   	ret    

00102ac0 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102ac0:	55                   	push   %ebp
  102ac1:	89 e5                	mov    %esp,%ebp
  102ac3:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102ac6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102acd:	eb 04                	jmp    102ad3 <strnlen+0x13>
        cnt ++;
  102acf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ad3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ad6:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102ad9:	73 10                	jae    102aeb <strnlen+0x2b>
  102adb:	8b 45 08             	mov    0x8(%ebp),%eax
  102ade:	8d 50 01             	lea    0x1(%eax),%edx
  102ae1:	89 55 08             	mov    %edx,0x8(%ebp)
  102ae4:	0f b6 00             	movzbl (%eax),%eax
  102ae7:	84 c0                	test   %al,%al
  102ae9:	75 e4                	jne    102acf <strnlen+0xf>
    }
    return cnt;
  102aeb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102aee:	c9                   	leave  
  102aef:	c3                   	ret    

00102af0 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102af0:	55                   	push   %ebp
  102af1:	89 e5                	mov    %esp,%ebp
  102af3:	57                   	push   %edi
  102af4:	56                   	push   %esi
  102af5:	83 ec 20             	sub    $0x20,%esp
  102af8:	8b 45 08             	mov    0x8(%ebp),%eax
  102afb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102afe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b01:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b04:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b0a:	89 d1                	mov    %edx,%ecx
  102b0c:	89 c2                	mov    %eax,%edx
  102b0e:	89 ce                	mov    %ecx,%esi
  102b10:	89 d7                	mov    %edx,%edi
  102b12:	ac                   	lods   %ds:(%esi),%al
  102b13:	aa                   	stos   %al,%es:(%edi)
  102b14:	84 c0                	test   %al,%al
  102b16:	75 fa                	jne    102b12 <strcpy+0x22>
  102b18:	89 fa                	mov    %edi,%edx
  102b1a:	89 f1                	mov    %esi,%ecx
  102b1c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b1f:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b28:	83 c4 20             	add    $0x20,%esp
  102b2b:	5e                   	pop    %esi
  102b2c:	5f                   	pop    %edi
  102b2d:	5d                   	pop    %ebp
  102b2e:	c3                   	ret    

00102b2f <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b2f:	55                   	push   %ebp
  102b30:	89 e5                	mov    %esp,%ebp
  102b32:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b35:	8b 45 08             	mov    0x8(%ebp),%eax
  102b38:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b3b:	eb 21                	jmp    102b5e <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b40:	0f b6 10             	movzbl (%eax),%edx
  102b43:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b46:	88 10                	mov    %dl,(%eax)
  102b48:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b4b:	0f b6 00             	movzbl (%eax),%eax
  102b4e:	84 c0                	test   %al,%al
  102b50:	74 04                	je     102b56 <strncpy+0x27>
            src ++;
  102b52:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102b56:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b5a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102b5e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b62:	75 d9                	jne    102b3d <strncpy+0xe>
    }
    return dst;
  102b64:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b67:	c9                   	leave  
  102b68:	c3                   	ret    

00102b69 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b69:	55                   	push   %ebp
  102b6a:	89 e5                	mov    %esp,%ebp
  102b6c:	57                   	push   %edi
  102b6d:	56                   	push   %esi
  102b6e:	83 ec 20             	sub    $0x20,%esp
  102b71:	8b 45 08             	mov    0x8(%ebp),%eax
  102b74:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b77:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b7d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b83:	89 d1                	mov    %edx,%ecx
  102b85:	89 c2                	mov    %eax,%edx
  102b87:	89 ce                	mov    %ecx,%esi
  102b89:	89 d7                	mov    %edx,%edi
  102b8b:	ac                   	lods   %ds:(%esi),%al
  102b8c:	ae                   	scas   %es:(%edi),%al
  102b8d:	75 08                	jne    102b97 <strcmp+0x2e>
  102b8f:	84 c0                	test   %al,%al
  102b91:	75 f8                	jne    102b8b <strcmp+0x22>
  102b93:	31 c0                	xor    %eax,%eax
  102b95:	eb 04                	jmp    102b9b <strcmp+0x32>
  102b97:	19 c0                	sbb    %eax,%eax
  102b99:	0c 01                	or     $0x1,%al
  102b9b:	89 fa                	mov    %edi,%edx
  102b9d:	89 f1                	mov    %esi,%ecx
  102b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ba2:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ba5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102ba8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102bab:	83 c4 20             	add    $0x20,%esp
  102bae:	5e                   	pop    %esi
  102baf:	5f                   	pop    %edi
  102bb0:	5d                   	pop    %ebp
  102bb1:	c3                   	ret    

00102bb2 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102bb2:	55                   	push   %ebp
  102bb3:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bb5:	eb 0c                	jmp    102bc3 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102bb7:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102bbb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102bbf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bc3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bc7:	74 1a                	je     102be3 <strncmp+0x31>
  102bc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bcc:	0f b6 00             	movzbl (%eax),%eax
  102bcf:	84 c0                	test   %al,%al
  102bd1:	74 10                	je     102be3 <strncmp+0x31>
  102bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd6:	0f b6 10             	movzbl (%eax),%edx
  102bd9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bdc:	0f b6 00             	movzbl (%eax),%eax
  102bdf:	38 c2                	cmp    %al,%dl
  102be1:	74 d4                	je     102bb7 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102be3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102be7:	74 18                	je     102c01 <strncmp+0x4f>
  102be9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bec:	0f b6 00             	movzbl (%eax),%eax
  102bef:	0f b6 d0             	movzbl %al,%edx
  102bf2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf5:	0f b6 00             	movzbl (%eax),%eax
  102bf8:	0f b6 c0             	movzbl %al,%eax
  102bfb:	29 c2                	sub    %eax,%edx
  102bfd:	89 d0                	mov    %edx,%eax
  102bff:	eb 05                	jmp    102c06 <strncmp+0x54>
  102c01:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c06:	5d                   	pop    %ebp
  102c07:	c3                   	ret    

00102c08 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c08:	55                   	push   %ebp
  102c09:	89 e5                	mov    %esp,%ebp
  102c0b:	83 ec 04             	sub    $0x4,%esp
  102c0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c11:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c14:	eb 14                	jmp    102c2a <strchr+0x22>
        if (*s == c) {
  102c16:	8b 45 08             	mov    0x8(%ebp),%eax
  102c19:	0f b6 00             	movzbl (%eax),%eax
  102c1c:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c1f:	75 05                	jne    102c26 <strchr+0x1e>
            return (char *)s;
  102c21:	8b 45 08             	mov    0x8(%ebp),%eax
  102c24:	eb 13                	jmp    102c39 <strchr+0x31>
        }
        s ++;
  102c26:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102c2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2d:	0f b6 00             	movzbl (%eax),%eax
  102c30:	84 c0                	test   %al,%al
  102c32:	75 e2                	jne    102c16 <strchr+0xe>
    }
    return NULL;
  102c34:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c39:	c9                   	leave  
  102c3a:	c3                   	ret    

00102c3b <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c3b:	55                   	push   %ebp
  102c3c:	89 e5                	mov    %esp,%ebp
  102c3e:	83 ec 04             	sub    $0x4,%esp
  102c41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c44:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c47:	eb 11                	jmp    102c5a <strfind+0x1f>
        if (*s == c) {
  102c49:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4c:	0f b6 00             	movzbl (%eax),%eax
  102c4f:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c52:	75 02                	jne    102c56 <strfind+0x1b>
            break;
  102c54:	eb 0e                	jmp    102c64 <strfind+0x29>
        }
        s ++;
  102c56:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102c5a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5d:	0f b6 00             	movzbl (%eax),%eax
  102c60:	84 c0                	test   %al,%al
  102c62:	75 e5                	jne    102c49 <strfind+0xe>
    }
    return (char *)s;
  102c64:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c67:	c9                   	leave  
  102c68:	c3                   	ret    

00102c69 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c69:	55                   	push   %ebp
  102c6a:	89 e5                	mov    %esp,%ebp
  102c6c:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c6f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c76:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c7d:	eb 04                	jmp    102c83 <strtol+0x1a>
        s ++;
  102c7f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c83:	8b 45 08             	mov    0x8(%ebp),%eax
  102c86:	0f b6 00             	movzbl (%eax),%eax
  102c89:	3c 20                	cmp    $0x20,%al
  102c8b:	74 f2                	je     102c7f <strtol+0x16>
  102c8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c90:	0f b6 00             	movzbl (%eax),%eax
  102c93:	3c 09                	cmp    $0x9,%al
  102c95:	74 e8                	je     102c7f <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102c97:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9a:	0f b6 00             	movzbl (%eax),%eax
  102c9d:	3c 2b                	cmp    $0x2b,%al
  102c9f:	75 06                	jne    102ca7 <strtol+0x3e>
        s ++;
  102ca1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ca5:	eb 15                	jmp    102cbc <strtol+0x53>
    }
    else if (*s == '-') {
  102ca7:	8b 45 08             	mov    0x8(%ebp),%eax
  102caa:	0f b6 00             	movzbl (%eax),%eax
  102cad:	3c 2d                	cmp    $0x2d,%al
  102caf:	75 0b                	jne    102cbc <strtol+0x53>
        s ++, neg = 1;
  102cb1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102cb5:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cbc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cc0:	74 06                	je     102cc8 <strtol+0x5f>
  102cc2:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102cc6:	75 24                	jne    102cec <strtol+0x83>
  102cc8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccb:	0f b6 00             	movzbl (%eax),%eax
  102cce:	3c 30                	cmp    $0x30,%al
  102cd0:	75 1a                	jne    102cec <strtol+0x83>
  102cd2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd5:	83 c0 01             	add    $0x1,%eax
  102cd8:	0f b6 00             	movzbl (%eax),%eax
  102cdb:	3c 78                	cmp    $0x78,%al
  102cdd:	75 0d                	jne    102cec <strtol+0x83>
        s += 2, base = 16;
  102cdf:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102ce3:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102cea:	eb 2a                	jmp    102d16 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102cec:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cf0:	75 17                	jne    102d09 <strtol+0xa0>
  102cf2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf5:	0f b6 00             	movzbl (%eax),%eax
  102cf8:	3c 30                	cmp    $0x30,%al
  102cfa:	75 0d                	jne    102d09 <strtol+0xa0>
        s ++, base = 8;
  102cfc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d00:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d07:	eb 0d                	jmp    102d16 <strtol+0xad>
    }
    else if (base == 0) {
  102d09:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d0d:	75 07                	jne    102d16 <strtol+0xad>
        base = 10;
  102d0f:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d16:	8b 45 08             	mov    0x8(%ebp),%eax
  102d19:	0f b6 00             	movzbl (%eax),%eax
  102d1c:	3c 2f                	cmp    $0x2f,%al
  102d1e:	7e 1b                	jle    102d3b <strtol+0xd2>
  102d20:	8b 45 08             	mov    0x8(%ebp),%eax
  102d23:	0f b6 00             	movzbl (%eax),%eax
  102d26:	3c 39                	cmp    $0x39,%al
  102d28:	7f 11                	jg     102d3b <strtol+0xd2>
            dig = *s - '0';
  102d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2d:	0f b6 00             	movzbl (%eax),%eax
  102d30:	0f be c0             	movsbl %al,%eax
  102d33:	83 e8 30             	sub    $0x30,%eax
  102d36:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d39:	eb 48                	jmp    102d83 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3e:	0f b6 00             	movzbl (%eax),%eax
  102d41:	3c 60                	cmp    $0x60,%al
  102d43:	7e 1b                	jle    102d60 <strtol+0xf7>
  102d45:	8b 45 08             	mov    0x8(%ebp),%eax
  102d48:	0f b6 00             	movzbl (%eax),%eax
  102d4b:	3c 7a                	cmp    $0x7a,%al
  102d4d:	7f 11                	jg     102d60 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102d4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d52:	0f b6 00             	movzbl (%eax),%eax
  102d55:	0f be c0             	movsbl %al,%eax
  102d58:	83 e8 57             	sub    $0x57,%eax
  102d5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d5e:	eb 23                	jmp    102d83 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d60:	8b 45 08             	mov    0x8(%ebp),%eax
  102d63:	0f b6 00             	movzbl (%eax),%eax
  102d66:	3c 40                	cmp    $0x40,%al
  102d68:	7e 3d                	jle    102da7 <strtol+0x13e>
  102d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6d:	0f b6 00             	movzbl (%eax),%eax
  102d70:	3c 5a                	cmp    $0x5a,%al
  102d72:	7f 33                	jg     102da7 <strtol+0x13e>
            dig = *s - 'A' + 10;
  102d74:	8b 45 08             	mov    0x8(%ebp),%eax
  102d77:	0f b6 00             	movzbl (%eax),%eax
  102d7a:	0f be c0             	movsbl %al,%eax
  102d7d:	83 e8 37             	sub    $0x37,%eax
  102d80:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d86:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d89:	7c 02                	jl     102d8d <strtol+0x124>
            break;
  102d8b:	eb 1a                	jmp    102da7 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  102d8d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d91:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d94:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d98:	89 c2                	mov    %eax,%edx
  102d9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d9d:	01 d0                	add    %edx,%eax
  102d9f:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102da2:	e9 6f ff ff ff       	jmp    102d16 <strtol+0xad>

    if (endptr) {
  102da7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dab:	74 08                	je     102db5 <strtol+0x14c>
        *endptr = (char *) s;
  102dad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db0:	8b 55 08             	mov    0x8(%ebp),%edx
  102db3:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102db5:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102db9:	74 07                	je     102dc2 <strtol+0x159>
  102dbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dbe:	f7 d8                	neg    %eax
  102dc0:	eb 03                	jmp    102dc5 <strtol+0x15c>
  102dc2:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102dc5:	c9                   	leave  
  102dc6:	c3                   	ret    

00102dc7 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102dc7:	55                   	push   %ebp
  102dc8:	89 e5                	mov    %esp,%ebp
  102dca:	57                   	push   %edi
  102dcb:	83 ec 24             	sub    $0x24,%esp
  102dce:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dd1:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102dd4:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102dd8:	8b 55 08             	mov    0x8(%ebp),%edx
  102ddb:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102dde:	88 45 f7             	mov    %al,-0x9(%ebp)
  102de1:	8b 45 10             	mov    0x10(%ebp),%eax
  102de4:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102de7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102dea:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102dee:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102df1:	89 d7                	mov    %edx,%edi
  102df3:	f3 aa                	rep stos %al,%es:(%edi)
  102df5:	89 fa                	mov    %edi,%edx
  102df7:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dfa:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102dfd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e00:	83 c4 24             	add    $0x24,%esp
  102e03:	5f                   	pop    %edi
  102e04:	5d                   	pop    %ebp
  102e05:	c3                   	ret    

00102e06 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e06:	55                   	push   %ebp
  102e07:	89 e5                	mov    %esp,%ebp
  102e09:	57                   	push   %edi
  102e0a:	56                   	push   %esi
  102e0b:	53                   	push   %ebx
  102e0c:	83 ec 30             	sub    $0x30,%esp
  102e0f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e15:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e18:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e1b:	8b 45 10             	mov    0x10(%ebp),%eax
  102e1e:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e21:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e24:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e27:	73 42                	jae    102e6b <memmove+0x65>
  102e29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e2c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e32:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e35:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e38:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e3e:	c1 e8 02             	shr    $0x2,%eax
  102e41:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e43:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e46:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e49:	89 d7                	mov    %edx,%edi
  102e4b:	89 c6                	mov    %eax,%esi
  102e4d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e4f:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e52:	83 e1 03             	and    $0x3,%ecx
  102e55:	74 02                	je     102e59 <memmove+0x53>
  102e57:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e59:	89 f0                	mov    %esi,%eax
  102e5b:	89 fa                	mov    %edi,%edx
  102e5d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e60:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e63:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e69:	eb 36                	jmp    102ea1 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e6e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e71:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e74:	01 c2                	add    %eax,%edx
  102e76:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e79:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e7f:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e82:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e85:	89 c1                	mov    %eax,%ecx
  102e87:	89 d8                	mov    %ebx,%eax
  102e89:	89 d6                	mov    %edx,%esi
  102e8b:	89 c7                	mov    %eax,%edi
  102e8d:	fd                   	std    
  102e8e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e90:	fc                   	cld    
  102e91:	89 f8                	mov    %edi,%eax
  102e93:	89 f2                	mov    %esi,%edx
  102e95:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e98:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e9b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102e9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ea1:	83 c4 30             	add    $0x30,%esp
  102ea4:	5b                   	pop    %ebx
  102ea5:	5e                   	pop    %esi
  102ea6:	5f                   	pop    %edi
  102ea7:	5d                   	pop    %ebp
  102ea8:	c3                   	ret    

00102ea9 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ea9:	55                   	push   %ebp
  102eaa:	89 e5                	mov    %esp,%ebp
  102eac:	57                   	push   %edi
  102ead:	56                   	push   %esi
  102eae:	83 ec 20             	sub    $0x20,%esp
  102eb1:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ebd:	8b 45 10             	mov    0x10(%ebp),%eax
  102ec0:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ec3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ec6:	c1 e8 02             	shr    $0x2,%eax
  102ec9:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102ecb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ece:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ed1:	89 d7                	mov    %edx,%edi
  102ed3:	89 c6                	mov    %eax,%esi
  102ed5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ed7:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102eda:	83 e1 03             	and    $0x3,%ecx
  102edd:	74 02                	je     102ee1 <memcpy+0x38>
  102edf:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ee1:	89 f0                	mov    %esi,%eax
  102ee3:	89 fa                	mov    %edi,%edx
  102ee5:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ee8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102eeb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102ef1:	83 c4 20             	add    $0x20,%esp
  102ef4:	5e                   	pop    %esi
  102ef5:	5f                   	pop    %edi
  102ef6:	5d                   	pop    %ebp
  102ef7:	c3                   	ret    

00102ef8 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102ef8:	55                   	push   %ebp
  102ef9:	89 e5                	mov    %esp,%ebp
  102efb:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102efe:	8b 45 08             	mov    0x8(%ebp),%eax
  102f01:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f04:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f07:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f0a:	eb 30                	jmp    102f3c <memcmp+0x44>
        if (*s1 != *s2) {
  102f0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f0f:	0f b6 10             	movzbl (%eax),%edx
  102f12:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f15:	0f b6 00             	movzbl (%eax),%eax
  102f18:	38 c2                	cmp    %al,%dl
  102f1a:	74 18                	je     102f34 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f1f:	0f b6 00             	movzbl (%eax),%eax
  102f22:	0f b6 d0             	movzbl %al,%edx
  102f25:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f28:	0f b6 00             	movzbl (%eax),%eax
  102f2b:	0f b6 c0             	movzbl %al,%eax
  102f2e:	29 c2                	sub    %eax,%edx
  102f30:	89 d0                	mov    %edx,%eax
  102f32:	eb 1a                	jmp    102f4e <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102f34:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102f38:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  102f3c:	8b 45 10             	mov    0x10(%ebp),%eax
  102f3f:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f42:	89 55 10             	mov    %edx,0x10(%ebp)
  102f45:	85 c0                	test   %eax,%eax
  102f47:	75 c3                	jne    102f0c <memcmp+0x14>
    }
    return 0;
  102f49:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f4e:	c9                   	leave  
  102f4f:	c3                   	ret    

00102f50 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f50:	55                   	push   %ebp
  102f51:	89 e5                	mov    %esp,%ebp
  102f53:	83 ec 58             	sub    $0x58,%esp
  102f56:	8b 45 10             	mov    0x10(%ebp),%eax
  102f59:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f5c:	8b 45 14             	mov    0x14(%ebp),%eax
  102f5f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f62:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f65:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f68:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f6b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f6e:	8b 45 18             	mov    0x18(%ebp),%eax
  102f71:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f74:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f77:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f7d:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f83:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f8a:	74 1c                	je     102fa8 <printnum+0x58>
  102f8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f8f:	ba 00 00 00 00       	mov    $0x0,%edx
  102f94:	f7 75 e4             	divl   -0x1c(%ebp)
  102f97:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f9d:	ba 00 00 00 00       	mov    $0x0,%edx
  102fa2:	f7 75 e4             	divl   -0x1c(%ebp)
  102fa5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fab:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fae:	f7 75 e4             	divl   -0x1c(%ebp)
  102fb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fb4:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fb7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fba:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fc0:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fc3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fc6:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fc9:	8b 45 18             	mov    0x18(%ebp),%eax
  102fcc:	ba 00 00 00 00       	mov    $0x0,%edx
  102fd1:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fd4:	77 56                	ja     10302c <printnum+0xdc>
  102fd6:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fd9:	72 05                	jb     102fe0 <printnum+0x90>
  102fdb:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102fde:	77 4c                	ja     10302c <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fe0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102fe3:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fe6:	8b 45 20             	mov    0x20(%ebp),%eax
  102fe9:	89 44 24 18          	mov    %eax,0x18(%esp)
  102fed:	89 54 24 14          	mov    %edx,0x14(%esp)
  102ff1:	8b 45 18             	mov    0x18(%ebp),%eax
  102ff4:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ff8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ffb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102ffe:	89 44 24 08          	mov    %eax,0x8(%esp)
  103002:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103006:	8b 45 0c             	mov    0xc(%ebp),%eax
  103009:	89 44 24 04          	mov    %eax,0x4(%esp)
  10300d:	8b 45 08             	mov    0x8(%ebp),%eax
  103010:	89 04 24             	mov    %eax,(%esp)
  103013:	e8 38 ff ff ff       	call   102f50 <printnum>
  103018:	eb 1c                	jmp    103036 <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  10301a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10301d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103021:	8b 45 20             	mov    0x20(%ebp),%eax
  103024:	89 04 24             	mov    %eax,(%esp)
  103027:	8b 45 08             	mov    0x8(%ebp),%eax
  10302a:	ff d0                	call   *%eax
        while (-- width > 0)
  10302c:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  103030:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103034:	7f e4                	jg     10301a <printnum+0xca>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103036:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103039:	05 70 3d 10 00       	add    $0x103d70,%eax
  10303e:	0f b6 00             	movzbl (%eax),%eax
  103041:	0f be c0             	movsbl %al,%eax
  103044:	8b 55 0c             	mov    0xc(%ebp),%edx
  103047:	89 54 24 04          	mov    %edx,0x4(%esp)
  10304b:	89 04 24             	mov    %eax,(%esp)
  10304e:	8b 45 08             	mov    0x8(%ebp),%eax
  103051:	ff d0                	call   *%eax
}
  103053:	c9                   	leave  
  103054:	c3                   	ret    

00103055 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103055:	55                   	push   %ebp
  103056:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103058:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10305c:	7e 14                	jle    103072 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10305e:	8b 45 08             	mov    0x8(%ebp),%eax
  103061:	8b 00                	mov    (%eax),%eax
  103063:	8d 48 08             	lea    0x8(%eax),%ecx
  103066:	8b 55 08             	mov    0x8(%ebp),%edx
  103069:	89 0a                	mov    %ecx,(%edx)
  10306b:	8b 50 04             	mov    0x4(%eax),%edx
  10306e:	8b 00                	mov    (%eax),%eax
  103070:	eb 30                	jmp    1030a2 <getuint+0x4d>
    }
    else if (lflag) {
  103072:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103076:	74 16                	je     10308e <getuint+0x39>
        return va_arg(*ap, unsigned long);
  103078:	8b 45 08             	mov    0x8(%ebp),%eax
  10307b:	8b 00                	mov    (%eax),%eax
  10307d:	8d 48 04             	lea    0x4(%eax),%ecx
  103080:	8b 55 08             	mov    0x8(%ebp),%edx
  103083:	89 0a                	mov    %ecx,(%edx)
  103085:	8b 00                	mov    (%eax),%eax
  103087:	ba 00 00 00 00       	mov    $0x0,%edx
  10308c:	eb 14                	jmp    1030a2 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  10308e:	8b 45 08             	mov    0x8(%ebp),%eax
  103091:	8b 00                	mov    (%eax),%eax
  103093:	8d 48 04             	lea    0x4(%eax),%ecx
  103096:	8b 55 08             	mov    0x8(%ebp),%edx
  103099:	89 0a                	mov    %ecx,(%edx)
  10309b:	8b 00                	mov    (%eax),%eax
  10309d:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030a2:	5d                   	pop    %ebp
  1030a3:	c3                   	ret    

001030a4 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030a4:	55                   	push   %ebp
  1030a5:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030a7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030ab:	7e 14                	jle    1030c1 <getint+0x1d>
        return va_arg(*ap, long long);
  1030ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b0:	8b 00                	mov    (%eax),%eax
  1030b2:	8d 48 08             	lea    0x8(%eax),%ecx
  1030b5:	8b 55 08             	mov    0x8(%ebp),%edx
  1030b8:	89 0a                	mov    %ecx,(%edx)
  1030ba:	8b 50 04             	mov    0x4(%eax),%edx
  1030bd:	8b 00                	mov    (%eax),%eax
  1030bf:	eb 28                	jmp    1030e9 <getint+0x45>
    }
    else if (lflag) {
  1030c1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030c5:	74 12                	je     1030d9 <getint+0x35>
        return va_arg(*ap, long);
  1030c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ca:	8b 00                	mov    (%eax),%eax
  1030cc:	8d 48 04             	lea    0x4(%eax),%ecx
  1030cf:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d2:	89 0a                	mov    %ecx,(%edx)
  1030d4:	8b 00                	mov    (%eax),%eax
  1030d6:	99                   	cltd   
  1030d7:	eb 10                	jmp    1030e9 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1030d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1030dc:	8b 00                	mov    (%eax),%eax
  1030de:	8d 48 04             	lea    0x4(%eax),%ecx
  1030e1:	8b 55 08             	mov    0x8(%ebp),%edx
  1030e4:	89 0a                	mov    %ecx,(%edx)
  1030e6:	8b 00                	mov    (%eax),%eax
  1030e8:	99                   	cltd   
    }
}
  1030e9:	5d                   	pop    %ebp
  1030ea:	c3                   	ret    

001030eb <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030eb:	55                   	push   %ebp
  1030ec:	89 e5                	mov    %esp,%ebp
  1030ee:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1030f1:	8d 45 14             	lea    0x14(%ebp),%eax
  1030f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1030f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030fe:	8b 45 10             	mov    0x10(%ebp),%eax
  103101:	89 44 24 08          	mov    %eax,0x8(%esp)
  103105:	8b 45 0c             	mov    0xc(%ebp),%eax
  103108:	89 44 24 04          	mov    %eax,0x4(%esp)
  10310c:	8b 45 08             	mov    0x8(%ebp),%eax
  10310f:	89 04 24             	mov    %eax,(%esp)
  103112:	e8 02 00 00 00       	call   103119 <vprintfmt>
    va_end(ap);
}
  103117:	c9                   	leave  
  103118:	c3                   	ret    

00103119 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103119:	55                   	push   %ebp
  10311a:	89 e5                	mov    %esp,%ebp
  10311c:	56                   	push   %esi
  10311d:	53                   	push   %ebx
  10311e:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103121:	eb 18                	jmp    10313b <vprintfmt+0x22>
            if (ch == '\0') {
  103123:	85 db                	test   %ebx,%ebx
  103125:	75 05                	jne    10312c <vprintfmt+0x13>
                return;
  103127:	e9 d1 03 00 00       	jmp    1034fd <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  10312c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10312f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103133:	89 1c 24             	mov    %ebx,(%esp)
  103136:	8b 45 08             	mov    0x8(%ebp),%eax
  103139:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10313b:	8b 45 10             	mov    0x10(%ebp),%eax
  10313e:	8d 50 01             	lea    0x1(%eax),%edx
  103141:	89 55 10             	mov    %edx,0x10(%ebp)
  103144:	0f b6 00             	movzbl (%eax),%eax
  103147:	0f b6 d8             	movzbl %al,%ebx
  10314a:	83 fb 25             	cmp    $0x25,%ebx
  10314d:	75 d4                	jne    103123 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10314f:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103153:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10315a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10315d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103160:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103167:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10316a:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10316d:	8b 45 10             	mov    0x10(%ebp),%eax
  103170:	8d 50 01             	lea    0x1(%eax),%edx
  103173:	89 55 10             	mov    %edx,0x10(%ebp)
  103176:	0f b6 00             	movzbl (%eax),%eax
  103179:	0f b6 d8             	movzbl %al,%ebx
  10317c:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10317f:	83 f8 55             	cmp    $0x55,%eax
  103182:	0f 87 44 03 00 00    	ja     1034cc <vprintfmt+0x3b3>
  103188:	8b 04 85 94 3d 10 00 	mov    0x103d94(,%eax,4),%eax
  10318f:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103191:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103195:	eb d6                	jmp    10316d <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103197:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  10319b:	eb d0                	jmp    10316d <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  10319d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031a4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031a7:	89 d0                	mov    %edx,%eax
  1031a9:	c1 e0 02             	shl    $0x2,%eax
  1031ac:	01 d0                	add    %edx,%eax
  1031ae:	01 c0                	add    %eax,%eax
  1031b0:	01 d8                	add    %ebx,%eax
  1031b2:	83 e8 30             	sub    $0x30,%eax
  1031b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031b8:	8b 45 10             	mov    0x10(%ebp),%eax
  1031bb:	0f b6 00             	movzbl (%eax),%eax
  1031be:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031c1:	83 fb 2f             	cmp    $0x2f,%ebx
  1031c4:	7e 0b                	jle    1031d1 <vprintfmt+0xb8>
  1031c6:	83 fb 39             	cmp    $0x39,%ebx
  1031c9:	7f 06                	jg     1031d1 <vprintfmt+0xb8>
            for (precision = 0; ; ++ fmt) {
  1031cb:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                    break;
                }
            }
  1031cf:	eb d3                	jmp    1031a4 <vprintfmt+0x8b>
            goto process_precision;
  1031d1:	eb 33                	jmp    103206 <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  1031d3:	8b 45 14             	mov    0x14(%ebp),%eax
  1031d6:	8d 50 04             	lea    0x4(%eax),%edx
  1031d9:	89 55 14             	mov    %edx,0x14(%ebp)
  1031dc:	8b 00                	mov    (%eax),%eax
  1031de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031e1:	eb 23                	jmp    103206 <vprintfmt+0xed>

        case '.':
            if (width < 0)
  1031e3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031e7:	79 0c                	jns    1031f5 <vprintfmt+0xdc>
                width = 0;
  1031e9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031f0:	e9 78 ff ff ff       	jmp    10316d <vprintfmt+0x54>
  1031f5:	e9 73 ff ff ff       	jmp    10316d <vprintfmt+0x54>

        case '#':
            altflag = 1;
  1031fa:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103201:	e9 67 ff ff ff       	jmp    10316d <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  103206:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10320a:	79 12                	jns    10321e <vprintfmt+0x105>
                width = precision, precision = -1;
  10320c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10320f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103212:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103219:	e9 4f ff ff ff       	jmp    10316d <vprintfmt+0x54>
  10321e:	e9 4a ff ff ff       	jmp    10316d <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103223:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  103227:	e9 41 ff ff ff       	jmp    10316d <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  10322c:	8b 45 14             	mov    0x14(%ebp),%eax
  10322f:	8d 50 04             	lea    0x4(%eax),%edx
  103232:	89 55 14             	mov    %edx,0x14(%ebp)
  103235:	8b 00                	mov    (%eax),%eax
  103237:	8b 55 0c             	mov    0xc(%ebp),%edx
  10323a:	89 54 24 04          	mov    %edx,0x4(%esp)
  10323e:	89 04 24             	mov    %eax,(%esp)
  103241:	8b 45 08             	mov    0x8(%ebp),%eax
  103244:	ff d0                	call   *%eax
            break;
  103246:	e9 ac 02 00 00       	jmp    1034f7 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  10324b:	8b 45 14             	mov    0x14(%ebp),%eax
  10324e:	8d 50 04             	lea    0x4(%eax),%edx
  103251:	89 55 14             	mov    %edx,0x14(%ebp)
  103254:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103256:	85 db                	test   %ebx,%ebx
  103258:	79 02                	jns    10325c <vprintfmt+0x143>
                err = -err;
  10325a:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10325c:	83 fb 06             	cmp    $0x6,%ebx
  10325f:	7f 0b                	jg     10326c <vprintfmt+0x153>
  103261:	8b 34 9d 54 3d 10 00 	mov    0x103d54(,%ebx,4),%esi
  103268:	85 f6                	test   %esi,%esi
  10326a:	75 23                	jne    10328f <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  10326c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103270:	c7 44 24 08 81 3d 10 	movl   $0x103d81,0x8(%esp)
  103277:	00 
  103278:	8b 45 0c             	mov    0xc(%ebp),%eax
  10327b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10327f:	8b 45 08             	mov    0x8(%ebp),%eax
  103282:	89 04 24             	mov    %eax,(%esp)
  103285:	e8 61 fe ff ff       	call   1030eb <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10328a:	e9 68 02 00 00       	jmp    1034f7 <vprintfmt+0x3de>
                printfmt(putch, putdat, "%s", p);
  10328f:	89 74 24 0c          	mov    %esi,0xc(%esp)
  103293:	c7 44 24 08 8a 3d 10 	movl   $0x103d8a,0x8(%esp)
  10329a:	00 
  10329b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10329e:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a5:	89 04 24             	mov    %eax,(%esp)
  1032a8:	e8 3e fe ff ff       	call   1030eb <printfmt>
            break;
  1032ad:	e9 45 02 00 00       	jmp    1034f7 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032b2:	8b 45 14             	mov    0x14(%ebp),%eax
  1032b5:	8d 50 04             	lea    0x4(%eax),%edx
  1032b8:	89 55 14             	mov    %edx,0x14(%ebp)
  1032bb:	8b 30                	mov    (%eax),%esi
  1032bd:	85 f6                	test   %esi,%esi
  1032bf:	75 05                	jne    1032c6 <vprintfmt+0x1ad>
                p = "(null)";
  1032c1:	be 8d 3d 10 00       	mov    $0x103d8d,%esi
            }
            if (width > 0 && padc != '-') {
  1032c6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032ca:	7e 3e                	jle    10330a <vprintfmt+0x1f1>
  1032cc:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032d0:	74 38                	je     10330a <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032d2:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  1032d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032dc:	89 34 24             	mov    %esi,(%esp)
  1032df:	e8 dc f7 ff ff       	call   102ac0 <strnlen>
  1032e4:	29 c3                	sub    %eax,%ebx
  1032e6:	89 d8                	mov    %ebx,%eax
  1032e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032eb:	eb 17                	jmp    103304 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  1032ed:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032f4:	89 54 24 04          	mov    %edx,0x4(%esp)
  1032f8:	89 04 24             	mov    %eax,(%esp)
  1032fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1032fe:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103300:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103304:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103308:	7f e3                	jg     1032ed <vprintfmt+0x1d4>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10330a:	eb 38                	jmp    103344 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  10330c:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103310:	74 1f                	je     103331 <vprintfmt+0x218>
  103312:	83 fb 1f             	cmp    $0x1f,%ebx
  103315:	7e 05                	jle    10331c <vprintfmt+0x203>
  103317:	83 fb 7e             	cmp    $0x7e,%ebx
  10331a:	7e 15                	jle    103331 <vprintfmt+0x218>
                    putch('?', putdat);
  10331c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10331f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103323:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10332a:	8b 45 08             	mov    0x8(%ebp),%eax
  10332d:	ff d0                	call   *%eax
  10332f:	eb 0f                	jmp    103340 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  103331:	8b 45 0c             	mov    0xc(%ebp),%eax
  103334:	89 44 24 04          	mov    %eax,0x4(%esp)
  103338:	89 1c 24             	mov    %ebx,(%esp)
  10333b:	8b 45 08             	mov    0x8(%ebp),%eax
  10333e:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103340:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103344:	89 f0                	mov    %esi,%eax
  103346:	8d 70 01             	lea    0x1(%eax),%esi
  103349:	0f b6 00             	movzbl (%eax),%eax
  10334c:	0f be d8             	movsbl %al,%ebx
  10334f:	85 db                	test   %ebx,%ebx
  103351:	74 10                	je     103363 <vprintfmt+0x24a>
  103353:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103357:	78 b3                	js     10330c <vprintfmt+0x1f3>
  103359:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  10335d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103361:	79 a9                	jns    10330c <vprintfmt+0x1f3>
                }
            }
            for (; width > 0; width --) {
  103363:	eb 17                	jmp    10337c <vprintfmt+0x263>
                putch(' ', putdat);
  103365:	8b 45 0c             	mov    0xc(%ebp),%eax
  103368:	89 44 24 04          	mov    %eax,0x4(%esp)
  10336c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103373:	8b 45 08             	mov    0x8(%ebp),%eax
  103376:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  103378:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10337c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103380:	7f e3                	jg     103365 <vprintfmt+0x24c>
            }
            break;
  103382:	e9 70 01 00 00       	jmp    1034f7 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103387:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10338a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10338e:	8d 45 14             	lea    0x14(%ebp),%eax
  103391:	89 04 24             	mov    %eax,(%esp)
  103394:	e8 0b fd ff ff       	call   1030a4 <getint>
  103399:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10339c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10339f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033a5:	85 d2                	test   %edx,%edx
  1033a7:	79 26                	jns    1033cf <vprintfmt+0x2b6>
                putch('-', putdat);
  1033a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033b0:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ba:	ff d0                	call   *%eax
                num = -(long long)num;
  1033bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033c2:	f7 d8                	neg    %eax
  1033c4:	83 d2 00             	adc    $0x0,%edx
  1033c7:	f7 da                	neg    %edx
  1033c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033cc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033cf:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033d6:	e9 a8 00 00 00       	jmp    103483 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033db:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033de:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033e2:	8d 45 14             	lea    0x14(%ebp),%eax
  1033e5:	89 04 24             	mov    %eax,(%esp)
  1033e8:	e8 68 fc ff ff       	call   103055 <getuint>
  1033ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033f0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033f3:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033fa:	e9 84 00 00 00       	jmp    103483 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1033ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103402:	89 44 24 04          	mov    %eax,0x4(%esp)
  103406:	8d 45 14             	lea    0x14(%ebp),%eax
  103409:	89 04 24             	mov    %eax,(%esp)
  10340c:	e8 44 fc ff ff       	call   103055 <getuint>
  103411:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103414:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103417:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10341e:	eb 63                	jmp    103483 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  103420:	8b 45 0c             	mov    0xc(%ebp),%eax
  103423:	89 44 24 04          	mov    %eax,0x4(%esp)
  103427:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  10342e:	8b 45 08             	mov    0x8(%ebp),%eax
  103431:	ff d0                	call   *%eax
            putch('x', putdat);
  103433:	8b 45 0c             	mov    0xc(%ebp),%eax
  103436:	89 44 24 04          	mov    %eax,0x4(%esp)
  10343a:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103441:	8b 45 08             	mov    0x8(%ebp),%eax
  103444:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103446:	8b 45 14             	mov    0x14(%ebp),%eax
  103449:	8d 50 04             	lea    0x4(%eax),%edx
  10344c:	89 55 14             	mov    %edx,0x14(%ebp)
  10344f:	8b 00                	mov    (%eax),%eax
  103451:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103454:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10345b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103462:	eb 1f                	jmp    103483 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103464:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103467:	89 44 24 04          	mov    %eax,0x4(%esp)
  10346b:	8d 45 14             	lea    0x14(%ebp),%eax
  10346e:	89 04 24             	mov    %eax,(%esp)
  103471:	e8 df fb ff ff       	call   103055 <getuint>
  103476:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103479:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10347c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103483:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103487:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10348a:	89 54 24 18          	mov    %edx,0x18(%esp)
  10348e:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103491:	89 54 24 14          	mov    %edx,0x14(%esp)
  103495:	89 44 24 10          	mov    %eax,0x10(%esp)
  103499:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10349c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10349f:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034a3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b1:	89 04 24             	mov    %eax,(%esp)
  1034b4:	e8 97 fa ff ff       	call   102f50 <printnum>
            break;
  1034b9:	eb 3c                	jmp    1034f7 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034c2:	89 1c 24             	mov    %ebx,(%esp)
  1034c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c8:	ff d0                	call   *%eax
            break;
  1034ca:	eb 2b                	jmp    1034f7 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034d3:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034da:	8b 45 08             	mov    0x8(%ebp),%eax
  1034dd:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034df:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1034e3:	eb 04                	jmp    1034e9 <vprintfmt+0x3d0>
  1034e5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1034e9:	8b 45 10             	mov    0x10(%ebp),%eax
  1034ec:	83 e8 01             	sub    $0x1,%eax
  1034ef:	0f b6 00             	movzbl (%eax),%eax
  1034f2:	3c 25                	cmp    $0x25,%al
  1034f4:	75 ef                	jne    1034e5 <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  1034f6:	90                   	nop
        }
    }
  1034f7:	90                   	nop
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1034f8:	e9 3e fc ff ff       	jmp    10313b <vprintfmt+0x22>
}
  1034fd:	83 c4 40             	add    $0x40,%esp
  103500:	5b                   	pop    %ebx
  103501:	5e                   	pop    %esi
  103502:	5d                   	pop    %ebp
  103503:	c3                   	ret    

00103504 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103504:	55                   	push   %ebp
  103505:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103507:	8b 45 0c             	mov    0xc(%ebp),%eax
  10350a:	8b 40 08             	mov    0x8(%eax),%eax
  10350d:	8d 50 01             	lea    0x1(%eax),%edx
  103510:	8b 45 0c             	mov    0xc(%ebp),%eax
  103513:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103516:	8b 45 0c             	mov    0xc(%ebp),%eax
  103519:	8b 10                	mov    (%eax),%edx
  10351b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10351e:	8b 40 04             	mov    0x4(%eax),%eax
  103521:	39 c2                	cmp    %eax,%edx
  103523:	73 12                	jae    103537 <sprintputch+0x33>
        *b->buf ++ = ch;
  103525:	8b 45 0c             	mov    0xc(%ebp),%eax
  103528:	8b 00                	mov    (%eax),%eax
  10352a:	8d 48 01             	lea    0x1(%eax),%ecx
  10352d:	8b 55 0c             	mov    0xc(%ebp),%edx
  103530:	89 0a                	mov    %ecx,(%edx)
  103532:	8b 55 08             	mov    0x8(%ebp),%edx
  103535:	88 10                	mov    %dl,(%eax)
    }
}
  103537:	5d                   	pop    %ebp
  103538:	c3                   	ret    

00103539 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103539:	55                   	push   %ebp
  10353a:	89 e5                	mov    %esp,%ebp
  10353c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10353f:	8d 45 14             	lea    0x14(%ebp),%eax
  103542:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103545:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103548:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10354c:	8b 45 10             	mov    0x10(%ebp),%eax
  10354f:	89 44 24 08          	mov    %eax,0x8(%esp)
  103553:	8b 45 0c             	mov    0xc(%ebp),%eax
  103556:	89 44 24 04          	mov    %eax,0x4(%esp)
  10355a:	8b 45 08             	mov    0x8(%ebp),%eax
  10355d:	89 04 24             	mov    %eax,(%esp)
  103560:	e8 08 00 00 00       	call   10356d <vsnprintf>
  103565:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103568:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10356b:	c9                   	leave  
  10356c:	c3                   	ret    

0010356d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10356d:	55                   	push   %ebp
  10356e:	89 e5                	mov    %esp,%ebp
  103570:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103573:	8b 45 08             	mov    0x8(%ebp),%eax
  103576:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103579:	8b 45 0c             	mov    0xc(%ebp),%eax
  10357c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10357f:	8b 45 08             	mov    0x8(%ebp),%eax
  103582:	01 d0                	add    %edx,%eax
  103584:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103587:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10358e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103592:	74 0a                	je     10359e <vsnprintf+0x31>
  103594:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103597:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10359a:	39 c2                	cmp    %eax,%edx
  10359c:	76 07                	jbe    1035a5 <vsnprintf+0x38>
        return -E_INVAL;
  10359e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035a3:	eb 2a                	jmp    1035cf <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035a5:	8b 45 14             	mov    0x14(%ebp),%eax
  1035a8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035ac:	8b 45 10             	mov    0x10(%ebp),%eax
  1035af:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035b3:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035b6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035ba:	c7 04 24 04 35 10 00 	movl   $0x103504,(%esp)
  1035c1:	e8 53 fb ff ff       	call   103119 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035c9:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035cf:	c9                   	leave  
  1035d0:	c3                   	ret    
