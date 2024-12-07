; ModuleID = 'test3.c'
source_filename = "test3.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.node = type { i32, ptr, ptr }

@.str = private unnamed_addr constant [144 x i8] c"\0A1.Insert in beginning\0A2.Insert in end\0A3.Insert at any position\0A4.Delete in beginning\0A5.Delete in end\0A6.Delete at any position\0A7.Display\0A8.Exit\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [21 x i8] c"\0AEnter your choice: \00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !12
@choice = global i32 0, align 4, !dbg !17
@.str.3 = private unnamed_addr constant [41 x i8] c"WRONG CHOICE,PLEASE ENTER CORRECT CHOICE\00", align 1, !dbg !797
@.str.4 = private unnamed_addr constant [9 x i8] c"Overflow\00", align 1, !dbg !802
@.str.5 = private unnamed_addr constant [21 x i8] c"\0AEnter your number: \00", align 1, !dbg !805
@n = global i32 0, align 4, !dbg !870
@head = global ptr null, align 8, !dbg !868
@.str.6 = private unnamed_addr constant [28 x i8] c"node inserted successfully\0A\00", align 1, !dbg !807
@.str.7 = private unnamed_addr constant [21 x i8] c"\0Aprinting values...\0A\00", align 1, !dbg !812
@.str.8 = private unnamed_addr constant [5 x i8] c"%d->\00", align 1, !dbg !814
@.str.9 = private unnamed_addr constant [11 x i8] c"\0AUNDERFLOW\00", align 1, !dbg !819
@.str.10 = private unnamed_addr constant [15 x i8] c"\0Anode deleted\0A\00", align 1, !dbg !824
@.str.11 = private unnamed_addr constant [10 x i8] c"\0AOVERFLOW\00", align 1, !dbg !829
@.str.12 = private unnamed_addr constant [16 x i8] c"\0AEnter value : \00", align 1, !dbg !834
@.str.13 = private unnamed_addr constant [15 x i8] c"Node inserted\0A\00", align 1, !dbg !836
@.str.14 = private unnamed_addr constant [29 x i8] c"\0ADeleted Node from the last\0A\00", align 1, !dbg !838
@.str.15 = private unnamed_addr constant [11 x i8] c"\0A OVERFLOW\00", align 1, !dbg !841
@.str.16 = private unnamed_addr constant [21 x i8] c"Enter the location: \00", align 1, !dbg !843
@loc = global i32 0, align 4, !dbg !872
@i = global i32 0, align 4, !dbg !874
@.str.17 = private unnamed_addr constant [14 x i8] c"Cannot insert\00", align 1, !dbg !845
@.str.18 = private unnamed_addr constant [14 x i8] c"Enter value: \00", align 1, !dbg !850
@.str.19 = private unnamed_addr constant [16 x i8] c"\0Anode inserted\0A\00", align 1, !dbg !852
@.str.20 = private unnamed_addr constant [52 x i8] c"\0AEnter the location of the node you want to delete\0A\00", align 1, !dbg !854
@.str.21 = private unnamed_addr constant [14 x i8] c"\0ACan't delete\00", align 1, !dbg !859
@.str.22 = private unnamed_addr constant [14 x i8] c"\0ADeleted node\00", align 1, !dbg !861
@.str.23 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !dbg !863

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !883 {
entry:
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !886
  call void @menu(), !dbg !887
  ret i32 0, !dbg !888
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @menu() #0 !dbg !889 {
entry:
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !892
  %call1 = call i32 (ptr, ...) @scanf(ptr noundef @.str.2, ptr noundef @choice), !dbg !893
  %0 = load i32, ptr @choice, align 4, !dbg !894
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
    i32 4, label %sw.bb4
    i32 5, label %sw.bb5
    i32 6, label %sw.bb6
    i32 7, label %sw.bb7
    i32 8, label %sw.bb8
  ], !dbg !895

sw.bb:                                            ; preds = %entry
  call void @insertb(), !dbg !896
  br label %sw.epilog, !dbg !898

sw.bb2:                                           ; preds = %entry
  call void @inserte(), !dbg !899
  br label %sw.epilog, !dbg !900

sw.bb3:                                           ; preds = %entry
  call void @insertp(), !dbg !901
  br label %sw.epilog, !dbg !902

sw.bb4:                                           ; preds = %entry
  call void @deleteb(), !dbg !903
  br label %sw.epilog, !dbg !904

sw.bb5:                                           ; preds = %entry
  call void @deletee(), !dbg !905
  br label %sw.epilog, !dbg !906

sw.bb6:                                           ; preds = %entry
  call void @deletep(), !dbg !907
  br label %sw.epilog, !dbg !908

sw.bb7:                                           ; preds = %entry
  call void @display(), !dbg !909
  br label %sw.epilog, !dbg !910

sw.bb8:                                           ; preds = %entry
  call void @exit(i32 noundef 1) #4, !dbg !911
  unreachable, !dbg !911

sw.default:                                       ; preds = %entry
  %call9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !912
  br label %sw.epilog, !dbg !913

sw.epilog:                                        ; preds = %sw.default, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb
  ret void, !dbg !914
}

declare i32 @scanf(ptr noundef, ...) #1

; Function Attrs: noreturn
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @insertb() #0 !dbg !915 {
entry:
  %ptr = alloca ptr, align 8
    #dbg_declare(ptr %ptr, !917, !DIExpression(), !918)
  %call = call ptr @malloc(i64 noundef 8) #5, !dbg !919
  store ptr %call, ptr %ptr, align 8, !dbg !920
  %0 = load ptr, ptr %ptr, align 8, !dbg !921
  %cmp = icmp eq ptr %0, null, !dbg !923
  br i1 %cmp, label %if.then, label %if.else, !dbg !924

if.then:                                          ; preds = %entry
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !dbg !925
  br label %if.end, !dbg !927

if.else:                                          ; preds = %entry
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5), !dbg !928
  %call3 = call i32 (ptr, ...) @scanf(ptr noundef @.str.2, ptr noundef @n), !dbg !930
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load ptr, ptr @head, align 8, !dbg !931
  %cmp4 = icmp eq ptr %1, null, !dbg !933
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !934

if.then5:                                         ; preds = %if.end
  %2 = load i32, ptr @n, align 4, !dbg !935
  %3 = load ptr, ptr %ptr, align 8, !dbg !937
  %data = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0, !dbg !938
  store i32 %2, ptr %data, align 8, !dbg !939
  %4 = load ptr, ptr %ptr, align 8, !dbg !940
  %next = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1, !dbg !941
  store ptr null, ptr %next, align 8, !dbg !942
  %5 = load ptr, ptr %ptr, align 8, !dbg !943
  %prev = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 2, !dbg !944
  store ptr null, ptr %prev, align 8, !dbg !945
  %6 = load ptr, ptr %ptr, align 8, !dbg !946
  store ptr %6, ptr @head, align 8, !dbg !947
  br label %if.end11, !dbg !948

if.else6:                                         ; preds = %if.end
  %7 = load i32, ptr @n, align 4, !dbg !949
  %8 = load ptr, ptr %ptr, align 8, !dbg !951
  %data7 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 0, !dbg !952
  store i32 %7, ptr %data7, align 8, !dbg !953
  %9 = load ptr, ptr %ptr, align 8, !dbg !954
  %prev8 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 2, !dbg !955
  store ptr null, ptr %prev8, align 8, !dbg !956
  %10 = load ptr, ptr @head, align 8, !dbg !957
  %11 = load ptr, ptr %ptr, align 8, !dbg !958
  %next9 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1, !dbg !959
  store ptr %10, ptr %next9, align 8, !dbg !960
  %12 = load ptr, ptr %ptr, align 8, !dbg !961
  %prev10 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 2, !dbg !962
  %13 = load ptr, ptr %prev10, align 8, !dbg !962
  store ptr %13, ptr @head, align 8, !dbg !963
  %14 = load ptr, ptr %ptr, align 8, !dbg !964
  store ptr %14, ptr @head, align 8, !dbg !965
  br label %if.end11

if.end11:                                         ; preds = %if.else6, %if.then5
  %call12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6), !dbg !966
  call void @menu(), !dbg !967
  ret void, !dbg !968
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #3

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @display() #0 !dbg !969 {
entry:
  %ptr = alloca ptr, align 8
    #dbg_declare(ptr %ptr, !970, !DIExpression(), !971)
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.7), !dbg !972
  %0 = load ptr, ptr @head, align 8, !dbg !973
  store ptr %0, ptr %ptr, align 8, !dbg !974
  br label %while.cond, !dbg !975

while.cond:                                       ; preds = %while.body, %entry
  %1 = load ptr, ptr %ptr, align 8, !dbg !976
  %cmp = icmp ne ptr %1, null, !dbg !977
  br i1 %cmp, label %while.body, label %while.end, !dbg !975

while.body:                                       ; preds = %while.cond
  %2 = load ptr, ptr %ptr, align 8, !dbg !978
  %data = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 0, !dbg !980
  %3 = load i32, ptr %data, align 8, !dbg !980
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %3), !dbg !981
  %4 = load ptr, ptr %ptr, align 8, !dbg !982
  %next = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1, !dbg !983
  %5 = load ptr, ptr %next, align 8, !dbg !983
  store ptr %5, ptr %ptr, align 8, !dbg !984
  br label %while.cond, !dbg !975, !llvm.loop !985

while.end:                                        ; preds = %while.cond
  call void @menu(), !dbg !988
  ret void, !dbg !989
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @deleteb() #0 !dbg !990 {
entry:
  %ptr = alloca ptr, align 8
    #dbg_declare(ptr %ptr, !991, !DIExpression(), !992)
  %0 = load ptr, ptr @head, align 8, !dbg !993
  %cmp = icmp eq ptr %0, null, !dbg !995
  br i1 %cmp, label %if.then, label %if.else, !dbg !996

if.then:                                          ; preds = %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.9), !dbg !997
  br label %if.end7, !dbg !999

if.else:                                          ; preds = %entry
  %1 = load ptr, ptr @head, align 8, !dbg !1000
  %next = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 1, !dbg !1002
  %2 = load ptr, ptr %next, align 8, !dbg !1002
  %cmp1 = icmp eq ptr %2, null, !dbg !1003
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1004

if.then2:                                         ; preds = %if.else
  store ptr null, ptr @head, align 8, !dbg !1005
  %3 = load ptr, ptr @head, align 8, !dbg !1007
  call void @free(ptr noundef %3), !dbg !1008
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !1009
  br label %if.end, !dbg !1010

if.else4:                                         ; preds = %if.else
  %4 = load ptr, ptr @head, align 8, !dbg !1011
  store ptr %4, ptr %ptr, align 8, !dbg !1013
  %5 = load ptr, ptr @head, align 8, !dbg !1014
  %next5 = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 1, !dbg !1015
  %6 = load ptr, ptr %next5, align 8, !dbg !1015
  store ptr %6, ptr @head, align 8, !dbg !1016
  %7 = load ptr, ptr @head, align 8, !dbg !1017
  %prev = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 2, !dbg !1018
  store ptr null, ptr %prev, align 8, !dbg !1019
  %8 = load ptr, ptr %ptr, align 8, !dbg !1020
  call void @free(ptr noundef %8), !dbg !1021
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !1022
  br label %if.end

if.end:                                           ; preds = %if.else4, %if.then2
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  call void @menu(), !dbg !1023
  ret void, !dbg !1024
}

declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @inserte() #0 !dbg !1025 {
entry:
  %ptr = alloca ptr, align 8
  %temp = alloca ptr, align 8
    #dbg_declare(ptr %ptr, !1026, !DIExpression(), !1027)
    #dbg_declare(ptr %temp, !1028, !DIExpression(), !1029)
  %call = call ptr @malloc(i64 noundef 24) #5, !dbg !1030
  store ptr %call, ptr %ptr, align 8, !dbg !1031
  %0 = load ptr, ptr %ptr, align 8, !dbg !1032
  %cmp = icmp eq ptr %0, null, !dbg !1034
  br i1 %cmp, label %if.then, label %if.else, !dbg !1035

if.then:                                          ; preds = %entry
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.11), !dbg !1036
  br label %if.end13, !dbg !1038

if.else:                                          ; preds = %entry
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.12), !dbg !1039
  %call3 = call i32 (ptr, ...) @scanf(ptr noundef @.str.2, ptr noundef @n), !dbg !1041
  %1 = load i32, ptr @n, align 4, !dbg !1042
  %2 = load ptr, ptr %ptr, align 8, !dbg !1043
  %data = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 0, !dbg !1044
  store i32 %1, ptr %data, align 8, !dbg !1045
  %3 = load ptr, ptr @head, align 8, !dbg !1046
  %cmp4 = icmp eq ptr %3, null, !dbg !1048
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !1049

if.then5:                                         ; preds = %if.else
  %4 = load ptr, ptr %ptr, align 8, !dbg !1050
  %next = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1, !dbg !1052
  store ptr null, ptr %next, align 8, !dbg !1053
  %5 = load ptr, ptr %ptr, align 8, !dbg !1054
  %prev = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 2, !dbg !1055
  store ptr null, ptr %prev, align 8, !dbg !1056
  %6 = load ptr, ptr %ptr, align 8, !dbg !1057
  store ptr %6, ptr @head, align 8, !dbg !1058
  br label %if.end, !dbg !1059

if.else6:                                         ; preds = %if.else
  %7 = load ptr, ptr @head, align 8, !dbg !1060
  store ptr %7, ptr %temp, align 8, !dbg !1062
  br label %while.cond, !dbg !1063

while.cond:                                       ; preds = %while.body, %if.else6
  %8 = load ptr, ptr %temp, align 8, !dbg !1064
  %next7 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 1, !dbg !1065
  %9 = load ptr, ptr %next7, align 8, !dbg !1065
  %cmp8 = icmp ne ptr %9, null, !dbg !1066
  br i1 %cmp8, label %while.body, label %while.end, !dbg !1063

while.body:                                       ; preds = %while.cond
  %10 = load ptr, ptr %temp, align 8, !dbg !1067
  %next9 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !dbg !1069
  %11 = load ptr, ptr %next9, align 8, !dbg !1069
  store ptr %11, ptr %temp, align 8, !dbg !1070
  br label %while.cond, !dbg !1063, !llvm.loop !1071

while.end:                                        ; preds = %while.cond
  %12 = load ptr, ptr %ptr, align 8, !dbg !1073
  %13 = load ptr, ptr %temp, align 8, !dbg !1074
  %next10 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 1, !dbg !1075
  store ptr %12, ptr %next10, align 8, !dbg !1076
  %14 = load ptr, ptr %temp, align 8, !dbg !1077
  %15 = load ptr, ptr %ptr, align 8, !dbg !1078
  %prev11 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 2, !dbg !1079
  store ptr %14, ptr %prev11, align 8, !dbg !1080
  %16 = load ptr, ptr %ptr, align 8, !dbg !1081
  %next12 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 1, !dbg !1082
  store ptr null, ptr %next12, align 8, !dbg !1083
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then5
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.13), !dbg !1084
  call void @menu(), !dbg !1085
  ret void, !dbg !1086
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @deletee() #0 !dbg !1087 {
entry:
  %temp = alloca ptr, align 8
  %temp1 = alloca ptr, align 8
    #dbg_declare(ptr %temp, !1088, !DIExpression(), !1089)
    #dbg_declare(ptr %temp1, !1090, !DIExpression(), !1091)
  %0 = load ptr, ptr @head, align 8, !dbg !1092
  %cmp = icmp eq ptr %0, null, !dbg !1094
  br i1 %cmp, label %if.then, label %if.else, !dbg !1095

