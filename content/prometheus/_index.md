---
title: Workshop
description: Schedule, setup & technical
linkTitle: "Prometheus workshop"
weight: 20
type: docs
menu:
  main:
    weight: 20
---

## Schedule

- 10:00 am: Start
- 11:30 am: Coffee Break
- 01:00 pm: Lunch at the Restaurant
- 03:30 pm: Coffee break
- 05:00 pm: End
- 07:00 pm: Dinner / get together at the Restaurant

### Online questionnaire

During this afternoon, you will receive an online questionnaire.

Please use it to provide feedback.

### Network setup

Because clients are isolated by default, we will add a secondary interface on
your laptop:

```
$ sudo -i
# service firewalld stop
# ip ad ad 192.168.28.x/24 dev enp3s0
```

Where x will be given by the trainer.

### Code of Conduct

This workshop is subject to the [OSMC Code of
Conduct](https://osmc.de/code-of-conduct/).
