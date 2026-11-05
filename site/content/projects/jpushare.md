+++
title = "JPUShare"
description = "연구실끼리 GPU를 나눠 쓰는 서비스. Slurm 작업을 Apptainer 컨테이너로 돌린다."
date = 2026-10-01
weight = 3
[params]
  period = "2026년 2학기부터"
  status = "진행 중"
  tools = "Slurm, Apptainer, Ceph RGW"
+++

JPUShare는 연구실이 가진 GPU를 다른 연구실과 나눠 쓰게 하는 서비스다. JCloud와 함께 유지보수를 맡고 있다.

사용자가 작업을 내면 Slurm이 빈 GPU에 배정하고, 작업은 Apptainer 컨테이너로 돈다. 데이터와 결과물은 JCloud 재구축 때 세운 Ceph의 오브젝트 저장소(RGW)에 둔다.

아직 진행 중이라 결과는 정리되는 대로 이 페이지에 덧붙인다.
