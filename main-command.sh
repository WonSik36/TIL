# thread dump
jstack <pid>

# garbage collection
jstat -gcutil <pid> <interval> <count>

# 예시
#   S0     S1     E      O      M     CCS    YGC     YGCT    FGC    FGCT    CGC    CGCT     GCT
#   0.00 100.00  83.89   9.17  96.99  93.19      7    0.126     0    0.000     6    0.024    0.149
#   0.00 100.00  83.89   9.17  96.99  93.19      7    0.126     0    0.000     6    0.024    0.149
#   0.00 100.00  83.89   9.17  96.99  93.19      7    0.126     0    0.000     6    0.024    0.149
#   0.00 100.00  83.89   9.17  96.99  93.19      7    0.126     0    0.000     6    0.024    0.149
#   0.00 100.00  83.89   9.17  96.99  93.19      7    0.126     0    0.000     6    0.024    0.149
# S0: Survivor 0 의 사용률
# S1: Survivor 1 의 사용률
# E: Eden 사용률
# O: Old 사용률
# M: Metaspace (이전 Perm 영역 일부)
# CCS: Compressed Class Space (이전 Perm 영역 일부)
# YGC: Young GC Count
# YGCT: Young GC Total Time
# FGC: Full GC Count
# FGCT: Full GC Total Time
# CGC: Concurrent GC Count
# CGCT: Concurrent GC Total Time
# GCT: GC Total Time

# memory dump
jmap -dump:format=b,file=<filename> <pid>

# java option
java -Xms128m -Xmx1024m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/memory

# cpu 통계
mpstat -P {cpuNum | ALL} <interval> <count>
sar -P {cpuNum | ALL} <interval> <count>

# 전체 시스템 통계
# vmstat 의 첫번째 값은 그동안의 통계임 -> 무시
    # 전체 통계
    vmstat -a -n -S m <interval> <count> 
    # 전체 디스크 통계
    vmstat -D
    
    # 예시
    # procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    # r  b   swpd   free  inact active   si   so    bi    bo   in   cs us sy id wa st
    # 2  0      0   1049    542    395    0    0     7     0   46   63  0  0 100  0  0
    # 0  0      0   1049    542    395    0    0     0     0  200  272  0  0 100  0  0
    # 0  0      0   1049    542    395    0    0     0     0  178  216  0  0 100  0  0
    # 1  0      0   1049    542    395    0    0     0     0  359  512  0  0 99  0  0
    # 0  0      0   1049    542    395    0    0     0     0  284  428  0  0 100  0  0
    # r: 실행하기 위해 대기하고 있는 프로세스 수
    # b: uninterruptible sleep 상태 프로세스 수 
    # swpd: 가상 메모리를 사용한 크기
    # free: 사용하지 않는 메모리 크기
    # inact: 사용중이지 않음
    # active: 사용중
    # si: swap in
    # so: swap out
    # bi: block in
    # bo: block out
    # in: 초당 interrupt
    # cs: 초당 context switching
    # us: user
    # sy: system
    # id: idle
    # wa: I/O wait
    # st: 가상머신에서 뺏긴 시간


# 네트워크 통계
sar -n DEV|SOCK|TCP <interval> <count>

# ps
ps -ef | grep java
ps -Lf -p <pid> # 스레드(LWP) 확인

# 한 프로세스가 얼마나 CPU 를 사용하는지
pidstat -p <pid> <interval> <count> 

# 디스크 사용량
df -h --total

# 파일 크기
du -sh <path>

# IO 통계
iostat -xd <interval> <count>

# 특정 프로세스의 파일 접근
lsof -p <pid>
lsof -c <command like java>

# 연결된 네트워크 정보
# lsof -i[46][protocol][@hostname|hostaddr][:service|port]
