	.file	"devicetable-offsets.c"
# GNU C89 (Gentoo 10.1.0 p1) version 10.1.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 10.1.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -nostdinc -I ./arch/x86/include
# -I ./arch/x86/include/generated -I ./include -I ./arch/x86/include/uapi
# -I ./arch/x86/include/generated/uapi -I ./include/uapi
# -I ./include/generated/uapi -D __KERNEL__ -D CONFIG_X86_X32_ABI
# -D CONFIG_AS_CFI=1 -D CONFIG_AS_CFI_SIGNAL_FRAME=1
# -D CONFIG_AS_CFI_SECTIONS=1 -D CONFIG_AS_SSSE3=1 -D CONFIG_AS_AVX=1
# -D CONFIG_AS_AVX2=1 -D CONFIG_AS_AVX512=1 -D CONFIG_AS_SHA1_NI=1
# -D CONFIG_AS_SHA256_NI=1 -D CONFIG_AS_ADX=1 -D CC_USING_FENTRY
# -D KBUILD_MODFILE="scripts/mod/devicetable-offsets"
# -D KBUILD_BASENAME="devicetable_offsets"
# -D KBUILD_MODNAME="devicetable_offsets"
# -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/10.1.0/include
# -include ./include/linux/kconfig.h
# -include ./include/linux/compiler_types.h
# -MD scripts/mod/.devicetable-offsets.s.d
# scripts/mod/devicetable-offsets.c -march=znver2 -msse3 -mssse3 -msse4a
# -mcx16 -msahf -mmovbe -maes -msha -mpclmul -mpopcnt -mabm -mno-lwp -mfma
# -mno-fma4 -mno-xop -mbmi -mno-sgx -mbmi2 -mno-pconfig -mwbnoinvd -mno-tbm
# -mavx2 -msse4.2 -msse4.1 -mlzcnt -mno-rtm -mno-hle -mrdrnd -mf16c
# -mfsgsbase -mrdseed -mprfchw -madx -mfxsr -mxsave -mxsaveopt -mno-avx512f
# -mno-avx512er -mno-avx512cd -mno-avx512pf -mno-prefetchwt1 -mclflushopt
# -mxsavec -mxsaves -mno-avx512dq -mno-avx512bw -mno-avx512vl
# -mno-avx512ifma -mno-avx512vbmi -mno-avx5124fmaps -mno-avx5124vnniw
# -mclwb -mmwaitx -mclzero -mno-pku -mrdpid -mno-gfni -mno-shstk
# -mno-avx512vbmi2 -mno-avx512vnni -mno-vaes -mno-vpclmulqdq
# -mno-avx512bitalg -mno-movdiri -mno-movdir64b -mno-waitpkg -mno-cldemote
# -mno-ptwrite -mno-avx512bf16 -mno-enqcmd -mno-avx512vp2intersect
# --param=l1-cache-size=32 --param=l1-cache-line-size=64
# --param=l2-cache-size=512 -mtune=znver2 -mno-sse -mno-mmx -mno-sse2
# -mno-3dnow -mno-avx -m64 -mno-80387 -mno-fp-ret-in-387
# -mpreferred-stack-boundary=3 -mskip-rax-setup -mno-red-zone
# -mcmodel=kernel -mindirect-branch=thunk-extern -mindirect-branch-register
# -mrecord-mcount -mfentry -auxbase-strip scripts/mod/devicetable-offsets.s
# -O2 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs
# -Werror=implicit-function-declaration -Werror=implicit-int
# -Wno-format-security -Wno-sign-compare -Wno-frame-address
# -Wformat-truncation=0 -Wformat-overflow=0 -Wno-address-of-packed-member
# -Wframe-larger-than=1024 -Wno-unused-but-set-variable
# -Wimplicit-fallthrough=3 -Wunused-const-variable=0
# -Wdeclaration-after-statement -Wvla -Wno-pointer-sign
# -Wno-stringop-truncation -Werror=date-time
# -Werror=incompatible-pointer-types -Werror=designated-init
# -Wno-packed-not-aligned -Wno-maybe-uninitialized -std=gnu90 -p
# -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -falign-jumps=1
# -falign-loops=1 -fno-asynchronous-unwind-tables -fno-jump-tables
# -fno-delete-null-pointer-checks -fstack-protector-strong
# -flive-patching=inline-clone -fno-strict-overflow
# -fno-merge-all-constants -fmerge-constants -fstack-check=no
# -fconserve-stack -fmacro-prefix-map=./= -fcf-protection=none
# -fprofile-arcs -ftest-coverage -fno-tree-loop-im -fverbose-asm
# options enabled:  -faggressive-loop-optimizations -falign-functions
# -falign-jumps -falign-labels -falign-loops -fallocation-dce
# -fauto-inc-dec -fbranch-count-reg -fcaller-saves -fcode-hoisting
# -fcombine-stack-adjustments -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-symbols -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -fgcse -fgcse-lm -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-profile -fipa-sra -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fisolate-erroneous-paths-dereference -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse -flra-remat
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -fprofile -fprofile-arcs -free -freg-struct-return
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstack-protector-strong
# -fstdarg-opt -fstore-merging -fstrict-volatile-bitfields -fsync-libcalls
# -ftest-coverage -fthread-jumps -ftoplevel-reorder -ftrapping-math
# -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
# -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
# -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
# -ftree-sink -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time -fverbose-asm
# -fwrapv -fwrapv-pointer -fzero-initialized-in-bss -m128bit-long-double
# -m64 -mabm -madx -maes -malign-stringops -mbmi -mbmi2 -mclflushopt -mclwb
# -mclzero -mcx16 -mfentry -mfsgsbase -mfxsr -mglibc -mieee-fp
# -mindirect-branch-register -mlong-double-80 -mlzcnt -mmovbe -mmwaitx
# -mno-fancy-math-387 -mno-red-zone -mno-sse4 -mpclmul -mpopcnt -mprfchw
# -mpush-args -mrdpid -mrdrnd -mrdseed -mrecord-mcount -msahf -msha
# -mskip-rax-setup -mtls-direct-seg-refs -mvzeroupper -mwbnoinvd

	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
