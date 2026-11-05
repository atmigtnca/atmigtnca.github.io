+++
title = "JCloud 2026년 여름 재구축"
description = "연구실 프라이빗 클라우드 JCloud를 Kolla-Ansible, OpenStack Gazpacho, Ceph로 새로 짓고 기존 자원을 옮긴 기록"
date = 2026-09-30
weight = 1
[params]
  period = "2026년 7월 ~ 9월"
  status = "완료"
  statusNote = "재구축과 이주는 8월 말에 끝났고, 모니터링과 사용자 화면 개선은 이어서 하고 있다."
  tools = "Kolla-Ansible, OpenStack Gazpacho(2026.1), Ceph Squid(cephadm), Ubuntu 24.04, Skyline"
+++

JCloud는 OSLAB이 학생 실습과 연구용 VM을 내주는 OpenStack 클라우드다. 2026년 여름에 이 클라우드를 처음부터 다시 지었다. 새 클라우드를 옆에 세운 뒤 기존 VM, 볼륨, 이미지, 사용자를 옮기고 옛 클라우드를 해체하는 방식이었다.

## 왜 다시 지었나

기존 JCloud는 서버에 패키지를 직접 설치하고, 설정 파일을 손으로 고치고, 고가용성은 pacemaker와 DRBD로 묶은 구성이었다. 운영하면서 가장 힘들었던 점은 **설정이 여러 노드와 위치에 흩어져 있어서 무엇이 어디에 있는지 찾기 어렵다**는 것이었다.

7월에 기존 컨트롤 플레인을 실측해 보니 이 문제가 실제 위험으로 이어지고 있었다. 설정은 노드마다 `/etc`, pacemaker 설정, DRBD, 수동 백업 폴더에 나뉘어 있었고, 한쪽 컨트롤러에는 인증서가 없어 장애 조치가 되지 않는 상태였으며, DRBD 복제도 끊겨 있었다. 쓰던 OpenStack Antelope(2023.1)는 이미 upstream 유지보수가 끝나 보안 패치도 나오지 않았다.

그래서 목표를 이렇게 정했다. 컨테이너로 바꾸는 것 자체가 목적이 아니라, **설정을 한곳에 선언해 두고 그 상태로 자동으로 맞춰지게 하는 것**이다. 이후의 모든 선택을 이 기준으로 판단했다.
