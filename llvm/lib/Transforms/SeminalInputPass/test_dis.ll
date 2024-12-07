; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [7 x i8] c"%d, %d\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [15 x i8] c"id= %d sum=%d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 !dbg !26 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !31, !DIExpression(), !32)
    #dbg_declare(ptr %3, !33, !DIExpression(), !34)
  %6 = call i32 (ptr, ...) @scanf(ptr noundef @.str, ptr noundef %2, ptr noundef %3), !dbg !35
    #dbg_declare(ptr %4, !36, !DIExpression(), !37)
  store i32 0, ptr %4, align 4, !dbg !37
    #dbg_declare(ptr %5, !38, !DIExpression(), !40)
  store i32 0, ptr %5, align 4, !dbg !40
  br label %7, !dbg !41

7:                                                ; preds = %15, %0
  %8 = load i32, ptr %5, align 4, !dbg !42
  %9 = load i32, ptr %3, align 4, !dbg !44
  %10 = icmp slt i32 %8, %9, !dbg !45
  br i1 %10, label %11, label %18, !dbg !46

11:                                               ; preds = %7
  %12 = call i32 @rand(), !dbg !47
  %13 = load i32, ptr %4, align 4, !dbg !49
  %14 = add nsw i32 %13, %12, !dbg !49
  store i32 %14, ptr %4, align 4, !dbg !49
  br label %15, !dbg !50

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4, !dbg !51
  %17 = add nsw i32 %16, 1, !dbg !51
  store i32 %17, ptr %5, align 4, !dbg !51
  br label %7, !dbg !52, !llvm.loop !53

18:                                               ; preds = %7
  %19 = load i32, ptr %2, align 4, !dbg !56
  %20 = load i32, ptr %3, align 4, !dbg !57
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %19, i32 noundef %20), !dbg !58
  %22 = load i32, ptr %3, align 4, !dbg !59
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %22), !dbg !60
  %24 = load i32, ptr %1, align 4, !dbg !61
  ret i32 %24, !dbg !61
}

declare i32 @scanf(ptr noundef, ...) #1

declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "test.c", directory: "/Users/judeelmasr/githubwor/dev-repo/llvm/llvm/lib/transforms/seminalinputpass", checksumkind: CSK_MD5, checksum: "62f53efda597a5e7a4af10de6dbd3f58")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 7)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 15)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 3)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Homebrew clang version 19.1.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !18, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!18 = !{!0, !7, !12}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 8, !"PIC Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 1}
!25 = !{!"Homebrew clang version 19.1.4"}
!26 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 3, type: !27, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !30)
!27 = !DISubroutineType(types: !28)
!28 = !{!29}
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !{}
!31 = !DILocalVariable(name: "id", scope: !26, file: !2, line: 4, type: !29)
!32 = !DILocation(line: 4, column: 9, scope: !26)
!33 = !DILocalVariable(name: "n", scope: !26, file: !2, line: 5, type: !29)
!34 = !DILocation(line: 5, column: 9, scope: !26)
!35 = !DILocation(line: 6, column: 5, scope: !26)
!36 = !DILocalVariable(name: "s", scope: !26, file: !2, line: 7, type: !29)
!37 = !DILocation(line: 7, column: 9, scope: !26)
!38 = !DILocalVariable(name: "i", scope: !39, file: !2, line: 8, type: !29)
!39 = distinct !DILexicalBlock(scope: !26, file: !2, line: 8, column: 5)
!40 = !DILocation(line: 8, column: 14, scope: !39)
!41 = !DILocation(line: 8, column: 10, scope: !39)
!42 = !DILocation(line: 8, column: 18, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !2, line: 8, column: 5)
!44 = !DILocation(line: 8, column: 20, scope: !43)
!45 = !DILocation(line: 8, column: 19, scope: !43)
!46 = !DILocation(line: 8, column: 5, scope: !39)
!47 = !DILocation(line: 9, column: 14, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !2, line: 8, column: 26)
!49 = !DILocation(line: 9, column: 11, scope: !48)
!50 = !DILocation(line: 10, column: 5, scope: !48)
!51 = !DILocation(line: 8, column: 23, scope: !43)
!52 = !DILocation(line: 8, column: 5, scope: !43)
!53 = distinct !{!53, !46, !54, !55}
!54 = !DILocation(line: 10, column: 5, scope: !39)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 11, column: 31, scope: !26)
!57 = !DILocation(line: 11, column: 35, scope: !26)
!58 = !DILocation(line: 11, column: 5, scope: !26)
!59 = !DILocation(line: 13, column: 18, scope: !26)
!60 = !DILocation(line: 13, column: 5, scope: !26)
!61 = !DILocation(line: 14, column: 1, scope: !26)