if.then:                                          ; preds = %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.9), !dbg !1096
  br label %if.end11, !dbg !1098

if.else:                                          ; preds = %entry
  %1 = load ptr, ptr @head, align 8, !dbg !1099
  %next = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 1, !dbg !1101
  %2 = load ptr, ptr %next, align 8, !dbg !1101
  %cmp1 = icmp eq ptr %2, null, !dbg !1102
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1103

if.then2:                                         ; preds = %if.else
  store ptr null, ptr @head, align 8, !dbg !1104
  %3 = load ptr, ptr @head, align 8, !dbg !1106
  call void @free(ptr noundef %3), !dbg !1107
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !1108
  br label %if.end, !dbg !1109

if.else4:                                         ; preds = %if.else
  %4 = load ptr, ptr @head, align 8, !dbg !1110
  store ptr %4, ptr %temp, align 8, !dbg !1112
  br label %while.cond, !dbg !1113

while.cond:                                       ; preds = %while.body, %if.else4
  %5 = load ptr, ptr %temp, align 8, !dbg !1114
  %next5 = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 1, !dbg !1115
  %6 = load ptr, ptr %next5, align 8, !dbg !1115
  %cmp6 = icmp ne ptr %6, null, !dbg !1116
  br i1 %cmp6, label %while.body, label %while.end, !dbg !1113

while.body:                                       ; preds = %while.cond
  %7 = load ptr, ptr %temp, align 8, !dbg !1117
  store ptr %7, ptr %temp1, align 8, !dbg !1119
  %8 = load ptr, ptr %temp, align 8, !dbg !1120
  %next7 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 1, !dbg !1121
  %9 = load ptr, ptr %next7, align 8, !dbg !1121
  store ptr %9, ptr %temp, align 8, !dbg !1122
  br label %while.cond, !dbg !1113, !llvm.loop !1123

while.end:                                        ; preds = %while.cond
  %10 = load ptr, ptr %temp1, align 8, !dbg !1125
  %next8 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !dbg !1126
  store ptr null, ptr %next8, align 8, !dbg !1127
  %11 = load ptr, ptr %temp, align 8, !dbg !1128
  %prev = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 2, !dbg !1129
  %12 = load ptr, ptr %prev, align 8, !dbg !1129
  %13 = load ptr, ptr %temp1, align 8, !dbg !1130
  %prev9 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2, !dbg !1131
  store ptr %12, ptr %prev9, align 8, !dbg !1132
  %14 = load ptr, ptr %temp, align 8, !dbg !1133
  call void @free(ptr noundef %14), !dbg !1134
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !dbg !1135
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then2
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  call void @menu(), !dbg !1136
  ret void, !dbg !1137
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @insertp() #0 !dbg !1138 {
entry:
  %ptr = alloca ptr, align 8
  %temp = alloca ptr, align 8
    #dbg_declare(ptr %ptr, !1139, !DIExpression(), !1140)
    #dbg_declare(ptr %temp, !1141, !DIExpression(), !1142)
  %call = call ptr @malloc(i64 noundef 24) #5, !dbg !1143
  store ptr %call, ptr %ptr, align 8, !dbg !1144
  %0 = load ptr, ptr %ptr, align 8, !dbg !1145
  %cmp = icmp eq ptr %0, null, !dbg !1147
  br i1 %cmp, label %if.then, label %if.else, !dbg !1148

if.then:                                          ; preds = %entry
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.15), !dbg !1149
  br label %if.end16, !dbg !1151

if.else:                                          ; preds = %entry
  %1 = load ptr, ptr @head, align 8, !dbg !1152
  store ptr %1, ptr %temp, align 8, !dbg !1154
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.16), !dbg !1155
  %call3 = call i32 (ptr, ...) @scanf(ptr noundef @.str.2, ptr noundef @loc), !dbg !1156
  store i32 1, ptr @i, align 4, !dbg !1157
  br label %for.cond, !dbg !1159

for.cond:                                         ; preds = %for.inc, %if.else
  %2 = load i32, ptr @i, align 4, !dbg !1160
  %3 = load i32, ptr @loc, align 4, !dbg !1162
  %cmp4 = icmp slt i32 %2, %3, !dbg !1163
  br i1 %cmp4, label %for.body, label %for.end, !dbg !1164

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %temp, align 8, !dbg !1165
  %next = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1, !dbg !1167
  %5 = load ptr, ptr %next, align 8, !dbg !1167
  store ptr %5, ptr %temp, align 8, !dbg !1168
  %6 = load ptr, ptr %temp, align 8, !dbg !1169
  %cmp5 = icmp eq ptr %6, null, !dbg !1171
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !1172

if.then6:                                         ; preds = %for.body
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str.17), !dbg !1173
  br label %return, !dbg !1175

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !1176

for.inc:                                          ; preds = %if.end
  %7 = load i32, ptr @i, align 4, !dbg !1177
  %inc = add nsw i32 %7, 1, !dbg !1177
  store i32 %inc, ptr @i, align 4, !dbg !1177
  br label %for.cond, !dbg !1178, !llvm.loop !1179

for.end:                                          ; preds = %for.cond
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.18), !dbg !1181
  %call9 = call i32 (ptr, ...) @scanf(ptr noundef @.str.2, ptr noundef @n), !dbg !1182
  %8 = load i32, ptr @n, align 4, !dbg !1183
  %9 = load ptr, ptr %ptr, align 8, !dbg !1184
  %data = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 0, !dbg !1185
  store i32 %8, ptr %data, align 8, !dbg !1186
  %10 = load ptr, ptr %temp, align 8, !dbg !1187
  %next10 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !dbg !1188
  %11 = load ptr, ptr %next10, align 8, !dbg !1188
  %12 = load ptr, ptr %ptr, align 8, !dbg !1189
  %next11 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 1, !dbg !1190
  store ptr %11, ptr %next11, align 8, !dbg !1191
  %13 = load ptr, ptr %temp, align 8, !dbg !1192
  %14 = load ptr, ptr %ptr, align 8, !dbg !1193
  %prev = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 2, !dbg !1194
  store ptr %13, ptr %prev, align 8, !dbg !1195
  %15 = load ptr, ptr %ptr, align 8, !dbg !1196
  %16 = load ptr, ptr %temp, align 8, !dbg !1197
  %next12 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 1, !dbg !1198
  store ptr %15, ptr %next12, align 8, !dbg !1199
  %17 = load ptr, ptr %ptr, align 8, !dbg !1200
  %18 = load ptr, ptr %temp, align 8, !dbg !1201
  %next13 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 1, !dbg !1202
  %19 = load ptr, ptr %next13, align 8, !dbg !1202
  %prev14 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 2, !dbg !1203
  store ptr %17, ptr %prev14, align 8, !dbg !1204
  %call15 = call i32 (ptr, ...) @printf(ptr noundef @.str.19), !dbg !1205
  br label %if.end16

if.end16:                                         ; preds = %for.end, %if.then
  call void @menu(), !dbg !1206
  br label %return, !dbg !1207

return:                                           ; preds = %if.end16, %if.then6
  ret void, !dbg !1207
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @deletep() #0 !dbg !1208 {
entry:
  %ptr = alloca ptr, align 8
  %ptr1 = alloca ptr, align 8
    #dbg_declare(ptr %ptr, !1209, !DIExpression(), !1210)
    #dbg_declare(ptr %ptr1, !1211, !DIExpression(), !1212)
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.20), !dbg !1213
  %call1 = call i32 (ptr, ...) @scanf(ptr noundef @.str.2, ptr noundef @loc), !dbg !1214
  %0 = load ptr, ptr @head, align 8, !dbg !1215
  store ptr %0, ptr %ptr, align 8, !dbg !1216
  store i32 0, ptr @i, align 4, !dbg !1217
  br label %for.cond, !dbg !1219

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr @i, align 4, !dbg !1220
  %2 = load i32, ptr @loc, align 4, !dbg !1222
  %cmp = icmp slt i32 %1, %2, !dbg !1223
  br i1 %cmp, label %for.body, label %for.end, !dbg !1224

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %ptr, align 8, !dbg !1225
  store ptr %3, ptr %ptr1, align 8, !dbg !1227
  %4 = load ptr, ptr %ptr, align 8, !dbg !1228
  %next = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1, !dbg !1229
  %5 = load ptr, ptr %next, align 8, !dbg !1229
  store ptr %5, ptr %ptr, align 8, !dbg !1230
  %6 = load ptr, ptr %ptr, align 8, !dbg !1231
  %cmp2 = icmp eq ptr %6, null, !dbg !1233
  br i1 %cmp2, label %if.then, label %if.end, !dbg !1234

if.then:                                          ; preds = %for.body
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.21), !dbg !1235
  br label %return, !dbg !1237

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !1238

for.inc:                                          ; preds = %if.end
  %7 = load i32, ptr @i, align 4, !dbg !1239
  %inc = add nsw i32 %7, 1, !dbg !1239
  store i32 %inc, ptr @i, align 4, !dbg !1239
  br label %for.cond, !dbg !1240, !llvm.loop !1241

