; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [7 x i8] c"%d, %d\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [15 x i8] c"id= %d sum=%d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  %id = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %retval, align 4
    #dbg_declare(ptr %id, !26, !DIExpression(), !27)
    #dbg_declare(ptr %n, !28, !DIExpression(), !29)
  %call = call i32 (ptr, ...) @scanf(ptr noundef @.str, ptr noundef %id, ptr noundef %n), !dbg !30
    #dbg_declare(ptr %s, !31, !DIExpression(), !32)
  store i32 0, ptr %s, align 4, !dbg !32
    #dbg_declare(ptr %i, !33, !DIExpression(), !35)
  store i32 0, ptr %i, align 4, !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !37
  %1 = load i32, ptr %n, align 4, !dbg !39
  %cmp = icmp slt i32 %0, %1, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %call1 = call i32 @rand(), !dbg !42
  %2 = load i32, ptr %s, align 4, !dbg !44
  %add = add nsw i32 %2, %call1, !dbg !44
  store i32 %add, ptr %s, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4, !dbg !46
  %inc = add nsw i32 %3, 1, !dbg !46
  store i32 %inc, ptr %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %4 = load i32, ptr %id, align 4, !dbg !51
  %5 = load i32, ptr %n, align 4, !dbg !52
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %4, i32 noundef %5), !dbg !53
  %6 = load i32, ptr %retval, align 4, !dbg !54
  ret i32 %6, !dbg !54
}

declare i32 @scanf(ptr noundef, ...) #1

declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "test.c", directory: "/Users/judeelmasr/githubwor/dev-repo/llvm/llvm/lib/transforms/seminalinputpass", checksumkind: CSK_MD5, checksum: "196d03faa284833a3ab1aa1c1c0cb891")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 7)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 15)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Homebrew clang version 19.1.3", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !13, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!13 = !{!0, !7}
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 1}
!20 = !{!"Homebrew clang version 19.1.3"}
!21 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 3, type: !22, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !25)
!22 = !DISubroutineType(types: !23)
!23 = !{!24}
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{}
!26 = !DILocalVariable(name: "id", scope: !21, file: !2, line: 4, type: !24)
!27 = !DILocation(line: 4, column: 5, scope: !21)
!28 = !DILocalVariable(name: "n", scope: !21, file: !2, line: 5, type: !24)
!29 = !DILocation(line: 5, column: 5, scope: !21)
!30 = !DILocation(line: 6, column: 1, scope: !21)
!31 = !DILocalVariable(name: "s", scope: !21, file: !2, line: 7, type: !24)
!32 = !DILocation(line: 7, column: 5, scope: !21)
!33 = !DILocalVariable(name: "i", scope: !34, file: !2, line: 8, type: !24)
!34 = distinct !DILexicalBlock(scope: !21, file: !2, line: 8, column: 1)
!35 = !DILocation(line: 8, column: 10, scope: !34)
!36 = !DILocation(line: 8, column: 6, scope: !34)
!37 = !DILocation(line: 8, column: 14, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !2, line: 8, column: 1)
!39 = !DILocation(line: 8, column: 16, scope: !38)
!40 = !DILocation(line: 8, column: 15, scope: !38)
!41 = !DILocation(line: 8, column: 1, scope: !34)
!42 = !DILocation(line: 9, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !2, line: 8, column: 22)
!44 = !DILocation(line: 9, column: 3, scope: !43)
!45 = !DILocation(line: 10, column: 1, scope: !43)
!46 = !DILocation(line: 8, column: 19, scope: !38)
!47 = !DILocation(line: 8, column: 1, scope: !38)
!48 = distinct !{!48, !41, !49, !50}
!49 = !DILocation(line: 10, column: 1, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 11, column: 27, scope: !21)
!52 = !DILocation(line: 11, column: 31, scope: !21)
!53 = !DILocation(line: 11, column: 1, scope: !21)
!54 = !DILocation(line: 12, column: 1, scope: !21)