1:	call	__fentry__
	.section __mcount_loc, "a",@progbits
	.quad 1b
	.previous
	incq	__gcov0.main(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:11: 	DEVID(usb_device_id);
#APP
# 11 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_usb_device_id $32 sizeof(struct usb_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+8(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:12: 	DEVID_FIELD(usb_device_id, match_flags);
#APP
# 12 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_match_flags $0 offsetof(struct usb_device_id, match_flags)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+16(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:13: 	DEVID_FIELD(usb_device_id, idVendor);
#APP
# 13 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_idVendor $2 offsetof(struct usb_device_id, idVendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+24(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:14: 	DEVID_FIELD(usb_device_id, idProduct);
#APP
# 14 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_idProduct $4 offsetof(struct usb_device_id, idProduct)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+32(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:15: 	DEVID_FIELD(usb_device_id, bcdDevice_lo);
#APP
# 15 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bcdDevice_lo $6 offsetof(struct usb_device_id, bcdDevice_lo)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+40(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:16: 	DEVID_FIELD(usb_device_id, bcdDevice_hi);
#APP
# 16 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bcdDevice_hi $8 offsetof(struct usb_device_id, bcdDevice_hi)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+48(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:17: 	DEVID_FIELD(usb_device_id, bDeviceClass);
#APP
# 17 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bDeviceClass $10 offsetof(struct usb_device_id, bDeviceClass)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+56(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:18: 	DEVID_FIELD(usb_device_id, bDeviceSubClass);
#APP
# 18 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bDeviceSubClass $11 offsetof(struct usb_device_id, bDeviceSubClass)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+64(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:19: 	DEVID_FIELD(usb_device_id, bDeviceProtocol);
#APP
# 19 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bDeviceProtocol $12 offsetof(struct usb_device_id, bDeviceProtocol)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+72(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:20: 	DEVID_FIELD(usb_device_id, bInterfaceClass);
#APP
# 20 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceClass $13 offsetof(struct usb_device_id, bInterfaceClass)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+80(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:21: 	DEVID_FIELD(usb_device_id, bInterfaceSubClass);
#APP
# 21 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceSubClass $14 offsetof(struct usb_device_id, bInterfaceSubClass)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+88(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:22: 	DEVID_FIELD(usb_device_id, bInterfaceProtocol);
#APP
# 22 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceProtocol $15 offsetof(struct usb_device_id, bInterfaceProtocol)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+96(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:23: 	DEVID_FIELD(usb_device_id, bInterfaceNumber);
#APP
# 23 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceNumber $16 offsetof(struct usb_device_id, bInterfaceNumber)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+104(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:25: 	DEVID(hid_device_id);
#APP
# 25 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_hid_device_id $24 sizeof(struct hid_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+112(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:26: 	DEVID_FIELD(hid_device_id, bus);
#APP
# 26 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_bus $0 offsetof(struct hid_device_id, bus)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+120(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:27: 	DEVID_FIELD(hid_device_id, group);
#APP
# 27 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_group $2 offsetof(struct hid_device_id, group)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+128(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:28: 	DEVID_FIELD(hid_device_id, vendor);
#APP
# 28 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_vendor $4 offsetof(struct hid_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+136(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:29: 	DEVID_FIELD(hid_device_id, product);
#APP
# 29 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_product $8 offsetof(struct hid_device_id, product)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+144(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:31: 	DEVID(ieee1394_device_id);
#APP
# 31 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ieee1394_device_id $32 sizeof(struct ieee1394_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+152(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:32: 	DEVID_FIELD(ieee1394_device_id, match_flags);
#APP
# 32 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_match_flags $0 offsetof(struct ieee1394_device_id, match_flags)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+160(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:33: 	DEVID_FIELD(ieee1394_device_id, vendor_id);
#APP
# 33 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_vendor_id $4 offsetof(struct ieee1394_device_id, vendor_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+168(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:34: 	DEVID_FIELD(ieee1394_device_id, model_id);
#APP
# 34 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_model_id $8 offsetof(struct ieee1394_device_id, model_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+176(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:35: 	DEVID_FIELD(ieee1394_device_id, specifier_id);
#APP
# 35 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_specifier_id $12 offsetof(struct ieee1394_device_id, specifier_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+184(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:36: 	DEVID_FIELD(ieee1394_device_id, version);
#APP
# 36 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_version $16 offsetof(struct ieee1394_device_id, version)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+192(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:38: 	DEVID(pci_device_id);
#APP
# 38 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pci_device_id $32 sizeof(struct pci_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+200(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:39: 	DEVID_FIELD(pci_device_id, vendor);
#APP
# 39 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_vendor $0 offsetof(struct pci_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+208(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:40: 	DEVID_FIELD(pci_device_id, device);
#APP
# 40 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_device $4 offsetof(struct pci_device_id, device)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+216(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:41: 	DEVID_FIELD(pci_device_id, subvendor);
#APP
# 41 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_subvendor $8 offsetof(struct pci_device_id, subvendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+224(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:42: 	DEVID_FIELD(pci_device_id, subdevice);
#APP
# 42 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_subdevice $12 offsetof(struct pci_device_id, subdevice)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+232(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:43: 	DEVID_FIELD(pci_device_id, class);
#APP
# 43 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_class $16 offsetof(struct pci_device_id, class)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+240(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:44: 	DEVID_FIELD(pci_device_id, class_mask);
#APP
# 44 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_class_mask $20 offsetof(struct pci_device_id, class_mask)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+248(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:46: 	DEVID(ccw_device_id);
#APP
# 46 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ccw_device_id $16 sizeof(struct ccw_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+256(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:47: 	DEVID_FIELD(ccw_device_id, match_flags);
#APP
# 47 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_match_flags $0 offsetof(struct ccw_device_id, match_flags)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+264(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:48: 	DEVID_FIELD(ccw_device_id, cu_type);
#APP
# 48 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_cu_type $2 offsetof(struct ccw_device_id, cu_type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+272(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:49: 	DEVID_FIELD(ccw_device_id, cu_model);
#APP
# 49 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_cu_model $6 offsetof(struct ccw_device_id, cu_model)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+280(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:50: 	DEVID_FIELD(ccw_device_id, dev_type);
#APP
# 50 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_dev_type $4 offsetof(struct ccw_device_id, dev_type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+288(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:51: 	DEVID_FIELD(ccw_device_id, dev_model);
#APP
# 51 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_dev_model $7 offsetof(struct ccw_device_id, dev_model)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+296(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:53: 	DEVID(ap_device_id);
#APP
# 53 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ap_device_id $16 sizeof(struct ap_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+304(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:54: 	DEVID_FIELD(ap_device_id, dev_type);
#APP
# 54 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ap_device_id_dev_type $2 offsetof(struct ap_device_id, dev_type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+312(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:56: 	DEVID(css_device_id);
#APP
# 56 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_css_device_id $16 sizeof(struct css_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+320(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:57: 	DEVID_FIELD(css_device_id, type);
#APP
# 57 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_css_device_id_type $1 offsetof(struct css_device_id, type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+328(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:59: 	DEVID(serio_device_id);
#APP
# 59 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_serio_device_id $4 sizeof(struct serio_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+336(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:60: 	DEVID_FIELD(serio_device_id, type);
#APP
# 60 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_type $0 offsetof(struct serio_device_id, type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+344(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:61: 	DEVID_FIELD(serio_device_id, proto);
#APP
# 61 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_proto $3 offsetof(struct serio_device_id, proto)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+352(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:62: 	DEVID_FIELD(serio_device_id, id);
#APP
# 62 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_id $2 offsetof(struct serio_device_id, id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+360(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:63: 	DEVID_FIELD(serio_device_id, extra);
#APP
# 63 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_extra $1 offsetof(struct serio_device_id, extra)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+368(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:65: 	DEVID(acpi_device_id);
#APP
# 65 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_acpi_device_id $32 sizeof(struct acpi_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+376(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:66: 	DEVID_FIELD(acpi_device_id, id);
#APP
# 66 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_acpi_device_id_id $0 offsetof(struct acpi_device_id, id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+384(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:67: 	DEVID_FIELD(acpi_device_id, cls);
#APP
# 67 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_acpi_device_id_cls $24 offsetof(struct acpi_device_id, cls)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+392(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:68: 	DEVID_FIELD(acpi_device_id, cls_msk);
#APP
# 68 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_acpi_device_id_cls_msk $28 offsetof(struct acpi_device_id, cls_msk)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+400(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:70: 	DEVID(pnp_device_id);
#APP
# 70 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pnp_device_id $16 sizeof(struct pnp_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+408(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:71: 	DEVID_FIELD(pnp_device_id, id);
#APP
# 71 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pnp_device_id_id $0 offsetof(struct pnp_device_id, id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+416(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:73: 	DEVID(pnp_card_device_id);
#APP
# 73 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pnp_card_device_id $80 sizeof(struct pnp_card_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+424(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:74: 	DEVID_FIELD(pnp_card_device_id, devs);
#APP
# 74 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pnp_card_device_id_devs $16 offsetof(struct pnp_card_device_id, devs)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+432(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:76: 	DEVID(pcmcia_device_id);
#APP
# 76 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pcmcia_device_id $80 sizeof(struct pcmcia_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+440(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:77: 	DEVID_FIELD(pcmcia_device_id, match_flags);
#APP
# 77 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_match_flags $0 offsetof(struct pcmcia_device_id, match_flags)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+448(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:78: 	DEVID_FIELD(pcmcia_device_id, manf_id);
#APP
# 78 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_manf_id $2 offsetof(struct pcmcia_device_id, manf_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+456(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:79: 	DEVID_FIELD(pcmcia_device_id, card_id);
#APP
# 79 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_card_id $4 offsetof(struct pcmcia_device_id, card_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+464(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:80: 	DEVID_FIELD(pcmcia_device_id, func_id);
#APP
# 80 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_func_id $6 offsetof(struct pcmcia_device_id, func_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+472(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:81: 	DEVID_FIELD(pcmcia_device_id, function);
#APP
# 81 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_function $7 offsetof(struct pcmcia_device_id, function)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+480(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:82: 	DEVID_FIELD(pcmcia_device_id, device_no);
#APP
# 82 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_device_no $8 offsetof(struct pcmcia_device_id, device_no)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+488(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:83: 	DEVID_FIELD(pcmcia_device_id, prod_id_hash);
#APP
# 83 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_prod_id_hash $12 offsetof(struct pcmcia_device_id, prod_id_hash)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+496(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:85: 	DEVID(of_device_id);
#APP
# 85 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_of_device_id $200 sizeof(struct of_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+504(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:86: 	DEVID_FIELD(of_device_id, name);
#APP
# 86 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_of_device_id_name $0 offsetof(struct of_device_id, name)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+512(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:87: 	DEVID_FIELD(of_device_id, type);
#APP
# 87 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_of_device_id_type $32 offsetof(struct of_device_id, type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+520(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:88: 	DEVID_FIELD(of_device_id, compatible);
#APP
# 88 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_of_device_id_compatible $64 offsetof(struct of_device_id, compatible)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+528(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:90: 	DEVID(vio_device_id);
#APP
# 90 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_vio_device_id $64 sizeof(struct vio_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+536(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:91: 	DEVID_FIELD(vio_device_id, type);
#APP
# 91 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_vio_device_id_type $0 offsetof(struct vio_device_id, type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+544(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:92: 	DEVID_FIELD(vio_device_id, compat);
#APP
# 92 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_vio_device_id_compat $32 offsetof(struct vio_device_id, compat)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+552(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:94: 	DEVID(input_device_id);
#APP
# 94 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_input_device_id $200 sizeof(struct input_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+560(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:95: 	DEVID_FIELD(input_device_id, flags);
#APP
# 95 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_flags $0 offsetof(struct input_device_id, flags)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+568(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:96: 	DEVID_FIELD(input_device_id, bustype);
#APP
# 96 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_bustype $8 offsetof(struct input_device_id, bustype)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+576(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:97: 	DEVID_FIELD(input_device_id, vendor);
#APP
# 97 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_vendor $10 offsetof(struct input_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+584(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:98: 	DEVID_FIELD(input_device_id, product);
#APP
# 98 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_product $12 offsetof(struct input_device_id, product)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+592(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:99: 	DEVID_FIELD(input_device_id, version);
#APP
# 99 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_version $14 offsetof(struct input_device_id, version)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+600(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:100: 	DEVID_FIELD(input_device_id, evbit);
#APP
# 100 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_evbit $16 offsetof(struct input_device_id, evbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+608(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:101: 	DEVID_FIELD(input_device_id, keybit);
#APP
# 101 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_keybit $24 offsetof(struct input_device_id, keybit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+616(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:102: 	DEVID_FIELD(input_device_id, relbit);
#APP
# 102 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_relbit $120 offsetof(struct input_device_id, relbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+624(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:103: 	DEVID_FIELD(input_device_id, absbit);
#APP
# 103 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_absbit $128 offsetof(struct input_device_id, absbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+632(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:104: 	DEVID_FIELD(input_device_id, mscbit);
#APP
# 104 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_mscbit $136 offsetof(struct input_device_id, mscbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+640(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:105: 	DEVID_FIELD(input_device_id, ledbit);
#APP
# 105 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_ledbit $144 offsetof(struct input_device_id, ledbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+648(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:106: 	DEVID_FIELD(input_device_id, sndbit);
#APP
# 106 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_sndbit $152 offsetof(struct input_device_id, sndbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+656(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:107: 	DEVID_FIELD(input_device_id, ffbit);
#APP
# 107 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_ffbit $160 offsetof(struct input_device_id, ffbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+664(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:108: 	DEVID_FIELD(input_device_id, swbit);
#APP
# 108 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_swbit $176 offsetof(struct input_device_id, swbit)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+672(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:110: 	DEVID(eisa_device_id);
#APP
# 110 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_eisa_device_id $16 sizeof(struct eisa_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+680(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:111: 	DEVID_FIELD(eisa_device_id, sig);
#APP
# 111 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_eisa_device_id_sig $0 offsetof(struct eisa_device_id, sig)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+688(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:113: 	DEVID(parisc_device_id);
#APP
# 113 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_parisc_device_id $8 sizeof(struct parisc_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+696(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:114: 	DEVID_FIELD(parisc_device_id, hw_type);
#APP
# 114 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_hw_type $0 offsetof(struct parisc_device_id, hw_type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+704(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:115: 	DEVID_FIELD(parisc_device_id, hversion);
#APP
# 115 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_hversion $2 offsetof(struct parisc_device_id, hversion)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+712(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:116: 	DEVID_FIELD(parisc_device_id, hversion_rev);
#APP
# 116 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_hversion_rev $1 offsetof(struct parisc_device_id, hversion_rev)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+720(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:117: 	DEVID_FIELD(parisc_device_id, sversion);
#APP
# 117 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_sversion $4 offsetof(struct parisc_device_id, sversion)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+728(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:119: 	DEVID(sdio_device_id);
#APP
# 119 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_sdio_device_id $16 sizeof(struct sdio_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+736(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:120: 	DEVID_FIELD(sdio_device_id, class);
#APP
# 120 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdio_device_id_class $0 offsetof(struct sdio_device_id, class)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+744(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:121: 	DEVID_FIELD(sdio_device_id, vendor);
#APP
# 121 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdio_device_id_vendor $2 offsetof(struct sdio_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+752(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:122: 	DEVID_FIELD(sdio_device_id, device);
#APP
# 122 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdio_device_id_device $4 offsetof(struct sdio_device_id, device)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+760(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:124: 	DEVID(ssb_device_id);
#APP
# 124 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ssb_device_id $6 sizeof(struct ssb_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+768(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:125: 	DEVID_FIELD(ssb_device_id, vendor);
#APP
# 125 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ssb_device_id_vendor $0 offsetof(struct ssb_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+776(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:126: 	DEVID_FIELD(ssb_device_id, coreid);
#APP
# 126 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ssb_device_id_coreid $2 offsetof(struct ssb_device_id, coreid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+784(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:127: 	DEVID_FIELD(ssb_device_id, revision);
#APP
# 127 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ssb_device_id_revision $4 offsetof(struct ssb_device_id, revision)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+792(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:129: 	DEVID(bcma_device_id);
#APP
# 129 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_bcma_device_id $6 sizeof(struct bcma_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+800(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:130: 	DEVID_FIELD(bcma_device_id, manuf);
#APP
# 130 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_manuf $0 offsetof(struct bcma_device_id, manuf)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+808(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:131: 	DEVID_FIELD(bcma_device_id, id);
#APP
# 131 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_id $2 offsetof(struct bcma_device_id, id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+816(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:132: 	DEVID_FIELD(bcma_device_id, rev);
#APP
# 132 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_rev $4 offsetof(struct bcma_device_id, rev)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+824(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:133: 	DEVID_FIELD(bcma_device_id, class);
#APP
# 133 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_class $5 offsetof(struct bcma_device_id, class)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+832(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:135: 	DEVID(virtio_device_id);
#APP
# 135 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_virtio_device_id $8 sizeof(struct virtio_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+840(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:136: 	DEVID_FIELD(virtio_device_id, device);
#APP
# 136 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_virtio_device_id_device $0 offsetof(struct virtio_device_id, device)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+848(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:137: 	DEVID_FIELD(virtio_device_id, vendor);
#APP
# 137 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_virtio_device_id_vendor $4 offsetof(struct virtio_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+856(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:139: 	DEVID(hv_vmbus_device_id);
#APP
# 139 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_hv_vmbus_device_id $24 sizeof(struct hv_vmbus_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+864(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:140: 	DEVID_FIELD(hv_vmbus_device_id, guid);
#APP
# 140 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hv_vmbus_device_id_guid $0 offsetof(struct hv_vmbus_device_id, guid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+872(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:142: 	DEVID(rpmsg_device_id);
#APP
# 142 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_rpmsg_device_id $32 sizeof(struct rpmsg_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+880(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:143: 	DEVID_FIELD(rpmsg_device_id, name);
#APP
# 143 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rpmsg_device_id_name $0 offsetof(struct rpmsg_device_id, name)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+888(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:145: 	DEVID(i2c_device_id);
#APP
# 145 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_i2c_device_id $32 sizeof(struct i2c_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+896(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:146: 	DEVID_FIELD(i2c_device_id, name);
#APP
# 146 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_i2c_device_id_name $0 offsetof(struct i2c_device_id, name)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+904(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:148: 	DEVID(spi_device_id);
#APP
# 148 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_spi_device_id $40 sizeof(struct spi_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+912(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:149: 	DEVID_FIELD(spi_device_id, name);
#APP
# 149 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_spi_device_id_name $0 offsetof(struct spi_device_id, name)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+920(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:151: 	DEVID(dmi_system_id);
#APP
# 151 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_dmi_system_id $344 sizeof(struct dmi_system_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+928(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:152: 	DEVID_FIELD(dmi_system_id, matches);
#APP
# 152 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_dmi_system_id_matches $16 offsetof(struct dmi_system_id, matches)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+936(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:154: 	DEVID(platform_device_id);
#APP
# 154 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_platform_device_id $32 sizeof(struct platform_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+944(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:155: 	DEVID_FIELD(platform_device_id, name);
#APP
# 155 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_platform_device_id_name $0 offsetof(struct platform_device_id, name)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+952(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:157: 	DEVID(mdio_device_id);
#APP
# 157 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_mdio_device_id $8 sizeof(struct mdio_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+960(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:158: 	DEVID_FIELD(mdio_device_id, phy_id);
#APP
# 158 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mdio_device_id_phy_id $0 offsetof(struct mdio_device_id, phy_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+968(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:159: 	DEVID_FIELD(mdio_device_id, phy_id_mask);
#APP
# 159 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mdio_device_id_phy_id_mask $4 offsetof(struct mdio_device_id, phy_id_mask)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+976(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:161: 	DEVID(zorro_device_id);
#APP
# 161 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_zorro_device_id $16 sizeof(struct zorro_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+984(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:162: 	DEVID_FIELD(zorro_device_id, id);
#APP
# 162 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_zorro_device_id_id $0 offsetof(struct zorro_device_id, id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+992(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:164: 	DEVID(isapnp_device_id);
#APP
# 164 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_isapnp_device_id $16 sizeof(struct isapnp_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1000(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:165: 	DEVID_FIELD(isapnp_device_id, vendor);
#APP
# 165 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_isapnp_device_id_vendor $4 offsetof(struct isapnp_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1008(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:166: 	DEVID_FIELD(isapnp_device_id, function);
#APP
# 166 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_isapnp_device_id_function $6 offsetof(struct isapnp_device_id, function)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1016(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:168: 	DEVID(ipack_device_id);
#APP
# 168 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ipack_device_id $12 sizeof(struct ipack_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1024(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:169: 	DEVID_FIELD(ipack_device_id, format);
#APP
# 169 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ipack_device_id_format $0 offsetof(struct ipack_device_id, format)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1032(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:170: 	DEVID_FIELD(ipack_device_id, vendor);
#APP
# 170 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ipack_device_id_vendor $4 offsetof(struct ipack_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1040(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:171: 	DEVID_FIELD(ipack_device_id, device);
#APP
# 171 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ipack_device_id_device $8 offsetof(struct ipack_device_id, device)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1048(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:173: 	DEVID(amba_id);
#APP
# 173 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_amba_id $16 sizeof(struct amba_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1056(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:174: 	DEVID_FIELD(amba_id, id);
#APP
# 174 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_amba_id_id $0 offsetof(struct amba_id, id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1064(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:175: 	DEVID_FIELD(amba_id, mask);
#APP
# 175 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_amba_id_mask $4 offsetof(struct amba_id, mask)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1072(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:177: 	DEVID(mips_cdmm_device_id);
#APP
# 177 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_mips_cdmm_device_id $1 sizeof(struct mips_cdmm_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1080(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:178: 	DEVID_FIELD(mips_cdmm_device_id, type);
#APP
# 178 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mips_cdmm_device_id_type $0 offsetof(struct mips_cdmm_device_id, type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1088(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:180: 	DEVID(x86_cpu_id);
#APP
# 180 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_x86_cpu_id $16 sizeof(struct x86_cpu_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1096(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:181: 	DEVID_FIELD(x86_cpu_id, feature);
#APP
# 181 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_feature $6 offsetof(struct x86_cpu_id, feature)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1104(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:182: 	DEVID_FIELD(x86_cpu_id, family);
#APP
# 182 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_family $2 offsetof(struct x86_cpu_id, family)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1112(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:183: 	DEVID_FIELD(x86_cpu_id, model);
#APP
# 183 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_model $4 offsetof(struct x86_cpu_id, model)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1120(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:184: 	DEVID_FIELD(x86_cpu_id, vendor);
#APP
# 184 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_vendor $0 offsetof(struct x86_cpu_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1128(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:186: 	DEVID(cpu_feature);
#APP
# 186 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_cpu_feature $2 sizeof(struct cpu_feature)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1136(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:187: 	DEVID_FIELD(cpu_feature, feature);
#APP
# 187 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_cpu_feature_feature $0 offsetof(struct cpu_feature, feature)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1144(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:189: 	DEVID(mei_cl_device_id);
#APP
# 189 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_mei_cl_device_id $64 sizeof(struct mei_cl_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1152(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:190: 	DEVID_FIELD(mei_cl_device_id, name);
#APP
# 190 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mei_cl_device_id_name $0 offsetof(struct mei_cl_device_id, name)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1160(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:191: 	DEVID_FIELD(mei_cl_device_id, uuid);
#APP
# 191 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mei_cl_device_id_uuid $32 offsetof(struct mei_cl_device_id, uuid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1168(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:192: 	DEVID_FIELD(mei_cl_device_id, version);
#APP
# 192 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mei_cl_device_id_version $48 offsetof(struct mei_cl_device_id, version)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1176(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:194: 	DEVID(rio_device_id);
#APP
# 194 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_rio_device_id $8 sizeof(struct rio_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1184(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:195: 	DEVID_FIELD(rio_device_id, did);
#APP
# 195 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_did $0 offsetof(struct rio_device_id, did)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1192(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:196: 	DEVID_FIELD(rio_device_id, vid);
#APP
# 196 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_vid $2 offsetof(struct rio_device_id, vid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1200(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:197: 	DEVID_FIELD(rio_device_id, asm_did);
#APP
# 197 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_asm_did $4 offsetof(struct rio_device_id, asm_did)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1208(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:198: 	DEVID_FIELD(rio_device_id, asm_vid);
#APP
# 198 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_asm_vid $6 offsetof(struct rio_device_id, asm_vid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1216(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:200: 	DEVID(ulpi_device_id);
#APP
# 200 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ulpi_device_id $16 sizeof(struct ulpi_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1224(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:201: 	DEVID_FIELD(ulpi_device_id, vendor);
#APP
# 201 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ulpi_device_id_vendor $0 offsetof(struct ulpi_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1232(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:202: 	DEVID_FIELD(ulpi_device_id, product);
#APP
# 202 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ulpi_device_id_product $2 offsetof(struct ulpi_device_id, product)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1240(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:204: 	DEVID(hda_device_id);
#APP
# 204 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_hda_device_id $32 sizeof(struct hda_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1248(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:205: 	DEVID_FIELD(hda_device_id, vendor_id);
#APP
# 205 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hda_device_id_vendor_id $0 offsetof(struct hda_device_id, vendor_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1256(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:206: 	DEVID_FIELD(hda_device_id, rev_id);
#APP
# 206 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hda_device_id_rev_id $4 offsetof(struct hda_device_id, rev_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1264(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:207: 	DEVID_FIELD(hda_device_id, api_version);
#APP
# 207 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hda_device_id_api_version $8 offsetof(struct hda_device_id, api_version)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1272(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:209: 	DEVID(sdw_device_id);
#APP
# 209 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_sdw_device_id $16 sizeof(struct sdw_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1280(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:210: 	DEVID_FIELD(sdw_device_id, mfg_id);
#APP
# 210 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdw_device_id_mfg_id $0 offsetof(struct sdw_device_id, mfg_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1288(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:211: 	DEVID_FIELD(sdw_device_id, part_id);
#APP
# 211 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdw_device_id_part_id $2 offsetof(struct sdw_device_id, part_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1296(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:213: 	DEVID(fsl_mc_device_id);
#APP
# 213 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_fsl_mc_device_id $18 sizeof(struct fsl_mc_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1304(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:214: 	DEVID_FIELD(fsl_mc_device_id, vendor);
#APP
# 214 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_fsl_mc_device_id_vendor $0 offsetof(struct fsl_mc_device_id, vendor)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1312(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:215: 	DEVID_FIELD(fsl_mc_device_id, obj_type);
#APP
# 215 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_fsl_mc_device_id_obj_type $2 offsetof(struct fsl_mc_device_id, obj_type)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1320(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:217: 	DEVID(tb_service_id);
#APP
# 217 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_tb_service_id $40 sizeof(struct tb_service_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1328(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:218: 	DEVID_FIELD(tb_service_id, match_flags);
#APP
# 218 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_match_flags $0 offsetof(struct tb_service_id, match_flags)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1336(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:219: 	DEVID_FIELD(tb_service_id, protocol_key);
#APP
# 219 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_key $4 offsetof(struct tb_service_id, protocol_key)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1344(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:220: 	DEVID_FIELD(tb_service_id, protocol_id);
#APP
# 220 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_id $16 offsetof(struct tb_service_id, protocol_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1352(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:221: 	DEVID_FIELD(tb_service_id, protocol_version);
#APP
# 221 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_version $20 offsetof(struct tb_service_id, protocol_version)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1360(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:222: 	DEVID_FIELD(tb_service_id, protocol_revision);
#APP
# 222 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_revision $24 offsetof(struct tb_service_id, protocol_revision)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1368(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:224: 	DEVID(typec_device_id);
#APP
# 224 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_typec_device_id $16 sizeof(struct typec_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1376(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:225: 	DEVID_FIELD(typec_device_id, svid);
#APP
# 225 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_typec_device_id_svid $0 offsetof(struct typec_device_id, svid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1384(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:226: 	DEVID_FIELD(typec_device_id, mode);
#APP
# 226 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_typec_device_id_mode $2 offsetof(struct typec_device_id, mode)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1392(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:228: 	DEVID(tee_client_device_id);
#APP
# 228 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_tee_client_device_id $16 sizeof(struct tee_client_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1400(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:229: 	DEVID_FIELD(tee_client_device_id, uuid);
#APP
# 229 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tee_client_device_id_uuid $0 offsetof(struct tee_client_device_id, uuid)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1408(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:231: 	DEVID(wmi_device_id);
#APP
# 231 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_wmi_device_id $48 sizeof(struct wmi_device_id)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1416(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:232: 	DEVID_FIELD(wmi_device_id, guid_string);
#APP
# 232 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_wmi_device_id_guid_string $0 offsetof(struct wmi_device_id, guid_string)"	#
# 0 "" 2
#NO_APP
	incq	__gcov0.main+1424(%rip)	# __gcov0.main
# scripts/mod/devicetable-offsets.c:235: }
	xorl	%eax, %eax	#
	ret	
	.size	main, .-main
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
	movq	$.LPBX0, %rdi	#,
	jmp	__gcov_init	#
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
	jmp	__gcov_exit	#
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.data
	.align 8
	.type	.LPBX1, @object
	.size	.LPBX1, 8
.LPBX1:
	.quad	__gcov_.main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"/usr/src/linux/scripts/mod/devicetable-offsets.gcda"
	.data
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 112
.LPBX0:
# <anonymous>:
	.long	1110454570
# <anonymous>:
	.zero	4
	.quad	0
# <anonymous>:
	.long	450460448
# <anonymous>:
	.zero	4
	.quad	.LC0
# <anonymous>:
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
# <anonymous>:
	.long	1
# <anonymous>:
	.zero	4
	.quad	.LPBX1
	.align 32
	.type	__gcov_.main, @object
	.size	__gcov_.main, 40
__gcov_.main:
# <anonymous>:
	.quad	.LPBX0
# <anonymous>:
	.long	108032747
# <anonymous>:
	.long	-1351455308
# <anonymous>:
	.long	-1379337770
# <anonymous>:
	.zero	4
# <anonymous>:
	.long	179
# <anonymous>:
	.zero	4
	.quad	__gcov0.main
	.local	__gcov0.main
	.comm	__gcov0.main,1432,32
	.ident	"GCC: (Gentoo 10.1.0 p1) 10.1.0"
	.section	.note.GNU-stack,"",@progbits