for.end:                                          ; preds = %for.cond
  %8 = load ptr, ptr %ptr, align 8, !dbg !1243
  %next4 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 1, !dbg !1244
  %9 = load ptr, ptr %next4, align 8, !dbg !1244
  %10 = load ptr, ptr %ptr1, align 8, !dbg !1245
  %next5 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !dbg !1246
  store ptr %9, ptr %next5, align 8, !dbg !1247
  %11 = load ptr, ptr %ptr, align 8, !dbg !1248
  %prev = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 2, !dbg !1249
  %12 = load ptr, ptr %prev, align 8, !dbg !1249
  %13 = load ptr, ptr %ptr1, align 8, !dbg !1250
  %prev6 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2, !dbg !1251
  store ptr %12, ptr %prev6, align 8, !dbg !1252
  %14 = load ptr, ptr %ptr, align 8, !dbg !1253
  call void @free(ptr noundef %14), !dbg !1254
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str.22), !dbg !1255
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.23), !dbg !1256
  call void @menu(), !dbg !1257
  br label %return, !dbg !1258

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !1258
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { noreturn }
attributes #5 = { allocsize(0) }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!876, !877, !878, !879, !880, !881}
!llvm.ident = !{!882}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 24, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "test3.c", directory: "/Users/judeelmasr/githubwor/dev-repo/llvm/llvm/lib/transforms/seminalinputpass", checksumkind: CSK_MD5, checksum: "d23d6811eb2e385001b80856df2e8183")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1152, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 144)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 21)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 30, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 3)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "choice", scope: !19, file: !2, line: 20, type: !39, isLocal: false, isDefinition: true)
!19 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Homebrew clang version 19.1.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !20, retainedTypes: !28, globals: !796, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!20 = !{!21}
!21 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !22, line: 79, baseType: !23, size: 32, elements: !24)
!22 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/wait.h", directory: "", checksumkind: CSK_MD5, checksum: "f6fbb67bfbabf056c20f8b23078c6d2d")
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !{!25, !26, !27}
!25 = !DIEnumerator(name: "P_ALL", value: 0)
!26 = !DIEnumerator(name: "P_PID", value: 1)
!27 = !DIEnumerator(name: "P_PGID", value: 2)
!28 = !{!29, !32, !34, !36, !38, !40, !41, !43, !45, !47, !48, !49, !56, !57, !58, !59, !61, !64, !65, !66, !67, !68, !69, !70, !71, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !94, !98, !109, !116, !123, !130, !134, !138, !142, !149, !154, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !173, !175, !176, !177, !179, !181, !183, !185, !187, !189, !191, !193, !195, !197, !199, !200, !201, !202, !203, !204, !205, !206, !207, !209, !211, !213, !218, !260, !261, !263, !21, !265, !266, !268, !270, !272, !278, !283, !287, !297, !309, !316, !326, !332, !335, !342, !349, !357, !360, !366, !371, !373, !375, !381, !382, !392, !393, !395, !397, !402, !413, !428, !429, !440, !450, !455, !456, !461, !465, !467, !469, !471, !473, !475, !476, !477, !478, !479, !480, !481, !482, !483, !484, !485, !486, !487, !488, !489, !490, !492, !494, !499, !501, !519, !520, !534, !553, !574, !604, !642, !681, !735, !736, !740, !744, !760, !762, !764, !766, !771, !772, !776, !777, !781, !782, !784, !786, !788, !790, !794, !105}
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !30, line: 28, baseType: !31)
!30 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!31 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !30, line: 32, baseType: !33)
!33 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !30, line: 33, baseType: !35)
!35 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !30, line: 34, baseType: !37)
!37 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !30, line: 35, baseType: !39)
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !30, line: 36, baseType: !23)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !30, line: 37, baseType: !42)
!42 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !30, line: 38, baseType: !44)
!44 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !30, line: 40, baseType: !46)
!46 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_natural_t", file: !30, line: 41, baseType: !23)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ct_rune_t", file: !30, line: 61, baseType: !39)
!49 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !30, line: 67, size: 1024, elements: !50)
!50 = !{!51, !55}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !49, file: !30, line: 68, baseType: !52, size: 1024)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1024, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 128)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !49, file: !30, line: 69, baseType: !42, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !30, line: 70, baseType: !49)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !30, line: 72, baseType: !56)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ptrdiff_t", file: !30, line: 77, baseType: !46)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !30, line: 87, baseType: !60)
!60 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !30, line: 95, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !30, line: 103, baseType: !39)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_rune_t", file: !30, line: 108, baseType: !64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !30, line: 111, baseType: !39)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !30, line: 116, baseType: !60)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_socklen_t", file: !30, line: 117, baseType: !40)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ssize_t", file: !30, line: 118, baseType: !46)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !30, line: 119, baseType: !46)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_blkcnt_t", file: !72, line: 67, baseType: !41)
!72 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_blksize_t", file: !72, line: 68, baseType: !38)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_dev_t", file: !72, line: 69, baseType: !38)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_fsblkcnt_t", file: !72, line: 70, baseType: !23)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_fsfilcnt_t", file: !72, line: 71, baseType: !23)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_gid_t", file: !72, line: 72, baseType: !40)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_id_t", file: !72, line: 73, baseType: !40)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ino64_t", file: !72, line: 74, baseType: !43)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_ino_t", file: !72, line: 76, baseType: !79)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mach_port_name_t", file: !72, line: 80, baseType: !47)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mach_port_t", file: !72, line: 81, baseType: !81)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mode_t", file: !72, line: 82, baseType: !36)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !72, line: 83, baseType: !41)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pid_t", file: !72, line: 84, baseType: !38)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_sigset_t", file: !72, line: 85, baseType: !40)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_suseconds_t", file: !72, line: 86, baseType: !38)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_uid_t", file: !72, line: 87, baseType: !40)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_useconds_t", file: !72, line: 88, baseType: !40)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_uuid_t", file: !72, line: 89, baseType: !91)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 128, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_uuid_string_t", file: !72, line: 90, baseType: !95)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 296, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 37)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_pthread_handler_rec", file: !99, line: 57, size: 192, elements: !100)
!99 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_pthread/_pthread_types.h", directory: "", checksumkind: CSK_MD5, checksum: "4e2ea0e1af95894da0a6030a21a8ebee")
!100 = !{!101, !106, !107}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "__routine", scope: !98, file: !99, line: 58, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DISubroutineType(types: !104)
!104 = !{null, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "__arg", scope: !98, file: !99, line: 59, baseType: !105, size: 64, offset: 64)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !98, file: !99, line: 60, baseType: !108, size: 64, offset: 128)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_attr_t", file: !99, line: 63, size: 512, elements: !110)
!110 = !{!111, !112}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !109, file: !99, line: 64, baseType: !46, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !109, file: !99, line: 65, baseType: !113, size: 448, offset: 64)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 56)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_cond_t", file: !99, line: 68, size: 384, elements: !117)
!117 = !{!118, !119}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !116, file: !99, line: 69, baseType: !46, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !116, file: !99, line: 70, baseType: !120, size: 320, offset: 64)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 40)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_condattr_t", file: !99, line: 73, size: 128, elements: !124)
!124 = !{!125, !126}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !123, file: !99, line: 74, baseType: !46, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !123, file: !99, line: 75, baseType: !127, size: 64, offset: 64)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 8)
!130 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_mutex_t", file: !99, line: 78, size: 512, elements: !131)
!131 = !{!132, !133}
!132 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !130, file: !99, line: 79, baseType: !46, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !130, file: !99, line: 80, baseType: !113, size: 448, offset: 64)
!134 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_mutexattr_t", file: !99, line: 83, size: 128, elements: !135)
!135 = !{!136, !137}
!136 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !134, file: !99, line: 84, baseType: !46, size: 64)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !134, file: !99, line: 85, baseType: !127, size: 64, offset: 64)
!138 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_once_t", file: !99, line: 88, size: 128, elements: !139)
!139 = !{!140, !141}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !138, file: !99, line: 89, baseType: !46, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !138, file: !99, line: 90, baseType: !127, size: 64, offset: 64)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_rwlock_t", file: !99, line: 93, size: 1600, elements: !143)
!143 = !{!144, !145}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !142, file: !99, line: 94, baseType: !46, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !142, file: !99, line: 95, baseType: !146, size: 1536, offset: 64)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1536, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 192)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_rwlockattr_t", file: !99, line: 98, size: 192, elements: !150)
!150 = !{!151, !152}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !149, file: !99, line: 99, baseType: !46, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !149, file: !99, line: 100, baseType: !153, size: 128, offset: 64)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !92)
!154 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_opaque_pthread_t", file: !99, line: 103, size: 65536, elements: !155)
!155 = !{!156, !157, !158}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "__sig", scope: !154, file: !99, line: 104, baseType: !46, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "__cleanup_stack", scope: !154, file: !99, line: 105, baseType: !108, size: 64, offset: 64)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "__opaque", scope: !154, file: !99, line: 106, baseType: !159, size: 65408, offset: 128)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 65408, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 8176)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_attr_t", file: !99, line: 109, baseType: !109)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_cond_t", file: !99, line: 110, baseType: !116)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_condattr_t", file: !99, line: 111, baseType: !123)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_key_t", file: !99, line: 112, baseType: !60)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_mutex_t", file: !99, line: 113, baseType: !130)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_mutexattr_t", file: !99, line: 114, baseType: !134)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_once_t", file: !99, line: 115, baseType: !138)
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_rwlock_t", file: !99, line: 116, baseType: !142)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_rwlockattr_t", file: !99, line: 117, baseType: !149)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pthread_t", file: !99, line: 118, baseType: !172)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!173 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_nl_item", file: !174, line: 40, baseType: !39)
!174 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "bd2087c8ee278624cee561f95099160e")
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !174, line: 41, baseType: !39)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !174, line: 43, baseType: !40)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !178, line: 30, baseType: !31)
!178 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !180, line: 30, baseType: !35)
!180 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!181 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !182, line: 30, baseType: !39)
!182 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!183 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !184, line: 30, baseType: !42)
!184 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int8_t", file: !186, line: 30, baseType: !33)
!186 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_u_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "cf25460e3a2d25a50de2bd9cd0738ad8")
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int16_t", file: !188, line: 30, baseType: !37)
!188 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_u_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "20fb61aa655de1ae21f6fe1799ea5928")
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !190, line: 30, baseType: !23)
!190 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_u_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1be414e13025ba0d11004877ba3f558a")
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int64_t", file: !192, line: 30, baseType: !44)
!192 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_u_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "466f994226288d9979ea32e237e3f3c2")
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "register_t", file: !194, line: 66, baseType: !183)
!194 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/types.h", directory: "", checksumkind: CSK_MD5, checksum: "bd345bb749b5098b0f191abe2c0d3eb4")
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !196, line: 32, baseType: !45)
!196 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !198, line: 34, baseType: !60)
!198 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!199 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_addr_t", file: !194, line: 77, baseType: !191)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_size_t", file: !194, line: 78, baseType: !191)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_ssize_t", file: !194, line: 79, baseType: !183)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_long_t", file: !194, line: 80, baseType: !183)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_ulong_t", file: !194, line: 81, baseType: !191)
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_time_t", file: !194, line: 82, baseType: !183)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "user_off_t", file: !194, line: 83, baseType: !183)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "syscall_arg_t", file: !194, line: 105, baseType: !191)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !208, line: 44, baseType: !61)
!208 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !210, line: 50, baseType: !59)
!210 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !212, line: 83, baseType: !84)
!212 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "3d165ce37807d123c2b5ed4c31060b16")
!213 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !212, line: 94, size: 128, elements: !214)
!214 = !{!215, !217}
!215 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !213, file: !212, line: 95, baseType: !216, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !213, file: !212, line: 96, baseType: !39, size: 32, offset: 64)
!218 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !212, line: 128, size: 1216, elements: !219)
!219 = !{!220, !221, !222, !223, !224, !225, !226, !227, !228, !232, !236, !240, !246, !247, !250, !251, !253, !257, !258, !259}
!220 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !218, file: !212, line: 129, baseType: !216, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !218, file: !212, line: 130, baseType: !39, size: 32, offset: 64)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !218, file: !212, line: 131, baseType: !39, size: 32, offset: 96)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !218, file: !212, line: 132, baseType: !35, size: 16, offset: 128)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !218, file: !212, line: 133, baseType: !35, size: 16, offset: 144)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !218, file: !212, line: 134, baseType: !213, size: 128, offset: 192)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !218, file: !212, line: 135, baseType: !39, size: 32, offset: 320)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !218, file: !212, line: 138, baseType: !105, size: 64, offset: 384)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !218, file: !212, line: 139, baseType: !229, size: 64, offset: 448)
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!230 = !DISubroutineType(types: !231)
!231 = !{!39, !105}
!232 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !218, file: !212, line: 140, baseType: !233, size: 64, offset: 512)
!233 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !234, size: 64)
!234 = !DISubroutineType(types: !235)
!235 = !{!39, !105, !63, !39}
!236 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !218, file: !212, line: 141, baseType: !237, size: 64, offset: 576)
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = !DISubroutineType(types: !239)
!239 = !{!211, !105, !211, !39}
!240 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !218, file: !212, line: 142, baseType: !241, size: 64, offset: 640)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DISubroutineType(types: !243)
!243 = !{!39, !105, !244, !39}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!245 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !218, file: !212, line: 145, baseType: !213, size: 128, offset: 704)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !218, file: !212, line: 146, baseType: !248, size: 64, offset: 832)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64)
!249 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !212, line: 100, flags: DIFlagFwdDecl)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !218, file: !212, line: 147, baseType: !39, size: 32, offset: 896)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !218, file: !212, line: 150, baseType: !252, size: 24, offset: 928)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 24, elements: !15)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !218, file: !212, line: 151, baseType: !254, size: 8, offset: 952)
!254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 8, elements: !255)
!255 = !{!256}
!256 = !DISubrange(count: 1)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !218, file: !212, line: 154, baseType: !213, size: 128, offset: 960)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !218, file: !212, line: 157, baseType: !39, size: 32, offset: 1088)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !218, file: !212, line: 158, baseType: !211, size: 64, offset: 1152)
!260 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !212, line: 159, baseType: !218)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "off_t", file: !262, line: 31, baseType: !84)
!262 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_off_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0468c56924902d4782b467d48c54d211")
!263 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !264, line: 31, baseType: !69)
!264 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_ssize_t.h", directory: "", checksumkind: CSK_MD5, checksum: "9b4f5bef81dd94a882775a3ce650ab9c")
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "idtype_t", file: !22, line: 83, baseType: !21)
!266 = !DIDerivedType(tag: DW_TAG_typedef, name: "pid_t", file: !267, line: 31, baseType: !85)
!267 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_pid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "86a3851b3039dd75e6cc5a8b4f2b3461")
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "id_t", file: !269, line: 31, baseType: !78)
!269 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_id_t.h", directory: "", checksumkind: CSK_MD5, checksum: "985e35d2b2c7e6ea13869fc8cd0b5949")
!270 = !DIDerivedType(tag: DW_TAG_typedef, name: "sig_atomic_t", file: !271, line: 17, baseType: !39)
!271 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/signal.h", directory: "", checksumkind: CSK_MD5, checksum: "802a7d5a263aebe8f27d5d67c7ad4b44")
!272 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_exception_state", file: !273, line: 41, size: 96, elements: !274)
!273 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/mach/arm/_structs.h", directory: "", checksumkind: CSK_MD5, checksum: "fc9233eb351901bd9aae4f5912643825")
!274 = !{!275, !276, !277}
!275 = !DIDerivedType(tag: DW_TAG_member, name: "__exception", scope: !272, file: !273, line: 43, baseType: !40, size: 32)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "__fsr", scope: !272, file: !273, line: 44, baseType: !40, size: 32, offset: 32)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "__far", scope: !272, file: !273, line: 45, baseType: !40, size: 32, offset: 64)
!278 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_exception_state64", file: !273, line: 59, size: 128, elements: !279)
!279 = !{!280, !281, !282}
!280 = !DIDerivedType(tag: DW_TAG_member, name: "__far", scope: !278, file: !273, line: 61, baseType: !43, size: 64)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "__esr", scope: !278, file: !273, line: 62, baseType: !40, size: 32, offset: 64)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "__exception", scope: !278, file: !273, line: 63, baseType: !40, size: 32, offset: 96)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_exception_state64_v2", file: !273, line: 66, size: 128, elements: !284)
!284 = !{!285, !286}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "__far", scope: !283, file: !273, line: 68, baseType: !43, size: 64)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "__esr", scope: !283, file: !273, line: 69, baseType: !43, size: 64, offset: 64)
!287 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_thread_state", file: !273, line: 89, size: 544, elements: !288)
!288 = !{!289, !293, !294, !295, !296}
!289 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !287, file: !273, line: 91, baseType: !290, size: 416)
!290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 416, elements: !291)
!291 = !{!292}
!292 = !DISubrange(count: 13)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "__sp", scope: !287, file: !273, line: 92, baseType: !40, size: 32, offset: 416)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "__lr", scope: !287, file: !273, line: 93, baseType: !40, size: 32, offset: 448)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "__pc", scope: !287, file: !273, line: 94, baseType: !40, size: 32, offset: 480)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "__cpsr", scope: !287, file: !273, line: 95, baseType: !40, size: 32, offset: 512)
!297 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_thread_state64", file: !273, line: 148, size: 2176, elements: !298)
!298 = !{!299, !303, !304, !305, !306, !307, !308}
!299 = !DIDerivedType(tag: DW_TAG_member, name: "__x", scope: !297, file: !273, line: 150, baseType: !300, size: 1856)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 1856, elements: !301)
!301 = !{!302}
!302 = !DISubrange(count: 29)
!303 = !DIDerivedType(tag: DW_TAG_member, name: "__fp", scope: !297, file: !273, line: 151, baseType: !43, size: 64, offset: 1856)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "__lr", scope: !297, file: !273, line: 152, baseType: !43, size: 64, offset: 1920)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "__sp", scope: !297, file: !273, line: 153, baseType: !43, size: 64, offset: 1984)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "__pc", scope: !297, file: !273, line: 154, baseType: !43, size: 64, offset: 2048)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "__cpsr", scope: !297, file: !273, line: 155, baseType: !40, size: 32, offset: 2112)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "__pad", scope: !297, file: !273, line: 156, baseType: !40, size: 32, offset: 2144)
!309 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_vfp_state", file: !273, line: 519, size: 2080, elements: !310)
!310 = !{!311, !315}
!311 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !309, file: !273, line: 521, baseType: !312, size: 2048)
!312 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 2048, elements: !313)
!313 = !{!314}
!314 = !DISubrange(count: 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "__fpscr", scope: !309, file: !273, line: 522, baseType: !40, size: 32, offset: 2048)
!316 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_neon_state64", file: !273, line: 538, size: 4224, elements: !317)
!317 = !{!318, !324, !325}
!318 = !DIDerivedType(tag: DW_TAG_member, name: "__v", scope: !316, file: !273, line: 540, baseType: !319, size: 4096)
!319 = !DICompositeType(tag: DW_TAG_array_type, baseType: !320, size: 4096, elements: !322)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint128_t", file: !2, baseType: !321)
!321 = !DIBasicType(name: "unsigned __int128", size: 128, encoding: DW_ATE_unsigned)
!322 = !{!323}
!323 = !DISubrange(count: 32)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "__fpsr", scope: !316, file: !273, line: 541, baseType: !40, size: 32, offset: 4096)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "__fpcr", scope: !316, file: !273, line: 542, baseType: !40, size: 32, offset: 4128)
!326 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_neon_state", file: !273, line: 545, size: 2176, elements: !327)
!327 = !{!328, !330, !331}
!328 = !DIDerivedType(tag: DW_TAG_member, name: "__v", scope: !326, file: !273, line: 547, baseType: !329, size: 2048)
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !320, size: 2048, elements: !92)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "__fpsr", scope: !326, file: !273, line: 548, baseType: !40, size: 32, offset: 2048)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "__fpcr", scope: !326, file: !273, line: 549, baseType: !40, size: 32, offset: 2080)
!332 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__arm_pagein_state", file: !273, line: 609, size: 32, elements: !333)
!333 = !{!334}
!334 = !DIDerivedType(tag: DW_TAG_member, name: "__pagein_error", scope: !332, file: !273, line: 611, baseType: !39, size: 32)
!335 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__arm_legacy_debug_state", file: !273, line: 646, size: 2048, elements: !336)
!336 = !{!337, !339, !340, !341}
!337 = !DIDerivedType(tag: DW_TAG_member, name: "__bvr", scope: !335, file: !273, line: 648, baseType: !338, size: 512)
!338 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 512, elements: !92)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "__bcr", scope: !335, file: !273, line: 649, baseType: !338, size: 512, offset: 512)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "__wvr", scope: !335, file: !273, line: 650, baseType: !338, size: 512, offset: 1024)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "__wcr", scope: !335, file: !273, line: 651, baseType: !338, size: 512, offset: 1536)
!342 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_debug_state32", file: !273, line: 669, size: 2112, elements: !343)
!343 = !{!344, !345, !346, !347, !348}
!344 = !DIDerivedType(tag: DW_TAG_member, name: "__bvr", scope: !342, file: !273, line: 671, baseType: !338, size: 512)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "__bcr", scope: !342, file: !273, line: 672, baseType: !338, size: 512, offset: 512)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "__wvr", scope: !342, file: !273, line: 673, baseType: !338, size: 512, offset: 1024)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "__wcr", scope: !342, file: !273, line: 674, baseType: !338, size: 512, offset: 1536)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "__mdscr_el1", scope: !342, file: !273, line: 675, baseType: !43, size: 64, offset: 2048)
!349 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_debug_state64", file: !273, line: 679, size: 4160, elements: !350)
!350 = !{!351, !353, !354, !355, !356}
!351 = !DIDerivedType(tag: DW_TAG_member, name: "__bvr", scope: !349, file: !273, line: 681, baseType: !352, size: 1024)
!352 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 1024, elements: !92)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "__bcr", scope: !349, file: !273, line: 682, baseType: !352, size: 1024, offset: 1024)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "__wvr", scope: !349, file: !273, line: 683, baseType: !352, size: 1024, offset: 2048)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "__wcr", scope: !349, file: !273, line: 684, baseType: !352, size: 1024, offset: 3072)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "__mdscr_el1", scope: !349, file: !273, line: 685, baseType: !43, size: 64, offset: 4096)
!357 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_arm_cpmu_state64", file: !273, line: 711, size: 1024, elements: !358)
!358 = !{!359}
!359 = !DIDerivedType(tag: DW_TAG_member, name: "__ctrs", scope: !357, file: !273, line: 713, baseType: !352, size: 1024)
!360 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_mcontext32", file: !361, line: 41, size: 2720, elements: !362)
!361 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_mcontext.h", directory: "", checksumkind: CSK_MD5, checksum: "da7c261f76f98eb3bbd7ed11c4aaa3d8")
!362 = !{!363, !364, !365}
!363 = !DIDerivedType(tag: DW_TAG_member, name: "__es", scope: !360, file: !361, line: 43, baseType: !272, size: 96)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "__ss", scope: !360, file: !361, line: 44, baseType: !287, size: 544, offset: 96)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "__fs", scope: !360, file: !361, line: 45, baseType: !309, size: 2080, offset: 640)
!366 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_mcontext64", file: !361, line: 64, size: 6528, elements: !367)
!367 = !{!368, !369, !370}
!368 = !DIDerivedType(tag: DW_TAG_member, name: "__es", scope: !366, file: !361, line: 66, baseType: !278, size: 128)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "__ss", scope: !366, file: !361, line: 67, baseType: !297, size: 2176, offset: 128)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "__ns", scope: !366, file: !361, line: 68, baseType: !316, size: 4224, offset: 2304)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "mcontext_t", file: !361, line: 85, baseType: !372)
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !374, line: 31, baseType: !162)
!374 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_pthread/_pthread_attr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "383e78324250b910a1128f1b9a464b23")
!375 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_sigaltstack", file: !376, line: 42, size: 192, elements: !377)
!376 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_sigaltstack.h", directory: "", checksumkind: CSK_MD5, checksum: "d308a81f239c930cbd1b1f2eee3fc6c1")
!377 = !{!378, !379, !380}
!378 = !DIDerivedType(tag: DW_TAG_member, name: "ss_sp", scope: !375, file: !376, line: 44, baseType: !105, size: 64)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "ss_size", scope: !375, file: !376, line: 45, baseType: !59, size: 64, offset: 64)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "ss_flags", scope: !375, file: !376, line: 46, baseType: !39, size: 32, offset: 128)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "stack_t", file: !376, line: 48, baseType: !375)
!382 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__darwin_ucontext", file: !383, line: 43, size: 448, elements: !384)
!383 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_ucontext.h", directory: "", checksumkind: CSK_MD5, checksum: "c9464687b003449106b679928ca1b348")
!384 = !{!385, !386, !387, !388, !390, !391}
!385 = !DIDerivedType(tag: DW_TAG_member, name: "uc_onstack", scope: !382, file: !383, line: 45, baseType: !39, size: 32)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "uc_sigmask", scope: !382, file: !383, line: 46, baseType: !86, size: 32, offset: 32)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "uc_stack", scope: !382, file: !383, line: 47, baseType: !375, size: 192, offset: 64)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "uc_link", scope: !382, file: !383, line: 48, baseType: !389, size: 64, offset: 256)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "uc_mcsize", scope: !382, file: !383, line: 49, baseType: !59, size: 64, offset: 320)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "uc_mcontext", scope: !382, file: !383, line: 50, baseType: !372, size: 64, offset: 384)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "ucontext_t", file: !383, line: 57, baseType: !382)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "sigset_t", file: !394, line: 31, baseType: !86)
!394 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_sigset_t.h", directory: "", checksumkind: CSK_MD5, checksum: "437b33d322f60e932c1e1199626d9393")
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "uid_t", file: !396, line: 31, baseType: !88)
!396 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2a704f772d04abefb01de36d246e45dd")
!397 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "sigval", file: !398, line: 158, size: 64, elements: !399)
!398 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/signal.h", directory: "", checksumkind: CSK_MD5, checksum: "541f2577a63933b8824579532ef86917")
!399 = !{!400, !401}
!400 = !DIDerivedType(tag: DW_TAG_member, name: "sival_int", scope: !397, file: !398, line: 160, baseType: !39, size: 32)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "sival_ptr", scope: !397, file: !398, line: 161, baseType: !105, size: 64)
!402 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigevent", file: !398, line: 168, size: 256, elements: !403)
!403 = !{!404, !405, !406, !407, !411}
!404 = !DIDerivedType(tag: DW_TAG_member, name: "sigev_notify", scope: !402, file: !398, line: 169, baseType: !39, size: 32)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "sigev_signo", scope: !402, file: !398, line: 170, baseType: !39, size: 32, offset: 32)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "sigev_value", scope: !402, file: !398, line: 171, baseType: !397, size: 64, offset: 64)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "sigev_notify_function", scope: !402, file: !398, line: 172, baseType: !408, size: 64, offset: 128)
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !409, size: 64)
!409 = !DISubroutineType(types: !410)
!410 = !{null, !397}
!411 = !DIDerivedType(tag: DW_TAG_member, name: "sigev_notify_attributes", scope: !402, file: !398, line: 173, baseType: !412, size: 64, offset: 192)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !373, size: 64)
!413 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__siginfo", file: !398, line: 177, size: 832, elements: !414)
!414 = !{!415, !416, !417, !418, !419, !420, !421, !422, !423, !424}
!415 = !DIDerivedType(tag: DW_TAG_member, name: "si_signo", scope: !413, file: !398, line: 178, baseType: !39, size: 32)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "si_errno", scope: !413, file: !398, line: 179, baseType: !39, size: 32, offset: 32)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "si_code", scope: !413, file: !398, line: 180, baseType: !39, size: 32, offset: 64)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !413, file: !398, line: 181, baseType: !266, size: 32, offset: 96)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !413, file: !398, line: 182, baseType: !395, size: 32, offset: 128)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "si_status", scope: !413, file: !398, line: 183, baseType: !39, size: 32, offset: 160)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr", scope: !413, file: !398, line: 184, baseType: !105, size: 64, offset: 192)
!422 = !DIDerivedType(tag: DW_TAG_member, name: "si_value", scope: !413, file: !398, line: 185, baseType: !397, size: 64, offset: 256)
!423 = !DIDerivedType(tag: DW_TAG_member, name: "si_band", scope: !413, file: !398, line: 186, baseType: !46, size: 64, offset: 320)
!424 = !DIDerivedType(tag: DW_TAG_member, name: "__pad", scope: !413, file: !398, line: 187, baseType: !425, size: 448, offset: 384)
!425 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 448, elements: !426)
!426 = !{!427}
!427 = !DISubrange(count: 7)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "siginfo_t", file: !398, line: 188, baseType: !413)
!429 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "__sigaction_u", file: !398, line: 269, size: 64, elements: !430)
!430 = !{!431, !435}
!431 = !DIDerivedType(tag: DW_TAG_member, name: "__sa_handler", scope: !429, file: !398, line: 270, baseType: !432, size: 64)
!432 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !433, size: 64)
!433 = !DISubroutineType(types: !434)
!434 = !{null, !39}
!435 = !DIDerivedType(tag: DW_TAG_member, name: "__sa_sigaction", scope: !429, file: !398, line: 271, baseType: !436, size: 64)
!436 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !39, !439, !105}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !413, size: 64)
!440 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sigaction", file: !398, line: 276, size: 192, elements: !441)
!441 = !{!442, !443, !448, !449}
!442 = !DIDerivedType(tag: DW_TAG_member, name: "__sigaction_u", scope: !440, file: !398, line: 277, baseType: !429, size: 64)
!443 = !DIDerivedType(tag: DW_TAG_member, name: "sa_tramp", scope: !440, file: !398, line: 278, baseType: !444, size: 64, offset: 64)
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!445 = !DISubroutineType(types: !446)
!446 = !{null, !105, !39, !39, !447, !105}
!447 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 64)
!448 = !DIDerivedType(tag: DW_TAG_member, name: "sa_mask", scope: !440, file: !398, line: 279, baseType: !393, size: 32, offset: 128)
!449 = !DIDerivedType(tag: DW_TAG_member, name: "sa_flags", scope: !440, file: !398, line: 280, baseType: !39, size: 32, offset: 160)
!450 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigaction", file: !398, line: 286, size: 128, elements: !451)
!451 = !{!452, !453, !454}
!452 = !DIDerivedType(tag: DW_TAG_member, name: "__sigaction_u", scope: !450, file: !398, line: 287, baseType: !429, size: 64)
!453 = !DIDerivedType(tag: DW_TAG_member, name: "sa_mask", scope: !450, file: !398, line: 288, baseType: !393, size: 32, offset: 64)
!454 = !DIDerivedType(tag: DW_TAG_member, name: "sa_flags", scope: !450, file: !398, line: 289, baseType: !39, size: 32, offset: 96)
!455 = !DIDerivedType(tag: DW_TAG_typedef, name: "sig_t", file: !398, line: 331, baseType: !432)
!456 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigvec", file: !398, line: 348, size: 128, elements: !457)
!457 = !{!458, !459, !460}
!458 = !DIDerivedType(tag: DW_TAG_member, name: "sv_handler", scope: !456, file: !398, line: 349, baseType: !432, size: 64)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "sv_mask", scope: !456, file: !398, line: 350, baseType: !39, size: 32, offset: 64)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "sv_flags", scope: !456, file: !398, line: 351, baseType: !39, size: 32, offset: 96)
!461 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigstack", file: !398, line: 367, size: 128, elements: !462)
!462 = !{!463, !464}
!463 = !DIDerivedType(tag: DW_TAG_member, name: "ss_sp", scope: !461, file: !398, line: 368, baseType: !63, size: 64)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "ss_onstack", scope: !461, file: !398, line: 369, baseType: !39, size: 32, offset: 64)
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !466, line: 31, baseType: !33)
!466 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !468, line: 31, baseType: !37)
!468 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !470, line: 31, baseType: !23)
!470 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !472, line: 31, baseType: !44)
!472 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !474, line: 29, baseType: !177)
!474 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !474, line: 30, baseType: !179)
!476 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !474, line: 31, baseType: !181)
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !474, line: 32, baseType: !183)
!478 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !474, line: 33, baseType: !465)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !474, line: 34, baseType: !467)
!480 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !474, line: 35, baseType: !469)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !474, line: 36, baseType: !471)
!482 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !474, line: 40, baseType: !177)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !474, line: 41, baseType: !179)
!484 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !474, line: 42, baseType: !181)
!485 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !474, line: 43, baseType: !183)
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !474, line: 44, baseType: !465)
!487 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !474, line: 45, baseType: !467)
!488 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !474, line: 46, baseType: !469)
!489 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !474, line: 47, baseType: !471)
!490 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !491, line: 32, baseType: !46)
!491 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!492 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !493, line: 32, baseType: !60)
!493 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!494 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !495, line: 34, size: 128, elements: !496)
!495 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_timeval.h", directory: "", checksumkind: CSK_MD5, checksum: "24f84d4e0450b2e5ff976a6f6da860d2")
!496 = !{!497, !498}
!497 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !494, file: !495, line: 36, baseType: !70, size: 64)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !494, file: !495, line: 37, baseType: !87, size: 32, offset: 64)
!499 = !DIDerivedType(tag: DW_TAG_typedef, name: "rlim_t", file: !500, line: 89, baseType: !43)
!500 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/resource.h", directory: "", checksumkind: CSK_MD5, checksum: "c4e799a130a69d94f00fda9cbd994906")
!501 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage", file: !500, line: 152, size: 1152, elements: !502)
!502 = !{!503, !504, !505, !506, !507, !508, !509, !510, !511, !512, !513, !514, !515, !516, !517, !518}
!503 = !DIDerivedType(tag: DW_TAG_member, name: "ru_utime", scope: !501, file: !500, line: 153, baseType: !494, size: 128)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "ru_stime", scope: !501, file: !500, line: 154, baseType: !494, size: 128, offset: 128)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "ru_maxrss", scope: !501, file: !500, line: 163, baseType: !46, size: 64, offset: 256)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "ru_ixrss", scope: !501, file: !500, line: 165, baseType: !46, size: 64, offset: 320)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "ru_idrss", scope: !501, file: !500, line: 166, baseType: !46, size: 64, offset: 384)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "ru_isrss", scope: !501, file: !500, line: 167, baseType: !46, size: 64, offset: 448)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "ru_minflt", scope: !501, file: !500, line: 168, baseType: !46, size: 64, offset: 512)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "ru_majflt", scope: !501, file: !500, line: 169, baseType: !46, size: 64, offset: 576)
!511 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nswap", scope: !501, file: !500, line: 170, baseType: !46, size: 64, offset: 640)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "ru_inblock", scope: !501, file: !500, line: 171, baseType: !46, size: 64, offset: 704)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "ru_oublock", scope: !501, file: !500, line: 172, baseType: !46, size: 64, offset: 768)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "ru_msgsnd", scope: !501, file: !500, line: 173, baseType: !46, size: 64, offset: 832)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "ru_msgrcv", scope: !501, file: !500, line: 174, baseType: !46, size: 64, offset: 896)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nsignals", scope: !501, file: !500, line: 175, baseType: !46, size: 64, offset: 960)
!517 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nvcsw", scope: !501, file: !500, line: 176, baseType: !46, size: 64, offset: 1024)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nivcsw", scope: !501, file: !500, line: 177, baseType: !46, size: 64, offset: 1088)
!519 = !DIDerivedType(tag: DW_TAG_typedef, name: "rusage_info_t", file: !500, line: 200, baseType: !105)
!520 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v0", file: !500, line: 202, size: 768, elements: !521)
!521 = !{!522, !524, !525, !526, !527, !528, !529, !530, !531, !532, !533}
!522 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !520, file: !500, line: 203, baseType: !523, size: 128)
!523 = !DICompositeType(tag: DW_TAG_array_type, baseType: !465, size: 128, elements: !92)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !520, file: !500, line: 204, baseType: !471, size: 64, offset: 128)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !520, file: !500, line: 205, baseType: !471, size: 64, offset: 192)
!526 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !520, file: !500, line: 206, baseType: !471, size: 64, offset: 256)
!527 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !520, file: !500, line: 207, baseType: !471, size: 64, offset: 320)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !520, file: !500, line: 208, baseType: !471, size: 64, offset: 384)
!529 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !520, file: !500, line: 209, baseType: !471, size: 64, offset: 448)
!530 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !520, file: !500, line: 210, baseType: !471, size: 64, offset: 512)
!531 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !520, file: !500, line: 211, baseType: !471, size: 64, offset: 576)
!532 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !520, file: !500, line: 212, baseType: !471, size: 64, offset: 640)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !520, file: !500, line: 213, baseType: !471, size: 64, offset: 704)
!534 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v1", file: !500, line: 216, size: 1152, elements: !535)
!535 = !{!536, !537, !538, !539, !540, !541, !542, !543, !544, !545, !546, !547, !548, !549, !550, !551, !552}
!536 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !534, file: !500, line: 217, baseType: !523, size: 128)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !534, file: !500, line: 218, baseType: !471, size: 64, offset: 128)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !534, file: !500, line: 219, baseType: !471, size: 64, offset: 192)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !534, file: !500, line: 220, baseType: !471, size: 64, offset: 256)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !534, file: !500, line: 221, baseType: !471, size: 64, offset: 320)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !534, file: !500, line: 222, baseType: !471, size: 64, offset: 384)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !534, file: !500, line: 223, baseType: !471, size: 64, offset: 448)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !534, file: !500, line: 224, baseType: !471, size: 64, offset: 512)
!544 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !534, file: !500, line: 225, baseType: !471, size: 64, offset: 576)
!545 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !534, file: !500, line: 226, baseType: !471, size: 64, offset: 640)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !534, file: !500, line: 227, baseType: !471, size: 64, offset: 704)
!547 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_user_time", scope: !534, file: !500, line: 228, baseType: !471, size: 64, offset: 768)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_system_time", scope: !534, file: !500, line: 229, baseType: !471, size: 64, offset: 832)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pkg_idle_wkups", scope: !534, file: !500, line: 230, baseType: !471, size: 64, offset: 896)
!550 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_interrupt_wkups", scope: !534, file: !500, line: 231, baseType: !471, size: 64, offset: 960)
!551 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pageins", scope: !534, file: !500, line: 232, baseType: !471, size: 64, offset: 1024)
!552 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_elapsed_abstime", scope: !534, file: !500, line: 233, baseType: !471, size: 64, offset: 1088)
!553 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v2", file: !500, line: 236, size: 1280, elements: !554)
!554 = !{!555, !556, !557, !558, !559, !560, !561, !562, !563, !564, !565, !566, !567, !568, !569, !570, !571, !572, !573}
!555 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !553, file: !500, line: 237, baseType: !523, size: 128)
!556 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !553, file: !500, line: 238, baseType: !471, size: 64, offset: 128)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !553, file: !500, line: 239, baseType: !471, size: 64, offset: 192)
!558 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !553, file: !500, line: 240, baseType: !471, size: 64, offset: 256)
!559 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !553, file: !500, line: 241, baseType: !471, size: 64, offset: 320)
!560 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !553, file: !500, line: 242, baseType: !471, size: 64, offset: 384)
!561 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !553, file: !500, line: 243, baseType: !471, size: 64, offset: 448)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !553, file: !500, line: 244, baseType: !471, size: 64, offset: 512)
!563 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !553, file: !500, line: 245, baseType: !471, size: 64, offset: 576)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !553, file: !500, line: 246, baseType: !471, size: 64, offset: 640)
!565 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !553, file: !500, line: 247, baseType: !471, size: 64, offset: 704)
!566 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_user_time", scope: !553, file: !500, line: 248, baseType: !471, size: 64, offset: 768)
!567 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_system_time", scope: !553, file: !500, line: 249, baseType: !471, size: 64, offset: 832)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pkg_idle_wkups", scope: !553, file: !500, line: 250, baseType: !471, size: 64, offset: 896)
!569 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_interrupt_wkups", scope: !553, file: !500, line: 251, baseType: !471, size: 64, offset: 960)
!570 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pageins", scope: !553, file: !500, line: 252, baseType: !471, size: 64, offset: 1024)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_elapsed_abstime", scope: !553, file: !500, line: 253, baseType: !471, size: 64, offset: 1088)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_bytesread", scope: !553, file: !500, line: 254, baseType: !471, size: 64, offset: 1152)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_byteswritten", scope: !553, file: !500, line: 255, baseType: !471, size: 64, offset: 1216)
!574 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v3", file: !500, line: 258, size: 1856, elements: !575)
!575 = !{!576, !577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !600, !601, !602, !603}
!576 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !574, file: !500, line: 259, baseType: !523, size: 128)
!577 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !574, file: !500, line: 260, baseType: !471, size: 64, offset: 128)
!578 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !574, file: !500, line: 261, baseType: !471, size: 64, offset: 192)
!579 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !574, file: !500, line: 262, baseType: !471, size: 64, offset: 256)
!580 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !574, file: !500, line: 263, baseType: !471, size: 64, offset: 320)
!581 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !574, file: !500, line: 264, baseType: !471, size: 64, offset: 384)
!582 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !574, file: !500, line: 265, baseType: !471, size: 64, offset: 448)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !574, file: !500, line: 266, baseType: !471, size: 64, offset: 512)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !574, file: !500, line: 267, baseType: !471, size: 64, offset: 576)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !574, file: !500, line: 268, baseType: !471, size: 64, offset: 640)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !574, file: !500, line: 269, baseType: !471, size: 64, offset: 704)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_user_time", scope: !574, file: !500, line: 270, baseType: !471, size: 64, offset: 768)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_system_time", scope: !574, file: !500, line: 271, baseType: !471, size: 64, offset: 832)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pkg_idle_wkups", scope: !574, file: !500, line: 272, baseType: !471, size: 64, offset: 896)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_interrupt_wkups", scope: !574, file: !500, line: 273, baseType: !471, size: 64, offset: 960)
!591 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pageins", scope: !574, file: !500, line: 274, baseType: !471, size: 64, offset: 1024)
!592 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_elapsed_abstime", scope: !574, file: !500, line: 275, baseType: !471, size: 64, offset: 1088)
!593 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_bytesread", scope: !574, file: !500, line: 276, baseType: !471, size: 64, offset: 1152)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_byteswritten", scope: !574, file: !500, line: 277, baseType: !471, size: 64, offset: 1216)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_default", scope: !574, file: !500, line: 278, baseType: !471, size: 64, offset: 1280)
!596 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_maintenance", scope: !574, file: !500, line: 279, baseType: !471, size: 64, offset: 1344)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_background", scope: !574, file: !500, line: 280, baseType: !471, size: 64, offset: 1408)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_utility", scope: !574, file: !500, line: 281, baseType: !471, size: 64, offset: 1472)
!599 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_legacy", scope: !574, file: !500, line: 282, baseType: !471, size: 64, offset: 1536)
!600 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_initiated", scope: !574, file: !500, line: 283, baseType: !471, size: 64, offset: 1600)
!601 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_interactive", scope: !574, file: !500, line: 284, baseType: !471, size: 64, offset: 1664)
!602 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_system_time", scope: !574, file: !500, line: 285, baseType: !471, size: 64, offset: 1728)
!603 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_system_time", scope: !574, file: !500, line: 286, baseType: !471, size: 64, offset: 1792)
!604 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v4", file: !500, line: 289, size: 2368, elements: !605)
!605 = !{!606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !616, !617, !618, !619, !620, !621, !622, !623, !624, !625, !626, !627, !628, !629, !630, !631, !632, !633, !634, !635, !636, !637, !638, !639, !640, !641}
!606 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !604, file: !500, line: 290, baseType: !523, size: 128)
!607 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !604, file: !500, line: 291, baseType: !471, size: 64, offset: 128)
!608 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !604, file: !500, line: 292, baseType: !471, size: 64, offset: 192)
!609 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !604, file: !500, line: 293, baseType: !471, size: 64, offset: 256)
!610 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !604, file: !500, line: 294, baseType: !471, size: 64, offset: 320)
!611 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !604, file: !500, line: 295, baseType: !471, size: 64, offset: 384)
!612 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !604, file: !500, line: 296, baseType: !471, size: 64, offset: 448)
!613 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !604, file: !500, line: 297, baseType: !471, size: 64, offset: 512)
!614 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !604, file: !500, line: 298, baseType: !471, size: 64, offset: 576)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !604, file: !500, line: 299, baseType: !471, size: 64, offset: 640)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !604, file: !500, line: 300, baseType: !471, size: 64, offset: 704)
!617 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_user_time", scope: !604, file: !500, line: 301, baseType: !471, size: 64, offset: 768)
!618 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_system_time", scope: !604, file: !500, line: 302, baseType: !471, size: 64, offset: 832)
!619 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pkg_idle_wkups", scope: !604, file: !500, line: 303, baseType: !471, size: 64, offset: 896)
!620 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_interrupt_wkups", scope: !604, file: !500, line: 304, baseType: !471, size: 64, offset: 960)
!621 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pageins", scope: !604, file: !500, line: 305, baseType: !471, size: 64, offset: 1024)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_elapsed_abstime", scope: !604, file: !500, line: 306, baseType: !471, size: 64, offset: 1088)
!623 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_bytesread", scope: !604, file: !500, line: 307, baseType: !471, size: 64, offset: 1152)
!624 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_byteswritten", scope: !604, file: !500, line: 308, baseType: !471, size: 64, offset: 1216)
!625 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_default", scope: !604, file: !500, line: 309, baseType: !471, size: 64, offset: 1280)
!626 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_maintenance", scope: !604, file: !500, line: 310, baseType: !471, size: 64, offset: 1344)
!627 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_background", scope: !604, file: !500, line: 311, baseType: !471, size: 64, offset: 1408)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_utility", scope: !604, file: !500, line: 312, baseType: !471, size: 64, offset: 1472)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_legacy", scope: !604, file: !500, line: 313, baseType: !471, size: 64, offset: 1536)
!630 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_initiated", scope: !604, file: !500, line: 314, baseType: !471, size: 64, offset: 1600)
!631 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_interactive", scope: !604, file: !500, line: 315, baseType: !471, size: 64, offset: 1664)
!632 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_system_time", scope: !604, file: !500, line: 316, baseType: !471, size: 64, offset: 1728)
!633 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_system_time", scope: !604, file: !500, line: 317, baseType: !471, size: 64, offset: 1792)
!634 = !DIDerivedType(tag: DW_TAG_member, name: "ri_logical_writes", scope: !604, file: !500, line: 318, baseType: !471, size: 64, offset: 1856)
!635 = !DIDerivedType(tag: DW_TAG_member, name: "ri_lifetime_max_phys_footprint", scope: !604, file: !500, line: 319, baseType: !471, size: 64, offset: 1920)
!636 = !DIDerivedType(tag: DW_TAG_member, name: "ri_instructions", scope: !604, file: !500, line: 320, baseType: !471, size: 64, offset: 1984)
!637 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cycles", scope: !604, file: !500, line: 321, baseType: !471, size: 64, offset: 2048)
!638 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_energy", scope: !604, file: !500, line: 322, baseType: !471, size: 64, offset: 2112)
!639 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_energy", scope: !604, file: !500, line: 323, baseType: !471, size: 64, offset: 2176)
!640 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interval_max_phys_footprint", scope: !604, file: !500, line: 324, baseType: !471, size: 64, offset: 2240)
!641 = !DIDerivedType(tag: DW_TAG_member, name: "ri_runnable_time", scope: !604, file: !500, line: 325, baseType: !471, size: 64, offset: 2304)
!642 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v5", file: !500, line: 328, size: 2432, elements: !643)
!643 = !{!644, !645, !646, !647, !648, !649, !650, !651, !652, !653, !654, !655, !656, !657, !658, !659, !660, !661, !662, !663, !664, !665, !666, !667, !668, !669, !670, !671, !672, !673, !674, !675, !676, !677, !678, !679, !680}
!644 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !642, file: !500, line: 329, baseType: !523, size: 128)
!645 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !642, file: !500, line: 330, baseType: !471, size: 64, offset: 128)
!646 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !642, file: !500, line: 331, baseType: !471, size: 64, offset: 192)
!647 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !642, file: !500, line: 332, baseType: !471, size: 64, offset: 256)
!648 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !642, file: !500, line: 333, baseType: !471, size: 64, offset: 320)
!649 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !642, file: !500, line: 334, baseType: !471, size: 64, offset: 384)
!650 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !642, file: !500, line: 335, baseType: !471, size: 64, offset: 448)
!651 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !642, file: !500, line: 336, baseType: !471, size: 64, offset: 512)
!652 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !642, file: !500, line: 337, baseType: !471, size: 64, offset: 576)
!653 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !642, file: !500, line: 338, baseType: !471, size: 64, offset: 640)
!654 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !642, file: !500, line: 339, baseType: !471, size: 64, offset: 704)
!655 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_user_time", scope: !642, file: !500, line: 340, baseType: !471, size: 64, offset: 768)
!656 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_system_time", scope: !642, file: !500, line: 341, baseType: !471, size: 64, offset: 832)
!657 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pkg_idle_wkups", scope: !642, file: !500, line: 342, baseType: !471, size: 64, offset: 896)
!658 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_interrupt_wkups", scope: !642, file: !500, line: 343, baseType: !471, size: 64, offset: 960)
!659 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pageins", scope: !642, file: !500, line: 344, baseType: !471, size: 64, offset: 1024)
!660 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_elapsed_abstime", scope: !642, file: !500, line: 345, baseType: !471, size: 64, offset: 1088)
!661 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_bytesread", scope: !642, file: !500, line: 346, baseType: !471, size: 64, offset: 1152)
!662 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_byteswritten", scope: !642, file: !500, line: 347, baseType: !471, size: 64, offset: 1216)
!663 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_default", scope: !642, file: !500, line: 348, baseType: !471, size: 64, offset: 1280)
!664 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_maintenance", scope: !642, file: !500, line: 349, baseType: !471, size: 64, offset: 1344)
!665 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_background", scope: !642, file: !500, line: 350, baseType: !471, size: 64, offset: 1408)
!666 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_utility", scope: !642, file: !500, line: 351, baseType: !471, size: 64, offset: 1472)
!667 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_legacy", scope: !642, file: !500, line: 352, baseType: !471, size: 64, offset: 1536)
!668 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_initiated", scope: !642, file: !500, line: 353, baseType: !471, size: 64, offset: 1600)
!669 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_interactive", scope: !642, file: !500, line: 354, baseType: !471, size: 64, offset: 1664)
!670 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_system_time", scope: !642, file: !500, line: 355, baseType: !471, size: 64, offset: 1728)
!671 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_system_time", scope: !642, file: !500, line: 356, baseType: !471, size: 64, offset: 1792)
!672 = !DIDerivedType(tag: DW_TAG_member, name: "ri_logical_writes", scope: !642, file: !500, line: 357, baseType: !471, size: 64, offset: 1856)
!673 = !DIDerivedType(tag: DW_TAG_member, name: "ri_lifetime_max_phys_footprint", scope: !642, file: !500, line: 358, baseType: !471, size: 64, offset: 1920)
!674 = !DIDerivedType(tag: DW_TAG_member, name: "ri_instructions", scope: !642, file: !500, line: 359, baseType: !471, size: 64, offset: 1984)
!675 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cycles", scope: !642, file: !500, line: 360, baseType: !471, size: 64, offset: 2048)
!676 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_energy", scope: !642, file: !500, line: 361, baseType: !471, size: 64, offset: 2112)
!677 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_energy", scope: !642, file: !500, line: 362, baseType: !471, size: 64, offset: 2176)
!678 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interval_max_phys_footprint", scope: !642, file: !500, line: 363, baseType: !471, size: 64, offset: 2240)
!679 = !DIDerivedType(tag: DW_TAG_member, name: "ri_runnable_time", scope: !642, file: !500, line: 364, baseType: !471, size: 64, offset: 2304)
!680 = !DIDerivedType(tag: DW_TAG_member, name: "ri_flags", scope: !642, file: !500, line: 365, baseType: !471, size: 64, offset: 2368)
!681 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage_info_v6", file: !500, line: 368, size: 3712, elements: !682)
!682 = !{!683, !684, !685, !686, !687, !688, !689, !690, !691, !692, !693, !694, !695, !696, !697, !698, !699, !700, !701, !702, !703, !704, !705, !706, !707, !708, !709, !710, !711, !712, !713, !714, !715, !716, !717, !718, !719, !720, !721, !722, !723, !724, !725, !726, !727, !728, !729, !730, !731}
!683 = !DIDerivedType(tag: DW_TAG_member, name: "ri_uuid", scope: !681, file: !500, line: 369, baseType: !523, size: 128)
!684 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_time", scope: !681, file: !500, line: 370, baseType: !471, size: 64, offset: 128)
!685 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_time", scope: !681, file: !500, line: 371, baseType: !471, size: 64, offset: 192)
!686 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pkg_idle_wkups", scope: !681, file: !500, line: 372, baseType: !471, size: 64, offset: 256)
!687 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interrupt_wkups", scope: !681, file: !500, line: 373, baseType: !471, size: 64, offset: 320)
!688 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pageins", scope: !681, file: !500, line: 374, baseType: !471, size: 64, offset: 384)
!689 = !DIDerivedType(tag: DW_TAG_member, name: "ri_wired_size", scope: !681, file: !500, line: 375, baseType: !471, size: 64, offset: 448)
!690 = !DIDerivedType(tag: DW_TAG_member, name: "ri_resident_size", scope: !681, file: !500, line: 376, baseType: !471, size: 64, offset: 512)
!691 = !DIDerivedType(tag: DW_TAG_member, name: "ri_phys_footprint", scope: !681, file: !500, line: 377, baseType: !471, size: 64, offset: 576)
!692 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_start_abstime", scope: !681, file: !500, line: 378, baseType: !471, size: 64, offset: 640)
!693 = !DIDerivedType(tag: DW_TAG_member, name: "ri_proc_exit_abstime", scope: !681, file: !500, line: 379, baseType: !471, size: 64, offset: 704)
!694 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_user_time", scope: !681, file: !500, line: 380, baseType: !471, size: 64, offset: 768)
!695 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_system_time", scope: !681, file: !500, line: 381, baseType: !471, size: 64, offset: 832)
!696 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pkg_idle_wkups", scope: !681, file: !500, line: 382, baseType: !471, size: 64, offset: 896)
!697 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_interrupt_wkups", scope: !681, file: !500, line: 383, baseType: !471, size: 64, offset: 960)
!698 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_pageins", scope: !681, file: !500, line: 384, baseType: !471, size: 64, offset: 1024)
!699 = !DIDerivedType(tag: DW_TAG_member, name: "ri_child_elapsed_abstime", scope: !681, file: !500, line: 385, baseType: !471, size: 64, offset: 1088)
!700 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_bytesread", scope: !681, file: !500, line: 386, baseType: !471, size: 64, offset: 1152)
!701 = !DIDerivedType(tag: DW_TAG_member, name: "ri_diskio_byteswritten", scope: !681, file: !500, line: 387, baseType: !471, size: 64, offset: 1216)
!702 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_default", scope: !681, file: !500, line: 388, baseType: !471, size: 64, offset: 1280)
!703 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_maintenance", scope: !681, file: !500, line: 389, baseType: !471, size: 64, offset: 1344)
!704 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_background", scope: !681, file: !500, line: 390, baseType: !471, size: 64, offset: 1408)
!705 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_utility", scope: !681, file: !500, line: 391, baseType: !471, size: 64, offset: 1472)
!706 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_legacy", scope: !681, file: !500, line: 392, baseType: !471, size: 64, offset: 1536)
!707 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_initiated", scope: !681, file: !500, line: 393, baseType: !471, size: 64, offset: 1600)
!708 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cpu_time_qos_user_interactive", scope: !681, file: !500, line: 394, baseType: !471, size: 64, offset: 1664)
!709 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_system_time", scope: !681, file: !500, line: 395, baseType: !471, size: 64, offset: 1728)
!710 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_system_time", scope: !681, file: !500, line: 396, baseType: !471, size: 64, offset: 1792)
!711 = !DIDerivedType(tag: DW_TAG_member, name: "ri_logical_writes", scope: !681, file: !500, line: 397, baseType: !471, size: 64, offset: 1856)
!712 = !DIDerivedType(tag: DW_TAG_member, name: "ri_lifetime_max_phys_footprint", scope: !681, file: !500, line: 398, baseType: !471, size: 64, offset: 1920)
!713 = !DIDerivedType(tag: DW_TAG_member, name: "ri_instructions", scope: !681, file: !500, line: 399, baseType: !471, size: 64, offset: 1984)
!714 = !DIDerivedType(tag: DW_TAG_member, name: "ri_cycles", scope: !681, file: !500, line: 400, baseType: !471, size: 64, offset: 2048)
!715 = !DIDerivedType(tag: DW_TAG_member, name: "ri_billed_energy", scope: !681, file: !500, line: 401, baseType: !471, size: 64, offset: 2112)
!716 = !DIDerivedType(tag: DW_TAG_member, name: "ri_serviced_energy", scope: !681, file: !500, line: 402, baseType: !471, size: 64, offset: 2176)
!717 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interval_max_phys_footprint", scope: !681, file: !500, line: 403, baseType: !471, size: 64, offset: 2240)
!718 = !DIDerivedType(tag: DW_TAG_member, name: "ri_runnable_time", scope: !681, file: !500, line: 404, baseType: !471, size: 64, offset: 2304)
!719 = !DIDerivedType(tag: DW_TAG_member, name: "ri_flags", scope: !681, file: !500, line: 405, baseType: !471, size: 64, offset: 2368)
!720 = !DIDerivedType(tag: DW_TAG_member, name: "ri_user_ptime", scope: !681, file: !500, line: 406, baseType: !471, size: 64, offset: 2432)
!721 = !DIDerivedType(tag: DW_TAG_member, name: "ri_system_ptime", scope: !681, file: !500, line: 407, baseType: !471, size: 64, offset: 2496)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pinstructions", scope: !681, file: !500, line: 408, baseType: !471, size: 64, offset: 2560)
!723 = !DIDerivedType(tag: DW_TAG_member, name: "ri_pcycles", scope: !681, file: !500, line: 409, baseType: !471, size: 64, offset: 2624)
!724 = !DIDerivedType(tag: DW_TAG_member, name: "ri_energy_nj", scope: !681, file: !500, line: 410, baseType: !471, size: 64, offset: 2688)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "ri_penergy_nj", scope: !681, file: !500, line: 411, baseType: !471, size: 64, offset: 2752)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "ri_secure_time_in_system", scope: !681, file: !500, line: 412, baseType: !471, size: 64, offset: 2816)
!727 = !DIDerivedType(tag: DW_TAG_member, name: "ri_secure_ptime_in_system", scope: !681, file: !500, line: 413, baseType: !471, size: 64, offset: 2880)
!728 = !DIDerivedType(tag: DW_TAG_member, name: "ri_neural_footprint", scope: !681, file: !500, line: 414, baseType: !471, size: 64, offset: 2944)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "ri_lifetime_max_neural_footprint", scope: !681, file: !500, line: 415, baseType: !471, size: 64, offset: 3008)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "ri_interval_max_neural_footprint", scope: !681, file: !500, line: 416, baseType: !471, size: 64, offset: 3072)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "ri_reserved", scope: !681, file: !500, line: 417, baseType: !732, size: 576, offset: 3136)
!732 = !DICompositeType(tag: DW_TAG_array_type, baseType: !471, size: 576, elements: !733)
!733 = !{!734}
!734 = !DISubrange(count: 9)
!735 = !DIDerivedType(tag: DW_TAG_typedef, name: "rusage_info_current", file: !500, line: 420, baseType: !681)
!736 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rlimit", file: !500, line: 464, size: 128, elements: !737)
!737 = !{!738, !739}
!738 = !DIDerivedType(tag: DW_TAG_member, name: "rlim_cur", scope: !736, file: !500, line: 465, baseType: !499, size: 64)
!739 = !DIDerivedType(tag: DW_TAG_member, name: "rlim_max", scope: !736, file: !500, line: 466, baseType: !499, size: 64, offset: 64)
!740 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "proc_rlimit_control_wakeupmon", file: !500, line: 499, size: 64, elements: !741)
!741 = !{!742, !743}
!742 = !DIDerivedType(tag: DW_TAG_member, name: "wm_flags", scope: !740, file: !500, line: 500, baseType: !469, size: 32)
!743 = !DIDerivedType(tag: DW_TAG_member, name: "wm_rate", scope: !740, file: !500, line: 501, baseType: !181, size: 32, offset: 32)
!744 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "wait", file: !22, line: 194, size: 32, elements: !745)
!745 = !{!746, !747, !754}
!746 = !DIDerivedType(tag: DW_TAG_member, name: "w_status", scope: !744, file: !22, line: 195, baseType: !39, size: 32)
!747 = !DIDerivedType(tag: DW_TAG_member, name: "w_T", scope: !744, file: !22, line: 212, baseType: !748, size: 32)
!748 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !744, file: !22, line: 199, size: 32, elements: !749)
!749 = !{!750, !751, !752, !753}
!750 = !DIDerivedType(tag: DW_TAG_member, name: "w_Termsig", scope: !748, file: !22, line: 201, baseType: !23, size: 7, flags: DIFlagBitField, extraData: i64 0)
!751 = !DIDerivedType(tag: DW_TAG_member, name: "w_Coredump", scope: !748, file: !22, line: 202, baseType: !23, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!752 = !DIDerivedType(tag: DW_TAG_member, name: "w_Retcode", scope: !748, file: !22, line: 203, baseType: !23, size: 8, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!753 = !DIDerivedType(tag: DW_TAG_member, name: "w_Filler", scope: !748, file: !22, line: 204, baseType: !23, size: 16, offset: 16, flags: DIFlagBitField, extraData: i64 0)
!754 = !DIDerivedType(tag: DW_TAG_member, name: "w_S", scope: !744, file: !22, line: 229, baseType: !755, size: 32)
!755 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !744, file: !22, line: 218, size: 32, elements: !756)
!756 = !{!757, !758, !759}
!757 = !DIDerivedType(tag: DW_TAG_member, name: "w_Stopval", scope: !755, file: !22, line: 220, baseType: !23, size: 8, flags: DIFlagBitField, extraData: i64 0)
!758 = !DIDerivedType(tag: DW_TAG_member, name: "w_Stopsig", scope: !755, file: !22, line: 221, baseType: !23, size: 8, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!759 = !DIDerivedType(tag: DW_TAG_member, name: "w_Filler", scope: !755, file: !22, line: 222, baseType: !23, size: 16, offset: 16, flags: DIFlagBitField, extraData: i64 0)
!760 = !DIDerivedType(tag: DW_TAG_typedef, name: "ct_rune_t", file: !761, line: 32, baseType: !48)
!761 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_ct_rune_t.h", directory: "", checksumkind: CSK_MD5, checksum: "c22112154646d7509ef295660b838a0e")
!762 = !DIDerivedType(tag: DW_TAG_typedef, name: "rune_t", file: !763, line: 31, baseType: !65)
!763 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_rune_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f2344ffb16201340bfd175b1637ea60f")
!764 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !765, line: 53, baseType: !64)
!765 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wchar_t.h", directory: "", checksumkind: CSK_MD5, checksum: "7c8733b31e382e8074a475f5c41f1e03")
!766 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !767, line: 83, size: 64, elements: !768)
!767 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "1fbf79127e45bcc71ac6e64ce165d68a")
!768 = !{!769, !770}
!769 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !766, file: !767, line: 84, baseType: !39, size: 32)
!770 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !766, file: !767, line: 85, baseType: !39, size: 32, offset: 32)
!771 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !767, line: 86, baseType: !766)
!772 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !767, line: 88, size: 128, elements: !773)
!773 = !{!774, !775}
!774 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !772, file: !767, line: 89, baseType: !46, size: 64)
!775 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !772, file: !767, line: 90, baseType: !46, size: 64, offset: 64)
!776 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !767, line: 91, baseType: !772)
!777 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !767, line: 94, size: 128, elements: !778)
!778 = !{!779, !780}
!779 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !777, file: !767, line: 95, baseType: !42, size: 64)
!780 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !777, file: !767, line: 96, baseType: !42, size: 64, offset: 64)
!781 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !767, line: 97, baseType: !777)
!782 = !DIDerivedType(tag: DW_TAG_typedef, name: "malloc_type_id_t", file: !783, line: 30, baseType: !44)
!783 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc_type.h", directory: "", checksumkind: CSK_MD5, checksum: "d42ade5b4592df6ab4d40d7d5990e609")
!784 = !DIDerivedType(tag: DW_TAG_typedef, name: "malloc_zone_t", file: !783, line: 63, baseType: !785)
!785 = !DICompositeType(tag: DW_TAG_structure_type, name: "_malloc_zone_t", file: !783, line: 63, flags: DIFlagFwdDecl)
!786 = !DIDerivedType(tag: DW_TAG_typedef, name: "dev_t", file: !787, line: 31, baseType: !74)
!787 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_dev_t.h", directory: "", checksumkind: CSK_MD5, checksum: "48c1388efd95518803dfc92f7c613390")
!788 = !DIDerivedType(tag: DW_TAG_typedef, name: "mode_t", file: !789, line: 31, baseType: !83)
!789 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mode_t.h", directory: "", checksumkind: CSK_MD5, checksum: "9d25d351341bf46798d552a73c506c13")
!790 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !2, line: 4, size: 192, elements: !791)
!791 = !{!792, !793, !795}
!792 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !790, file: !2, line: 6, baseType: !39, size: 32)
!793 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !790, file: !2, line: 7, baseType: !794, size: 64, offset: 64)
!794 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64)
!795 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !790, file: !2, line: 8, baseType: !794, size: 64, offset: 128)
!796 = !{!0, !7, !12, !797, !802, !805, !807, !812, !814, !819, !824, !829, !834, !836, !838, !841, !843, !845, !850, !852, !854, !859, !861, !863, !868, !17, !870, !872, !874}
!797 = !DIGlobalVariableExpression(var: !798, expr: !DIExpression())
!798 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !799, isLocal: true, isDefinition: true)
!799 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !800)
!800 = !{!801}
!801 = !DISubrange(count: 41)
!802 = !DIGlobalVariableExpression(var: !803, expr: !DIExpression())
!803 = distinct !DIGlobalVariable(scope: null, file: !2, line: 60, type: !804, isLocal: true, isDefinition: true)
!804 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !733)
!805 = !DIGlobalVariableExpression(var: !806, expr: !DIExpression())
!806 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !9, isLocal: true, isDefinition: true)
!807 = !DIGlobalVariableExpression(var: !808, expr: !DIExpression())
!808 = distinct !DIGlobalVariable(scope: null, file: !2, line: 82, type: !809, isLocal: true, isDefinition: true)
!809 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 224, elements: !810)
!810 = !{!811}
!811 = !DISubrange(count: 28)
!812 = !DIGlobalVariableExpression(var: !813, expr: !DIExpression())
!813 = distinct !DIGlobalVariable(scope: null, file: !2, line: 89, type: !9, isLocal: true, isDefinition: true)
!814 = !DIGlobalVariableExpression(var: !815, expr: !DIExpression())
!815 = distinct !DIGlobalVariable(scope: null, file: !2, line: 93, type: !816, isLocal: true, isDefinition: true)
!816 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !817)
!817 = !{!818}
!818 = !DISubrange(count: 5)
!819 = !DIGlobalVariableExpression(var: !820, expr: !DIExpression())
!820 = distinct !DIGlobalVariable(scope: null, file: !2, line: 104, type: !821, isLocal: true, isDefinition: true)
!821 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !822)
!822 = !{!823}
!823 = !DISubrange(count: 11)
!824 = !DIGlobalVariableExpression(var: !825, expr: !DIExpression())
!825 = distinct !DIGlobalVariable(scope: null, file: !2, line: 110, type: !826, isLocal: true, isDefinition: true)
!826 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !827)
!827 = !{!828}
!828 = !DISubrange(count: 15)
!829 = !DIGlobalVariableExpression(var: !830, expr: !DIExpression())
!830 = distinct !DIGlobalVariable(scope: null, file: !2, line: 130, type: !831, isLocal: true, isDefinition: true)
!831 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !832)
!832 = !{!833}
!833 = !DISubrange(count: 10)
!834 = !DIGlobalVariableExpression(var: !835, expr: !DIExpression())
!835 = distinct !DIGlobalVariable(scope: null, file: !2, line: 134, type: !153, isLocal: true, isDefinition: true)
!836 = !DIGlobalVariableExpression(var: !837, expr: !DIExpression())
!837 = distinct !DIGlobalVariable(scope: null, file: !2, line: 156, type: !826, isLocal: true, isDefinition: true)
!838 = !DIGlobalVariableExpression(var: !839, expr: !DIExpression())
!839 = distinct !DIGlobalVariable(scope: null, file: !2, line: 185, type: !840, isLocal: true, isDefinition: true)
!840 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 232, elements: !301)
!841 = !DIGlobalVariableExpression(var: !842, expr: !DIExpression())
!842 = distinct !DIGlobalVariable(scope: null, file: !2, line: 197, type: !821, isLocal: true, isDefinition: true)
!843 = !DIGlobalVariableExpression(var: !844, expr: !DIExpression())
!844 = distinct !DIGlobalVariable(scope: null, file: !2, line: 202, type: !9, isLocal: true, isDefinition: true)
!845 = !DIGlobalVariableExpression(var: !846, expr: !DIExpression())
!846 = distinct !DIGlobalVariable(scope: null, file: !2, line: 209, type: !847, isLocal: true, isDefinition: true)
!847 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !848)
!848 = !{!849}
!849 = !DISubrange(count: 14)
!850 = !DIGlobalVariableExpression(var: !851, expr: !DIExpression())
!851 = distinct !DIGlobalVariable(scope: null, file: !2, line: 213, type: !847, isLocal: true, isDefinition: true)
!852 = !DIGlobalVariableExpression(var: !853, expr: !DIExpression())
!853 = distinct !DIGlobalVariable(scope: null, file: !2, line: 220, type: !153, isLocal: true, isDefinition: true)
!854 = !DIGlobalVariableExpression(var: !855, expr: !DIExpression())
!855 = distinct !DIGlobalVariable(scope: null, file: !2, line: 228, type: !856, isLocal: true, isDefinition: true)
!856 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 416, elements: !857)
!857 = !{!858}
!858 = !DISubrange(count: 52)
!859 = !DIGlobalVariableExpression(var: !860, expr: !DIExpression())
!860 = distinct !DIGlobalVariable(scope: null, file: !2, line: 237, type: !847, isLocal: true, isDefinition: true)
!861 = !DIGlobalVariableExpression(var: !862, expr: !DIExpression())
!862 = distinct !DIGlobalVariable(scope: null, file: !2, line: 244, type: !847, isLocal: true, isDefinition: true)
!863 = !DIGlobalVariableExpression(var: !864, expr: !DIExpression())
!864 = distinct !DIGlobalVariable(scope: null, file: !2, line: 245, type: !865, isLocal: true, isDefinition: true)
!865 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !866)
!866 = !{!867}
!867 = !DISubrange(count: 2)
!868 = !DIGlobalVariableExpression(var: !869, expr: !DIExpression())
!869 = distinct !DIGlobalVariable(name: "head", scope: !19, file: !2, line: 10, type: !794, isLocal: false, isDefinition: true)
!870 = !DIGlobalVariableExpression(var: !871, expr: !DIExpression())
!871 = distinct !DIGlobalVariable(name: "n", scope: !19, file: !2, line: 20, type: !39, isLocal: false, isDefinition: true)
!872 = !DIGlobalVariableExpression(var: !873, expr: !DIExpression())
!873 = distinct !DIGlobalVariable(name: "loc", scope: !19, file: !2, line: 20, type: !39, isLocal: false, isDefinition: true)
!874 = !DIGlobalVariableExpression(var: !875, expr: !DIExpression())
!875 = distinct !DIGlobalVariable(name: "i", scope: !19, file: !2, line: 20, type: !39, isLocal: false, isDefinition: true)
!876 = !{i32 7, !"Dwarf Version", i32 5}
!877 = !{i32 2, !"Debug Info Version", i32 3}
!878 = !{i32 1, !"wchar_size", i32 4}
!879 = !{i32 8, !"PIC Level", i32 2}
!880 = !{i32 7, !"uwtable", i32 1}
!881 = !{i32 7, !"frame-pointer", i32 1}
!882 = !{!"Homebrew clang version 19.1.4"}
!883 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !884, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !19)
!884 = !DISubroutineType(types: !885)
!885 = !{!39}
!886 = !DILocation(line: 24, column: 2, scope: !883)
!887 = !DILocation(line: 25, column: 2, scope: !883)
!888 = !DILocation(line: 26, column: 1, scope: !883)
!889 = distinct !DISubprogram(name: "menu", scope: !2, file: !2, line: 28, type: !890, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !19)
!890 = !DISubroutineType(types: !891)
!891 = !{null}
!892 = !DILocation(line: 29, column: 2, scope: !889)
!893 = !DILocation(line: 30, column: 2, scope: !889)
!894 = !DILocation(line: 31, column: 9, scope: !889)
!895 = !DILocation(line: 31, column: 2, scope: !889)
!896 = !DILocation(line: 33, column: 9, scope: !897)
!897 = distinct !DILexicalBlock(scope: !889, file: !2, line: 32, column: 2)
!898 = !DILocation(line: 34, column: 3, scope: !897)
!899 = !DILocation(line: 35, column: 9, scope: !897)
!900 = !DILocation(line: 36, column: 3, scope: !897)
!901 = !DILocation(line: 37, column: 9, scope: !897)
!902 = !DILocation(line: 38, column: 3, scope: !897)
!903 = !DILocation(line: 39, column: 9, scope: !897)
!904 = !DILocation(line: 40, column: 3, scope: !897)
!905 = !DILocation(line: 41, column: 9, scope: !897)
!906 = !DILocation(line: 42, column: 3, scope: !897)
!907 = !DILocation(line: 43, column: 9, scope: !897)
!908 = !DILocation(line: 44, column: 3, scope: !897)
!909 = !DILocation(line: 45, column: 9, scope: !897)
!910 = !DILocation(line: 46, column: 3, scope: !897)
!911 = !DILocation(line: 48, column: 3, scope: !897)
!912 = !DILocation(line: 50, column: 3, scope: !897)
!913 = !DILocation(line: 51, column: 3, scope: !897)
!914 = !DILocation(line: 53, column: 1, scope: !889)
!915 = distinct !DISubprogram(name: "insertb", scope: !2, file: !2, line: 55, type: !890, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!916 = !{}
!917 = !DILocalVariable(name: "ptr", scope: !915, file: !2, line: 57, type: !794)
!918 = !DILocation(line: 57, column: 15, scope: !915)
!919 = !DILocation(line: 58, column: 21, scope: !915)
!920 = !DILocation(line: 58, column: 5, scope: !915)
!921 = !DILocation(line: 59, column: 5, scope: !922)
!922 = distinct !DILexicalBlock(scope: !915, file: !2, line: 59, column: 5)
!923 = !DILocation(line: 59, column: 8, scope: !922)
!924 = !DILocation(line: 59, column: 5, scope: !915)
!925 = !DILocation(line: 60, column: 3, scope: !926)
!926 = distinct !DILexicalBlock(scope: !922, file: !2, line: 59, column: 15)
!927 = !DILocation(line: 61, column: 2, scope: !926)
!928 = !DILocation(line: 64, column: 3, scope: !929)
!929 = distinct !DILexicalBlock(scope: !922, file: !2, line: 63, column: 2)
!930 = !DILocation(line: 65, column: 3, scope: !929)
!931 = !DILocation(line: 67, column: 5, scope: !932)
!932 = distinct !DILexicalBlock(scope: !915, file: !2, line: 67, column: 5)
!933 = !DILocation(line: 67, column: 9, scope: !932)
!934 = !DILocation(line: 67, column: 5, scope: !915)
!935 = !DILocation(line: 69, column: 13, scope: !936)
!936 = distinct !DILexicalBlock(scope: !932, file: !2, line: 68, column: 2)
!937 = !DILocation(line: 69, column: 3, scope: !936)
!938 = !DILocation(line: 69, column: 8, scope: !936)
!939 = !DILocation(line: 69, column: 12, scope: !936)
!940 = !DILocation(line: 70, column: 3, scope: !936)
!941 = !DILocation(line: 70, column: 8, scope: !936)
!942 = !DILocation(line: 70, column: 12, scope: !936)
!943 = !DILocation(line: 71, column: 3, scope: !936)
!944 = !DILocation(line: 71, column: 8, scope: !936)
!945 = !DILocation(line: 71, column: 12, scope: !936)
!946 = !DILocation(line: 72, column: 8, scope: !936)
!947 = !DILocation(line: 72, column: 7, scope: !936)
!948 = !DILocation(line: 73, column: 2, scope: !936)
!949 = !DILocation(line: 76, column: 13, scope: !950)
!950 = distinct !DILexicalBlock(scope: !932, file: !2, line: 75, column: 2)
!951 = !DILocation(line: 76, column: 3, scope: !950)
!952 = !DILocation(line: 76, column: 8, scope: !950)
!953 = !DILocation(line: 76, column: 12, scope: !950)
!954 = !DILocation(line: 77, column: 3, scope: !950)
!955 = !DILocation(line: 77, column: 8, scope: !950)
!956 = !DILocation(line: 77, column: 12, scope: !950)
!957 = !DILocation(line: 78, column: 13, scope: !950)
!958 = !DILocation(line: 78, column: 3, scope: !950)
!959 = !DILocation(line: 78, column: 8, scope: !950)
!960 = !DILocation(line: 78, column: 12, scope: !950)
!961 = !DILocation(line: 79, column: 8, scope: !950)
!962 = !DILocation(line: 79, column: 13, scope: !950)
!963 = !DILocation(line: 79, column: 7, scope: !950)
!964 = !DILocation(line: 80, column: 8, scope: !950)
!965 = !DILocation(line: 80, column: 7, scope: !950)
!966 = !DILocation(line: 82, column: 2, scope: !915)
!967 = !DILocation(line: 83, column: 2, scope: !915)
!968 = !DILocation(line: 84, column: 1, scope: !915)
!969 = distinct !DISubprogram(name: "display", scope: !2, file: !2, line: 86, type: !890, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!970 = !DILocalVariable(name: "ptr", scope: !969, file: !2, line: 88, type: !794)
!971 = !DILocation(line: 88, column: 15, scope: !969)
!972 = !DILocation(line: 89, column: 2, scope: !969)
!973 = !DILocation(line: 90, column: 6, scope: !969)
!974 = !DILocation(line: 90, column: 5, scope: !969)
!975 = !DILocation(line: 91, column: 2, scope: !969)
!976 = !DILocation(line: 91, column: 8, scope: !969)
!977 = !DILocation(line: 91, column: 11, scope: !969)
!978 = !DILocation(line: 93, column: 17, scope: !979)
!979 = distinct !DILexicalBlock(scope: !969, file: !2, line: 92, column: 2)
!980 = !DILocation(line: 93, column: 22, scope: !979)
!981 = !DILocation(line: 93, column: 3, scope: !979)
!982 = !DILocation(line: 94, column: 7, scope: !979)
!983 = !DILocation(line: 94, column: 12, scope: !979)
!984 = !DILocation(line: 94, column: 6, scope: !979)
!985 = distinct !{!985, !975, !986, !987}
!986 = !DILocation(line: 95, column: 2, scope: !969)
!987 = !{!"llvm.loop.mustprogress"}
!988 = !DILocation(line: 96, column: 2, scope: !969)
!989 = !DILocation(line: 97, column: 1, scope: !969)
!990 = distinct !DISubprogram(name: "deleteb", scope: !2, file: !2, line: 99, type: !890, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!991 = !DILocalVariable(name: "ptr", scope: !990, file: !2, line: 101, type: !794)
!992 = !DILocation(line: 101, column: 15, scope: !990)
!993 = !DILocation(line: 102, column: 5, scope: !994)
!994 = distinct !DILexicalBlock(scope: !990, file: !2, line: 102, column: 5)
!995 = !DILocation(line: 102, column: 9, scope: !994)
!996 = !DILocation(line: 102, column: 5, scope: !990)
!997 = !DILocation(line: 104, column: 3, scope: !998)
!998 = distinct !DILexicalBlock(scope: !994, file: !2, line: 103, column: 2)
!999 = !DILocation(line: 105, column: 2, scope: !998)
!1000 = !DILocation(line: 106, column: 10, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !994, file: !2, line: 106, column: 10)
!1002 = !DILocation(line: 106, column: 16, scope: !1001)
!1003 = !DILocation(line: 106, column: 20, scope: !1001)
!1004 = !DILocation(line: 106, column: 10, scope: !994)
!1005 = !DILocation(line: 108, column: 7, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !1001, file: !2, line: 107, column: 2)
!1007 = !DILocation(line: 109, column: 8, scope: !1006)
!1008 = !DILocation(line: 109, column: 3, scope: !1006)
!1009 = !DILocation(line: 110, column: 3, scope: !1006)
!1010 = !DILocation(line: 111, column: 2, scope: !1006)
!1011 = !DILocation(line: 114, column: 7, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1001, file: !2, line: 113, column: 2)
!1013 = !DILocation(line: 114, column: 6, scope: !1012)
!1014 = !DILocation(line: 115, column: 8, scope: !1012)
!1015 = !DILocation(line: 115, column: 14, scope: !1012)
!1016 = !DILocation(line: 115, column: 7, scope: !1012)
!1017 = !DILocation(line: 116, column: 3, scope: !1012)
!1018 = !DILocation(line: 116, column: 9, scope: !1012)
!1019 = !DILocation(line: 116, column: 13, scope: !1012)
!1020 = !DILocation(line: 117, column: 8, scope: !1012)
!1021 = !DILocation(line: 117, column: 3, scope: !1012)
!1022 = !DILocation(line: 118, column: 3, scope: !1012)
!1023 = !DILocation(line: 120, column: 2, scope: !990)
!1024 = !DILocation(line: 121, column: 1, scope: !990)
!1025 = distinct !DISubprogram(name: "inserte", scope: !2, file: !2, line: 124, type: !890, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!1026 = !DILocalVariable(name: "ptr", scope: !1025, file: !2, line: 126, type: !794)
!1027 = !DILocation(line: 126, column: 15, scope: !1025)
!1028 = !DILocalVariable(name: "temp", scope: !1025, file: !2, line: 126, type: !794)
!1029 = !DILocation(line: 126, column: 20, scope: !1025)
!1030 = !DILocation(line: 127, column: 24, scope: !1025)
!1031 = !DILocation(line: 127, column: 6, scope: !1025)
!1032 = !DILocation(line: 128, column: 5, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1025, file: !2, line: 128, column: 5)
!1034 = !DILocation(line: 128, column: 9, scope: !1033)
!1035 = !DILocation(line: 128, column: 5, scope: !1025)
!1036 = !DILocation(line: 130, column: 3, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1033, file: !2, line: 129, column: 2)
!1038 = !DILocation(line: 131, column: 2, scope: !1037)
!1039 = !DILocation(line: 134, column: 3, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1033, file: !2, line: 133, column: 2)
!1041 = !DILocation(line: 135, column: 3, scope: !1040)
!1042 = !DILocation(line: 136, column: 13, scope: !1040)
!1043 = !DILocation(line: 136, column: 3, scope: !1040)
!1044 = !DILocation(line: 136, column: 8, scope: !1040)
!1045 = !DILocation(line: 136, column: 12, scope: !1040)
!1046 = !DILocation(line: 137, column: 6, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1040, file: !2, line: 137, column: 6)
!1048 = !DILocation(line: 137, column: 10, scope: !1047)
!1049 = !DILocation(line: 137, column: 6, scope: !1040)
!1050 = !DILocation(line: 139, column: 4, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1047, file: !2, line: 138, column: 3)
!1052 = !DILocation(line: 139, column: 9, scope: !1051)
!1053 = !DILocation(line: 139, column: 13, scope: !1051)
!1054 = !DILocation(line: 140, column: 4, scope: !1051)
!1055 = !DILocation(line: 140, column: 9, scope: !1051)
!1056 = !DILocation(line: 140, column: 13, scope: !1051)
!1057 = !DILocation(line: 141, column: 9, scope: !1051)
!1058 = !DILocation(line: 141, column: 8, scope: !1051)
!1059 = !DILocation(line: 142, column: 3, scope: !1051)
!1060 = !DILocation(line: 145, column: 9, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1047, file: !2, line: 144, column: 3)
!1062 = !DILocation(line: 145, column: 8, scope: !1061)
!1063 = !DILocation(line: 146, column: 4, scope: !1061)
!1064 = !DILocation(line: 146, column: 10, scope: !1061)
!1065 = !DILocation(line: 146, column: 16, scope: !1061)
!1066 = !DILocation(line: 146, column: 20, scope: !1061)
!1067 = !DILocation(line: 148, column: 10, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1061, file: !2, line: 147, column: 4)
!1069 = !DILocation(line: 148, column: 16, scope: !1068)
!1070 = !DILocation(line: 148, column: 9, scope: !1068)
!1071 = distinct !{!1071, !1063, !1072, !987}
!1072 = !DILocation(line: 149, column: 4, scope: !1061)
!1073 = !DILocation(line: 150, column: 17, scope: !1061)
!1074 = !DILocation(line: 150, column: 4, scope: !1061)
!1075 = !DILocation(line: 150, column: 10, scope: !1061)
!1076 = !DILocation(line: 150, column: 15, scope: !1061)
!1077 = !DILocation(line: 151, column: 14, scope: !1061)
!1078 = !DILocation(line: 151, column: 4, scope: !1061)
!1079 = !DILocation(line: 151, column: 9, scope: !1061)
!1080 = !DILocation(line: 151, column: 13, scope: !1061)
!1081 = !DILocation(line: 152, column: 4, scope: !1061)
!1082 = !DILocation(line: 152, column: 9, scope: !1061)
!1083 = !DILocation(line: 152, column: 14, scope: !1061)
!1084 = !DILocation(line: 156, column: 2, scope: !1025)
!1085 = !DILocation(line: 157, column: 2, scope: !1025)
!1086 = !DILocation(line: 158, column: 1, scope: !1025)
!1087 = distinct !DISubprogram(name: "deletee", scope: !2, file: !2, line: 160, type: !890, scopeLine: 161, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!1088 = !DILocalVariable(name: "temp", scope: !1087, file: !2, line: 162, type: !794)
!1089 = !DILocation(line: 162, column: 15, scope: !1087)
!1090 = !DILocalVariable(name: "temp1", scope: !1087, file: !2, line: 162, type: !794)
!1091 = !DILocation(line: 162, column: 21, scope: !1087)
!1092 = !DILocation(line: 163, column: 5, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1087, file: !2, line: 163, column: 5)
!1094 = !DILocation(line: 163, column: 9, scope: !1093)
!1095 = !DILocation(line: 163, column: 5, scope: !1087)
!1096 = !DILocation(line: 165, column: 3, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1093, file: !2, line: 164, column: 2)
!1098 = !DILocation(line: 166, column: 2, scope: !1097)
!1099 = !DILocation(line: 167, column: 10, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1093, file: !2, line: 167, column: 10)
!1101 = !DILocation(line: 167, column: 16, scope: !1100)
!1102 = !DILocation(line: 167, column: 20, scope: !1100)
!1103 = !DILocation(line: 167, column: 10, scope: !1093)
!1104 = !DILocation(line: 169, column: 7, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1100, file: !2, line: 168, column: 2)
!1106 = !DILocation(line: 170, column: 8, scope: !1105)
!1107 = !DILocation(line: 170, column: 3, scope: !1105)
!1108 = !DILocation(line: 171, column: 3, scope: !1105)
!1109 = !DILocation(line: 172, column: 2, scope: !1105)
!1110 = !DILocation(line: 175, column: 8, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1100, file: !2, line: 174, column: 2)
!1112 = !DILocation(line: 175, column: 7, scope: !1111)
!1113 = !DILocation(line: 176, column: 3, scope: !1111)
!1114 = !DILocation(line: 176, column: 9, scope: !1111)
!1115 = !DILocation(line: 176, column: 15, scope: !1111)
!1116 = !DILocation(line: 176, column: 19, scope: !1111)
!1117 = !DILocation(line: 178, column: 11, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1111, file: !2, line: 177, column: 4)
!1119 = !DILocation(line: 178, column: 10, scope: !1118)
!1120 = !DILocation(line: 179, column: 10, scope: !1118)
!1121 = !DILocation(line: 179, column: 16, scope: !1118)
!1122 = !DILocation(line: 179, column: 9, scope: !1118)
!1123 = distinct !{!1123, !1113, !1124, !987}
!1124 = !DILocation(line: 181, column: 4, scope: !1111)
!1125 = !DILocation(line: 182, column: 3, scope: !1111)
!1126 = !DILocation(line: 182, column: 10, scope: !1111)
!1127 = !DILocation(line: 182, column: 14, scope: !1111)
!1128 = !DILocation(line: 183, column: 15, scope: !1111)
!1129 = !DILocation(line: 183, column: 21, scope: !1111)
!1130 = !DILocation(line: 183, column: 3, scope: !1111)
!1131 = !DILocation(line: 183, column: 10, scope: !1111)
!1132 = !DILocation(line: 183, column: 14, scope: !1111)
!1133 = !DILocation(line: 184, column: 8, scope: !1111)
!1134 = !DILocation(line: 184, column: 3, scope: !1111)
!1135 = !DILocation(line: 185, column: 3, scope: !1111)
!1136 = !DILocation(line: 187, column: 2, scope: !1087)
!1137 = !DILocation(line: 188, column: 1, scope: !1087)
!1138 = distinct !DISubprogram(name: "insertp", scope: !2, file: !2, line: 190, type: !890, scopeLine: 191, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!1139 = !DILocalVariable(name: "ptr", scope: !1138, file: !2, line: 193, type: !794)
!1140 = !DILocation(line: 193, column: 21, scope: !1138)
!1141 = !DILocalVariable(name: "temp", scope: !1138, file: !2, line: 193, type: !794)
!1142 = !DILocation(line: 193, column: 26, scope: !1138)
!1143 = !DILocation(line: 194, column: 27, scope: !1138)
!1144 = !DILocation(line: 194, column: 11, scope: !1138)
!1145 = !DILocation(line: 195, column: 11, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1138, file: !2, line: 195, column: 11)
!1147 = !DILocation(line: 195, column: 14, scope: !1146)
!1148 = !DILocation(line: 195, column: 11, scope: !1138)
!1149 = !DILocation(line: 197, column: 12, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1146, file: !2, line: 196, column: 8)
!1151 = !DILocation(line: 198, column: 8, scope: !1150)
!1152 = !DILocation(line: 201, column: 17, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1146, file: !2, line: 200, column: 8)
!1154 = !DILocation(line: 201, column: 16, scope: !1153)
!1155 = !DILocation(line: 202, column: 12, scope: !1153)
!1156 = !DILocation(line: 203, column: 12, scope: !1153)
!1157 = !DILocation(line: 204, column: 17, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1153, file: !2, line: 204, column: 12)
!1159 = !DILocation(line: 204, column: 16, scope: !1158)
!1160 = !DILocation(line: 204, column: 20, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1158, file: !2, line: 204, column: 12)
!1162 = !DILocation(line: 204, column: 22, scope: !1161)
!1163 = !DILocation(line: 204, column: 21, scope: !1161)
!1164 = !DILocation(line: 204, column: 12, scope: !1158)
!1165 = !DILocation(line: 206, column: 21, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1161, file: !2, line: 205, column: 12)
!1167 = !DILocation(line: 206, column: 27, scope: !1166)
!1168 = !DILocation(line: 206, column: 20, scope: !1166)
!1169 = !DILocation(line: 207, column: 19, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1166, file: !2, line: 207, column: 19)
!1171 = !DILocation(line: 207, column: 23, scope: !1170)
!1172 = !DILocation(line: 207, column: 19, scope: !1166)
!1173 = !DILocation(line: 209, column: 20, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1170, file: !2, line: 208, column: 16)
!1175 = !DILocation(line: 210, column: 20, scope: !1174)
!1176 = !DILocation(line: 212, column: 12, scope: !1166)
!1177 = !DILocation(line: 204, column: 27, scope: !1161)
!1178 = !DILocation(line: 204, column: 12, scope: !1161)
!1179 = distinct !{!1179, !1164, !1180, !987}
!1180 = !DILocation(line: 212, column: 12, scope: !1158)
!1181 = !DILocation(line: 213, column: 12, scope: !1153)
!1182 = !DILocation(line: 214, column: 12, scope: !1153)
!1183 = !DILocation(line: 215, column: 22, scope: !1153)
!1184 = !DILocation(line: 215, column: 12, scope: !1153)
!1185 = !DILocation(line: 215, column: 17, scope: !1153)
!1186 = !DILocation(line: 215, column: 21, scope: !1153)
!1187 = !DILocation(line: 216, column: 22, scope: !1153)
!1188 = !DILocation(line: 216, column: 28, scope: !1153)
!1189 = !DILocation(line: 216, column: 12, scope: !1153)
!1190 = !DILocation(line: 216, column: 17, scope: !1153)
!1191 = !DILocation(line: 216, column: 21, scope: !1153)
!1192 = !DILocation(line: 217, column: 22, scope: !1153)
!1193 = !DILocation(line: 217, column: 12, scope: !1153)
!1194 = !DILocation(line: 217, column: 17, scope: !1153)
!1195 = !DILocation(line: 217, column: 21, scope: !1153)
!1196 = !DILocation(line: 218, column: 23, scope: !1153)
!1197 = !DILocation(line: 218, column: 12, scope: !1153)
!1198 = !DILocation(line: 218, column: 18, scope: !1153)
!1199 = !DILocation(line: 218, column: 22, scope: !1153)
!1200 = !DILocation(line: 219, column: 29, scope: !1153)
!1201 = !DILocation(line: 219, column: 12, scope: !1153)
!1202 = !DILocation(line: 219, column: 18, scope: !1153)
!1203 = !DILocation(line: 219, column: 24, scope: !1153)
!1204 = !DILocation(line: 219, column: 28, scope: !1153)
!1205 = !DILocation(line: 220, column: 12, scope: !1153)
!1206 = !DILocation(line: 222, column: 8, scope: !1138)
!1207 = !DILocation(line: 223, column: 1, scope: !1138)
!1208 = distinct !DISubprogram(name: "deletep", scope: !2, file: !2, line: 225, type: !890, scopeLine: 226, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !916)
!1209 = !DILocalVariable(name: "ptr", scope: !1208, file: !2, line: 227, type: !794)
!1210 = !DILocation(line: 227, column: 15, scope: !1208)
!1211 = !DILocalVariable(name: "ptr1", scope: !1208, file: !2, line: 227, type: !794)
!1212 = !DILocation(line: 227, column: 20, scope: !1208)
!1213 = !DILocation(line: 228, column: 2, scope: !1208)
!1214 = !DILocation(line: 229, column: 2, scope: !1208)
!1215 = !DILocation(line: 230, column: 6, scope: !1208)
!1216 = !DILocation(line: 230, column: 5, scope: !1208)
!1217 = !DILocation(line: 231, column: 7, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1208, file: !2, line: 231, column: 2)
!1219 = !DILocation(line: 231, column: 6, scope: !1218)
!1220 = !DILocation(line: 231, column: 10, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1218, file: !2, line: 231, column: 2)
!1222 = !DILocation(line: 231, column: 12, scope: !1221)
!1223 = !DILocation(line: 231, column: 11, scope: !1221)
!1224 = !DILocation(line: 231, column: 2, scope: !1218)
!1225 = !DILocation(line: 233, column: 8, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !2, line: 232, column: 2)
!1227 = !DILocation(line: 233, column: 7, scope: !1226)
!1228 = !DILocation(line: 234, column: 7, scope: !1226)
!1229 = !DILocation(line: 234, column: 12, scope: !1226)
!1230 = !DILocation(line: 234, column: 6, scope: !1226)
!1231 = !DILocation(line: 235, column: 6, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1226, file: !2, line: 235, column: 6)
!1233 = !DILocation(line: 235, column: 9, scope: !1232)
!1234 = !DILocation(line: 235, column: 6, scope: !1226)
!1235 = !DILocation(line: 237, column: 7, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1232, file: !2, line: 236, column: 3)
!1237 = !DILocation(line: 238, column: 7, scope: !1236)
!1238 = !DILocation(line: 240, column: 3, scope: !1226)
!1239 = !DILocation(line: 231, column: 17, scope: !1221)
!1240 = !DILocation(line: 231, column: 2, scope: !1221)
!1241 = distinct !{!1241, !1224, !1242, !987}
!1242 = !DILocation(line: 240, column: 3, scope: !1218)
!1243 = !DILocation(line: 241, column: 17, scope: !1208)
!1244 = !DILocation(line: 241, column: 22, scope: !1208)
!1245 = !DILocation(line: 241, column: 6, scope: !1208)
!1246 = !DILocation(line: 241, column: 12, scope: !1208)
!1247 = !DILocation(line: 241, column: 16, scope: !1208)
!1248 = !DILocation(line: 242, column: 17, scope: !1208)
!1249 = !DILocation(line: 242, column: 22, scope: !1208)
!1250 = !DILocation(line: 242, column: 6, scope: !1208)
!1251 = !DILocation(line: 242, column: 12, scope: !1208)
!1252 = !DILocation(line: 242, column: 16, scope: !1208)
!1253 = !DILocation(line: 243, column: 11, scope: !1208)
!1254 = !DILocation(line: 243, column: 6, scope: !1208)
!1255 = !DILocation(line: 244, column: 6, scope: !1208)
!1256 = !DILocation(line: 245, column: 6, scope: !1208)
!1257 = !DILocation(line: 246, column: 6, scope: !1208)
!1258 = !DILocation(line: 247, column: 1, scope: !1208)
